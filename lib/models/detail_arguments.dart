import 'package:bwa_kosans/models/space_data.dart';

class DetailArguments {
  String stringPayload = '';
  int intPayload = 0;
  SpaceData? spaceData;

  DetailArguments(
      {this.stringPayload = '', this.intPayload = 0, this.spaceData});
}
