import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';

class Dbhelper {
  late Box
      box; //we are using "late" keyword as the box will be initialized later

  Dbhelper() //constructor
  {
    openBox();
  }

  openBox() {
    box = Hive.box('money');
  }

  Future addData(int amount, DateTime date, String note, String type) async {
    var value = {
      'amount': amount,
      'date': date,
      'type': type,
      'note': note
    }; // this is a map created from the values recieved from the function

    box.add(value); //added the map to the box
  }

  Future<Map> fetch() {
    if (box.values.isEmpty) {
      return Future.value(
          {}); //returns an empty map if the box values have nothing
    } else {
      return Future.value(box.toMap());
    }
  }
}
