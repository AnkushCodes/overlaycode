import 'package:flutter/material.dart';
import 'package:overlaycode/showblink.dart';
import 'package:overlaycode/shownotification.dart';

void main() => runApp(HomeApp());

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  ShowNotification showNotification =ShowNotification() ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Builder(
                      builder: (BuildContext context) {  
                      return ListView(
              children: <Widget>[
                SizedBox(height: 200.0,),
                RaisedButton(
                  child: Text('Show Dialog'),
                  onPressed: (){
                  showNotification.show(context);
                }),
                SizedBox(height: 200.0,),
                RaisedButton(
                  child: Text('Show Dialog with animation'),
                  onPressed: (){
            
            showNotification.showAnimWidget(context, 
            (context) => Icon(Icons.warning, color: Colors.purple)
            , Duration(seconds: 3), Offset(50.0, 50.0));
                }),
              ],
            );}
          ),
        ),
      ),
    );

  }
}