import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
                Map<String, String> headers = {"Content-type": "application/json"};
                String json = '{"username": "${userController.text}", "password": "${passController.text}"';
                Response res = await post(route, body: json);
              
                Navigator.push(
                    context, new MaterialPageRoute(
                    builder: (context) => new SecondPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({ Key key }) : super(key: key);

  @override
  _SecondPage createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage> {

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[

    Text(
      'Index 2',
    ),
    Text(
      'Index 3',
    ),

    ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
            color: Colors.grey[200],
            height: 200,
            child: Container(
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  image: DecorationImage(image: AssetImage('assets/images/logo.png'),
                  alignment: Alignment(1, 1),
  )
  ),
  ),
  ),
  ],
  ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white10,
        elevation: 0,
        child: Icon(Icons.fullscreen_exit),
        onPressed: () {
            Navigator.pushReplacementNamed(context, "/logout");
          },
      ),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_atm),
            title: Text('Donate'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            title: Text('Charities'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.greenAccent[700],
        onTap: _onItemTapped,
      ),
    );
  }
}