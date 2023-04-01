import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About App')),
      body: Center(
        child: Column(
          children: [
            const Text(
              "เกี่ยวกับเเอป",
            ),
            const Text("this is application about todolist ")
          ],
        ),
      ),
    );
  }
}
