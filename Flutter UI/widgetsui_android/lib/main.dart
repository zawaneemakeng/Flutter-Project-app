import 'package:flutter/material.dart';
import 'package:widgetsui_android/form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var passwordConrtoller = TextEditingController();
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildImage(),
            const SizedBox(height: 20),
            buildText(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: buildTextField(),
            ),
            const SizedBox(height: 20),
            buildButton()
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return Image.asset(
      'assets/profile.png',
      width: 50,
      height: 50,
    );
  }

  Widget buildText() {
    return const Text(
      "fill Password",
      style: TextStyle(fontSize: 20),
    );
  }

  Widget buildTextField() {
    return TextField(
      controller: passwordConrtoller,
      obscureText: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password'), //ขนาดของช่องกรอก
    );
  }

  Widget buildButton() {
    return ElevatedButton(
        onPressed: () {
          if (passwordConrtoller.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text("Plese Enter your Password"),
              action: SnackBarAction(
                  label: "OK",
                  onPressed: () {
                    print('ok');
                  }),
            ));
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const FormUI())));
          }
        },
        child: const Text("Submit"));
  }
}
