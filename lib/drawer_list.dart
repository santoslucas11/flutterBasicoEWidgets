import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer( 
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Favoritos"),
            subtitle: Text("Mais informações..."),
            trailing: Icon(Icons.arrow_forward),
            onTap: (){
              print("Favoritos");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Ajuda"),
            subtitle: Text("Mais informações..."),
            trailing: Icon(Icons.arrow_forward),
            onTap: (){
              print("Ajuda");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Log Out"),
            subtitle: Text("Mais informações..."),
            trailing: Icon(Icons.arrow_forward),
            onTap: (){
              print("Log Out");
              Navigator.pop(context);
            },
          ),
        ],),
    );
  }
}