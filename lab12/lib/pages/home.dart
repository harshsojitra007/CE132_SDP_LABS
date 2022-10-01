import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  Map<dynamic, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    
    data = ModalRoute.of(context)?.settings.arguments as Map;
    String bgImage = data['isDayTime'] ? "day.avif" : "night.jfif";
    Color appBgColor = data['isDayTime'] ? Colors.black : Colors.white;

    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
          child: Center(
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: const Icon(
                    Icons.edit_location,
                    size: 60,
                  ),
                  label: const Text(
                    "Location",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  data['location'],
                  style: TextStyle(fontSize: 45, color: appBgColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 50, color: appBgColor),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
