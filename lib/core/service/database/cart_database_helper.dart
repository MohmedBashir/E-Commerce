import 'package:e_commerce/model/cart_product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CartDataBaseHelper {
  CartDataBaseHelper._();

  static final CartDataBaseHelper db = CartDataBaseHelper._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      return await initDb();
    }
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartProducts.db');
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''CREATE TABLE cartProduct (
            id TEXT NOT NULL PRIMARY KEY,
            name TEXT NOT NULL, 
            image TEXT NOT NULL, 
            price TEXT NOT NULL, 
            quantity INTEGER NOT NULL)
            ''');
    });
  }

  insertToDatabase(CartProductModel product) async {
    var dbClient = await database;
    await dbClient.insert('cartProduct', product.tojson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CartProductModel>> getAllProduct() async {
    Database dbclient = await database;
    List<Map> jsonProducts = await dbclient.query('cartProduct');
    List<CartProductModel> productsList = jsonProducts.isNotEmpty
        ? jsonProducts
            .map((product) => CartProductModel.fromJson(product))
            .toList()
        : [];
    return productsList;
  }

  Future<int> deletFromDatabase(String id) async {
    var dbClient = await database;
    return await dbClient
        .delete('cartProduct', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateDatabase(CartProductModel product) async {
    var dbClient = await database;
    return await dbClient.update('cartProduct', product.tojson(),
        where: 'id = ?', whereArgs: [product.id]);
  }
}
