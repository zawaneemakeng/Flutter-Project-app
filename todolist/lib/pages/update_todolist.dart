import 'package:flutter/material.dart';
//http method
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:todolist/pages/todolist.dart';

class UpdateTodo extends StatefulWidget {
  //constructor
  final v1, v2, v3;
  const UpdateTodo(this.v1, this.v2, this.v3);

  @override
  State<UpdateTodo> createState() => _UpdateTodoState();
}

class _UpdateTodoState extends State<UpdateTodo> {
  var _v1, _v2, _v3;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _v1 = widget.v1; //id
    _v2 = widget.v2; //title
    _v3 = widget.v3; //details
    todo_title.text = _v2;
    todo_details.text = _v3;
  }

  TextEditingController todo_title = TextEditingController();
  TextEditingController todo_details = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update"),
        actions: [
          IconButton(
              onPressed: () {
                print("ID : $_v1");
                deleteTodo();
                Navigator.pop(context, 'delate');
              },
              icon: Icon(
                Icons.delete_outline_outlined,
                color: Color.fromARGB(255, 228, 208, 242),
              ))
        ],
      ),
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
                left: 100, right: 100, top: 10, bottom: 0),
            child: ElevatedButton(
              onPressed: () {
                print(
                    '--------------------------------------------------------');
                print('title : ${todo_title.text}');
                print('details : ${todo_details.text}');
                updateTodo();
                final snackBar = SnackBar(
                  content: const Text('เเก้ไขเรียบร้อย'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {},
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text('Update',
                  style: TextStyle(
                    fontSize: 18,
                  )),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff5b3775),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: const Size(50, 50),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Future updateTodo() async {
    // var url = Uri.https('abcd.ngrok.io', '/api/post-todolist');
    var url = Uri.http('abcd.ngrok.io', '/api/update-todolist/$_v1');
    Map<String, String> header = {"Content-type": "application/json"};
    String jsondata =
        '{"title":"${todo_title.text}","details":"${todo_details.text}"}';
    var response = await http.put(url, headers: header, body: jsondata);
    print('--------result--------');
    print(response.body);
  }

  Future deleteTodo() async {
    // var url = Uri.https('abcd.ngrok.io', '/api/post-todolist');
    var url = Uri.http('abcd.ngrok.io', '/api/delete-todolist/$_v1');
    Map<String, String> header = {"Content-type": "application/json"};
    var response = await http.delete(url, headers: header);
    print('--------result--------');
    print(response.body);
  }
}
