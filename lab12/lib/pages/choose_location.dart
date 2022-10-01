import 'package:flutter/material.dart';
import 'package:lab12/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);
  // const ChooseLocation({Key? key}) : super(key: key);
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;
  List<WorldTime> locations = [
    WorldTime(location: 'kolkata', flag: 'india.png', url: 'Asia/Kolkata'),
    WorldTime(
        location: 'manilla', flag: 'phillipines.png', url: 'Asia/Manilla'),
    WorldTime(
        location: 'singapore', flag: 'singapore.png', url: 'Asia/Singapore'),
    WorldTime(
        location: 'brisbane', flag: 'australia.png', url: 'Australia/Brisbane'),
    WorldTime(location: 'vienna', flag: 'austria.png', url: 'Europe/Vienna'),
    WorldTime(location: 'moscow', flag: 'russia.png', url: 'Europe/Moscow'),
  ];

  // @override
  // void initState() {
  //   super.initState();
  // }

  void updateTime(dynamic index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

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
      appBar: AppBar(
        title: const Text('Choose location'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
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
                  title: Text(locations[index].location.toString()),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/flags/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
