import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localdatabase/controller/all_user_controller.dart';

class AllUser extends StatelessWidget {
  AllUser({super.key});

  var allUserCtr = Get.put(AllUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All User",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.blue,
      ),
      body: GetBuilder<AllUserController>(builder: (controller) {
        if (controller.loader) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text("${controller.users[index].name}"),
                  subtitle: Text("${controller.users[index].age}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () =>
                            allUserCtr.editUserOnClick(controller.users[index]),
                        icon: Icon(Icons.edit_outlined),
                      ),
                      IconButton(
                        onPressed: () => allUserCtr
                            .deleteUserOnClick(controller.users[index]),
                        icon: const Icon(Icons.delete_outline),
                      ),
                    ],
                  ));
            },
            itemCount: controller.users.length,
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
          onPressed: allUserCtr.gotoAddUserOnCLick,
          child: const Icon(Icons.add)),
    );
  }
}
