import 'package:bloc/bloc.dart';
import './player_listing_events.dart';
import './player_listing_state.dart';
import '../models/api_models.dart';
import '../services/repository.dart';

class PlayerListingBloc extends Bloc<PlayerListingEvent, PlayerListingState> {
  final PlayerRepository playerRepository;
  PlayerListingBloc({this.playerRepository}) : assert(playerRepository != null);

  @override
  PlayerListingState get initialState => PlayerUninitializedState();

  @override
  Stream<PlayerListingState> mapEventToState(PlayerListingEvent event) async* {
    if (event is CountrySelectedEvent) {
      yield PlayerFetchingState();
      try {
        final List<Players> players = await playerRepository
            .fetchPlayersByCountry(event.nationModel.countryId);
        if (players.length == 0) {
          yield PlayerEmptyState();
        } else {
          yield PlayerFetchedState(players: players);
        }
      } catch (_) {
        yield PlayerErrorState();
      }
    }
  }
  
}

/*
  @override
  Stream<PlayerListingState> mapEventToState(
    PlayerListingState currentState,
    PlayerListingEvent event,
  ) async* {
    if (event is CountrySelectedEvent) {
      yield PlayerFetchingState();
      try {
        final List<Players> players = await playerRepository
            .fetchPlayersByCountry(event.nationModel.countryId);
        if (players.length == 0) {
          yield PlayerEmptyState();
        } else {
          yield PlayerFetchedState(players: players);
        }
      } catch (_) {
        yield PlayerErrorState();
      }
    }
  }

*/