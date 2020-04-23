import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:startngflutter_3/model/person.dart';
import 'package:startngflutter_3/screens/PersonPage.dart';

class PeopleList extends StatefulWidget {
  @override
  _PeopleListState createState() {
    return _PeopleListState();
  }
}

class _PeopleListState extends State<PeopleList> {
  Future<List<Person>> futurePeople;

  @override
  void initState() {
    super.initState();
    futurePeople = fetchPeople();
  }

  _screenReturn(List<Person> peopleList) {
    if (peopleList == null)
      return SingleChildScrollView(physics: AlwaysScrollableScrollPhysics());
    else {
      if (peopleList.length == 0)
        return SingleChildScrollView(physics: AlwaysScrollableScrollPhysics());
      else {
        return ListView.builder(
            itemCount: peopleList != null ? peopleList.length : 0,
            itemBuilder: (BuildContext ctxt, int index) {
              return ListTile(
                  title: new Text(
                    peopleList[index].name,
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Container(
                    child: Text(peopleList[index].email,
                        style: TextStyle(color: Colors.brown, fontSize: 12)),
                  ),
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> PersonPage(peopleList[index]) ));});
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //openVisitForm();
    return Scaffold(
        appBar: AppBar(title: Text('People')),
        body: FutureBuilder(
            future: futurePeople,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return _screenReturn(snapshot.data);
              } else if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              else
                return new Text('Loading....');
            }));
  }

  Future<List<Person>> fetchPeople() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return compute(parsePeople, response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Person');
    }
  }
}
  List<Person> parsePeople(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Person>((json) => Person.fromJson(json)).toList();
  }

