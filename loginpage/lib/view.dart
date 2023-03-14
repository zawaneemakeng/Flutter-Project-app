import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  String? text = "";
  String? status = "";
  @override
  void initState() {
    // TODO: implement initState
    getUsername();
    getStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('View Page')),
      body: Center(
          child: Column(
        children: [
          Text("Username :${text!}"),
          Text("Status :${status!}"),
        ],
      )),
    );
  }

  void getUsername() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      text = pref.getString('username');
    });
  }

  void getStatus() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      status = pref.getString('status');
    });
  }
}
