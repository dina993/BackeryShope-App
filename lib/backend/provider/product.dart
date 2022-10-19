import 'dart:io';

import 'package:bakeryshop/backend/helper/firestorageHelper.dart';
import 'package:bakeryshop/backend/helper/firestoreHelper.dart';
import 'package:bakeryshop/model/product.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdminProvider extends ChangeNotifier {
  late File file;
  ProductModel? productModel;
  List<ProductModel> cartProducts = [];
  TextEditingController productNameController = TextEditingController();
  GlobalKey<FormState> productKey = GlobalKey<FormState>();

  selectImage() async {
    PickedFile pickedFile =
        (await ImagePicker().getImage(source: ImageSource.gallery))!;
    this.file = File(pickedFile.path);
    notifyListeners();
  }

  nullValidation(String value) {
    if (value.length == 0) {
      return 'Required field';
    }
  }

  addProduct() async {
    if (productKey.currentState!.validate()) {
      String imageUrl = await uploadImage('products');
      ProductModel productModel = ProductModel(
        productname: productNameController.text,
        image: imageUrl,
      );
      await FirestoreHelper.firestoreHelper.addProduct(productModel);
    } else {
      return;
    }
  }

  Future<String> uploadImage(String path) async {
    String? imageUrl =
        await FirestorageHelper.firestorageHelper.uploadImage(file, path);
    return imageUrl!;
  }
}
