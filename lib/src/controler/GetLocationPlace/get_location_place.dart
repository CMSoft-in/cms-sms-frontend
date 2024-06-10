import 'package:geocoding/geocoding.dart';

Future<String> getPlace(
  double latitude,
  double longitude,
) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(latitude, longitude);
  Placemark place = placemarks[0];

  return "${place.subLocality}, ${place.locality}";
}
