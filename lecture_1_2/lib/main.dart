import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': ( context) => const MyHomePage(title: 'Flutter Demo Home asdfasfdsdf'),
        '/settings': ( context) => const SettingsPage(),
      },
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, this.num = 0});


final int num;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class A extends StatefulWidget {
  final TabController tabController;
  const A({super.key,required this.tabController});

  @override
  State<A> createState() => _AState();
}

class _AState extends State<A> {

  @override
  void initState() {
    widget.tabController.addListener(listener);
    super.initState();
  }

  void listener() {
    if (widget.tabController.indexIsChanging) {
      print('tab index is changing');
    }
  }

  dispose() {
    widget.tabController.removeListener(listener);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _counter = 0;

  void _incrementCounter() {
    Navigator.of(context).pushNamed('/settings');
  }

  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        print('tab index is changing');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: TabBar(

            controller: _tabController,
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.settings)),

            ],
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.percent),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.num.toString()),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')),
                );
            },
          ),
        ],
      ),
      drawer:Drawer(
         child:

         Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [

             DrawerHeader(

               child: Text('Drawer Header'),
               decoration: BoxDecoration(
                 color: Theme.of(context).colorScheme.primary,
               ),
             ),
             ListTile(
               title: const Text('Home'),
               subtitle: const Text('Go to home page'),
               trailing: const Icon(Icons.arrow_forward),
               leading: const Icon(Icons.home),
               onTap: () {
                 Navigator.pop(context);
               },
             ),
             ListTile(
               title: const Text('Settings'),
               subtitle: const Text('Go to Settings page'),
               trailing: const Icon(Icons.arrow_forward),
               leading: const Icon(Icons.settings),
               onTap: () {
                 Navigator.of(context).pushNamed('/settings');
               },
             ),
           ],
         ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: TabBarView(children: [
       if(false) A(tabController: _tabController),
          Container(child: Text('settings'),),

        ],),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
