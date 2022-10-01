import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? location, time, flag, url;
  bool? isDayTime;

  WorldTime({this.location, this.flag, this.url});
  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map timeData = jsonDecode(response.body);
      String dateTime = timeData['datetime'],
          offset = timeData['utc_offset'],
          offsetHours = offset.substring(1, 3),
          offsetMinutes = offset.substring(4, 6);
      DateTime currenttime = DateTime.parse(dateTime);
      currenttime = currenttime.add(Duration(
          minutes: int.parse(offsetMinutes), hours: int.parse(offsetHours)));

      time = DateFormat.jm().format(currenttime);
      isDayTime = (currenttime.hour > 6 && currenttime.hour < 20);
    } catch (e) {
      time = "Error occurred while fetching";
    }
  }
}
