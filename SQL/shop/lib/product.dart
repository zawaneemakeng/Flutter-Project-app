class Product {
  int? id;
  String? productName;
  int? quantity;
  double? price;
  double? total;
  bool inStock;

  Product(
      {this.id,
      this.productName,
      this.quantity,
      this.price,
      this.total,
      required this.inStock});
  //required this.inStockค่่าnull ไม่ได้
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'productName': productName,
      'quantity': quantity,
      'price': price,
      'total': total,
      'inStock': inStock ? 1 : 0 //sql no booleean
    };
    return map;
  }
}
