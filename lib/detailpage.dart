
import 'package:flutter/material.dart';
import 'package:testingapi/data/model/api_model.dart';


class Covidetailpage extends StatelessWidget {
  Countries countries;
  Covidetailpage({this.countries});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(



      ),

body: Padding(
  padding: const EdgeInsets.only(top:60),
  child:   ListView(
  
  
  
  children: <Widget>[
  
  
  
  ListTile(
  
  leading: Text("Country"),
  
  trailing: Text(countries.country),
  
  ),
  
  ListTile(
  
  leading: Text("Deaths"),
  
  trailing: Text(countries.totalDeaths.toString()),
  
  ),
  
  ListTile(
  
  leading: Text("Recovered"),
  
  trailing: Text(countries.totalRecovered.toString()),
  
  )
  
  
  
  ],
  
  
  
  
  
  ),
),
    );
  }
}