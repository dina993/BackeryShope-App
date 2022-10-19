import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Driver extends StatefulWidget {
  @override
  _DriverState createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF3E2723),
           title: Text("Driver",
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
                            Fluttertoast.showToast(msg: "Trip Started !!");
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
                                  Icons.local_shipping ,
                                  size: 80.0,
                                  color: Color(0xFF3E2723),
                                ),
                                new Text(
                                  "Start trip",
                                  style: TextStyle(fontSize: 18.0),
                                )
                              ],
                            ),
                          ))),
                  new Expanded(
                      child: GestureDetector(
                    onTap: () {

                      Fluttertoast.showToast(msg: "Trip Ended !!");
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
                            Icons.not_interested_rounded ,
                            size: 80.0,
                            color: Color(0xFF3E2723),
                          ),
                          new Text(
                            "End trip",
                            style: TextStyle(fontSize: 18.0),
                          )
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            
              
            ],
          ),
        );
  }
}