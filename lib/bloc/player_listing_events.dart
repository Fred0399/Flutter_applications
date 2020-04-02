import '../models/nations.dart';
import 'package:meta/meta.dart';

abstract class PlayerListingEvent {}

class CountrySelectedEvent with PlayerListingEvent {
  final NationModel nationModel;

  CountrySelectedEvent({@required this.nationModel})
      : assert(nationModel != null);
}

class SearchTextChangedEvent with PlayerListingEvent {
  final String searchText;

  SearchTextChangedEvent({@required this.searchText})
      : assert(searchText != null);
}
