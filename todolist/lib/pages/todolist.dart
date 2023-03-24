import 'package:flutter/material.dart';
//http method
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:todolist/pages/add.dart';
import 'package:todolist/pages/update_todolist.dart';
import 'package:todolist/sqlitedb.dart';

import 'package:todolist/todo.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  List todolistitems = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'];
  String fullname = '';

  List<Todo> todolist = [];
  Todo readTodo = Todo(status: false);
  SqliteDatabase readsql = SqliteDatabase();

  readTodoSQL() async {
    List<Todo> allList = await readsql.readTodo();
    setState(() {
      todolist = allList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getTodolist();
    readTodoSQL();
    readTodo.status = false;
    check(); //ตรวจสอบว่ามีชื่อหรือไป ถ้ามีสวัสดี
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: ((context) => AddPage())))
              .then((value) {
            //.then ตือให้ทำอะไรถ้ากลับมา
            setState(() {
              //getTodolist();
            });
          });
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
      body: ListView(children: [
        Center(child: Text(fullname)),
      ]),
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
                    //.then ตือให้ทำอะไรถ้ากลับมา
                    setState(() {
                      getTodolist();
                      print(value);
                      if (value == 'delate') {
                        final snackBar = SnackBar(
                          content: const Text('เเก้ไขเรียบร้อย'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    });
                  });
                },
              ),
            ),
          );
        });
  }

  Widget todolistCreateSQL() {
    return ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (context, index) {
          int todoID = todolist[index].id!;
          String todoTitle = todolist[index].title!;
          String todoDetails = todolist[index].details!;

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: ListTile(
                leading: Checkbox(
                  value: todolist[index].status,
                  onChanged: (bool? value) {
                    setState(() {
                      todolist[index].status = value!;
                    });
                  },
                ),
                title: Text(
                  todoTitle,
                  style: TextStyle(fontSize: 18),
                ),
                tileColor: Color.fromARGB(255, 251, 244, 255),
                onTap: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  UpdateTodo(todoID, todoTitle, todoDetails))))
                      .then((value) {
                    //.then ตือให้ทำอะไรถ้ากลับมา
                    setState(() {
                      print(value);
                      if (value == 'delate') {
                        final snackBar = SnackBar(
                          content: const Text('เเก้ไขเรียบร้อย'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      readTodoSQL();
                    });
                  });
                },
                enabled: todolist[index].status ==
                    false, //ถ้าtodolist ถูกเช็ค ไม่สามารถทำงานได้
              ),
            ),
          );
        });
  }

  Future getTodolist() async {
    var url = Uri.http('---------:8000', '/api/all-todolist/');
    var response = await http.get(url);
    // var result = json.decode(response.body);
    var result = utf8.decode(response.bodyBytes);
    print(result);
    setState(() {
      todolistitems = jsonDecode(result);
    });
  }

  void getFullname() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var first_name = pref.getString('first_name');
      fullname = 'สวัสดีคุณ $first_name';
    });
  }

  void check() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final checkvalue = pref.get('first_name') ?? 0;
    if (checkvalue != 0) {
      getFullname();
    }
  }
}
