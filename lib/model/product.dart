

import 'package:bakeryshop/helper/firebasename.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProductModel {


  String? productname = "";
  String? idproduct= "";
  String? image='';
  ProductModel({this.productname, this.idproduct, this.image});

  Map<String, dynamic> toMap() {
    return {
      ConstantProduct.PRODUCTNAME: productname,
      ConstantProduct.IDPRODUCT: idproduct,
      ConstantProduct.IMAGE: image
    };
  }
  ProductModel.fromlist(Map<String, dynamic> snapshot) {
    productname = snapshot[ConstantProduct.PRODUCTNAME];
    idproduct =snapshot[ConstantProduct.IDPRODUCT];
    image =snapshot[ConstantProduct.IMAGE];
  }
}
