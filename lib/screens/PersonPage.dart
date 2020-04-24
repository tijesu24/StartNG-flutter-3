import 'package:flutter/material.dart';
import 'package:startngflutter_3/model/person.dart';




class PersonPage extends StatelessWidget {
final Person person ;
PersonPage(this.person);
final TextStyle textStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:Text(person.name)),
    body: Column(
      children: <Widget>[
        CircleAvatar(backgroundImage: AssetImage('assets/images/person_avatar.jpg'),radius: 100,),
        SizedBox(height: 20,),
        Card(
          child: ListTile(
            leading: Icon(Icons.person, color: Colors.white),
            title: Text('Name: ' + person.name, style: textStyle,),          
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.mail, color: Colors.white),
            title: Text('Email: ' + person.email, style: textStyle),          
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.phone, color: Colors.white,),
            title: Text('Phone number: ' + person.phoneno, style: textStyle),          
          ),
        ),

        
        
        
      ],
    ),);
  }
}