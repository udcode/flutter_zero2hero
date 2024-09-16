import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isLoading = false;


  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        _loadMore();
      }
    });
  }

  void _loadMore() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        items.addAll(List<int>.generate(30, (index) => index));
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ListView Example')),
        body: _getListView(),
      ),
    );
  }

List<int> items =List<int>.generate(30, (int index) => index);
bool isReverse = false;
  Widget _getListView() {
    var children = <Widget>[
      for(int i in items )
        ListTile(title: Text('Item $i')),

        //add 5 more items
      ];
    return Column(

      mainAxisSize: MainAxisSize.min,
      children: [
        SwitchListTile(
          title: Text('Reverse'),
          value: isReverse,
          onChanged: (value) {
            setState(() {
              isReverse = value;
            });
          },
        ),
        Flexible(
          child: ListView(
      controller: _scrollController,
            reverse: isReverse,
            children: children,
          ),
        ),
        Visibility(child:  CircularProgressIndicator(),)
      ],
    );
  }
//list with 100 items with color and text

  Widget _getListViewBuilder() {
    List<ListItemWithColor> items = List<ListItemWithColor>.generate(60,
            (index) =>
        ListItemWithColor(Colors.primaries[index % Colors.primaries.length],
            'Item $index'));
    return ListView.builder(
      itemCount: items.length,
      addAutomaticKeepAlives: false,
      physics: CustomScrollPhysics(),
      itemBuilder: (context, index) {
        var item = items[index];
        return ListItemWidget(item: item, index: index);
      },
    );
  }
  //Widget _getListViewSeparated() {
  Widget _getListViewSeparated() {
    List<ListItemWithColor> items = List<ListItemWithColor>.generate(100,
            (index) =>
        ListItemWithColor(Colors.primaries[index % Colors.primaries.length],
            'Item $index'));
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
        height: 2,
      ),
      itemBuilder: (context, index) {
        var item = items[index];
        return ListItemWidget(item: item, index: index);
      },
    );
  }

}

class ListItemWidget extends StatefulWidget {
  const ListItemWidget({
    super.key,
    required this.index,
    required this.item,
  });
  final int index;

  final ListItemWithColor item;

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> with AutomaticKeepAliveClientMixin {


  @override
  void initState() {
    super.initState();
    print('initState: ${widget.item.text}');
  }


  @override
  void dispose() {
    print('dispose: ${widget.item.text}');
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return ListTile(

      title: Text(widget.item.text, style:TextStyle(color:widget.item.color)),
      tileColor: widget.item.color.withOpacity(0.3),
      leading: CircleAvatar(backgroundColor: widget.item.color,
      //give me avatar image from the internet

        child: //image with placeholder
         FadeInImage.assetNetwork(
          placeholder: 'assets/images/placeholder-image.png',

          image: 'https://picsum.photos/250?image=${widget.index}',)

      ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('You tapped on: ${widget.item.text}'),
        ));

      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

extension ColorToState on State {
  Color get color => Colors.primaries[Random().nextInt(Colors.primaries.length)];
}
class ListItemWithColor{
  final Color color;
  final String text;
  ListItemWithColor(this.color, this.text);
}

//list of ListItemWithColor items 100 items

class CustomScrollPhysics extends ScrollPhysics {
  const CustomScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    return offset * 1; // ממהר את מהירות הגלילה
  }
}
