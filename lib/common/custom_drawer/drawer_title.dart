import 'package:curso_app/models/page_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerTitle extends StatelessWidget {
  final IconData icomData;
  final String title;
  final int page;

  const DrawerTitle(
      {required this.icomData, required this.title, required this.page});
  @override
  Widget build(BuildContext context) {
    final int curPage = context.read<PageManager>().page;
    return InkWell(
      onTap: () {
        context.read<PageManager>().setPage(page);
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                icomData,
                size: 32,
                color: curPage == page ? Colors.red : Colors.green,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
