import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stella_stays_mobile/models/service.dart';

class AppState with ChangeNotifier {
  late UserCredential user;
  List<Service> services = [
    Service(
        id: 1,
        city: [
          "Dubai",
          "Montreal",
        ],
        title: "Home Cleaning",
        imageUrl: "assets/cleaning-service.png"),
    Service(
        id: 2,
        city: ["Dubai", "Montreal"],
        title: "Car Rental",
        imageUrl: "assets/cleaning-service.png"),
    Service(
        id: 3,
        city: ["Dubai", "Manama"],
        title: "Food",
        imageUrl: "assets/cleaning-service.png"),
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
    cities = getAllCities();
    filteredServices = getServicesBasedOnCities(services, cities);
    //To mimic an API call
    await Future.delayed(const Duration(seconds: 4), () {
      loadingData = false;
      notifyListeners();
    });
    return filteredServices;
  }
}
