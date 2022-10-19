
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, file_names

import 'package:bakeryshop/provider/user.dart';
import 'package:bakeryshop/utilities/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerDetail extends StatefulWidget {
  @override
  _CustomerDetailState createState() => _CustomerDetailState();
}

class _CustomerDetailState extends State<CustomerDetail> {
  
  String _typeSelected = '';


  @override


  Widget _buildCustomerType(String title) {
    return InkWell(
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          color: _typeSelected == title ? Colors.green : Color(0xFF3E2723),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFFFFF3E0),
            ),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _typeSelected = title;

        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF3E2723),
          title: Text(
            "New Customer",
            style: TextStyle(
              color: Color(0xFFFFF3E0),
            ),
          ),
          leading: IconButton(
            color: Color(0xFFFFF3E0),
            icon: Icon(Icons.arrow_back),
            onPressed: () {
             AppRouter.router.popPage();
            },
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: auth.name,
                        decoration: InputDecoration(
                            labelText: "Customer Name :",
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Color(0xFF3E2723),
                              size: 30,
                            ),
                            contentPadding: EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: auth.phone,
                        decoration: InputDecoration(
                            labelText: "Phone number :",
                            prefixIcon: Icon(
                              Icons.phone_iphone,
                              color: Color(0xFF3E2723),
                              size: 30,
                            ),
                            contentPadding: EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: auth.description,
                        decoration: InputDecoration(
                            labelText: "Description :",
                            prefixIcon: Icon(
                              Icons.description,
                              color: Color(0xFF3E2723),
                              size: 30,
                            ),
                            contentPadding: EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: auth.email,
                        decoration: InputDecoration(
                            labelText: "Email :",
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color(0xFF3E2723),
                              size: 30,
                            ),
                            contentPadding: EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: auth.password,
                        decoration: InputDecoration(
                            labelText: "Password :",
                            prefixIcon: Icon(
                              Icons.padding,
                              color: Color(0xFF3E2723),
                              size: 30,
                            ),
                            contentPadding: EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: auth.address,
                        decoration: InputDecoration(
                            labelText: "Address :",
                            prefixIcon: Icon(
                              Icons.store,
                              color: Color(0xFF3E2723),
                              size: 30,
                            ),
                            contentPadding: EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: auth.ytunus,
                        decoration: InputDecoration(
                            labelText: "Y-tunus :",
                            prefixIcon: Icon(
                              Icons.fact_check,
                              color: Color(0xFF3E2723),
                              size: 30,
                            ),
                            contentPadding: EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 40,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildCustomerType('Group A'),
                            SizedBox(width: 10),
                            _buildCustomerType('Group B'),
                            SizedBox(width: 10),
                            _buildCustomerType('Group C'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(

                          child: Text(
                            'Save Customer',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFFFF3E0),
                            ),
                          ),
                          onPressed: () {
                           auth.group.text= _typeSelected;
                           auth.signUpcostumer();
                           
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }

  

    
}
