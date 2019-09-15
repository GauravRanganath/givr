import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:  <Widget>[
          Card(
            child: ListTile(

              leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://www.logodesignlove.com/wp-content/uploads/2011/10/red-cross-logo.jpg'),
              ),

              title: Text('Canadian Red Cross'),
              subtitle: Text(
                  'Humanitarianism\nOttawa, Ontario'
              ),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RedCross()),
                );
              },
            ),
          ),

          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://media.glassdoor.com/sqll/658142/rick-hansen-foundation-squarelogo-1498227943918.png'),
              ),
              title: Text('Rick Hansen Institute'),
              subtitle: Text(
                  'Spinal Cord Injury Research\nVancouver, British Columbia'
              ),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),

          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://www.themississaugafoodbank.org/wp-content/uploads/2017/07/shutterstock-556545406-przekonwertowany@2x.png'),
              ),
              title: Text('Mississauga Food Bank'),
              subtitle: Text(
                  'Housing and Homelessness\nMississauga, Ontario'
              ),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),

          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/614435627107549184/3LvBd-pf_400x400.jpg'),
              ),
              title: Text('Nature Conservancy Canada'),
              subtitle: Text(
                  'Environment\nToronto, Ontario'
              ),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),

          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://givingtuesday.ca/img/partner-profiles/59e7dfa4a30b5logo-centre.jpg'),
              ),
              title: Text('Discovery House'),
              subtitle: Text(
                  'Social Services\nGuelph, Ontario'
              ),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),

          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/378800000475445563/190a0ec226a889372ff384c5200f058a_400x400.jpeg'),
              ),
              title: Text('Hamilton Food Share'),
              subtitle: Text(
                  'Housing and Homelessness\nHamilton, Ontario'
              ),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),
        ],
      )
    );
  }
}

class RedCross extends StatelessWidget {
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
      body: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                Text(
                  'CANADIAN RED CROSS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Lato',
                    color: Colors.redAccent,
                    letterSpacing: 3,
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                
                Text(
                  'INTERNATIONAL HUMANITARIANISM',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Lato',
                    color: Colors.grey[700],
                    letterSpacing: 2,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(15),
                ),

                Image.asset(
                    'assets/charity_data/images/red-cross.png',
                    height: 200,
                    width: 200,
                ),

                Padding(
                  padding: EdgeInsets.all(15),
                ),

                Text(
                  '10/10',
                  style: TextStyle(
                    fontSize: 60,
                    fontFamily: 'Lato',
                    color: Colors.greenAccent,
                    letterSpacing: 5,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10),
                ),

                Text(
                    'The Canadian Red Cross mission is to improve the lives of vulnerable people by mobilizing the power of humanity.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Lato',
                  color: Colors.grey[700],
                  letterSpacing: 1,
                ),
                ),

                Padding(
                  padding: EdgeInsets.all(5),
                ),

                FlatButton(
                  onPressed: () {
                    /*...*/
                  },
                  child: Text(
                    "DONATE",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Righteous',
                      fontSize: 24,
                    ),
                  ),
                )



              ],
            ),
          ),
      ),
    );
  }
}