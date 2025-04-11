import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tasksheet_11_04_25/navigation_bar_page.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _pageIndex = 0;

  List<Widget> bottomPages = [
    NavigationBarPage(text: "Home", color: Colors.amber),
    NavigationBarPage(text: "Dokumente", color: Colors.cyan),
    NavigationBarPage(text: "Kosten", color: Colors.purple),
    NavigationBarPage(text: "Kalender", color: Colors.greenAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          width: 200,
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Willkomen in deinem Menü"),
              ),
              Divider(),
              Card(
                child: ListTile(
                  onTap: () {
                    setState(() {
                      _pageIndex = 0;
                    });
                  },
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    setState(() {
                      _pageIndex = 1;
                    });
                  },
                  leading: Icon(Icons.attach_file),
                  title: Text("Dokumente"),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    setState(() {
                      _pageIndex = 2;
                    });
                  },
                  leading: Icon(Icons.euro),
                  title: Text("Kosten"),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    setState(() {
                      _pageIndex = 3;
                    });
                  },
                  leading: Icon(Icons.calendar_month_rounded),
                  title: Text("Kalender"),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Willkommen"),
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
          selectedIndex: _pageIndex,
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(
              icon: Icon(Icons.attach_file),
              label: "Dokumente",
            ),
            NavigationDestination(icon: Icon(Icons.euro), label: "Kosten"),
            NavigationDestination(
              icon: Icon(Icons.calendar_month_rounded),
              label: "Kalender",
            ),
          ],
        ),
        body: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 32,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Card(
                      color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.newspaper,
                            color: Colors.amberAccent,
                            size: 56,
                          ),
                          Text(
                            "die akteuellen News",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(children: [bottomPages[_pageIndex]]),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      spacing: 24,
                      children: [
                        Image.network("https://picsum.photos/100/100"),
                        Image.network(
                          "https://picsum.photos/seed/picsum/100/100",
                        ),
                        Image.network("https://picsum.photos/100"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
