import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:convert';
var catStrToId = {
    'AccidentInsurance': 881244,
    'Accounting': 881250,
    'Advertising': 881220,
    'Airfare': 881294,
    'BankFees': 881200,
    'BusinessInsurance': 881198,
    'CarTruckExpenses': 881222,
    'Commissions': 881216,
    'Contractors': 881234,
    'Depreciation': 881212,
    'Education': 881236,
    'Employee': 881238, 
    'Entertainment': 881256,
    'Equipment': 881284,
    'Gas': 881226,
    'GasElectrical': 881300,
    'Hardware': 881264,
    'HealthInsurance': 881240,
    'Hotel': 881292,
    'InterestMortgage': 881202,
    'InterestOther': 881204,
    'LegalFees': 881248,
    'LifeInsurance': 881242,
    'Machinery': 881282,
    'Mileage': 881224,
    'OfficeExpenses': 881258,
    'OfficeSpace': 881286,
    'OfficeSupplies': 881260,
    'OnlineServices': 881218,
    'Packaging': 881270,
    'Personal': 881276,
    'Phone': 881302,
    'Postage': 881268,
    'Rent': 881278,
    'Repairs': 881228,
    'Restaurants': 881254,
    'Shipping': 881266,
    'Software': 881262,
    'Subscriptions': 881214,
    'Taxes': 881208,
    'Taxi': 881296,
    'Utilities': 881298,
    'Vehicle': 881230,
    'Wages': 881210
  };
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
List<Widget> alist = new List<Widget>();

class FourthPage extends StatelessWidget {
  const FourthPage({Key key}) : super(key: key);
  
  Future<List<Widget>> fetchExpenses(context) async {
     final LocalStorage storage = new LocalStorage('some_key');
      String user = storage.getItem("username");
      const route = baseUrl + "/expenses/redcross";
      Response res = await get(route);
      Iterable l =  json.decode(res.body);
      List<dynamic> expenses = l.map((model)=>fromJson(model)).toList();
      
      expenses.forEach((e) =>{
        debugPrint((e as Expense).amount.toString()),
        
        alist.add(
        
          Container(
            color: Colors.white10,
            child: Container(
              color: Colors.grey[300],
              margin: EdgeInsets.all(15),
              child: Text("${(e as Expense).amount.toString()} + YO ${catStrToId.keys.firstWhere((k)=>catStrToId[k] == ((e as Expense).categoryId), orElse: ()=> null)} + ${(e as Expense).date}"),
            ),
          ),
      )
      });
      return alist;
  }
  
  @override
  Widget build(BuildContext context) {
    cool() async{
      alist = await fetchExpenses(context);
    }
    
    

    
    return  new Container(alignment: Alignment.center,
    child: new FutureBuilder(
      future: fetchExpenses(context),
      builder: (BuildContext ctx, AsyncSnapshot snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.waiting: return new Text('Fetchihg....');
          default:
            if (snapshot.hasError){
              return new Text('Error');
            }
            return new Container(
              width: MediaQuery.of(context).size.width*.9,
              height: MediaQuery.of(context).size.height*.4,
              child: ListView(
              scrollDirection: Axis.horizontal,
              children: alist,
            ));
        }
        
      }
    ));
  }
}

 
