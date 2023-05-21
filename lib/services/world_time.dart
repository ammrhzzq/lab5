import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location for the ui
  String time = ''; // time in that location
  String flag; //url to an asset flag icon
  String latitude;
  String longitude; //location url for api endpoint
  bool isDayTime = false; //true or false if daytime or not

  final apiKey = 'FQL9403FO639';

  WorldTime(
      {required this.location,
      required this.flag,
      required this.latitude,
      required this.longitude});

  Future<void> getTime() async {
    try {
      final response = await http.get(Uri.parse(
          'http://api.timezonedb.com/v2.1/get-time-zone?key=$apiKey&format=json&by=position&lat=$latitude&lng=$longitude'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        //print(data);

        //get properties from data
        String formatted = data['formatted'];
        String dst = data['dst'];
        // ignore: avoid_print
        print(dst);

        //create DateTime object
        DateTime now = DateTime.parse(formatted);
        now = now.add(Duration(hours: int.parse(dst)));

        //set time property
        isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
        time = DateFormat.jm().format(now);
      } else {
        // ignore: avoid_print
        print('Unexpected status code: ${response.statusCode}');
      }
    } catch (e) {
      // ignore: avoid_print
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}