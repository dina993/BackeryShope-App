
import 'package:bakeryshop/screens/Customers_list.dart';
import 'package:bakeryshop/screens/Employees_list.dart';
import 'package:bakeryshop/screens/administration/Driver.dart';
import 'package:bakeryshop/screens/administration/product.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF3E2723),
           title: Text("Admin",
              style: TextStyle(
              color: Color(0xFFFFF3E0),
              ),),
          centerTitle: true,
        ),
        backgroundColor:Color(0xFF3E2723),
       
        body:  ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  new Expanded(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Employees() ));
                          },
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Color(0xFFFFF3E0),
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Column(
                              children: <Widget>[
                                new Icon(
                                  Icons.person,
                                  size: 80.0,
                                  color: Color(0xFF3E2723),
                                ),
                                new Text(
                                  "Employee",
                                  style: TextStyle(fontSize: 18.0),
                                )
                              ],
                            ),
                          ))),
                  new Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Customer()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Color(0xFFFFF3E0),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                        children: <Widget>[
                          new Icon(
                            Icons.person,
                            size: 80.0,
                            color: Color(0xFF3E2723),
                          ),
                          new Text(
                            "Customer",
                            style: TextStyle(fontSize: 18.0),
                          )
                        ],
                      ),
                    ),
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Driver()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Color(0xFFFFF3E0),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                        children: <Widget>[
                          new Icon(
                            Icons.drive_eta_rounded,
                            size: 80.0,
                            color: Color(0xFF3E2723),
                          ),
                          new Text(
                            "Driver",
                            style: TextStyle(fontSize: 18.0),
                          )
                        ],
                      ),
                    ),
                  )),
                  new Expanded(
                     child: GestureDetector(
                    onTap: () {
                      //Navigator.push(context,
                         // MaterialPageRoute(builder: (context) => Listorder()));
                    },
                      child: Container(
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Color(0xFFFFF3E0),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      children: <Widget>[
                        new Icon(
                          Icons.message,
                          size: 80.0,
                          color: Color(0xFF3E2723),
                        ),
                        new Text(
                          "Order",
                          style: TextStyle(fontSize: 18.0),
                       )
                        ],
                      ),
                    ),
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                 

                  new Expanded(
                     child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Product()));
                    },

                      child: Container(
                       
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Color(0xFFFFF3E0),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      children: <Widget>[
                        new Icon(
                          Icons.fastfood,
                          size: 80.0,
                          color: Color(0xFF3E2723),
                        ),
                        new Text(
                          "Product", 
                          style: TextStyle(fontSize: 18.0),
                        )
                      ],
                    ),
                  )),
                  ),
                ],
              ),
            ],
          ),
        );
  }
}