import 'dart:async';
import 'package:farmtopia_task/src/managers/auth_manager.dart';
import 'package:farmtopia_task/src/models/region.dart';
import 'package:farmtopia_task/src/sources/regions_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

class MapController extends GetxController {
  final Completer<GoogleMapController> controller = Completer();

  final CameraPosition kGoogle = const CameraPosition(
    target: LatLng(19.0759837, 72.8776559),
    zoom: 5,
  );

  final RxSet<Polygon> polygons = <Polygon>{}.obs;
  final RxSet<Polyline> polyLines = <Polyline>{}.obs;

  final RxSet<Marker> markers = <Marker>{}.obs;
  List<LatLng> points = [];

  final _regionsSource = RegionsSource();
  final _authManager = AuthManager();
  final uuid = const Uuid();

  final isDrawingFinished = false.obs;
  final isDrawingEnabled = false.obs;

  @override
  void onInit() {
    print('on init map controller');
    getRegions();

    super.onInit();
  }

  /// get list of regions
  Future<void> getRegions() async {
    final regions = await _regionsSource.getRegions();
    print(regions);
    for (final region in regions) {
      points = region.points;
      drawPolygon();
    }
  }

  void toggleDrawer() {
    isDrawingEnabled.value = !isDrawingEnabled.value;
    if (!isDrawingEnabled.value) {
      createRegion();
    }
    points = [];
  }

  void addMarker(LatLng latLng) {
    if (isDrawingEnabled.value) {
      final marker = Marker(
          markerId: MarkerId(uuid.v4().toString()),
          icon: BitmapDescriptor.defaultMarker,
          position: latLng);
      markers.add(marker);
      print('markers are $markers');
      points.add(latLng);
      drawPolygon();
    }
  }

// draw a polygon on map
  void drawPolygon() {
    final polygon = Polygon(
        polygonId: PolygonId(uuid.v4()),
        points: points,
        fillColor: Colors.green.withOpacity(0.3),

        // given border color to polygon
        strokeColor: Colors.green,
        geodesic: true,
        strokeWidth: 4);
    polygons.add(polygon);
  }

  /// save regions to database
  Future<void> createRegion() async {
    final currentUser = _authManager.getUser();
    final region = Region(points: points, createdBy: currentUser.uid);
    await _regionsSource.createRegion(region);
  }
}
