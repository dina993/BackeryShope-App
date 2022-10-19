
import 'package:bakeryshop/screens/ORDER/tracking_order.dart';
import 'package:flutter/material.dart';




class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  

  @override
  Widget build(BuildContext context) {
    
    
    return Container(
      
      child: Theme(
        data: Theme.of(context).copyWith(canvasColor: Color(0xFF3E2723)),
        child: Drawer(
          
          
            
            child: ListView(
              children: <Widget>[
                
                
                UserAccountsDrawerHeader(
                  accountName: Text(
                    "User",
                    style: TextStyle(fontSize: 20.0, color: Color(0xFFFFF3E0),),
                  ),
                  accountEmail: Text(
                    "user@gmail.com",
                    style: TextStyle(color:Color(0xFFFFF3E0),),
                  ),
                  currentAccountPicture: GestureDetector(
                    child: new CircleAvatar(
                      backgroundColor: Color(0xFFFFF3E0),
                      child: Icon(
                        Icons.person,
                        color: Color(0xFF3E2723),
                        size:50,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: Color(0xFF3E2723)),
                ),
                
                
                
                Container(
                  padding: EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Divider(
                    color: Color(0xFFFFF3E0),
                  ),
                ),
                
                
                Container(
                  color: Color(0xFF3E2723),
                  padding: EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text(
                            "My Order",
                            style: TextStyle(color: Color(0xFFFFF3E0), fontSize: 20.0),
                          ),
                          leading: Icon(
                            Icons.history,
                            color: Color(0xFFFFF3E0),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFFFF3E0),
                            size: 18.0,
                          ),
                        ),
                      ),
                      Divider(
                        color: Color(0xFFFFF3E0),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Color(0xFF3E2723),
                  padding: EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> new Tracking()));
                          },
                        child: ListTile(
                          title: Text(
                            "traking order ",
                            style: TextStyle(color: Color(0xFFFFF3E0), fontSize: 20.0),
                          ),
                          leading: Icon(
                            Icons.drive_eta,
                            color: Color(0xFFFFF3E0),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFFFF3E0),
                            size: 18.0,
                          ),
                        ),
                      ),
                      Divider(
                        color: Color(0xFFFFF3E0),
                      ),
                    ],
                  ),
                ),
                
                
                
              ],
            ),
          
        ),
      ),
    );
  }
}