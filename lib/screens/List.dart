import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_serializable/json_serializable.dart';
import 'package:flutter/material.dart';


class SavedVisit extends StatefulWidget {
  

  

  @override
  _SavedVisitState createState() {
    return _SavedVisitState();
  }
}

class _SavedVisitState extends State<SavedVisit> {
  
  @override
void initState() {
    super.initState();
    pq = PersistentQueue('visitQueue' , onFlush: (list) async {
    final result = await InternetAddress.lookup('google.com');
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    if (list[0] == events[0]) {
      await _onlineDatabase.addVisit((){
        for 
      }
  
    }}
  print('auto-flush\n$list');
});
}

  Future getAllVisits() async{
    visits = 
    
    return visits ;
  }

  _screenReturn (){
    if(visits == null) return SingleChildScrollView(physics: AlwaysScrollableScrollPhysics());
    else {
      if(visits.length == 0) return SingleChildScrollView(physics: AlwaysScrollableScrollPhysics());
      else{
      return ListView.builder
  (
    itemCount: visits != null ?visits.length : 0,
    itemBuilder: (BuildContext ctxt, int index) {
     return ListTile(
            title: new Text(visits[index].siteId,
      style: TextStyle(fontSize: 16), ),
            subtitle: Container(
                child: Text(visits[index].dateofVisit.toIso8601String(),
        style: TextStyle(color: Colors.brown, fontSize: 12)),
            ),
             onTap: (){openVisitForm(visits[index]);},
             trailing: Row(
               mainAxisSize: MainAxisSize.min,
       children: <Widget>[
         Icon(visits[index].pending ? Icons.cached : Icons.check),
         Icon(Icons.more),
       ],
             )) ;
             
  }
     );}}}

  
  Future<http.Response> fetchAlbum() {
  return http.get('https://jsonplaceholder.typicode.com/users');
}

  @override
  Widget build (BuildContext context) {
    
    //openVisitForm();
    return FutureBuilder(
          future: initialiseDB().whenComplete((){getAllVisits();}),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
           if(snapshot.hasData) {
            return new 
             Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Site Inspection'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Add Visit',
              onPressed: () {
                //openVisitForm();
                updateOnlineDatabase();
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz),
              tooltip: 'Next page',
              onPressed: () async{
                await widget._auth.signOut();
                 /* dropDB();
                setState(() {
                  getAllVisits(); 
                }); */                
              },
            ),
            IconButton(
              icon: const Icon(Icons.airline_seat_recline_extra),
              tooltip: 'Add',
              onPressed: ()=> testMultiple(),
            ),
            
          ],
        ),
        body: _screenReturn(),

);}
    else if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
    else
          return new Text('Loading....');
            
              });}
    
           
    
  
  openVisitForm([SiteVisit visitb4])async{
                      SiteVisit visit = //SiteVisit.fromList(['14c926t0-39dd-11ea-l39i-fff47b71598b', 'oy066', '2020-01-18T11:28:30.825026', 32323.0, 23.0, 323.0, 1, 232.0, 323.0, 34.0, 1, 1, 323.0, 213.0, 23.0, 1, 0, 2131.0, 12.0, 1, 1, 1, '',1]);
                      await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VisitForm(visitb4),
              ));
              if(visit != null){
              await visitDB.insertSiteVisit(visit);
              setState(() {
                getAllVisits();
              }); 
              } 
          }

   testMultiple()async{
                      List<SiteVisit> visits = [SiteVisit.fromList(['14c926t0-39dd-11ea-l39i-fff47b71598b', 'oy066', '2020-01-18T11:28:30.825026', 32323.0, 23.0, 323.0, 1, 232.0, 323.0, 34.0, 1, 1, 323.0, 213.0, 23.0, 1, 0, 2131.0, 12.0, 1, 1, 1, '',1]),
                      SiteVisit.fromList(['14c926t0-39dd-11ea-l66i-fff47b71598b', 'oy066', '2020-01-18T11:28:30.825026', 32323.0, 23.0, 323.0, 1, 232.0, 323.0, 34.0, 1, 1, 323.0, 213.0, 23.0, 1, 0, 2131.0, 12.0, 1, 1, 1, '',1]),
                      SiteVisit.fromList(['14c926t0-39dd-11ea-l3fi-fff47b71598b', 'oy109', '2020-01-18T11:28:30.825026', 32323.0, 23.0, 323.0, 1, 232.0, 323.0, 34.0, 1, 1, 323.0, 213.0, 23.0, 1, 0, 2131.0, 12.0, 1, 1, 1, '',1]),
                      SiteVisit.fromList(['14c926t0-39dd-11ea-l39i-fffijb71598b', 'og666', '2020-01-18T11:28:30.825026', 32323.0, 23.0, 323.0, 1, 232.0, 323.0, 34.0, 1, 1, 323.0, 213.0, 23.0, 1, 0, 2131.0, 12.0, 1, 1, 1, '',1]),
                      SiteVisit.fromList(['14c92y00-39dd-11ea-l39i-fff47b71598b', 'oy010', '2020-01-18T11:28:30.825026', 32323.0, 23.0, 323.0, 1, 232.0, 323.0, 34.0, 1, 1, 323.0, 213.0, 23.0, 1, 0, 2131.0, 12.0, 1, 1, 1, '',1])
                      ];

                      visits.forEach((it) async =>await visitDB.insertSiteVisit(it));
            
              setState(() {
                getAllVisits();
              }); 
              } 
          
    
    dropDB (){
      visitDB.database.execute("DROP TABLE IF EXISTS visits");
      visitDB.database.execute(
          "CREATE TABLE visits(entryuid TEXT PRIMARY KEY, siteId TEXT, dateofVisit TEXT, dgCapacity REAL, genRH REAL, lastPPM REAL, dgDuePPM INTEGER, freq REAL, dgACVolts REAL, dgACLoad REAL, engOilOk INTEGER, radOk INTEGER, dieselDipLts REAL, dieselDipcm REAL, dieselGal REAL, phcnOk INTEGER, hybridOk INTEGER, dcLoad REAL, moduleNo REAL, secLtOk INTEGER, avLtOk INTEGER, janitOk INTEGER, comment TEXT, pending INTEGER)");
    }

    updateOnlineDatabase(){
       setState( (){for (SiteVisit item in visits) {
        if(item.pending){
          widget._onlineDatabase.addVisit(item);
          item.pending = false;
          print(item.siteId);
        }
      }});
    }
  }
