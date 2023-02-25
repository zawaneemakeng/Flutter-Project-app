import 'package:flutter/material.dart';

class CalculatPage extends StatefulWidget {
  const CalculatPage({super.key});

  @override
  State<CalculatPage> createState() => _CalculatPageState();
}

class _CalculatPageState extends State<CalculatPage> {
  TextEditingController weight = TextEditingController();
  TextEditingController result = TextEditingController();
  @override
  void initState() {
    super.initState();
    result.text = "----ผลลัพธ์-----";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cal"),
        backgroundColor: const Color(0xff5b3775),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Image.network(
                    'https://cdn-icons-png.flaticon.com/512/2171/2171991.png',
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: weight,
                    decoration: const InputDecoration(
                      labelText: 'กรอกน้ำหนักน้องเเงว (กิโลกรัม)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var w = double.parse(weight.text);
                      if (w <= 3.9) {
                        setState(() {
                          result.text =
                              "cat weight : ${weight.text} กิโลกรัม \nควรให้อาหารไม่เกิน 47 - 67 กรัมต่อวัน";
                        });
                      } else if (w <= 4.9) {
                        setState(() {
                          result.text =
                              "cat weight : ${weight.text} กิโลกรัม \nควรให้อาหารไม่เกิน 61 - 74 กรัมต่อวัน";
                        });
                      } else if (w <= 5.9) {
                        setState(() {
                          result.text =
                              "cat weight : ${weight.text} กิโลกรัม \nควรให้อาหารไม่เกิน 74 - 86 กรัมต่อวัน";
                        });
                      } else if (w <= 6.9) {
                        setState(() {
                          result.text =
                              "cat weight : ${weight.text} กิโลกรัม \nควรให้อาหารไม่เกิน 86 - 97 กรัมต่อวัน";
                        });
                      } else if (w > 6.9) {
                        setState(() {
                          result.text =
                              "cat weight : ${weight.text} กิโลกรัม \nเเมวของคุณอ้วนเกินไป ควรลดน้ำหนักน้อง";
                        });
                      }
                    },
                    child: Text('คำนวณ'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff5b3775)),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.fromLTRB(30, 20, 30, 20)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 18, fontFamily: 'Khanom')),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    result.text,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
