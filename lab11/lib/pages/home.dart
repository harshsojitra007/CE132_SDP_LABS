import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
 @override
 State<HomePage> createState() => _HomeState();
}
class _HomeState extends State<HomePage> {

  Map<dynamic, dynamic> data = {};

 @override
 Widget build(BuildContext context) {

   data = ModalRoute.of(context)?.settings.arguments as Map;

   return Scaffold(
     body: SafeArea(
         child: Padding(
           padding: const EdgeInsets.fromLTRB(0.0,120.0,0.0,0.0),
           child: Center(
             child: Column(
               children: [
                 TextButton.icon(
                   onPressed: (){
                     Navigator.pushNamed(context,'/location');
                   },
                   icon: const Icon(Icons.edit_location, size: 60,),
                   label: const Text("Location", style: TextStyle(fontSize: 40),),
                 ),
                 const SizedBox(height: 20,),
                 Text(data['location'], style: const TextStyle(fontSize: 45),),
                 const SizedBox(height: 20,),
                 Text(data['time'], style: const TextStyle(fontSize: 50),),
               ],
             ),
           ),
         )
     ),
   );
 }
}
