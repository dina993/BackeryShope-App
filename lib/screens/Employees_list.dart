
import 'package:bakeryshop/model/user.dart';
import 'package:bakeryshop/provider/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Employee_detil.dart';



class Employees extends StatefulWidget {
  @override
  _EmployeesState createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {

  @override
  void initState() {
    super.initState();
   }
 

  


  Widget _buildContactItem(UserModel contact) {
    Color typeColor = Colors.red;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 130,
      color: Color(0xFFFFF3E0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.person,
                color: Color(0xFF3E2723),
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact.username!,
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3E2723),
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.phone_iphone,
                color: Color(0xFF3E2723),
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact.phone!,
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3E2723),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 15),
              Icon(
                Icons.group_work,
                color: typeColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact.email!,
                style: TextStyle(
                    fontSize: 16,
                    color: typeColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  _showDeleteDialog( contact);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red[700],
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('Delete',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.red[700],
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              
            ],
          )
        ],
      ),
    );
  }

  _showDeleteDialog(UserModel contact) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete ${contact.username}'),
            content: Text('Are you sure you want to delete?'),
            actions: [
             ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
             ElevatedButton(
                  onPressed: (){

                    
                   
                  },
                  child: Text('Delete'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color(0xFF3E2723),
        title: Text('Employees List',
              style: TextStyle(
              fontSize: 18.0,
              color: Color(0xFFFFF3E0),
        ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xFFFFF3E0),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      
     floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF3E2723),
          onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (_){
             return EmployeeDetail();

           }));
          },
          tooltip: 'Add Employee',
          child: Icon(Icons.add,
          color: Color(0xFFFFF3E0),

           ),
        ),

   body:
        ChangeNotifierProvider(
        create: (_) =>  UserProvider.getlist(),
    child: Consumer< UserProvider>(
    builder: (_,  _user, __) =>
    _user.loading?
    ListView.builder(
    itemCount:_user.employes.length ,
    itemBuilder: (context, index) {
     return _buildContactItem(_user.employes[index]);
   },):Center(child:CircularProgressIndicator()), )));
  }

  Color getTypeColor(String type) {
    Color color = Theme.of(context).accentColor;

    if (type == 'Driver') {
      color = Colors.brown;
    }

    if (type == 'Bakery') {
      color = Colors.green;
    }

    if (type == 'Supervisor') {
      color = Colors.teal;
    }
    
    if (type == 'collector') {
      color = Colors.blue;
    }
    return color;
  }
}