import 'package:flutter/material.dart';

void main() {
  runApp(const Lecture1());
}

class Lecture1 extends StatelessWidget {
  const Lecture1({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          appBarTheme: AppBarTheme(
              // centerTitle: true,
              ),
          // useMaterial3: true,
          colorScheme: ColorScheme.light(
            shadow: Colors.blueGrey,
            // surfaceTint: Colors.blueGrey,
            primary: Colors.cyan,
            onPrimary: Colors.black,
            secondary: Colors.blue,

            // surface: Colors.black,
            // onPrimaryContainer: Colors.red,
            // primaryContainer: Colors.black,
            // onSecondaryContainer: Colors.orange,
            // secondaryContainer: Colors.amber,
          ),

          // color
          brightness: Brightness.light,
        ),
        initialRoute: '/',

        // builder: (context, child) {
        //   return Stack(
        //     children: [child!, Center(child: CircularProgressIndicator())],
        //   );
        // },
        // home: HomeScreen(),
        routes: {
          '/': (context) => HomeScreen(),
          '/settings': (context) => SettingsScreen(),
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color iconColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.blue,

            // leading:
            //     //  Builder(builder: (context) {
            //     //   return
            //     IconButton(
            //         icon: Icon(Icons.percent),
            //         onPressed: () {
            //           // פעולה בעת לחיצה על כפתור התפריט
            //           ScaffoldMessenger.of(context).showSnackBar(
            //             SnackBar(
            //               content: Text('Menu'),
            //             ),
            //           );
            //           // Scaffold.of(context)
            //           //     .openDrawer(); //show error and fix with Builder widget
            //           // },
            //           // );
            //         }),
            title: Text('Home'),

            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: TabBar(
                // unselectedLabelColor: iconColor,
                tabs: [
                  Tab(
                    icon: Icon(Icons.home),
                    text: 'Home',
                  ),
                  Tab(
                    icon: Icon(Icons.settings),
                    text: 'Settings',
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // פעולה בעת לחיצה על כפתור החיפוש
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Search'),
                    ),
                  );
                },
              ),
            ],
          ),
          body: TabBarView(children: [
            Column(
              children: [
                Container(
                  child: Center(
                    child: Text('Welcome to Flutter!'),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.resolveWith(
                              (states) {
                                if (states.contains(WidgetState.pressed)) {
                                  return Colors.red;
                                }
                                return Colors.blue;
                              },
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'button',
                          )),
                      Flexible(
                        child: Container(
                          color: Colors.red,
                          child: TextField(
                            decoration: InputDecoration(
                                focusColor: Colors.red,
                                fillColor: WidgetStateColor.resolveWith(
                                  (states) {
                                    if (states.contains(WidgetState.focused)) {
                                      return Colors.black;
                                    }
                                    return Colors.blue;
                                  },
                                ),
                                filled: true),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: TextField(
                          decoration: InputDecoration(
                              fillColor: WidgetStateColor.resolveWith(
                                (states) {
                                  if (states.contains(WidgetState.focused)) {
                                    return Colors.green;
                                  }
                                  return Colors.white;
                                },
                              ),
                              filled: true),
                        ),
                      ),
                    ],
                  ),
                )
                // SizedBox(
                //   width: 300,
                //   child: ListTile(
                //     title: Text('alsdfjasldfjadjfds'),
                //     leading: Icon(Icons.settings),
                //     trailing: Icon(Icons.arrow_forward),
                //   ),
                // ),
              ],
            ),
            Theme(
              data: ThemeData(
                primaryColor: Colors.red,
                colorScheme: ColorScheme.light(
                    onPrimaryContainer: Colors.red,
                    primaryContainer: Colors.yellow,
                    primary: Colors.green),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                // border: Border.all(color: Colors.red, width: 2),),
                //color: Colors.blue,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Text('Settings'),
                    FloatingActionButton(
                        foregroundColor: Colors.blue,
                        child: Icon(Icons.mobile_friendly),
                        onPressed: () {}),
                    FloatingActionButton(
                        child: Icon(Icons.mobile_friendly), onPressed: () {}),
                    FloatingActionButton(
                        child: Icon(Icons.mobile_friendly), onPressed: () {})
                  ],
                ),
              ),
            ),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // פעולה בעת לחיצה על כפתור הפעולה הצף
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Hello!'),
                ),
              );
              // setState(() {
              iconColor = Colors.red;
              // });
            },
            child: Icon(
              Icons.add,
            ),
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Text('Menu'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: Text('Home'),
                  onTap: () {
                    Navigator.pop(context); // סגור את המגירה
                  },
                ),
                ListTile(
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.pop(context); // סגור את המגירה
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Settings'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("You Can't go Back"),
                  ),
                );
              },
            ),
            Text('Settings Page'),
          ],
        ),
      ),
    );
  }
}
