import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import 'countries_event.dart';
import 'countries_state.dart';
import 'package:testingapi/data/model/api_model.dart';

import 'package:testingapi/data/repository/repository.dart';



class CountryBloc extends Bloc<CountryEvent, Countrystate> {

  CountryRepository repository;

 CountryBloc({@required this.repository});

  @override
  // TODO: implement initialState
  Countrystate get initialState => CountryInitialState();

  @override
  Stream<Countrystate> mapEventToState(CountryEvent event) async* {
    if (event is FetchCountries) {
      yield CountriesLoadingState();
      try {
        List<Countries> countries = await repository.getCountries();
        yield CountryLoadedState(countries: countries);
      } catch (e) {
        yield CountryErrorstate(message: e.toString());
      }
    }
  }

}




