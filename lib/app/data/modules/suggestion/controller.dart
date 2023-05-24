import 'dart:async';

import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/core/base/base_controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/core/enums/controller_state.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/suggestion/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/suggestion/repository.dart';

class SuggestionsController extends BaseController {
  SuggestionRepository suggestionRepository;
  final Rx<List<Suggestion>> _suggestions = Rx([]);
  StreamSubscription<List<Suggestion>>? _suggestionsStream;

  final Space _space;

  List<Suggestion> get suggestions => _suggestions.value;

  SuggestionsController(
    this._space, {
    SuggestionRepository? repository,
  }) : suggestionRepository = repository ?? SuggestionRepository();

  Future<SuggestionsController> init() async {
    _suggestionsStream = suggestionRepository.getStream(_space.id).listen(null);
    _suggestionsStream!.onData(_onStreamData);
    _suggestionsStream!.onError(_onStreamError);

    _suggestions.value = await suggestionRepository.getStream(_space.id).first;
    return this;
  }

  int getIndex(Suggestion song) {
    return suggestions.indexWhere((e) => e.id == song.id);
  }

  Future insertSuggestion(SuggestionBase newSuggestion) async {
    await suggestionRepository.insert(newSuggestion);
  }

  void _onStreamData(List<Suggestion> suggestions) {
    state.value = ControllerState.success;
    _suggestions.value = suggestions;
  }

  void _onStreamError(Object e) {
    state.value = ControllerState.failed;
  }

  @override
  void onClose() {
    _suggestionsStream?.cancel();
    super.onClose();
  }
}
