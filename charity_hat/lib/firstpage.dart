import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:convert';

const baseUrl = "http://localhost:3000";

class Expense{
  final String npo;
  final double amount;
  final int categoryId;
  final String date;
  Expense({this.npo, this.amount, this.categoryId, this.date});

  factory Expense.fromJson(Map<String, dynamic> json){
    return Expense(
      npo: json['npo'],
      amount: json['amount'], 
      categoryId: json['categoryId'],
      date: json['date']);
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);
  
  void fetchExpenses() async {
     final LocalStorage storage = new LocalStorage('some_key');
      String user = storage.getItem("username");
      const route = baseUrl + "/expenses/redcross";
        
      Response res = await get(route);
      final body = json.decode(res.body);
      var i = 0;
      while(body[i] != null){
        debugPrint(body[i].toString());
        i = i + 1;
      }
    
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> alist = new List<Widget>();

    for (int i = 0; i < 3;i++){
      alist.add(
          Container(
            color: Colors.white10,
            width: MediaQuery.of(context).size.width,
            child: Container(
              color: Colors.grey[300],
              margin: EdgeInsets.all(15),
              child: Container(
                color: Colors.grey[700],
                margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[

                    Padding(padding: EdgeInsets.all(10)),

                    Text(
                      'EXPENSES',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: Colors.greenAccent,
                        fontSize: 26,
                        letterSpacing: 5,
                      ),
                    ),

                    Padding(padding: EdgeInsets.all(10)),

                    Text(
                        '\$45',
                        style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.white,
                      fontSize: 40,
                          letterSpacing: 5,
                    ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      );
    }

    return Scaffold(
      body:
          Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                CircleImage(),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  'GAURAV RANGANATH',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Lato',
                    letterSpacing: 2,
                    color: Colors.black,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(5),
                ),

                Text(
                  'CHARITIES: RED CROSS AND DISCOVERY HOUSE',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Lato',
                    letterSpacing: 2,
                    color: Colors.black,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(2),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 200.0,
                  child:
                  Center(
                    child:
                    ListView(
                      scrollDirection: Axis.horizontal,
                      children: alist,
                    ),
                  ),),
              ],
            ),
          ),


    );
  }
}

class CircleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _size = 200.0;

    return Center(
      child: new Container(
          width: _size,
          height: _size,
          decoration: new BoxDecoration(
              border: Border.all(width: 5.0, color: Colors.grey[350]),
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage(
                      "https://scontent.fyyz1-1.fna.fbcdn.net/v/t1.0-9/35305554_930165850481980_5000180563563249664_n.jpg?_nc_cat=104&_nc_oc=AQmQ7wBPSMAsTbMUPc60VM47oIaed29NX3hZizDTUeuMitInhv5zDFxSLLiJgKKEgDM&_nc_ht=scontent.fyyz1-1.fna&oh=cd82af78deeeeae65e063115a8b38822&oe=5E0D4153")
              )
          )
      ),
    );
  }

}