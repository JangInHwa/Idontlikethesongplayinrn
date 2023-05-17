import 'dart:async';

import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/core/base/base_controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/core/enums/controller_state.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/song_suggestion/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/song_suggestion/repository.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/model.dart';

class SongSuggestionsController extends BaseController {
  SongSuggestionRepository repository;
  final Rx<List<SongSuggestion>> _songSuggestions = Rx([]);
  StreamSubscription<List<SongSuggestion>>? _songSuggestionsStream;

  final Space _space;

  List<SongSuggestion> get songSuggestions => _songSuggestions.value;

  SongSuggestionsController(
    this._space, {
    SongSuggestionRepository? repository,
  }) : repository = repository ?? SongSuggestionRepository();

  void _onStreamData(List<SongSuggestion> songSuggestions) {
    print('ok');
    state.value = ControllerState.success;
    _songSuggestions.value = songSuggestions;
  }

  void _onStreamError(Object e) {
    state.value = ControllerState.failed;
  }

  Future init() async {
    _songSuggestionsStream = repository.getStream(_space.id).listen((event) => ());

    _songSuggestionsStream!.onData(_onStreamData);
    _songSuggestionsStream!.onError(_onStreamError);
  }

  @override
  void onClose() {
    _songSuggestionsStream?.cancel();
    super.onClose();
  }
}
