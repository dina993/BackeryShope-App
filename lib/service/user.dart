

import 'package:bakeryshop/helper/firebasename.dart';
import 'package:bakeryshop/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserServices {
  String collection = "users";

  void createUser({

    required String id,
    required String name,
    required String phone,
    required String email,
    required String address,
    required String ytunus,
    required String description,
    required String group,
  }) {
    try {
      DocumentReference ref = firebaseFiretore.collection(collection).doc(id);
      ref.set({
        constantuser.type:"costumer",

        constantuser.id:id,
        constantuser.name: name,
        constantuser.phone:phone,
        constantuser.email:email,
        constantuser.address:address,
        constantuser.ytunus:ytunus,
        constantuser.description:description,
        constantuser.group: group,

      });
    } catch (e) {
      print("exception create User file=>service user : $e ");
    }
  }
  void createemploye({
    required String role,
    required String id,
    required String name,
    required String phone,
    required String email,
    required String description,

  }) {
    try {
      DocumentReference ref = firebaseFiretore.collection(collection).doc(id);
      ref.set({
        constantuser.type:"employe",

        constantuser.id:id,
        constantuser.name: name,
        constantuser.phone:phone,
        constantuser.description:description,
        constantuser.email:email,
        constantuser.role: role,



      });
    } catch (e) {
      print("exception create User file=>service user : $e ");
    }
  }

  void updateUserProfile({
    required String role,
    required String id,
    required String name,
    required String phone,
    required String email,
    required String address,
    required String ytunus,
    required String description,
    required String group,
  }) {
    try {
      firebaseFiretore.collection(collection).doc(id).update({

        constantuser.name: name,
        constantuser.phone:phone,
        constantuser.email:email,
        constantuser.address:address,
        constantuser.ytunus:ytunus,
        constantuser.description:description,
        constantuser.group: group,
      });
    } catch (e) {
      print("exception  update User Profile file=>service user: $e ");
    }
  }


  void updateUserData(Map<String, dynamic> values) {

    firebaseFiretore.collection(collection).doc(values['id']).update(values);
  }

  void uploadimage(String linkimage, String? id) {
    firebaseFiretore.collection(collection).doc(id).update({
      "imageprofile": linkimage
    });
  }

  Future<UserModel> getUserById(String id) async =>
      await firebaseFiretore.collection(collection).doc(id).get().then((doc) {
        //  print("role eole from snapshot ${doc.get("role")}");
        return UserModel.fromDocumentSnapshot(doc);
      });

  Future<List<UserModel>> getUsers() async {
    List<UserModel>a=[];
      await firebaseFiretore.collection(collection).get().then((doc) {

        final _docData = doc.docs.map((doc) => doc.data()).toList();
        print(_docData);
        for (int i = 0; i < _docData.length; i++)
        a.add(UserModel.from(_docData[i]));
        });
      return a;
      }


}