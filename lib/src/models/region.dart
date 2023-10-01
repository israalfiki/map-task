import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Region {
  final List<LatLng> points;
  final String? notes; // report
  final String createdBy;

  Region({required this.points, this.notes, required this.createdBy});

  factory Region.fromJson(Map<String, dynamic>? map) {
    final geoPointsItr = map?['points'] as Iterable;

    return Region(
        points: geoPointsItr
            .map((geoPoint) => LatLng(geoPoint.latitude, geoPoint.longitude))
            .toList(),
        createdBy: map?['createdBy'],
        notes: map?['report']);
  }

  Map<String, dynamic> toJson() {
    List<GeoPoint> geoPoints = [];
    for (final point in points) {
      geoPoints.add(GeoPoint(point.latitude, point.longitude));
    }
    return {'points': geoPoints, 'report': notes, 'createdBy': createdBy};
  }
}
