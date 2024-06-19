import 'package:architech/config/constants.dart';
import 'package:architech/models/autoCompletePredictionModel.dart';
import 'package:architech/models/placeAutoCompleteResponseModel.dart';
import 'package:architech/services/network_utility.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class SearchLocationProvider extends ChangeNotifier{
  List<AutoCompletePredictionModel> placePredictions = [];
  TextEditingController controller = TextEditingController();

  Position? currentLocation;
  String? currentAddress;

  void placeAutoComplete(String query) async{
    Uri uri = Uri.https(
      "maps.googleapis.com",
      "maps/api/place/autocomplete/json",
      {
        "input": query,
        "radius": 10000,
        "key": google_api_key
      }
    );

    String? response = await NetworkUtility.fetchUrl(uri);

    if(response != null){
      // print(response);
      PlaceAutoCompleteResponseModel result = PlaceAutoCompleteResponseModel.parsedAutoCompleteResult(response);

      if(result.predictions != null){
        // setState(() {
        //   placePredictions = result.predictions!;
        // });
      }
    }
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    
    if(!serviceEnabled){
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();

      if(permission == LocationPermission.denied){
        return Future.error('Location permissions are denied.');
      }
    }

    if(permission == LocationPermission.deniedForever){
      return Future.error('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition().then((Position position){
      // setState(() => currentLocation = position);

      // getAddressFromCoordinates(currentLocation!);
    });
  }

  Future<void> getAddressFromCoordinates(Position position) async{
    try{
      List<Placemark> placemarks = await placemarkFromCoordinates(
        currentLocation!.latitude, 
        currentLocation!.longitude)
        .then((List<Placemark> placemarks){
          Placemark place = placemarks[0];

          // setState(() {
          //   currentAddress = '${place.name}, ${place.thoroughfare}, ${place.postalCode}, ${place.locality}, ${place.administrativeArea}';
          //   controller.text = currentAddress!;
          // });

          return placemarks;
        });
    }catch (error){
      print(error);
    }
  }
}