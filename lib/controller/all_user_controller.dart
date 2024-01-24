import 'package:get/get.dart';
import 'package:localdatabase/controller/db_controller.dart';
import 'package:localdatabase/screen/add_user.dart';
import 'package:localdatabase/screen/edit_user.dart';
import '../model/user.dart';

class AllUserController extends GetxController {
  late List<User> users = [];
  var dbCtr = Get.put(DbController());
  bool loader = true;

  @override
  void onInit() async {
    await loadUser();
    super.onInit();
  }

  Future<void> loadUser() async {
    loader = true;
    update();
    users = [];
    await dbCtr.dbInit();
    dbCtr.db.query('user').then((value) {
      value.forEach((Map element) {
        users.add(User(
            id: element['id'], name: element['name'], age: element['age']));
      });
      loader = false;
      update();
    });
  }

  void editUserOnClick(User user) async {
    loader = true;
    await Get.to(EditUser(
      user: user,
    ));
    await loadUser();
  }

  void deleteUserOnClick(User user) {
    loader = true;
    dbCtr.db.delete('user', where: "id=?", whereArgs: [user.id]).then((value) {
      users.remove(user);
      loader = false;
      update();
    });
  }

  void gotoAddUserOnCLick() async {
    await Get.to(AddUser());
    await loadUser();
  }
}
