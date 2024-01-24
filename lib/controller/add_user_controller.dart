import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:localdatabase/controller/db_controller.dart';
import 'package:localdatabase/model/user.dart';

class AddUserController extends GetxController {
  final TextEditingController fullNameCtr = TextEditingController();
  final TextEditingController ageCtr = TextEditingController();
  final DbController _dbController = Get.find<DbController>();
  bool loader = false;

  void saveUserOnClick() async {
    if (fullNameCtr.text != "" && ageCtr.text != "") {
      loader = true;
      update();

      await _dbController.db.insert('user',
          User(name: fullNameCtr.text, age: int.parse(ageCtr.text)).toMap());
      fullNameCtr.clear();
      ageCtr.clear();
      loader = false;
      update();
      Get.back();
    }
  }
}
