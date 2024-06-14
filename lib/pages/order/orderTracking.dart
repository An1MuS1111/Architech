import 'dart:async';

import 'package:architech/components/logos.dart';
import 'package:architech/config/constants.dart';
import 'package:architech/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class OrderTracking extends StatefulWidget{
  @override
  State<OrderTracking> createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {
  final Completer<GoogleMapController> _controller = Completer();

  // test data
  static const LatLng source = LatLng(1.5578927661584385, 103.64838516948697);
  static const LatLng destination = LatLng(1.5577654908351668, 103.64254923843006);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentIcon = BitmapDescriptor.defaultMarker;

  void getCurrentLocation() async{
    Location location = Location();

    location.getLocation().then((location) => {
      currentLocation = location
    });

    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((newLocation){
      currentLocation = newLocation;
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 14.5,
            target: LatLng(newLocation!.latitude!, newLocation!.longitude!)
          )
        )
      );

      setState(() {
      
      });
    });
  }

  void getPolyPoints() async{
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key, 
      PointLatLng(source.latitude, source.longitude), 
      PointLatLng(destination.latitude, destination.longitude)
    );

    if(result.points.isNotEmpty){
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }

    setState(() {
      
    });
  }

  void setCustomMarkerIcon(){
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty, ""
    ).then((icon){
      sourceIcon = icon;
    });

    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty, ""
    ).then((icon){
      destinationIcon = icon;
    });

    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty, ""
    ).then((icon){
      currentIcon = icon;
    });
  }

  @override
  void initState(){
    getCurrentLocation();
    setCustomMarkerIcon();
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          currentLocation == null ? 
          Center(child: Text("Loading"))
          : GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
              zoom: 10.5
            ),
            myLocationButtonEnabled: false,
            onMapCreated: (mapController){
              _controller.complete(mapController);
            },
            polylines: {
              Polyline(
                polylineId: PolylineId("route"),
                points: polylineCoordinates,
                color: primaryColour,
                width: 7
              )
            },
            markers: {
              Marker(
                markerId: const MarkerId("source"),
                position: source,
                icon: sourceIcon
              ),
              Marker(
                markerId: const MarkerId("currentLocation"),
                position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
                icon: currentIcon
              ),
              Marker(
                markerId: const MarkerId("destination"),
                position: destination,
                icon: destinationIcon
              )
            }
          ),
          Positioned(
            top: 40,
            left: 30,
            child: appLogo("assets/logo_small.png", 150)
          ),
          Positioned(
            bottom: 10,
            width: width,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: semanticBlue,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Parcel 1",
                        style: TextStyle(
                          fontSize: 16
                        )
                      ),
                      Text(
                        "In transit at Lingkaran Ilmu",
                        style: TextStyle(
                          fontSize: 12
                        )
                      )
                    ],
                  ),
                  InkWell(
                    onTap: (){},
                    child: const Icon(
                      Icons.zoom_in_map_rounded
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}