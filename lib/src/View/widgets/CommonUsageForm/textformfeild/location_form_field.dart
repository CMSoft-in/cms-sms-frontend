import 'package:cmssms/src/Model/Const/color.dart';
import 'package:cmssms/src/Model/Const/height_width.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../Model/Const/text_const.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LocationFormField extends StatefulWidget {
  const LocationFormField(
      {super.key,
      required this.controller,
      required this.text,
      required this.optionalisEmpty,
      required this.star,
      required this.enabled});
  final TextEditingController controller;
  final String text;
  final String star;
  final bool enabled;
  final bool optionalisEmpty;

  @override
  State<LocationFormField> createState() => _LocationFormFieldState();
}

class _LocationFormFieldState extends State<LocationFormField> {
  late Position currentposition;
  late String currentAddress;

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please enable Your Location Service');
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

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      setState(() {
        currentposition = position;
        print(place);
        currentAddress = "${place.subLocality}, ${place.locality}";
        widget.controller.text = currentAddress;
      });
    } catch (e) {
      print('Error fetching location: $e');
      Fluttertoast.showToast(msg:'$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: primaryWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 260,
              child: TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.text,
                          style: textStyleGrey18,
                        ),
                        TextSpan(
                          text: widget.star,
                          style: textStyleRedStar,
                        ),
                      ],
                    ),
                  ),
                  errorStyle: const TextStyle(color: Colors.red),
                ),
                validator: validMethod,
                controller: widget.controller,
                enabled: widget.enabled,
              )),
          ElevatedButton(
            onPressed: () async {
              _determinePosition();
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.white, // Text color
              elevation: 0, // Elevation
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10), // Padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Border radius
              ),
            ),
            child: const Text(
              'Get',
              style: TextStyle(
                color: black,
                fontSize: 16, // Text size
              ),
            ),
          )
        ],
      ),
    );
  }

  String? validMethod(value) {
    if (widget.optionalisEmpty == true) {
      if (value == null || value.isEmpty) {
        return "Please enter ${widget.text == '+91-' ? 'Phone Number' : widget.text}";
      }
      return null;
    }
    return null;
  }
}