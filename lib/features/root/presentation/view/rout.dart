import 'package:flutter/material.dart';

class Rout extends StatefulWidget {
  const Rout({super.key});

  @override
  State<Rout> createState() => _RoutState();
}

class _RoutState extends State<Rout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Routes"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings))
        ],
      ),
      body: ListView(
        children: [
          TextField(
            onTap: (){},
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hint:Text( "Search" )
            ),
          )
        ],
      ),
    );
  }
}