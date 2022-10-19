import 'dart:async';

import 'package:bakeryshop/helper/firebasename.dart';
import 'package:bakeryshop/model/user.dart';
import 'package:bakeryshop/service/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:shared_preferences/shared_preferences.dart';
enum Status {
  loadedadmin,loadedemploye,loadedcostumer,unloaded,Uninitialized
}

class UserProvider with ChangeNotifier {
  User? _user;
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();
  UserModel _userModel=UserModel();

List<UserModel>_costumers=[];
List<UserModel>_employes=[];
  bool loading=false;

  List<UserModel> get employes => _employes;

  List<UserModel> get costumers => _costumers; //  getter

  UserModel get userModel => _userModel;

  User? get user => _user;

 String  _genderselect="";


  Status get status => _status;

  set userModel(UserModel value) {
    _userModel = value;
  }
  UserProvider.statusfunction() {
    initialization.then((value) {
      auth.authStateChanges().listen((user) {
        if (user == null) {
          _status= Status.unloaded;
        }
        else {
          _onStateChanged(user);
        }
      });
    });
  }
  UserProvider.getlist(){
 initialization.then((value) =>    getusers() );

  }
  // public variables
  final formkey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController ytunus = TextEditingController();
  TextEditingController group = TextEditingController();
  TextEditingController role = TextEditingController();
  TextEditingController description = TextEditingController();




  Future<bool> signIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      await auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim())
          .then((value) async {
        await prefs.setString("id", value.user!.uid);
      });
      await _onStateChanged(_user!);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUpcostumer() async {
    try {
      print("im in signup");
      await auth
          .createUserWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim())
          .then((result) async {
          _userServices.createUser(

            id: result.user!.uid,
            name: name.text.trim(),
            email: email.text.trim(),
            phone: phone.text.trim(),
            address: address.text.trim(),
            group: group.text ,
            description: description.text,
            ytunus:ytunus.text,
          );

      });
      return true;
    } catch (e) {


      print(e.toString());
      return false;
    }
  }

  Future<bool> signUpemploye() async {
    try {
      print("im in signup");
      await auth
          .createUserWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim())
          .then((result) async {

        _userServices.createemploye(
            role: role.text,
            id: result.user!.uid,
            name: name.text,
            phone: phone.text,
            email: email.text,
            description: description.text
        );





      });

      return true;
    } catch (e) {


      print(e.toString());
      return false;
    }
  }



  reloadUserModel(User firebaseUser) async {
    _userModel = await _userServices.getUserById(firebaseUser.uid);

    notifyListeners();
  }

  updateUserData(Map<String, dynamic> data) async {
    _userServices.updateUserData(data);
  }
  uploadimage(String linkimage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id= prefs.getString("id");
    _userServices.uploadimage(linkimage,id);
  }





  _onStateChanged(User firebaseUser) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();


        _user = firebaseUser;
        await prefs.setString("id", firebaseUser.uid);
        await _userServices.getUserById(user!.uid).then((value) async {
          _userModel=value;
          if(_userModel.type=="admin"){
            _status= Status.loadedadmin;
          }else{ if(_userModel.type=="costumer"){
            _status= Status.loadedcostumer;
          }else{if(_userModel.type=="employe"){
            _status= Status.loadedemploye;
          }}}
          notifyListeners();


       });
      }catch(e){
      print("$e");
    }
      notifyListeners();


    }
    getusers()async {
    List<UserModel> a= await _userServices.getUsers();
    for(int i = 0; i<a.length;i++){
      if(a[i]. type=="costumer"){
        _costumers.add(a[i]);

      }
      if(a[i].type=="employe"){
        _employes.add(a[i]);
      }
    }
    loading=true;
  notifyListeners();  }
  }



