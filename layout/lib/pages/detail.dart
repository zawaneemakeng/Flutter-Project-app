import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final v1, v2, v3, v4;
  DetailPage(this.v1, this.v2, this.v3, this.v4);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var _v1, _v2, _v3, _v4;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _v1 = widget.v1; //referent from v1
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("details")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(_v1,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5b3775))),
            const SizedBox(
              height: 15,
            ),
            Text(
              _v2,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15), // Image border
              child: SizedBox.fromSize(
                size: const Size.fromRadius(120), // Image radius
                child: Image.network(_v3, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(_v4, style: TextStyle(fontSize: 12))
          ],
        ),
      ),
    );
  }
}
