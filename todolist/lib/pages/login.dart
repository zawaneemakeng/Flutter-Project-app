import 'package:flutter/material.dart';
import 'package:todolist/pages/regiter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var username = TextEditingController();
  var password = TextEditingController();
  String result = "----------";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: ListView(
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
                      //setUsername(username.text);
                      //setStatus('success');
                    });
                  } else {
                    print("User : Other");
                    setState(() {
                      result = 'Login Failed';
                      //setUsername('Other user');
                      //setStatus('Failed');
                    });
                  }
                },
                child: Text("Login")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => RegisterPage())));
                },
                child: Text("Regiter")),
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
}
