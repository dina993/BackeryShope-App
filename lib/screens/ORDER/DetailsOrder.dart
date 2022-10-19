// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class DetailsOrder extends StatefulWidget {
//
//   final heroTag;
//   final foodName;
//
//   DetailsOrder(this.heroTag, this.foodName, );
//
//   @override
//   _DetailsOrderState createState() => _DetailsOrderState();
// }
//
//
//
// class _DetailsOrderState extends State<DetailsOrder>{
//
//
//   var _Quantity = 0;
//   String note = "";
//
//   void _minus() {
//
//     if(_Quantity>0){
//       this.setState(() {
//         _Quantity =  _Quantity-10;
//       });
//     }
//
//
//   }
//
//   void _plus() {
//      this.setState(() {
//       _Quantity =  _Quantity+10;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//       return Scaffold(
//       backgroundColor: Color(0xFF3E2723),
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           color: Color(0xFFFFF3E0),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         title: Text('Order',
//               style: TextStyle(
//               fontFamily: 'Montserrat',
//               fontSize: 18.0,
//               color: Color(0xFFFFF3E0),
//         ),
//         ),
//         centerTitle: true,
//       ),
//       body: ListView(
//         children: [
//           Stack(
//             children: <Widget>[
//                  Container(
//                    height: MediaQuery.of(context).size.height - 82,
//                    width: MediaQuery.of(context).size.width,
//                    color: Colors.transparent,
//                  ),
//                  Positioned (
//                    top: 75.0,
//                    child: Container(
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.only(
//                          topLeft: Radius.circular(45.0),
//                          topRight: Radius.circular(45.0)
//                        ),
//                        color: Color(0xFFFFF3E0),
//                      ),
//                      height: MediaQuery.of(context).size.height - 100,
//                      width: MediaQuery.of(context).size.width,
//                    )
//                  ),
//                  Positioned(
//                    top: 30,
//                    left: (MediaQuery.of(context).size.width / 2) - 100,
//                    child: Hero(
//                      tag: widget.heroTag,
//                      child: Container(
//                        decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(40),
//                          image: DecorationImage(
//                            image: AssetImage(widget.heroTag),
//                            fit: BoxFit.cover
//                          )
//                        ),
//                      ),
//                    ),
//                    height: 200,
//                    width: 200,
//                  ),
//                  Positioned(
//                    top: 250,
//                    left: 25,
//                    right: 25,
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text(widget.foodName,
//                          style: TextStyle(
//                            color: Color(0xFF3E2723),
//                            fontFamily: 'Montserrat',
//                            fontSize: 22,
//                            fontWeight: FontWeight.bold
//                          ),
//                        ),
//                        SizedBox(height: 20,),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            Container(
//                              width: 125,
//                              height: 40,
//                              decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(17),
//                                color: Color(0xFF3E2723),
//                              ),
//                              child: Row(
//                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                children: <Widget>[
//                                  InkWell(
//                                    onTap: () {
//                                      _minus();
//                                     },
//                                    child: Container(
//                                      height: 25,
//                                      width: 25,
//                                      decoration: BoxDecoration(
//                                        borderRadius: BorderRadius.circular(7),
//                                        color: Color(0xFF3E2723),
//                                      ),
//                                      child: Center(
//                                        child: Icon(
//                                          Icons.remove,
//                                          color: Colors.white,
//                                          size: 20,
//                                        ),
//                                      ),
//                                    )
//                                  ),
//                                  Text( '$_Quantity',
//                                    style: TextStyle(
//                                      color: Color(0xFFFFF3E0),
//                                      fontFamily: 'Montserrat',
//                                      fontSize: 15
//                                    ),
//                                  ),
//                                  InkWell(
//
//                                    onTap: () {
//                                      _plus();
//                                     },
//
//
//                                      child: Container(
//                                        height: 25,
//                                        width: 25,
//                                        decoration: BoxDecoration(
//                                            borderRadius: BorderRadius.circular(7),
//                                            color: Color(0xFF3E2723),
//                                        ),
//                                        child: Center(
//                                          child: Icon(
//                                            Icons.add,
//                                            color: Color(0xFFFFF3E0),
//                                            size: 20,
//                                          ),
//                                        ),
//                                      )
//                                  ),
//                                ],
//                              ),
//                            )
//                          ],
//                        ),
//                        SizedBox(height: 20,),
//                        Container(
//                         height: 100,
//                          child: TextField(
//                       onChanged: (value) {
//                         this.setState(() {
//                           note = value;
//                         });
//                       },
//                       decoration: InputDecoration(
//                           labelText: "Note :",
//                           border: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(50),
//                           )
//                       ),
//                     ),
//                        ),
//
//
//                        Container(
//                         height: 50,
//                           child: RaisedButton(
//                             color: Color(0xFF3E2723),
//
//                             child: Text(
//                               'Make Order', textScaleFactor: 2,
//                               style: TextStyle(
//                                      color:Color(0xFFFFF3E0),
//                                      fontFamily: 'Montserrat',
//                                      fontSize: 15
//
//                                    ),
//                             ),
//                             onPressed: () {},
//                           ),
//                         ),
//                       ],
//                    ),
//                  )
//             ],
//           )
//         ]
//       ),
//     );
//   }
// }