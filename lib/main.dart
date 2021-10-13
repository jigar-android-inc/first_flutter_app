import 'package:first_flutter_app/second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'first.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jigar Pandya',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Jigar Pandya'),
      routes: <String, WidgetBuilder>{
        MyNextPage.routeName: (context) => new MyNextPage(title: 'Android Developer'),
        MySecondPage.routeName: (context) => new MySecondPage(title: 'iOS Developer')
      },
    );
  }
}

class MyAppBar extends AppBar {
  MyAppBar({Key? key, required Widget title}) :
        super(key: key, title: title, actions: [
        new IconButton(onPressed: () => print("on tap of action "),
            icon: new Icon(Icons.notifications))
      ]);
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Text(widget.title)),
      body: Container(
        child: ListTile(
          title: RaisedButton(
            child: Text('NEXT'),
            onPressed: () {
              Navigator.of(context).pushNamed(MyNextPage.routeName);
            },
          ),
        ),
      ),
    );
  }
}


class MyNextPage extends StatefulWidget {
  static String routeName = "/nextPage";

  MyNextPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyNextPageState createState() => _MyNextPageState();
}

class _MyNextPageState extends State<MyNextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Text(widget.title)),
      body:Container(
        child: ListTile(
          title: RaisedButton(
            child: Text('GO TO SECOND PAGE'),
            onPressed: () {
              Navigator.of(context).pushNamed(MySecondPage.routeName);
            },
          ),
        ),
      ),
    );
  }
}


class MySecondPage extends StatefulWidget {
  static String routeName = "/secondPage";

  MySecondPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MySecondPageState createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer Header'),
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: Text(widget.title),
            leading: Builder(builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            )),
            elevation: 10.0,
            actions: <Widget>[
              IconButton(
                  onPressed: () {

                  },
                  icon: Icon(Icons.copy)
              ),
            ],
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.contacts), text: "Tab 1"),
                  Tab(icon: Icon(Icons.camera_alt), text: "Tab 2")
                ],
              ),

          ),
          body: TabBarView(
            children: [
              FirstScreen(),
              SecondScreen(),
            ],
          ),
      ),
    );
  }
}


//Slivers code

// CustomScrollView(
// slivers: [
// SliverAppBar(
// expandedHeight: 160.0,
// floating: true,
// snap: false,
// flexibleSpace: FlexibleSpaceBar(
// title: Text(widget.title),
// background: Container(
// color: Colors.blue,
// ),
// ),
// ),
// SliverList(
// delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
// return Container(
// color: index.isOdd ? Colors.white : Colors.black12,
// height: 100.0,
// child: Center(
// child: Text('$index', textScaleFactor: 5),
// ),
// );
// },
// childCount: 20,
// ))
// ],
// )