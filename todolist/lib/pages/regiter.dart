import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var username = TextEditingController();
  var password = TextEditingController();
  var first_name = TextEditingController();
  var last_name = TextEditingController();
  var mobile = TextEditingController();

  String result = "----Result------";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: ListView(
          children: [
            Text("Register"),
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
                  border: OutlineInputBorder(), labelText: 'Email'),
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
            TextField(
              controller: first_name,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ชื่อ'), //ขนาดของช่องกรอก
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: last_name,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'นามสกุล'), //ขนาดของช่องกรอก
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: mobile,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'เบอร์โทรศัพท์'), //ขนาดของช่องกรอก
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  register_newuser();
                },
                child: Text("Register")),
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

  Future register_newuser() async {
    // var url = Uri.https('abcd.ngrok.io', '/api/post-todolist');
    var url = Uri.http('--------:8000', '/api/newuser');
    Map<String, String> header = {"Content-type": "application/json"};

    String v1 = '"username":"${username.text}"';
    String v2 = '"password":"${password.text}"';
    String v3 = '"first_name":"${first_name.text}"';
    String v4 = '"last_name":"${last_name.text}"';
    String v5 = '"mobile":"${mobile.text}"';

    String jsondata = '{$v1,$v2,$v3,$v4,$v5}';
    var response = await http.post(url, headers: header, body: jsondata);
    print('--------result--------');
    print(response.body);

    var resulttext = utf8.decode(response.bodyBytes);
    var result_json = json.decode(resulttext);

    String status = result_json['status'];

    if (status == 'user_created') {
      String t1 = result_json['first_name'];
      String t2 = result_json['last_name'];
      String token = result_json['token']; //ดึง
      setToken(token); //เมื่อได้รับ tokenเเล้วให้บันทึกในระบบ
      String setresult = 'ยินดีด้วย คุณ $t1 $t2\n คุณได้สมัคสมาชิกเรียบร้อย';
      setState(() {
        result = setresult;
      });
    } else if (status == 'user-exist') {
      String setresult = 'คุณเป็นสมาชิกเรียบร้อยเเล้ว';
      setState(() {
        result = setresult;
      });
    } else {
      String setresult = 'ข้อมูลไม่ถูกต้อง';
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
}
