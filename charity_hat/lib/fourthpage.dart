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
                
             
              },
            ),
          ),

        
        ],
      )
    );
  }
}

 
