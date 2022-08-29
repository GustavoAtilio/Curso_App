import 'package:curso_app/models/page_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/custom_drawer/custom_drawer.dart';

final PageController pageController = PageController();

class BasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            Scaffold(
              drawer: CustomDrawer(),
              appBar: AppBar(title: const Text("tela 0")),
            ),
            Scaffold(
              drawer: CustomDrawer(),
              appBar: AppBar(title: const Text("tela 1")),
            ),
            Scaffold(
              drawer: CustomDrawer(),
              appBar: AppBar(title: const Text("tela 2")),
            ),
          ]),
    );
  }
}
