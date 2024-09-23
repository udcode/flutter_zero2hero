import 'package:flutter/material.dart';

import 'main_listview.dart';

void main() => runApp(StackApp());

class StackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('GridView Example')),
        body: _getAdvancedGridView(),
      ),
    );
  }

  Widget _getGridView() {
    List<NetworkImage> items = List<NetworkImage>.generate(100,
            (index) => NetworkImage('https://picsum.photos/200/300?random=$index'));
    return GridView.builder(
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        var item = items[index];
        return Image(image: item);
      },
    );
  }

  Widget _getAdvancedGridView() {
    List<NetworkImage> items = List<NetworkImage>.generate(100,
            (index) => NetworkImage('https://picsum.photos/200/300?random=$index'));
    return GridView.builder(
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,

      ),
      itemBuilder: (context, index) {
        var item = items[index];
        return Image(image: item);
      },
    );
  }
}
