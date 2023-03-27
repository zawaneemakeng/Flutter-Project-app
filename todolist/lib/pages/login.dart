import 'package:flutter/material.dart';
import 'package:todolist/pages/regiter.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/pages/todolist.dart';

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
                  login();
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

  Future login() async {
    // var url = Uri.https('abcd.ngrok.io', '/api/post-todolist');
    var url = Uri.http('--------------:8000', '/api/authenticate');
    Map<String, String> header = {"Content-type": "application/json"};

    String v1 = '"username":"${username.text}"';
    String v2 = '"password":"${password.text}"';

    String jsondata = '{$v1,$v2}';
    var response = await http.post(url, headers: header, body: jsondata);
    print('--------result--------');
    print(response.body);

    var resulttext = utf8.decode(response.bodyBytes);
    var result_json = json.decode(resulttext);

    String status = result_json['status'];

    if (status == 'login-success') {
      String t1 = result_json['first_name'];
      String t2 = result_json['last_name'];
      String user = result_json['username'];
      String token = result_json['token']; //ดึง
      setToken(token); //เมื่อได้รับ tokenเเล้วให้บันทึกในระบบ
      setUserInfo(t1, t2, user);
      //ไปยังหน้าใหม่เเเบบไม่ย้อน ไม่มีลูกศร
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => Todolist()));
    } else if (status == 'login-failed') {
      String setresult = 'เข้าสุ่ระบบไม่สำเร็จ';
      setState(() {
        result = setresult;
      });
    } else {
      String setresult = 'กรุณาลองอีกครั้ง';
      setState(() {
        result = setresult;
      });
    }
  }

  //auth
  void setToken(token) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', token);
  }

  void setUserInfo(fname, lname, usr) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('first_name', fname);
    pref.setString('last_name', lname);
    pref.setString('username', usr);
  }
}
