import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class TimeService {
  String location;
  String time = "";
  String flag;
  String url;

  TimeService({ required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      String uri = 'http://worldtimeapi.org/api/timezone/$url';
      Response response = await get(Uri.parse(uri));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now);

      print(time);
    }
    catch (e) {
      print(e);
      time = "Could not get time";
    }
  }
}