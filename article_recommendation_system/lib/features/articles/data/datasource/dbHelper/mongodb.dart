/*import 'dart:developer';

import 'package:article_recommendation_system/features/articles/data/datasource/dbHelper/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLECTION_NAME);
  }
}*/
