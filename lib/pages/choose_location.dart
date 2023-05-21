import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        latitude: '41.0082',
        longitude: '28.9784',
        location: 'Istanbul',
        flag: 'turkey.png'),
    WorldTime(
        latitude: '51.5072',
        longitude: '0.1276',
        location: 'London',
        flag: 'uk.png'),
    WorldTime(
        latitude: '52.5200',
        longitude: '13.4050',
        location: 'Berlin',
        flag: 'germany.png'),
    WorldTime(
        latitude: '6.1164',
        longitude: '125.1716',
        location: 'Santos',
        flag: 'brazil.png'),
    WorldTime(
        latitude: '30.0444',
        longitude: '31.2357',
        location: 'Cairo',
        flag: 'egypt.png'),
    WorldTime(
        latitude: '53.3272',
        longitude: '7.5141',
        location: 'Leinster',
        flag: 'ireland.png'),
    WorldTime(
        latitude: '35.6762',
        longitude: '139.6503',
        location: 'Tokyo',
        flag: 'japan.png'),
    WorldTime(
        latitude: '64.7337',
        longitude: '177.4968',
        location: 'Anadyr',
        flag: 'russia.png'),
    WorldTime(
        latitude: '37.5519',
        longitude: '126.9918',
        location: 'Seoul',
        flag: 'south_korea.png'),
    WorldTime(
        latitude: '3.1319',
        longitude: '101.6841',
        location: 'Kuala Lumpur',
        flag: 'malaysia.png'),
    WorldTime(
        latitude: '-1.292066',
        longitude: '36.821946',
        location: 'Nairobi',
        flag: 'kenya.png'),
    WorldTime(
        latitude: '43.70011',
        longitude: '-79.4163',
        location: 'Toronto',
        flag: 'canada.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    //navigate to home screen
    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ));
        },
      ),
    );
  }
}