import 'package:flutter/material.dart';
import 'package:shop/product.dart';
import 'package:shop/sqlite.dart';

class UpdatePage extends StatefulWidget {
  final Product editProduct;
  const UpdatePage({super.key, required this.editProduct});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late TextEditingController pdNameUpdate;
  late TextEditingController pdQuanUpdate;
  late TextEditingController pdPriceUpdate;

  Product editProduct = Product(inStock: false);
  SQLiteDatabase dpHelper = SQLiteDatabase();

  late int selectID;
  late double editTotal;
  late bool editInstock;

  @override
  void initState() {
    super.initState();
    selectID = widget.editProduct.id!;
    pdNameUpdate = TextEditingController(text: widget.editProduct.productName);
    pdQuanUpdate =
        TextEditingController(text: widget.editProduct.quantity.toString());
    pdPriceUpdate =
        TextEditingController(text: widget.editProduct.price.toString());
    editTotal = widget.editProduct.total!;

    editInstock = widget.editProduct.inStock;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update')),
      body: buildEditForm(),
    );
  }

  Widget buildEditForm() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Product Name',
              border: OutlineInputBorder(),
            ),
            controller: pdNameUpdate,
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
                labelText: 'Product Quantity', border: OutlineInputBorder()),
            controller: pdQuanUpdate,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
                labelText: 'Product Price', border: OutlineInputBorder()),
            controller: pdPriceUpdate,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('มีสินค้าในสต๊อคหรือไม่'),
              Checkbox(
                  value: editInstock,
                  onChanged: ((value) {
                    setState(() {
                      editInstock = value!;
                    });
                  }))
            ],
          ),
          SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                if (pdNameUpdate.text.isNotEmpty &&
                    pdQuanUpdate.text.isNotEmpty &&
                    pdPriceUpdate.text.isNotEmpty) {
                  setState(() {
                    EditData(context);
                  });
                }
              },
              child: Text('บันทึก'))
        ],
      ),
    );
  }

  void EditData(BuildContext context) {
    editProduct.productName = pdNameUpdate.text;
    editProduct.quantity = int.parse(pdQuanUpdate.text);
    editProduct.price = double.parse(pdPriceUpdate.text);
    editProduct.total = editProduct.quantity! * editProduct.price!;

    editProduct = Product(
        id: selectID,
        productName: editProduct.productName,
        quantity: editProduct.quantity,
        price: editProduct.price,
        total: editProduct.total,
        inStock: editProduct.inStock);
    dpHelper.updateProduct(editProduct);
    Navigator.pop(context, true);
  }
}
