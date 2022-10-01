import 'package:flutter/material.dart';
import 'package:lab10/pages/choose_location.dart';
import 'package:lab10/pages/loading.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/home",
    routes: {
      "/": (context) => const Loading(),
      "/home": (context) => const Home(),
      "/location": (context) => const ChooseLocation(),
    },
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Center(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/location");
                    },
                    icon: const Icon(Icons.edit_location, size: 50),
                    label: const Text(
                      "Location",
                      style: TextStyle(fontSize: 30),
                    )
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
