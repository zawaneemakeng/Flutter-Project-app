import 'package:flutter/material.dart';
import 'package:shop/product.dart';
import 'package:shop/sqlite.dart';
import 'package:shop/updatepage.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pdName = TextEditingController();
  final pdQuantity = TextEditingController();
  final pdPrice = TextEditingController();

  Product product = Product(inStock: false);
  SQLiteDatabase dbHelper = SQLiteDatabase();
  List<Product> pdList = [];

  _refreshList() async {
    List<Product> lists = await dbHelper.readProduct();
    setState(() {
      pdList = lists;
    });
  }

  @override
  void initState() {
    super.initState();
    product.inStock = false;
    _refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          SizedBox(height: 20),
          Image.network(
            'https://cdn-icons-png.flaticon.com/512/2981/2981313.png',
            height: 100,
            width: 100,
          ),
          SizedBox(height: 20),
          buildForm(),
          SizedBox(height: 10),
          buildListView(),
        ],
      ),
    );
  }

  Widget buildForm() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Product Name',
              border: OutlineInputBorder(),
            ),
            controller: pdName,
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
                labelText: 'Product Quantity', border: OutlineInputBorder()),
            controller: pdQuantity,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
                labelText: 'Product Price', border: OutlineInputBorder()),
            controller: pdPrice,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('มีสินค้าในสต๊อคหรือไม่'),
              Checkbox(
                  value: product.inStock,
                  onChanged: ((value) {
                    setState(() {
                      product.inStock = value!;
                    });
                  }))
            ],
          ),
          SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                if (pdName.text.isNotEmpty &&
                    pdQuantity.text.isNotEmpty &&
                    pdPrice.text.isNotEmpty) {
                  saveData();
                }
              },
              child: Text('บันทึก'))
        ],
      ),
    );
  }

  Widget buildListView() {
    return Expanded(
      child: Card(
          child: Scrollbar(
              child: ListView.builder(
                  itemCount: pdList.isEmpty ? 0 : pdList.length,
                  itemBuilder: (context, index) {
                    int pdId = pdList[index].id!;
                    String pdName = pdList[index].productName!;
                    int pdQuan = pdList[index].quantity!;
                    double pdPrice = pdList[index].price!;
                    double pdTotal = pdList[index].total!;
                    bool pdinStock = pdList[index].inStock;
                    return Column(
                      children: [
                        ListTile(
                          title: Text('$pdId  $pdName'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Quantity $pdQuan'),
                              Text('price $pdPrice'),
                              Text('total $pdTotal'),
                              Text('Stock ${pdinStock ? "มี" : "ไม่มี"}')
                            ],
                          ),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      bool updateed = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => UpdatePage(
                                                  editProduct: pdList[index])));
                                      if (updateed == true) {
                                        _refreshList();
                                      }
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.green,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      dbHelper.deleteProduct(pdId);
                                      _refreshList();
                                    },
                                    icon: Icon(Icons.delete, color: Colors.red))
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }))),
    );
  }

  saveData() async {
    product.productName = pdName.text;
    product.quantity = int.parse(pdQuantity.text);
    product.price = double.parse(pdPrice.text);
    product.total = product.quantity! * product.price!;

    product = Product(
        productName: product.productName,
        quantity: product.quantity,
        price: product.price,
        total: product.total,
        inStock: product.inStock);
    await dbHelper.createdProduct(product);
    setState(() {
      pdName.text = '';
      pdQuantity.text = '';
      pdPrice.text = '';
      product.inStock = false;
    });
    await _refreshList();
  }
}
