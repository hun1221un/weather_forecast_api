import 'package:geolocator/geolocator.dart';


void main() async {
  try {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

    double longitude = position.longitude;
    double latitude = position.latitude;

    print(longitude);

  } catch (e) {
    print(e);
  }
}

