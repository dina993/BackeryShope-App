import 'package:bakeryshop/backend/provider/auth.dart';
import 'package:bakeryshop/backend/provider/product.dart';
import 'package:bakeryshop/helper/firebasename.dart';
// import 'package:bakeryshop/provider/product.dart';
import 'package:bakeryshop/provider/user.dart';
import 'package:bakeryshop/screens/Customer_detil.dart';
import 'package:bakeryshop/screens/Customers_list.dart';
import 'package:bakeryshop/screens/Employee_detil.dart';
import 'package:bakeryshop/screens/Log_in.dart';
import 'package:bakeryshop/screens/ORDER/DetailsOrder.dart';
import 'package:bakeryshop/screens/ORDER/Order.dart';
import 'package:bakeryshop/screens/administration/Driver.dart';
import 'package:bakeryshop/screens/administration/admin.dart';
import 'package:bakeryshop/screens/administration/product.dart';
import 'package:bakeryshop/utilities/router.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'provider/imagepicker.dart';
import 'provider/product2.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<AdminProvider>(
          create: (context) => AdminProvider(),
        ),
        ChangeNotifierProvider<UploadImageProvider>(
          create: (context) => UploadImageProvider.nodata(),
        ),
        ChangeNotifierProvider<ProductProvider>.value(value: ProductProvider.nodata()),
        ChangeNotifierProvider<UserProvider>.value(value: UserProvider.getlist()),


      ],child: MaterialApp(
    debugShowCheckedModeBanner: false,
    navigatorKey: AppRouter.router.navigatorKey,
    home:Splash(),
  )));
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    UserProvider auth = Provider.of<UserProvider>(context);

    return FutureBuilder(
      // Initialize FlutterFire:
      future: initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Something went wrong")],
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          //   auth.status=Status.Unauthenticated;
          print("status main => ${auth.status}");
          switch (auth.status) {

            case Status.loadedadmin:
           return Admin();
            case Status.unloaded:
              return Log_in();
            default:
              return Log_in();
          }
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
        );
      },
    );
  }
}
