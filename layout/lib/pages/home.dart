import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("เเอพเเนะนำพันธุ์เเมว"),
        backgroundColor: const Color.fromARGB(255, 16, 121, 85),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            builder: (context, snapshot) {
              var data = json.decode(snapshot.data.toString()); //to list format
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return MyBox(data[index]['title'], data[index]['subtitle'],
                      data[index]['image_url'], data[index]['details']);
                },
                itemCount: data.length,
              );
            },
            future:
                DefaultAssetBundle.of(context).loadString('assets/data.json'),
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
      margin: EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      //color: const Color.fromARGB(255, 152, 205, 186),
      height: 160,
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
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 227, 227, 227)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            subtitle,
            style: const TextStyle(
                fontSize: 14, color: Color.fromARGB(255, 227, 227, 227)),
          ),
          const SizedBox(
            height: 20,
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
              )),
        ],
      ),
    );
  }
}
