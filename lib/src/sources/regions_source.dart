import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/region.dart';

class RegionsSource {
  final _firestore = FirebaseFirestore.instance;

  /// get regions from firestore
  Future<List<Region>> getRegions() async {
    final result = await _firestore.collection('regions').get();
    List<Region> regions = [];
    for (final doc in result.docs) {
      regions.add(Region.fromJson(doc.data()));
    }
    return regions;
  }

  /// create a new region
  Future<void> createRegion(Region region) async {
    await _firestore.collection('regions').add(region.toJson());
  }
}
