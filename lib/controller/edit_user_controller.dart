import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'db_controller.dart';

class EditUserController extends GetxController {
  final TextEditingController fullNameCtr = TextEditingController();
  final TextEditingController ageCtr = TextEditingController();
  final DbController _dbController = Get.find<DbController>();

  void updateUser(int id) {
    _dbController.db
        .update(
            'user', {"name": fullNameCtr.text, "age": int.parse(ageCtr.text)},
            where: "id=?", whereArgs: [id])
        .then((value) {
      _dbController.db.query('user').then((value) {
        Get.back(result: value);
      });
    });
  }
}
