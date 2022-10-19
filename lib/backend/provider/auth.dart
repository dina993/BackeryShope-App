import 'dart:io';

import 'package:bakeryshop/backend/helper/AuthHelper.dart';
import 'package:bakeryshop/backend/helper/firestorageHelper.dart';
import 'package:bakeryshop/backend/helper/firestoreHelper.dart';
import 'package:bakeryshop/model/user.dart';
import 'package:bakeryshop/screens/Log_in.dart';
import 'package:bakeryshop/utilities/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class AuthProvider extends ChangeNotifier {
  User? user;
  int isAdmin = 0;
  // bool isAdmin=true;
  //
  // changeIsAdmin( bool value){
  //   isAdmin=true;
  //   notifyListeners();
  // }
  toggleIsAdmin(int i) {
    this.isAdmin = i;
    notifyListeners();
  }

  User? currentUser;
  UserModel? userModel;
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  // registerUser() async {
  //   if (registerKey.currentState.validate()) {
  //     UserModel userModel = UserModel(
  //         city: cityController.text,
  //         email: emailController.text,
  //         fullName: fullNameController.text,
  //         password: passwordController.text,
  //         phoneNumber: phoneNumberController.text,
  //         isAdmin: isAdmin == 1 ? true : false);
  //     User user = await AuthHelper.authHelper.register(userModel.email, userModel.password);
  //     FirestoreHelper.firestoreHelper.createNewUser(userModel, user.uid);
  //     getCurrentUser();
  //   } else {
  //     return;
  //   }
  // }

  login() async {
    if (loginKey.currentState!.validate()) {
      User user = (await AuthHelper.authHelper
          .login(emailController.text, passwordController.text))!;
      await FirestoreHelper.firestoreHelper.getUser(user.uid);
      getCurrentUser();
    } else {
      return;
    }
  }

  logout() async {
    this.currentUser = null;
    this.userModel = null;
    await FirebaseAuth.instance.signOut();
    emailController.clear();
    passwordController.clear();
    AppRouter.router.pushReplacementToNewWidget(Log_in());
  }

  updateUserImage(File file) async {
    String userId = this.currentUser!.uid;
    String? imageUrl =
        await FirestorageHelper.firestorageHelper.uploadImage(file);
    await FirestoreHelper.firestoreHelper.insertImage(imageUrl!, userId);
    getCurrentUser();
  }

  getCurrentUser() async {
    this.currentUser = AuthHelper.authHelper.getCurrentUserId();

    if (currentUser != null) {
      this.userModel =
          await FirestoreHelper.firestoreHelper.getUser(currentUser!.uid);
      // AppRouter.router.pushReplacementToNewWidget(BottomNavBar());
    } else {
      // AppRouter.router.pushReplacementToNewWidget(LoginScreen());
    }
    notifyListeners();
  }

  nullValidation(String value) {
    if (value.length == 0) {
      return 'Required field';
    }
  }

  emailValidation(String value) {
    if (value.length == 0 || value == null) {
      return 'Required Field';
    } else if (!isEmail(value)) {
      return 'Invalid Email syntax';
    }
  }

  validatePassword(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern as String);
    print(value);
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value))
        return 'Enter valid password';
      else
        return null;
    }
  }

  validateRepeatedPassword(String value) {
    if (value != this.passwordController.text) {
      return 'the entered passwords are not matched';
    }
  }
}
