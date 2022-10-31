import 'package:http/http.dart';
import 'dart:convert';

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

      print(data);
    }
    catch (e) {
      print(e);
    }
  }
}