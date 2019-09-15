import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:convert';

const baseUrl = "http://localhost:3000";

class Expense{
  String npo;
  int amount;
  int categoryId;
  String date;
  Expense({this.npo, this.amount, this.categoryId, this.date});
  
  
  
  
  
}
 fromJson(json){
    Expense p = new Expense();
    p.npo = json['npo'].toString();
    p.amount = json['amount'];
    p.categoryId = json['categoryId'];
    p.date = json['date'];
    return p;
}
class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);
  
  void fetchExpenses() async {
     final LocalStorage storage = new LocalStorage('some_key');
      String user = storage.getItem("username");
      const route = baseUrl + "/expenses/redcross";
        
      Response res = await get(route);
      Iterable l =  json.decode(res.body);
      List<dynamic> expenses = l.map((model)=>fromJson(model)).toList();
      expenses.forEach((e) =>{
        debugPrint((e as Expense).amount.toString())
      });
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> alist = new List<Widget>();
    fetchExpenses();
    for (int i = 0; i < 3;i++){
      alist.add(
          Container(
            color: Colors.white10,
            width: MediaQuery.of(context).size.width,
            child: Container(
              color: Colors.grey[300],
              margin: EdgeInsets.all(15),
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
                  margin: EdgeInsets.symmetric(vertical: 50.0),
                  height: 300.0,
                  child:
                  Center(
                    child:
                    ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          color: Colors.white10,
                          padding: EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            color: Colors.grey[300],
                            margin: EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Text(
                                    'RED CROSS ALERT',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 24,
                                  ),
                                ),
                                
                                Padding(
                                  padding: EdgeInsets.all(5),
                                ),
                                
                                Text(
                                    'Hundreds of Red Cross volunteers on standby as hurricane Dorian nears Atlantic Canada.',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 18,
                                    ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Container(
                          color: Colors.white10,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            color: Colors.grey[300],
                            margin: EdgeInsets.all(15),
                          ),
                        ),

                        Container(
                          color: Colors.white10,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            color: Colors.grey[300],
                            margin: EdgeInsets.all(15),
                          ),
                        ),
                      ],
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