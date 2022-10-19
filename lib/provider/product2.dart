import 'dart:async';
import 'package:bakeryshop/helper/firebasename.dart';
import 'package:bakeryshop/model/product.dart';
import 'package:bakeryshop/service/product.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductProvider with ChangeNotifier {

  ProductService _productServices = ProductService();
  ProductModel _productmodel = new ProductModel();
  List<ProductModel> _listproduct = [];
  List<ProductModel> _listproductid = [];
  List<ProductModel> _listproductidoffer = [];
  List<ProductModel> _listproductidfilltring = [];
  bool _loading=false;
  bool _loadingprof=false;
  String _linkimage="";

  String get linkimage => _linkimage;

  set linkimage(String value) {
    _linkimage = value;
  }

  set loading(bool value) {
    _loading = value;
  }

  String get totalquantity => _totalquantity;

  set totalquantity(String value) {
    _totalquantity = value;
  }

  String _totalquantity="0";

//  getter

  ProductModel get Productmodel => _productmodel;
  List<ProductModel> get listproduct => _listproduct;
  List<ProductModel> get listproductid => _listproductid;
  List<ProductModel> get listproductidoffer => _listproductidoffer;
  List<ProductModel> get listproductidfilltring => _listproductidfilltring;
  bool get loading =>_loading;
  bool get loadingprof =>_loadingprof;
  // public variables

  ProductProvider.initialize() {

    _fireSetUp();

  }
  ProductProvider.nodata() {


  }
  ProductProvider.getProductbyidprof(String a) {


  }

  TextEditingController nameproduct = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController feature = TextEditingController();
  _fireSetUp() async {
    await initialization.then((value) {
      _onStateChanged();

    });
  }

  Future<bool> createproduct() async {
    try {

      _productServices.createProduct(

        productname: nameproduct.value.text,

        image: _linkimage,
      );
      // _onStateChangedidoffer();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
  Future<bool> editproduct(BuildContext context,String idproduct,String totalequantity,String linkimage) async {
    try {
      _productServices.editProduct(
        idproduct:idproduct,
        productname: nameproduct.value.text,
        image: linkimage,
      );

      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
  removeProduct(String? product){
    _listproductidoffer.remove(product);
    _productServices.removeproduct(product);
    notifyListeners();
    return  Fluttertoast.showToast(
      msg: "Removed",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
  }
  _onStateChanged() async {

    _listproduct.clear();
    _listproduct = await _productServices.getProduct();
    //  });
    notifyListeners();
  }



}
