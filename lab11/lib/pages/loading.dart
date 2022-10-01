import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lab11/services/world_time.dart';
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
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'location': timeInstance.location,
      'flag': timeInstance.flag,
      'time': timeInstance.time,
    });
  }
  @override
  void initState() {
    super.initState();
    setWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
          body: Center(
            child: SpinKitThreeBounce(
              color: Colors.blueAccent,
              size: 50,
            ),
          ),
        ));
  }
}