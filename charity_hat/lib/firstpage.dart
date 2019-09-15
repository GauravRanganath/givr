import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:convert';

const baseUrl = "http://localhost:3000";

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);
  
  void fetchExpenses() async {
     final LocalStorage storage = new LocalStorage('some_key');
      String user = storage.getItem("username");
      const route = baseUrl + "/expenses/redcross";
        
      Response res = await get(route);
      final body = json.decode(res.body);
      
      
      debugPrint(body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          title: Text('Lorem Ipsum'),
          subtitle: Text('$index'),
          onTap: () async {
            fetchExpenses();
          },
        );
      }),
    );
  }
}