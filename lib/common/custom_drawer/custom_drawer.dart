import 'package:flutter/material.dart';

import 'drawer_title.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const <Widget>[
          DrawerTitle(icomData: Icons.home, title: "tela 0", page: 0),
          DrawerTitle(icomData: Icons.home, title: "tela 1", page: 1),
          DrawerTitle(icomData: Icons.home, title: "tela 3", page: 2),
        ],
      ),
    );
  }
}
