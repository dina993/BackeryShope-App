import 'package:bakeryshop/screens/ORDER/DetailsOrder.dart';
import 'package:bakeryshop/screens/ORDER/drawer.dart';
import 'package:flutter/material.dart';
class OrderPage extends StatefulWidget {
  OrderPage({ required this.title}) ;

  final String title;

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  GlobalKey<ScaffoldState> _keydrawer = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _keydrawer,
      endDrawer: MyDrawer(),
      backgroundColor: Color(0xFF3E2723),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.logout),
                    color: Color(0xFFFFF3E0),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.menu),
                          color: Color(0xFFFFF3E0),
                          onPressed: () {
                            _keydrawer.currentState!.openEndDrawer();

                          },
                        ),
                      ],
                    ),
                  ),
                ],
            ),
          ),
          SizedBox(height: 25.0,),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('ali',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFFFFF3E0),
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0
                  ),
                ),
                SizedBox(width: 10.0,),
                Text('Oy',
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
                    child: ListView(
                      children: <Widget>[
                        _bulidFoodItem(
                            'assets/plate2.png', "White bread",),
                            
                        _bulidFoodItem(
                            'assets/plate1.jpg', "Brown bread",),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _bulidFoodItem(String imgPath, String foodName) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0,bottom: 10),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => DetailsOrder(imgPath, foodName)
          // ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: imgPath,
                    
                    child: Image(
                        image: AssetImage(imgPath),
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
                      
                    ],
                  )
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}