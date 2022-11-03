import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:online_course/app/components/custom_button.dart';
import 'package:online_course/app/components/custom_input_password.dart';
import 'package:online_course/app/components/custom_text_field.dart';
import 'package:online_course/app/utils/style.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        title: Text(
          'Sign In',
          style: textTitle(size: 18),
        ),
        centerTitle: true,
        leading: BackButton(color: Colors.black),
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 17.5),
            width: Get.width,
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/png/programmer.png',
                        width: Get.width * .6),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Email',
                  style: textTitle(size: 18),
                ),
                SizedBox(height: 5),
                CustomTextField(
                  borderColor: Colors.grey,
                  hintText: 'Enter email or phone number',
                  controller: TextEditingController(),
                ),
                SizedBox(height: 20),
                Text(
                  'Password',
                  style: textTitle(size: 18),
                ),
                SizedBox(height: 5),
                CustomInputPassword(
                  borderColor: Colors.grey,
                  hintText: 'Enter email or phone number',
                  controller: TextEditingController(),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      child: Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Remember me',
                      style: textSubtitle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Forgot Password?',
                      style: textSubtitle(
                        color: Get.theme.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox.fromSize(
                  size: Size(Get.width, 55),
                  child: CustomButton(
                    onTap: () {},
                    text: 'Sign In',
                  ),
                ),
                SizedBox(height: 20),
                Row(children: <Widget>[
                  Expanded(
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("OR"),
                  ),
                  Expanded(child: Divider()),
                ]),
                SizedBox(height: 20),
                SizedBox.fromSize(
                  size: Size(Get.width, 55),
                  child: CustomButton(
                    onTap: () {},
                    text: 'Using Social Media Account',
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account? ',
                        style: textSubtitle(
                          fontWeight: FontWeight.normal,
                        )),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Sign Up',
                        style: textSubtitle(
                          color: Get.theme.primaryColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
