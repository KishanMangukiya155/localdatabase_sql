import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localdatabase/controller/edit_user_controller.dart';

import '../model/user.dart';

class EditUser extends StatelessWidget {
  EditUser({super.key, required this.user});

  final EditUserController _editUserController = Get.put(EditUserController());
  final User user;

  @override
  Widget build(BuildContext context) {
    _editUserController.fullNameCtr.text = user.name;
    _editUserController.ageCtr.text = user.age.toString();

    return Scaffold(
      appBar: AppBar(title: Text("Edit User")),
      body: Padding(
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
              controller: _editUserController.fullNameCtr,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelText: "Full Name"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _editUserController.ageCtr,
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
                onPressed: () => _editUserController.updateUser(user.id!),
                child: Text("Update"))
          ],
        ),
      ),
    );
  }
}
