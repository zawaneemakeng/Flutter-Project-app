import 'package:flutter/material.dart';
//http method
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController todo_title = TextEditingController();
  TextEditingController todo_details = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add To Do List ")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: [
          Image.network(
            'https://cdn-icons-png.flaticon.com/512/2387/2387635.png',
            height: 100,
            width: 100,
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: todo_title,
            decoration: const InputDecoration(
              labelText: 'รายการที่ต้องทำ',
              border: OutlineInputBorder(),
            ),
            minLines: 2,
            maxLines: 3,
          ),
          const SizedBox(
            height: 25,
          ),
          TextField(
            controller: todo_details,
            decoration: const InputDecoration(
              labelText: 'รายละเอียดราบการที่ต้องทำ',
              border: OutlineInputBorder(),
            ),
            minLines: 4,
            maxLines: 8,
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 150, right: 150, top: 10, bottom: 0),
            child: ElevatedButton(
              onPressed: () {
                print(
                    '--------------------------------------------------------');
                print('title : ${todo_title.text}');
                print('details : ${todo_details.text}');
                postTodo();
              },
              child: Text('เพิ่มรายการ',
                  style: TextStyle(
                    fontSize: 18,
                  )),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff5b3775),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: const Size(20, 50),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Future postTodo() async {
    // var url = Uri.https('abcd.ngrok.io', '/api/post-todolist');
    var url = Uri.http('abcd.ngrok.io', '/api/post-todolist');
    Map<String, String> header = {"Content-type": "application/json"};
    String jsondata =
        '{"title":"เรียนเขียนเเอป flutter ","details":"เรียนทุกวัน วันละ 1EP"}';
    var response = await http.post(url, headers: header, body: jsondata);
    print('--------result--------');
    print(response.body);
  }
}
