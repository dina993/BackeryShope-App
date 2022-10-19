import 'package:bakeryshop/provider/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Employees_list.dart';

class EmployeeDetail extends StatefulWidget {
  @override
  _EmployeeDetailState createState() => _EmployeeDetailState();
}

class _EmployeeDetailState extends State<EmployeeDetail> {
  

  String _typeSelected = '';

  @override
  
 Widget _buildEmployeeType(String title) {
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
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF3E2723),
          title: Text(
            "New Employee",
            style: TextStyle(
              color: Color(0xFFFFF3E0),
            ),
          ),
          leading: IconButton(
            color: Color(0xFFFFF3E0),
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
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
                       controller: user.name,
                        decoration: InputDecoration(
                            labelText: "Employee Name :",
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
                        controller: user.phone,
                        decoration: InputDecoration(
                            labelText: "Employee number :",
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
                        controller: user.description,
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
                        controller: user.email,
                        decoration: InputDecoration(
                            labelText: "Email :",
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
                        controller: user.password,
                        decoration: InputDecoration(

                            labelText: "Password :",
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
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 40,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildEmployeeType('Driver'),
                            SizedBox(width: 10),
                            _buildEmployeeType('Bakery'),
                            SizedBox(width: 10),
                            _buildEmployeeType('Supervisor'),
                            SizedBox(width: 10),
                            _buildEmployeeType('collector'),
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
                            'Save Employee',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFFFF3E0),
                            ),
                          ),
                          onPressed: () {
                           user.role.text=_typeSelected;
                           user.signUpemploye();
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Employees()),
                            );
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
