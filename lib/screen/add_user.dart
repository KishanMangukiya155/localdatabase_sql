import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localdatabase/controller/add_user_controller.dart';
import 'package:localdatabase/screen/all_user.dart';

class AddUser extends StatelessWidget {
  AddUser({super.key});
  final AddUserController _addUserController = Get.put(AddUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
              child: Text("Add User", style: TextStyle(color: Colors.white))),
          backgroundColor: Colors.blue),
      body: GetBuilder<AddUserController>(builder: (controller) {
        if (controller.loader) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Add User",
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _addUserController.fullNameCtr,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: "Full Name"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _addUserController.ageCtr,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: "Age"),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: _addUserController.saveUserOnClick,
                    child: Text("Save"))
              ],
            ),
          );
        }
      }),
    );
  }
}
