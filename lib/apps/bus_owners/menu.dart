import 'package:flutter/material.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/view/login.dart';
import 'package:transit_track_flutter/core/constants/text.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.color,
        title: Text(ConstText.transitTrack),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: (){},
            title: Text("Buses"),
          ),
          ListTile(
            onTap: (){},
            title: Text("Routes"),
          ),
          ListTile(
            onTap: () {
              
            },
            title: Text("Bus Add"),
          ),
          ListTile(
            onTap:(){} ,
            title: Text("system"),
          ),
          ListTile(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const Login()));
            },
            title: Text("LogOut",style: TextStyle(color: Colors.red),),
            trailing: Icon(Icons.logout,color: Colors.red,),
          )
        ],
      ),
    );
  }
}