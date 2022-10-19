
import 'package:bakeryshop/model/product.dart';
// import 'package:bakeryshop/provider/product.dart';
import 'package:bakeryshop/provider/product2.dart';
import 'package:bakeryshop/screens/administration/AddProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';





class Product extends StatefulWidget {

@override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF3E2723),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_){
              return Edit();

            }));

          },
          tooltip: 'Add Product',
          child: Icon(Icons.add,
          color: Color(0xFFFFF3E0),

           ),
        ),
      
     
      backgroundColor: Color(0xFF3E2723),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Color(0xFFFFF3E0),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
            ),
          ),
          SizedBox(height: 25.0,),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Our',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFFFFF3E0),
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0
                  ),
                ),
                SizedBox(width: 10.0,),
                Text('product',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xFFFFF3E0),
                      fontSize: 25.0
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0,),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height - 185.0,
            decoration: BoxDecoration(
                color: Color(0xFFFFF3E0),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0))
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height - 300,
                    child:   ChangeNotifierProvider(
    create: (_) =>  ProductProvider.initialize(),
    child: Consumer< ProductProvider>(
    builder: (_,  _product, __) =>ListView.builder(
      itemCount: _product.listproduct.length,
      itemBuilder: (context, index) {
      return
        _bulidFoodItem(
          _product.listproduct[index].image! ,
          _product.listproduct[index].productname!,
          _product.listproduct[index].idproduct);
    },))),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _bulidFoodItem(String imgPath, String foodName,String? prod) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0,bottom: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: imgPath,
                    
                    child: Image(
                        image: NetworkImage(imgPath),
                        fit: BoxFit.cover,
                        height: 90.0,
                        width: 90.0
                        
                    ),
                  ),
                  SizedBox(width: 30.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        foodName,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                            
                        ),
                      ),
                      IconButton(onPressed: (){
                        Provider.of<ProductProvider>(context,listen: false).removeProduct(prod);
                      }, icon: Icon(Icons.delete))

                    ],
                  )
                ],
              ),
            ),
            
          ],
        ),
      
    );
  }
}