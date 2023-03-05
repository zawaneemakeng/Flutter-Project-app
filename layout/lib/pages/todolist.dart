import 'package:flutter/material.dart';
//http method
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:layout/pages/add.dart';
import 'package:layout/pages/update_todolist.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  List todolistitems = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodolist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => AddPage())));
        },
        child: Icon(Icons.add),
        backgroundColor: const Color(0xff5b3775),
        foregroundColor: const Color.fromARGB(255, 169, 169, 169),
      ),
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    getTodolist();
                  });
                },
                icon: Icon(
                  Icons.refresh,
                  color: Color.fromARGB(255, 228, 208, 242),
                ))
          ],
          title: const Text(
            'All todolist',
          )),
      body: todolistCreate(),
    );
  }

  Widget todolistCreate() {
    return ListView.builder(
        itemCount: todolistitems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: ListTile(
                title: Text(
                  "${todolistitems[index]['title']}",
                  style: TextStyle(fontSize: 18),
                ),
                leading: Icon(Icons.event_note),
                tileColor: Color.fromARGB(255, 251, 244, 255),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => UpdateTodo(
                                todolistitems[index]['id'],
                                todolistitems[index]['title'],
                                todolistitems[index]['details'],
                              )))).then((value) {
                    setState(() {
                      getTodolist();
                    });
                  });
                },
              ),
            ),
          );
        });
  }

  Future getTodolist() async {
    var url = Uri.http('abcd.ngrok.io', '/api/all-todolist/');
    var response = await http.get(url);
    // var result = json.decode(response.body);
    var result = utf8.decode(response.bodyBytes);
    print(result);
    setState(() {
      todolistitems = jsonDecode(result);
    });
  }
}
