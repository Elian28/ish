// A4
import 'package:flutter/material.dart';


class A0 extends StatefulWidget {
  @override
  _A0State createState() => _A0State();
}

class _A0State extends State<A0> {
      int number1 = 1;
      int number2 = 1;
      int _radioValue;
      int _radioValue1;
      int _radioValue2;


 
  @override

Widget build(BuildContext context) {
  return  Container(
              padding: EdgeInsets.only(top: 90),
              child: Column (children: <Widget>[
                  // نوع الورق
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                      'نوع الورق',
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                        new Radio(
                         activeColor: Colors.cyan,

                          value: 0,
                          groupValue: _radioValue,
                          
                           onChanged: (int value) {
                         setState(() {
                               _radioValue = value;
                         }); },
                        ),
                        new Text(
                          'عادي',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                       new Radio(
                         activeColor: Colors.cyan,

                          value: 1,
                          groupValue: _radioValue,
                          
                           onChanged: (int value) {
                         setState(() {
                               _radioValue = value;
                         }); },
                        ),
                        new Text(
                          'فلم ابيض',
                          style: new TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        //
                        
                      
                        
                      ],
                    ),

                  // لون الطباعة
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                      ' لون الحبر',                     
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                        new Radio(
                         activeColor: Colors.cyan,

                          value: 0,
                          groupValue: _radioValue1,
                          
                           onChanged: (int value) {
                         setState(() {
                               _radioValue1 = value;
                         }); },
                        ),
                        new Text(
                          'اسود',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        new Radio(
                         activeColor: Colors.cyan,

                          value: 1,
                          groupValue: _radioValue1,
                          
                           onChanged: (int value) {
                         setState(() {
                               _radioValue1 = value;
                         }); },
                        ),
                        new Text(
                          'ملون',
                          style: new TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        
                      ],
                    ),
                       
                       // خيارات التغليف
                      new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                      'خيارات التغليف',
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                        new Radio(
                         activeColor: Colors.cyan,

                          value: 0,
                          groupValue: _radioValue2,
                          
                           onChanged: (int value) {
                         setState(() {
                               _radioValue2 = value;
                         }); },
                        ),
                        new Text(
                          'بدون تغليف',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                       new Radio(
                         activeColor: Colors.cyan,
                          value: 1,
                          groupValue: _radioValue2,
                           onChanged: (int value) {
                            
                         setState(() {
                               _radioValue2 = value;
                         }); 
                        
                         
                         },
                        ),
                        new Text(
                          'حافظ انبوبي',
                          style: new TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        
                      ],
                    ),
 // عدد الصفحات
 
                      new Container(
                                    width: MediaQuery.of(
                                      
                                      context).size.width,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        
                                        children: <Widget>[
                                          
                                           Text("عدد النسخ"),
                                          IconButton(icon: Icon(Icons.control_point,),
                                           onPressed: () {
                                             setState(() {
                                               number1++; }); }, ),
                                        Center(child: Text("$number1")),
                                           IconButton(
                                              icon: Icon(
                                                Icons.remove_circle_outline,), 
                                                onPressed: () {
                                                  setState(() {
                                                    number1--;
                                                  }); },), ],),
                                      
                                    ),
                        Column(
                          children: <Widget>[
                            new Container(
                                        width: MediaQuery.of(context).size.width,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                               Text("عدد الصفحات"),
                                              IconButton(icon: Icon(Icons.control_point,),
                                               onPressed: () {
                                                 setState(() {
                                                   number2++; }); }, ),
                                            Center(child: Text("$number2")),
                                               Center(
                                                 child: Column(
                                                   children: <Widget>[
                                                     IconButton(
                                                        icon: Icon(
                                                          Icons.remove_circle_outline,), 
                                                          onPressed: () {
                                                            setState(() {
                                                              number2--;
                                                            });
                                                            
                                                             },),
                                                             
                                                   ],
                                                 ),
                                               ), 
                                                      
                                                      ],),
                                          
                                        ),
                                        
                          ],
                        ),
    
                   // عدد النسخ


              ],)

          );
                  
                  


}
}