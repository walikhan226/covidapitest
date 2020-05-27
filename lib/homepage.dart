
import 'package:flutter/material.dart';
import 'package:testingapi/bloc/countries_bloc.dart';
import 'package:testingapi/bloc/countries_state.dart';
import 'package:testingapi/bloc/countries_event.dart';
import 'package:testingapi/data/model/api_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'detailpage.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
CountryBloc countryBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
countryBloc = BlocProvider.of<CountryBloc>(context);
countryBloc.add(FetchCountries());

  }

Widget countrylist (List<Countries> countries){

var list = ListView.builder(
itemCount: countries.length,
  itemBuilder: (context, index) {
  
return ListTile(

  onTap: (){

 navigateToDetailPage(context, countries[index]);

  },
leading: Text(countries[index].country),


);

    
  },
);


return list;

}
  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  void navigateToDetailPage(BuildContext context, Countries country) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Covidetailpage(
 countries:country
      );
    }));
  }
  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar: AppBar(
   title: Text("COVID 19"),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      countryBloc.add(FetchCountries());
                    },
                  ),
               
                ],
              ),
              body: Container(
                child: BlocListener<CountryBloc, Countrystate>(
                  listener: (context, state) {
                    if (state is CountryErrorstate) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<CountryBloc, Countrystate>(
                    builder: (context, state) {
                      if (state is CountryInitialState) {
                        return buildLoading();
                      } else if (state is CountriesLoadingState) {
                        return buildLoading();
                      } else if (state is CountryLoadedState) {
                        return countrylist(state.countries);
                      } else if (state is CountryErrorstate) {
                        return buildErrorUi(state.message);
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}