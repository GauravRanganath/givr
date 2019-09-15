import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
const baseUrl = "http://localhost:3000";
class Company {
  int id;
  String name;
 
  Company(this.id, this.name);
 
  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'RED CROSS'),
      Company(2, 'MISSISSAUGA FOOD BANK'),
      Company(3, "NATURE CONSERVANCY CANADA"),
      Company(4, "DISCOVERY HOUSE",),
      Company(5, "HAMILTON FOOD SHARE"),
    ];
  }

}
final myController = TextEditingController();
class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);
  @override
  _SecondPage createState() => new _SecondPage();
}
class _SecondPage extends State<SecondPage>{
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;
 
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
  }
  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }
 onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: new Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.all(20),
                ),

                Text(
                  "MAKE A DONATION",
                  style:TextStyle(
                      fontSize: 30,
                      color: Colors.greenAccent[600],
                      letterSpacing: 2,
                      fontFamily: 'Lato'
                  ),),

                Padding(
                  padding: EdgeInsets.all(20),
                ),

                Text(
                  "SELECT AN ORGANIZATION",
                  style:TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  letterSpacing: 2,
                  fontFamily: 'Lato'
                ),),

                Padding(
                  padding: EdgeInsets.all(12),
                ),

                DropdownButton(
                  value: _selectedCompany,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 2,
                    fontFamily: 'Lato',
                    color: Colors.lightGreenAccent[700],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),

                new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Text(
            "ENTER AN AMOUNT TO DONATE",
            style:TextStyle(
                fontSize: 18,
                color: Colors.black,
                letterSpacing: 2,
                fontFamily: 'Lato'
            ),),

          new TextField(
            decoration: new InputDecoration(
                labelText:
                "\$0.00",
              labelStyle: TextStyle(
                fontSize: 20,
                fontFamily: 'Lato',
              ),
            ),
            keyboardType: TextInputType.number,
            controller: myController,
          ),

          Padding(
            padding: EdgeInsets.all(15),
          ),

          FlatButton(
            color: Colors.grey[200],
            onPressed: () async {
              final LocalStorage storage = new LocalStorage('some_key');
              String user = storage.getItem("username");
              const route = baseUrl + "/invoice";
               
              Response res = await post(route,  body: {
                "npo": "redcross",
                "username": user,
                "amount":myController.text
              });
              
              debugPrint(res.statusCode.toString());
              if (res.statusCode > 300){
                //MAke a popup box that says payment failed
              }
              else{
                //Make a popup that says payment was successful
              }

            },
              child: Text(
                'CONFIRM DONATION',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  letterSpacing: 2,
                  fontFamily: 'Lato'
                ),
               
              ),
              
            )
        ],
      ))
              ],
            ),
          
        ),
      ),
    );
  }

 
}