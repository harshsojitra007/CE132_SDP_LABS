import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Choose Your Location"), centerTitle: true),
      body: ElevatedButton(
          child: Text("Counter is $counter"),
          onPressed: () {
            setState(() {
              counter += 1;
            });
          }),
    );
  }
}
