import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/map_controller.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(Object context) {
    final controller = Get.find<MapController>();
    return Scaffold(
      body: Obx(() => GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: controller.kGoogle,
          polygons: controller.polygons.value,
          polylines: controller.polyLines.value,
          onMapCreated: (GoogleMapController mapController) {
            controller.controller.complete(mapController);
          },
          markers: controller.markers.value,
          onTap: (latLng) => controller.addMarker(latLng),
        ),),
        floatingActionButton: Obx(() =>FloatingActionButton(
          onPressed: () => controller.toggleDrawer(),
          child: Icon(controller.isDrawingEnabled.value? Icons.done : Icons.add) ,
          
          ))

    );
  }
}
