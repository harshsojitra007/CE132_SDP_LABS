import 'package:flutter/material.dart';
import 'package:lab10/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? time = "Loading...";
  void setWorldTime() async {
    WorldTime timeInstance =
        WorldTime(location: 'kolkata', flag: 'india.png', url: 'Asia/Kolkata');
    await timeInstance.getTime();
    setState(() {
      time = timeInstance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Time for your location",
                style: TextStyle(fontSize: 20)),
            TextButton(
              child: Text('$time'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    ));
  }
}
