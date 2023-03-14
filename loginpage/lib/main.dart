import 'package:flutter/material.dart';
import 'package:loginpage/view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var username = TextEditingController();
  var password = TextEditingController();
  String result = "----------";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loing Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(
          children: [
            Text("Login"),
            SizedBox(
              height: 30,
            ),
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/2674/2674147.png',
              height: 100,
              width: 100,
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: username,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Username'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password'), //ขนาดของช่องกรอก
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (username.text == 'admin') {
                    print("User : Admin");
                    setState(() {
                      username.text = 'admin';
                      result = 'Username : Admin';
                      setUsername(username.text);
                      setStatus('success');
                    });
                  } else {
                    print("User : Other");
                    setState(() {
                      result = 'Login Failed';
                      setUsername('Other user');
                      setStatus('Failed');
                    });
                  }
                },
                child: Text("Login")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => ViewPage())));
                },
                child: Text("View Username")),
            SizedBox(
              height: 20,
            ),
            Text(
              result,
              style: TextStyle(fontSize: 20, color: Colors.pink),
            )
          ],
        )),
      ),
    );
  }

  Future<void> setUsername(textUsername) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('username', textUsername);
  }

  Future<void> setStatus(textStatus) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('status', textStatus);
  }
}
