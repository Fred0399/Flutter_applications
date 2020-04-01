import '../models/nations.dart';
import 'package:meta/meta.dart';

abstract class PlayerListingEvent {}

class CountrySelectedEvent with PlayerListingEvent {
  final NationModel nationModel;

  CountrySelectedEvent({@required this.nationModel})
      : assert(nationModel != null);
}
