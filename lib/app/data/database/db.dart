
import 'package:sqflite/sqflite.dart';

class SqlService{

  static final _singleton = SqlService();
  static SqlService get instance => _singleton;


  late Database _db;

  Future<void>openOrCreateDb()async{
    _db = await openDatabase("CartDb",version: 1,
    onCreate:(Database db,int version)async{
      await db.execute("CREATE TABLE cart(id INTEGER PRIMARY KEY,productid INTEGER,name TEXT,quantity INTEGER,price DOUBLE,imageUrl TEXT)");
    } );
  }

  Future<List<Map<String,dynamic>>>getCartItems()async{

    try{
      await openOrCreateDb();
      List<Map<String,dynamic>>data = await _db.rawQuery("SELECT * FROM cart");

      return data;
    }catch(e){

      print(e.toString());
      return [];
    }
  }

  Future<bool> productExists(int productId) async {
    final db = await _db;

    final List<Map<String, dynamic>> result = await db.query(
      'cart',
      where: 'productId = ?',
      whereArgs: [productId],
    );

    return result.isNotEmpty;
  }



  Future<void>addToCart({required productId,required name,required price,required quantity,required imageUrl})async{
    try{

      await openOrCreateDb();
      bool exists = await productExists(productId);

       if(!exists){
      await _db.insert("cart", {
           "productId":productId,"name":name,"price":price,"quantity":quantity,"imageUrl":imageUrl
         },
         );
      await getCartItems();
       }else{
         print("product already exist in cart");
       }

      getCartItems();
    }catch(e){
      print(e.toString());
    }
  }
  
  Future<void>deleteItem({required int productId})async{
    try{
      await openOrCreateDb();
        _db.delete("cart",
      where: "productid = ?",
      whereArgs: [productId]);
        getCartItems();
        print("item deleted");
    }catch(e){
      print(e.toString());
    }
  }
  Future<void>updateDb({required int quantity,required int productid})async{
    try{
      await openOrCreateDb();
      _db.update("cart", {"quantity": quantity},
      where: "productid = ?",
      whereArgs: [productid]);
      getCartItems();
    }catch(e){
      print(e.toString());
    }
  }




}