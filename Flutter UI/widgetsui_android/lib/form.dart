import 'package:flutter/material.dart';

class FormUI extends StatefulWidget {
  const FormUI({super.key});

  @override
  State<FormUI> createState() => _FormUIState();
}

class _FormUIState extends State<FormUI> {
  int _selectedIndex = 0;
  void _onItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        drawer: buildDrawer(),
        appBar: AppBar(
          title: const Text("User Form "),
          backgroundColor: const Color(0xff1476b8),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.person),
              text: 'Form',
            ),
            Tab(
              icon: Icon(Icons.info),
              text: 'info',
            ),
            Tab(
              icon: Icon(Icons.contact_mail),
              text: 'Contact',
            ),
          ]),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text('Tab1'),
            ),
            Center(
              child: Text('Tab2'),
            ),
            Center(
              child: Text('Tab3'),
            )
          ],
        ),
        bottomNavigationBar: buildBottomNavBar(),
      ),
    );
  }

  Widget buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            color: const Color(0xff98bcd4),
          ),
          ListTile(
            leading: const Icon(Icons.folder),
            title: const Text('Menu 1'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.folder),
            title: const Text('Menu 2'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.folder),
            title: const Text('Menu 3'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget buildBottomNavBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        BottomNavigationBarItem(icon: Icon(Icons.business), label: "business"),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: "school"),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItem,
      selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
      backgroundColor: const Color(0xff1476b8),
    );
  }
}
