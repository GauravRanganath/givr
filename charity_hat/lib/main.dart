import 'package:charity_hat/firstpage.dart';
import 'package:charity_hat/fourthpage.dart';
import 'package:charity_hat/secondpage.dart';
import 'package:charity_hat/thirdpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    theme: ThemeData(
      cursorColor: Colors.grey[700],
    ),
    home: FirstRoute(),
  ));
}
const baseUrl = "http://localhost:3000";
TextEditingController userController = new TextEditingController();
TextEditingController passController = new TextEditingController();
class FirstRoute extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      body: Center(
        child: Column(

          children: <Widget>[

            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            Image.asset(
              'assets/images/logo.png',
              width: 225,
            ),

            Padding(
              padding: EdgeInsets.all(12.0),
            ),

            Text(
              'givr',
              style:
              TextStyle(
                fontFamily: 'Righteous',
                fontSize: 100,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(12.0),
            ),
            
            Container(
              width: 300.0,
              child: TextField(
                controller: userController,
                obscureText: false,
                style: TextStyle(color: Colors.grey[700]),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen,
                    ),
                  ),
                  hintText: "Username",
                  icon: Icon(
                      Icons.person_outline,
                      color: Colors.grey[700],
                  ),

                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightGreen,
                    ),
                  ),

                  border:
                  UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(204, 5, 65, 1),

                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(12.0),
            ),

            Container(
              width: 300.0,
              child: TextField(
                controller: passController,
                obscureText: true,
                style: TextStyle(color: Colors.grey[700]),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen,
                    ),
                  ),
                  hintText: "Password",
                  icon: Icon(
                      Icons.lock_outline,
                      color: Colors.grey[700],
                  ),

                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightGreen,
                    ),
                  ),
                  border:
                    UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(204, 5, 65, 1),

                      ),
                    ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(12.0),
            ),

            FlatButton(
              child: Text(
                'SIGN IN',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey[700],
                  letterSpacing: 2,
                  fontFamily: 'Lato'
                ),
              ),
              onPressed: () async {

                const route = baseUrl + "/auth/login";
                debugPrint(userController.text + passController.text);
               



                  final LocalStorage storage = new LocalStorage('some_key');
                  storage.setItem("username", userController.text);
                  Navigator.push(
                    context, new MaterialPageRoute(
                    builder: (context) => new AppBottomNavigationBarController()));


              },
            ),
          ],
        ),
      ),
    );
  }
}

class AppBottomNavigationBarController extends StatefulWidget {
  @override
  _AppBottomNavigationBarControllerState createState() =>
      _AppBottomNavigationBarControllerState();
}


class _AppBottomNavigationBarControllerState extends State<AppBottomNavigationBarController> {
  
  final List<Widget> pages = [
    FirstPage(
      key: PageStorageKey('Page1'),
    ),
    SecondPage(
      key: PageStorageKey('Page2')
    ),
    ThirdPage(
      key: PageStorageKey('Page3'),
    ),
    FourthPage(
      key: PageStorageKey('Page4'),
    )
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  int _selectedIndex = 0;
  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
    unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
                Icons.home,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.local_atm,
            ),
            title: Text('Donate',),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance,
            ),
            title: Text('Charities'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.attach_money,
            ),
            title: Text("Analytics")
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.greenAccent[700],
        onTap: (int index) => setState(() => _selectedIndex = index),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        title: const Text(
            'givr',
            style: TextStyle(
              fontFamily: 'Righteous',
              fontSize: 35,
              color: Colors.black,
            ),
        ),
      ),

      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
        

      
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex)
    );
  }
}