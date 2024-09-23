import 'package:flutter/material.dart';

import 'main_listview.dart';

void main() => runApp(StackApp());

class StackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ListView Example')),
        body: _getListViewSeparated(),
      ),
    );
  }

  Widget _getListViewSeparated() {
    List<ListItemWithColor> items = List<ListItemWithColor>.generate(100,
            (index) => ListItemWithColor(Colors.primaries[index % Colors.primaries.length], 'Item $index'));
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
        height: 10,
      ),
      physics: BouncingScrollPhysics(), // Updated scroll behavior
      itemBuilder: (context, index) {
        var item = items[index];
        return ListItemWidget(item: item, index: index);
      },
    );
  }
}
