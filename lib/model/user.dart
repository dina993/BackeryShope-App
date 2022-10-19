import 'package:bakeryshop/helper/firebasename.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String? username="";
  String? role ="";
  String? type="";
  String? id="";
  String? phone="";
  String? email="";
  String? description ="";
  String? group= "";
  String? Ytunus="";
  String? address="";

  UserModel({this.username, this.role, this.type, this.id, this.phone,
    this.email, this.description, this.group, this.Ytunus, this.address});


  UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
    // _group=snapshot[constantuser.group];
    id=snapshot[constantuser.id];
    username=snapshot[constantuser.name];
    email=snapshot[constantuser.email];
    phone=snapshot[constantuser.phone];
    description=snapshot[constantuser.description];
    type=snapshot[constantuser.type];
    if(type=="employe"){
      role=snapshot[constantuser.role];

    }
    if(type=="costumer"){
      address=snapshot[constantuser.address];
      Ytunus=snapshot[constantuser.ytunus];
      group=snapshot[constantuser.group];
    }

  }
  UserModel.from(Map<String, dynamic> snapshot){
    // _group=snapshot[constantuser.group];
    id=snapshot[constantuser.id];
    username=snapshot[constantuser.name];
    email=snapshot[constantuser.email];
    phone=snapshot[constantuser.phone];
    description=snapshot[constantuser.description];
    type=snapshot[constantuser.type];

if(type=="employe"){
  role=snapshot[constantuser.role];

}
if(type=="costumer"){
  address=snapshot[constantuser.address];
  Ytunus=snapshot[constantuser.ytunus];
  group=snapshot[constantuser.group];
}

  }

  Map<String, dynamic> toMap() {
    return {
      "name" :username,
      "phone":phone,
      "_description":description,
      'email': email,
      'address':address,
      'type':type

    };
  }

}