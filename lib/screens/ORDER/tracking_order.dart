import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Tracking extends StatefulWidget {
  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  Widget getTimeLine() {
    double heightCon = 180.0;
    return Container(
      color:Color(0xFF3E2723),
      margin: EdgeInsets.only(top: 10.0, bottom: 80.0),
      child: Column(
        children: <Widget>[
          new Container(
              height: heightCon,
              child: TimelineTile(
                lineXY: 0.2,
                indicatorStyle: IndicatorStyle(height: 1.0),
                alignment: TimelineAlign.manual,
                endChild: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      new Text(
                        "Preparing your order",
                        style: TextStyle(
                            color: Color(0xFFFFF3E0),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      new Icon(
                        Icons.restaurant,
                        color: Color(0xFFFFF3E0),
                      )
                    ],
                  ),
                ),
              )),
          
          new Container(
              height: heightCon,
              child: TimelineTile(
                lineXY: 0.2,
                indicatorStyle: IndicatorStyle(height: 1.0),
                alignment: TimelineAlign.manual,
                endChild: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      new Text(
                        "Your order is ready",
                        style: TextStyle(
                            color: Color(0xFFFFF3E0),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      new Icon(
                        Icons.restaurant,
                        color: Color(0xFFFFF3E0),
                      )
                    ],
                  ),
                ),
              )),
          new Container(
              height: heightCon,
              child: TimelineTile(
                lineXY: 0.2,
                indicatorStyle: IndicatorStyle(height: 1.0),
                alignment: TimelineAlign.manual,
                endChild: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      new Text(
                        "Your order is on the way",
                        style: TextStyle(
                            color: Color(0xFFFFF3E0),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      new Icon(
                        Icons.restaurant,
                        color: Color(0xFFFFF3E0),
                      )
                    ],
                  ),
                ),
              )),
         
        ],
      ),
    );
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF3E2723),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tracking Order ",
          style: TextStyle(color: Color(0xFFFFF3E0)),
        ),
        backgroundColor:  Color(0xFF3E2723),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xFFFFF3E0),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 30.0)),
          new Text(
            "Any problem contact us:",
            style: TextStyle(fontSize: 25.0,color: Color(0xFFFFF3E0), fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(),
          new Text("+358 101010010",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFF3E0),)),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Divider(
              color: Colors.grey[200],
            ),
          ),
         
          getTimeLine(),
        ],
      ),
      bottomNavigationBar: Container(
        child: MaterialButton(
          onPressed: () {},
          child: new Container(
            height: 50,
            padding: EdgeInsets.all(5.0),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Receipt",
              style: TextStyle(fontSize: 30.0, color:Color(0xFF3E2723), fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
                color: Color(0xFFFFF3E0),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}