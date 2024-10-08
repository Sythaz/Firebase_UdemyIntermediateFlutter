import 'package:firebase_udemyintermediate/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Register',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.nameC,
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.phone,
            controller: controller.phoneC,
            decoration: InputDecoration(
              labelText: "Phone number",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: controller.emailC,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          Obx(
            () => TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: controller.isHidden.value,
              controller: controller.passC,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () => controller.isHidden.toggle(),
                  icon: Icon(controller.isHidden.isTrue
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Obx(
            () {
              return ElevatedButton(
                onPressed: () {
                  controller.register(); // Memanggil fungsi register
                },
                child: controller.isLoading.isFalse
                    ? Text('Sign In')
                    : Text('Loading...'),
              );
            },
          )
        ],
      ),
    );
  }
}
