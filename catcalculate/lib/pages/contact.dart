import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            children: const [Text("zawanee"), Text("fjdfgggggggggkfjdkf")],
          ),
        )
      ],
    );
  }
}
