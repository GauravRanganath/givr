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
      Company(1, 'Red Cross'),
      Company(2, 'Mississauga Food Bank'),
      Company(3, "Nature Conservancy Canada"),
      Company(4, "Discovery House",),
      Company(5, "Hamilton Food Share"),
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
                Text("Select an Organization", style:TextStyle(
                  fontSize: 30,
                  color: Colors.grey[700],
                  letterSpacing: 2,
                  fontFamily: 'Lato'
                ),),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButton(
                  value: _selectedCompany,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Selected: ${_selectedCompany.name}',style:TextStyle(
                  fontSize: 30,
                  color: Colors.grey[700],
                  letterSpacing: 2,
                  fontFamily: 'Lato'
                )),
                new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new TextField(
            decoration: new InputDecoration(labelText: "Enter donation amount"),
            keyboardType: TextInputType.number,
            controller: myController,
          ),
          FlatButton(
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
                'Donate',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey[700],
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