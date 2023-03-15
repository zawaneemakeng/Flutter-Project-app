import 'package:shop/product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLiteDatabase {
  late Database database;
  final String dbName = 'shop.sqlite3';
  final String tableName = 'Products';
  final String idField = 'id';
  final String nameField = 'productName';
  final String quanField = 'quantity';
  final String priceField = 'price';
  final String totalField = 'total';
  final String inStockField = 'inStock';

  Future initDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), dbName),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE  $tableName(
            $idField INTEGER PRIMARY KEY autoincrement,
            $nameField TEXT,
            $quanField INTEGER,
            $priceField REAL,
            $totalField REAL,
            $inStockField INTEGER
           )''');
      },
    );
  }

//CREATE
  Future<int> createdProduct(Product product) async {
    await initDatabase();
    return await database.insert(tableName, product.toMap());
  }

  //READ
  Future<List<Product>> readProduct() async {
    await initDatabase();
    final List<Map<String, dynamic>> maps = await database.query(tableName);
    return List.generate(maps.length, (index) {
      return Product(
        id: maps[index][idField],
        productName: maps[index][nameField],
        quantity: maps[index][quanField],
        price: maps[index][priceField],
        total: maps[index][totalField],
        inStock: maps[index][inStockField] == 1,
      );
    });
  }

//u
  Future<int> updateProduct(Product product) async {
    await initDatabase();
    return await database.update(tableName, product.toMap(),
        where: "id = ? ", whereArgs: [product.id]);
  }

//d
  Future<void> deleteProduct(int id) async {
    await initDatabase();
    await database.delete(tableName, where: "id = ? ", whereArgs: [id]);
  }
}
