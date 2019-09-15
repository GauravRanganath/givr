import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    theme: ThemeData(
      cursorColor: Colors.grey[700],
    ),
    home: FirstRoute(),
  ));
}

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
              onPressed: () {
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
      children: <Widget>[

        Text(
          'Charities',
          style:
          TextStyle(
            fontFamily: 'Righteous',
            fontSize: 30,
          ),
        ),

        Padding(
          padding: EdgeInsets.all(20.0),
        ),

        Container(
          width: 200,
          margin: new EdgeInsets.only(left:10.0, right:10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.grey[100],
            elevation: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album, size: 70),
                  title: Text(
                      'Mississauga Food Bank',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                      )
                  ),

                  subtitle: Text(
                      'Housing and Homelessness',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.greenAccent[700],
                      )
                  ),
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Donate', style: TextStyle(color: Colors.black)),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: const Text('Remove', style: TextStyle(color: Colors.black)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        Container(
          width: 200,
          margin: new EdgeInsets.only(left:10.0, right:10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.grey[100],
            elevation: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album, size: 70),
                  title: Text('Mississauga Food Bank', style: TextStyle(color: Colors.black)),
                  subtitle: Text('Housing and Homelessness', style: TextStyle(color: Colors.black)),
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Donate', style: TextStyle(color: Colors.black)),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: const Text('Remove', style: TextStyle(color: Colors.black)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        Container(
          width: 200,
          margin: new EdgeInsets.only(left:10.0, right:10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.grey[100],
            elevation: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album, size: 70),
                  title: Text('Nature Conservancy Canada', style: TextStyle(color: Colors.black)),
                  subtitle: Text('Environment', style: TextStyle(color: Colors.black)),
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Donate', style: TextStyle(color: Colors.black)),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: const Text('Remove', style: TextStyle(color: Colors.black)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        Container(
          width: 200,
          margin: new EdgeInsets.only(left:10.0, right:10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.grey[100],
            elevation: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album, size: 70),
                  title: Text('Discovery House', style: TextStyle(color: Colors.black)),
                  subtitle: Text('Social Services', style: TextStyle(color: Colors.black)),
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Donate', style: TextStyle(color: Colors.black)),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: const Text('Remove', style: TextStyle(color: Colors.black)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        Container(
          width: 200,
          margin: new EdgeInsets.only(left:10.0, right:10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.grey[100],
            elevation: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album, size: 70),
                  title: Text('Hamilton Food Share', style: TextStyle(color: Colors.black)),
                  subtitle: Text('Housing and Homelessness', style: TextStyle(color: Colors.black)),
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Donate', style: TextStyle(color: Colors.black)),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: const Text('Remove', style: TextStyle(color: Colors.black)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(20.0),
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