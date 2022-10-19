
// ignore_for_file: file_names, prefer_const_constructors

import 'dart:io';

import 'package:bakeryshop/backend/provider/product.dart';
import 'package:bakeryshop/provider/imagepicker.dart';
// import 'package:bakeryshop/provider/product.dart';
import 'package:bakeryshop/provider/product2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';


class Edit extends StatefulWidget {

  @override
  _EditState createState() => _EditState();
}


class _EditState extends State<Edit>{
 late File _image ;
    getImage() async{
    final image = (await ImagePicker.platform.pickImage(source: ImageSource.gallery))!;
    _image = File(image.path) ;

  }



  @override
  Widget build(BuildContext context) {

    final img = Provider.of<UploadImageProvider>(context);
    final product = Provider.of<ProductProvider>(context);


    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFF3E2723),
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Add Products',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18.0,
            color: Color(0xFFFFF3E0),
          ),
        ),
        centerTitle: true,
      ),


      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 82,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned (
                  top: 75.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0)
                      ),
                      color: Color(0xFFFFF3E0),
                    ),
                    height: MediaQuery.of(context).size.height - 100,
                    width: MediaQuery.of(context).size.width,
                  )
              ),
              Positioned(
                top: 100,
                left: 25,
                right: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Form(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20,),
                          TextFormField(

                            controller: product.nameproduct,
                              validator: (value) => value!.isEmpty ? 'You must enter a name' : null,
                              decoration: InputDecoration(
                                  labelText: "Product name :",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  )
                              )
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),

                    Container(
                      height: 50,
                      child: ElevatedButton(

                          child: Text(
                            'Add photo', textScaleFactor: 2,
                            style: TextStyle(
                                color: Color(0xFFFFF3E0),
                                fontFamily: 'Montserrat',
                                fontSize: 15
                            ),
                          ),
                          onPressed: ()  async{
                            // Provider.of<AdminProvider>(context).selectImage();
                          await  getImage();
                           await img.uploadimageandgetlinkimage(_image, "product", "f");
                       product.linkimage=img.linkimage;
                          }
                      ),
                    ),

                    SizedBox(height: 20,),

                    Container(
                      height: 50,
                      child: ElevatedButton(

                          child:img.loading? Text(
                            'Save product', textScaleFactor: 2,
                            style: TextStyle(
                                color: Color(0xFFFFF3E0),
                                fontFamily: 'Montserrat',
                                fontSize: 15
                            ),
                          ):Center(child:CircularProgressIndicator()),
                          onPressed: ()  {
                            product.createproduct();
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}