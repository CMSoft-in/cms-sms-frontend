import 'package:cmssms/src/Model/Const/height_width.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class LocationFormField extends StatefulWidget {
  LocationFormField({
    Key? key,
    required this.assignLocation,
    required this.controller,
    required this.text,
    required this.optionalisEmpty,
    required this.star,
    required this.enabled,
  }) : super(key: key);

  final TextEditingController controller;
  final String text;
  final String star;
  final bool enabled;
  final bool optionalisEmpty;

  Function(String)? assignLocation;

  @override
  _LocationFormFieldState createState() => _LocationFormFieldState();
}

class _LocationFormFieldState extends State<LocationFormField> {
  late Position currentPosition;
  late String currentAddress;

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg:
              'Location permissions are permanently denied, we cannot request permissions.');
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      if (widget.assignLocation != null) {
        widget.assignLocation!("${position.latitude} ${position.longitude}");
      }
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      setState(() {
        currentPosition = position;
        currentAddress = "${place.subLocality}, ${place.locality}";
        widget.controller.text = currentAddress;
      });
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: 'Error fetching location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: primaryWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.text,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      TextSpan(
                        text: widget.star,
                        style: const TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                errorStyle: const TextStyle(color: Colors.red),
              ),
              validator: validMethod,
              controller: widget.controller,
              enabled: widget.enabled,
            ),
          ),
          ElevatedButton(
            onPressed: _determinePosition,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Get',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? validMethod(value) {
    if (widget.optionalisEmpty) {
      if (value == null || value.isEmpty) {
        return "Please enter ${widget.text == '+91-' ? 'Phone Number' : widget.text}";
      }
      return null;
    }
    return null;
  }
}
