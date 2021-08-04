import 'package:geolocator/geolocator.dart';


class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      longitude = position.longitude;
      latitude = position.latitude;

      print(longitude);

    } catch (e) {
      print(e);
    }
  }
}



