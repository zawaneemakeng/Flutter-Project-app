import 'package:flutter/material.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Doctor"),
          backgroundColor: const Color(0xff5b3775),
        ),
        body: Center(
          child: Column(
            children: const [Text("Test ")],
          ),
        ));
  }
}
