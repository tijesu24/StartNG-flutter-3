import 'package:flutter/material.dart';
import 'package:startngflutter_3/model/person.dart';




class PersonPage extends StatelessWidget {
final Person person ;
PersonPage(this.person);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:Text(person.name)),
    body: Column(
      children: <Widget>[
        CircleAvatar(backgroundImage: AssetImage('assets/images/person_avatar.jpg'),radius: 100,),
        SizedBox(height: 20,),
        Card(
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text('Name: ' + person.name),          
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.mail),
            title: Text('Email: ' + person.email),          
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone number: ' + person.phoneno),          
          ),
        ),

        
        
        
      ],
    ),);
  }
}