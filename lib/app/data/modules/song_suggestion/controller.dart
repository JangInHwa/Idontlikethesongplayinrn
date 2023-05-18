import 'dart:async';

import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/core/base/base_controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/core/enums/controller_state.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/song_suggestion/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/song_suggestion/repository.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/model.dart';

class SongSuggestionsController extends BaseController {
  SongSuggestionRepository songSuggestionRepository;
  final Rx<List<SongSuggestion>> _songSuggestions = Rx([]);
  StreamSubscription<List<SongSuggestion>>? _songSuggestionsStream;

  final Space _space;

  List<SongSuggestion> get songSuggestions => _songSuggestions.value;

  SongSuggestionsController(
    this._space, {
    SongSuggestionRepository? repository,
  }) : songSuggestionRepository = repository ?? SongSuggestionRepository();

  Future init() async {
    _songSuggestionsStream = songSuggestionRepository.getStream(_space.id).listen((event) => ());

    _songSuggestionsStream!.onData(_onStreamData);
    _songSuggestionsStream!.onError(_onStreamError);
  }

  Future insertSongSuggestion(SongSuggestionBase newSongSuggestion) async {
    await songSuggestionRepository.insert(newSongSuggestion);
  }

  void _onStreamData(List<SongSuggestion> songSuggestions) {
    state.value = ControllerState.success;
    _songSuggestions.value = songSuggestions;
  }

  void _onStreamError(Object e) {
    state.value = ControllerState.failed;
  }

  @override
  void onClose() {
    _songSuggestionsStream?.cancel();
    super.onClose();
  }
}
