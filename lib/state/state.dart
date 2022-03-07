import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stella_stays_mobile/models/property.dart';
import 'package:stella_stays_mobile/models/service.dart';

class AppState with ChangeNotifier {
  late UserCredential user;
  List<Service> services = [];
  List<Property> properties = [
    Property(
        propertyPrice: "1,250",
        propertyCapacity: 8,
        propertyImage: "assets/slider-1.png",
        propertyName: "Cozy Beachfront Villa | Private Pool | 4BDR",
        propertyLocation: "Dubai"),
    Property(
        propertyPrice: "1,250",
        propertyCapacity: 8,
        propertyImage: "assets/slider-1.png",
        propertyName: "Cozy Beachfront Villa | Private Pool | 4BDR",
        propertyLocation: "Dubai"),
    Property(
        propertyPrice: "1,250",
        propertyCapacity: 8,
        propertyImage: "assets/slider-1.png",
        propertyName: "Cozy Beachfront Villa | Private Pool | 4BDR",
        propertyLocation: "Dubai"),
  ];

  loginUser(UserCredential loggedInUser) {
    user = loggedInUser;
    notifyListeners();
  }

  Map<String, Iterable<Service>> filteredServices = {};
  Set<String> cities = {};
  bool loadingData = true;

  Set<String> getAllCities() {
    var uniqueCities = <String>{};
    for (Service service in services) {
      for (String city in service.city) {
        uniqueCities.add(city);
      }
    }
    return uniqueCities;
  }

  Future<List<Service>> getServicesFromFirebase() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference servicesReference = firestore.collection('services');
    List<QueryDocumentSnapshot<Object?>> servicesDocs =
        (await servicesReference.get()).docs;
    List<Service> services = [];
    for (var i = 0; i < servicesDocs.length; i++) {
      var service = servicesDocs[i].data() as Map<String, dynamic>;
      List<String> cities = [];
      for (var city in service['city']) {
        cities.add(city.toString());
      }
      service['city'] = cities;
      Service customService = Service.fromMap(service);
      customService.id = i + 1;
      services.add(customService);
    }
    return services;
  }

  Map<String, List<Service>> getServicesBasedOnCities(
      List<Service> services, Set<String> cities) {
    Map<String, List<Service>> result = {};
    for (var city in cities) {
      List<Service> filteredServices =
          services.where((service) => service.city.contains(city)).toList();
      result[city] = filteredServices;
    }
    return result;
  }

  Future<Map<String, Iterable<Service>>> loadData() async {
    loadingData = true;
    services = await getServicesFromFirebase();
    cities = getAllCities();
    inspect(services);
    filteredServices = getServicesBasedOnCities(services, cities);
    loadingData = false;
    notifyListeners();
    return filteredServices;
  }
}
