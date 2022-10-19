import 'package:bakeryshop/backend/provider/auth.dart';
import 'package:bakeryshop/provider/user.dart';
import 'package:bakeryshop/screens/administration/admin.dart';
import 'package:bakeryshop/utilities/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class Log_in extends StatefulWidget {
  @override
  _Log_inState createState() => _Log_inState();
}

class _Log_inState extends State<Log_in> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color(0xFF3E2723),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Mill Bakery',
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
              Positioned(
                  top: 75.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0)),
                      color: Color(0xFFFFF3E0),
                    ),
                    height: MediaQuery.of(context).size.height - 100,
                    width: MediaQuery.of(context).size.width,
                  )),
              Positioned(
                top: 30,
                left: (MediaQuery.of(context).size.width / 2) - 100,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/login.png'),
                  )),
                ),
                height: 200,
                width: 200,
              ),
              Positioned(
                top: 250,
                left: 25,
                right: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Form(
                      key: Provider.of<AuthProvider>(context, listen: false).loginKey,
                      child: Column(
                        children: <Widget>[
                         
                         
                          TextFormField(
                              controller:
                              Provider.of<AuthProvider>(context).emailController,
                              validator: (value) => Provider.of<AuthProvider>(context,listen: false).emailValidation(value!),
                              decoration: InputDecoration(
                                  labelText: "Email :",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ))),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                              controller:
                              Provider.of<AuthProvider>(context).passwordController,
                              validator: (value) => Provider.of<AuthProvider>(context,listen: false).nullValidation(value!),
                              autocorrect: false,
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: "Password :",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      child: ElevatedButton(

                          child: Text(
                            'log in',
                            textScaleFactor: 2,
                            style: TextStyle(
                                color: Color(0xFFFFF3E0),
                                fontFamily: 'Montserrat',
                                fontSize: 15),
                          ),
                          onPressed: ()  {
                            Provider.of<UserProvider>(context,listen:false).signIn();
                            AppRouter.router.pushToNewWidget(Admin());
                          }),
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
