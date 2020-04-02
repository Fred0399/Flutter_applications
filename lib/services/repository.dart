import '../models/api_models.dart';
import './player_api_provider.dart';

class PlayerRepository {
  PlayerApiProvider _playerApiProvider = new PlayerApiProvider();

  Future<List<Players>> fetchPlayersByCountry(String countryID) =>
      _playerApiProvider.fetchPlayersByCountry(countryID);

  Future<List<Players>> fetchPlayersByName(String name) =>
      _playerApiProvider.fetchPlayersByName(name);
}
