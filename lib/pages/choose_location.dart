import 'package:flutter/material.dart';
import 'package:world_clock/services/time_service.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});


  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<TimeService> locations = [
    TimeService(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    TimeService(location: 'Paris', flag: 'france.png', url: 'Europe/Paris'),
    TimeService(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
    TimeService(location: 'Lagos', flag: 'nigeria.png', url: 'Africa/Lagos'),
    TimeService(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
    TimeService(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi'),
    TimeService(location: 'New York', flag: 'usa.png', url: 'America/New_York'),
    TimeService(location: 'Toronto', flag: 'canada.png', url: 'America/Toronto'),
    TimeService(location: 'Riyadh', flag: 'saudi.png', url: 'Asia/Riyadh'),
    TimeService(location: 'Shanghai', flag: 'china.png', url: 'Asia/Shanghai'),
  ];

  void updateTime(index) async {
    TimeService instance = locations[index];
    await instance.getTime();
    if (!mounted) return;
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
    });
    print(instance.location);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/flags/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
