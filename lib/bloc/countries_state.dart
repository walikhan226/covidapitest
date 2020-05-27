
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:testingapi/data/model/api_model.dart';

abstract class Countrystate extends Equatable{}


class CountryInitialState extends Countrystate{
  @override
  // TODO: implement props
  List<Object> get props => [];

  
}

class CountriesLoadingState extends Countrystate{

  @override
  // TODO: implement props
  List<Object> get props => [];
}


class CountryLoadedState extends Countrystate{

List<Countries> countries; 

CountryLoadedState({@required this.countries});

   @override
  // TODO: implement props
  List<Object> get props => [countries];
}


class CountryErrorstate extends Countrystate{


String message;

  CountryErrorstate({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];

}