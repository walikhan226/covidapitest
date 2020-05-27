import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testingapi/bloc/countries_bloc.dart';
import 'package:testingapi/data/repository/repository.dart';
import 'package:testingapi/detailpage.dart';
import 'homepage.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
     
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

    home: BlocProvider(

     create: (BuildContext context) => CountryBloc(repository: Countryrepoimpl()),


      child: Homepage()
      
      ),
    );
  }
}
