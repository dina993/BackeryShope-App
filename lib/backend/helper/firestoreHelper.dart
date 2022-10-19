import 'package:bakeryshop/model/product.dart';
import 'package:bakeryshop/model/user.dart';
import 'package:bakeryshop/utilities/router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreHelper {
  FirestoreHelper._();

  static FirestoreHelper firestoreHelper = FirestoreHelper._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;


  createNewUser(UserModel userModel, String userId) async {
    firestore.collection('Users').doc(userId).set(userModel.toMap());
  }

  exitApp() async {
    Globals.globals.userModel = null;
  }

  Future<UserModel> getUser(String userId) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
    await firestore.collection('Users').doc(userId).get();
    UserModel userModel = UserModel.fromDocumentSnapshot(documentSnapshot);
    Globals.globals.userModel = userModel;
    return userModel;
  }

  insertImage(String imageUrl, String id) async {
    await firestore.collection('Users').doc(id).update({'imageUrl': imageUrl});
  }

  addProduct(ProductModel productModel) async {
    await firestore.collection('products').add(productModel.toMap());
  }


}
