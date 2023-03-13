import 'dart:ui';

import 'package:flutter/material.dart';

class FormUI extends StatefulWidget {
  const FormUI({super.key});

  @override
  State<FormUI> createState() => _FormUIState();
}

class _FormUIState extends State<FormUI> {
  int _selectedIndex = 0;
  String? _radioValue;

  List<String> menuList = ['Menu1', 'Menu2', 'Menu3'];
  String? getText;

  Map<String, bool> language = {'Dart': true, 'Python': false}; //ค่าเริ่มต้น
  void _onItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetBottom = [
      buildUI(),
      Text('Bottom Tab2'),
      Text('Bottom Tab3'),
    ];
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
        body: TabBarView(
          children: [
            Center(child: widgetBottom.elementAt(_selectedIndex)),
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

  Widget buildTextField() {
    return TextField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password'), //ขนาดของช่องกรอก
    );
  }

  Widget buildRadio() {
    return Row(
      children: [
        Text("ชาย"),
        Radio(
            value: 'ชาย',
            groupValue: _radioValue,
            onChanged: (String? value) {
              setState(() {
                _radioValue = value;
              });
            }),
        Text("หญิง"),
        Radio(
            value: 'หญิง',
            groupValue: _radioValue,
            onChanged: (String? value) {
              setState(() {
                _radioValue = value;
              });
            }),
      ],
    );
  }

  Widget buildDropDown() {
    return DropdownButton(
      value: getText,
      onChanged: (String? newValue) {
        setState(() {
          getText = newValue;
        });
      },
      hint: const Text("Opsions"), //ค่าเริ่มต้น
      items: menuList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget buildCheckbBox() {
    return Row(
      children: [
        Checkbox(
            value: language['Dart'],
            onChanged: (bool? value) {
              setState(() {
                language['Dart'] = value!; //!null sefty
              });
            }),
        Text(
          "Dart",
          style: TextStyle(fontSize: 16),
        ),
        Checkbox(
            value: language['Python'],
            onChanged: (bool? value) {
              setState(() {
                language['Python'] = value!; //!null sefty
              });
            }),
        Text(
          "Python",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget buildButton() {
    return ElevatedButton(
        onPressed: () {
          _showDialog();
        },
        child: Text('Submit'));
  }

  Future<void> _showDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: ListBody(children: [
                Text('This is AlertDialog'),
                Text('Plese select OK')
              ]),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK')),
            ],
          );
        });
  }

  Widget buildListView() {
    return Expanded(
      //Expandeจัดการพื้นที่เหลือ
      child: ListView(
        padding: EdgeInsets.only(top: 20),
        children: [
          Container(
            height: 50,
            color: Color.fromARGB(255, 119, 187, 232),
            child: Text('ListViwe 1'),
          ),
          Container(
            height: 50,
            color: Color.fromARGB(255, 44, 117, 165),
            child: Text('ListViwe 2'),
          ),
          Container(
            height: 50,
            color: Color.fromARGB(255, 8, 75, 119),
            child: Text('ListViwe 3'),
          ),
        ],
      ),
    );
  }

  Widget buildUI() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          buildTextField(),
          SizedBox(
            height: 20,
          ),
          buildRadio(),
          SizedBox(
            height: 20,
          ),
          buildDropDown(),
          SizedBox(
            height: 20,
          ),
          buildCheckbBox(),
          SizedBox(
            height: 20,
          ),
          buildButton(),
          buildListView()
        ]),
      ),
    );
  }
}
