import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About Cat")),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder(
            builder: (context, snapshot) {
              //var data = json.decode(snapshot.data.toString()); //to list format
              //data[index]['title'] if from json
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return MyBox(
                      snapshot.data[index]['title'],
                      snapshot.data[index]['subtitle'],
                      snapshot.data[index]['image_url'],
                      snapshot.data[index]['details']);
                },
                itemCount: snapshot.data.length,
              );
            },
            future: getData(),
            //future:  DefaultAssetBundle.of(context).loadString('assets/data.json'),
          )),
    );
  }

  Widget MyBox(
    String title,
    String subtitle,
    String imageUrl,
    String details,
  ) {
    var v1, v2, v3, v4;
    v1 = title;
    v2 = subtitle;
    v3 = imageUrl;
    v4 = details;
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      //color: const Color.fromARGB(255, 152, 205, 186),
      height: 220,
      decoration: BoxDecoration(
          //color: const Color.fromARGB(255, 152, 205, 186),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.25),
              BlendMode.darken,
            ),
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 227, 227, 227)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: const TextStyle(
                fontSize: 14, color: Color.fromARGB(255, 227, 227, 227)),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                print("Next Page ");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => DetailPage(v1, v2, v3, v4))));
              },
              child: const Text(
                "Read more",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              )),
        ],
      ),
    );
  }

  Future getData() async {
    //https://raw.githubusercontent.com/zawaneemakeng/BasicAPI/main/data2.json

    var url = Uri.https(
        'raw.githubusercontent.com', 'zawaneemakeng/BasicAPI/main/data2.json');
    var response = await http.get(url);
    var result = json.decode(response.body);
    return result;
  }
}
