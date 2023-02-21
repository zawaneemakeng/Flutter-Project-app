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
        child: ListView(children: [
          const SizedBox(
            height: 17,
          ),
          MyBox(
              'บริติช ช็อตแฮร์ (British Shorthair)',
              'British shorthair เป็นหนึ่งในสายพันธุ์แมวที่เก่าแก่ที่สุดของประเทศอังกฤษ',
              'https://cdn.pixabay.com/photo/2022/01/29/10/59/cat-6977088_960_720.jpg'),
          const SizedBox(
            height: 25,
          ),
          MyBox(
              'สก๊อตทิช โฟลด์ (Scottish fold)',
              'แมวมันช์กิ้น เป็นแมวสายพันธุ์ขนาดกลาง ขาสั้นกุดและลำตัวยาว มีคนเปรียบเปรยไว้ว่า แมวสายพันธุ์นี้เคลื่อนที่เหมือนตัวเฟร์ริต',
              'https://cdn.pixabay.com/photo/2019/04/17/18/58/scottish-fold-4135062_960_720.jpg'),
          const SizedBox(
            height: 25,
          ),
          MyBox(
              'แมววิเชียรมาศ (Siamese cat)',
              'แมวพันธุ์วิเชียรมาศ หรือ แมวสยาม (Siamese cat) ที่เป็นดั่งตัวแทนสายพันธุ์แมวแห่งประเทศไทย ที่นอกจากจะมีเอกลักษณ์จากลวดลายและสีขนบนตัว',
              'https://cdn.pixabay.com/photo/2020/06/20/11/08/siamese-cat-5320568_960_720.jpg')
        ]),
      ),
    );
  }

  Widget MyBox(String title, String detail, String imageUrl) {
    return Container(
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
            detail,
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
                        builder: ((context) => const DetailPage())));
              },
              child: const Text(
                "Read more",
              )),
        ],
      ),
    );
  }
}
