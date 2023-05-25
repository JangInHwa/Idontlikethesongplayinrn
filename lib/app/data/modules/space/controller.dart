import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/core/base/base_controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/core/enums/controller_state.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/music_player/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/suggestion/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/suggestion/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/repository.dart';

class SpacesController extends BaseController {
  final SpaceRepository repository;
  final Rx<List<Space>> _spaces = Rx([]);

  List<Space> get spaces => _spaces.value;

  SpacesController({
    SpaceRepository? repository,
  }) : repository = repository ?? SpaceRepository();

  Future init() async {
    _spaces.value = await repository.getAll();
    state.value = ControllerState.success;
  }

  Future<List<Space>> fetchSpaces() async {
    state.value = ControllerState.fetching;
    final res = await repository.getAll();
    state.value = ControllerState.success;
    return res;
  }

  Future<void> joinSpace(Space space) async {
    if (spaces.any((e) => e.id == space.id)) {
      return;
    }
    await repository.join(space);
    _spaces.value.add(space);
    _spaces.refresh();
  }
}

class SpaceController extends BaseController {
  final SpaceRepository repository;
  final Space space;
  final SuggestionsController _suggestionsController = Get.find<SuggestionsController>();
  final MusicPlayerController _musicPlayerController = Get.find<MusicPlayerController>();

  List<Suggestion> get suggestions => _suggestionsController.suggestions;

  SpaceController(
    this.space, {
    SpaceRepository? repository,
  }) : repository = repository ?? SpaceRepository();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future init() async {
    await _suggestionsController.init();
    if (_suggestionsController.suggestions.isNotEmpty) {
      _musicPlayerController.setCurrentSong(_suggestionsController.suggestions.first);
    }
  }

  Future insertSuggestion(SuggestionBase newSuggestion) async {
    await _suggestionsController.insertSuggestion(newSuggestion);
  }

  Suggestion? getPrevSong() {
    if (_musicPlayerController.currentSong == null) {
      return null;
    }
    int currentSongIndex = _suggestionsController.getIndex(_musicPlayerController.currentSong!);
    if (currentSongIndex == 0) {
      return null;
    }
    return _suggestionsController.suggestions[currentSongIndex - 1];
  }

  Suggestion? getNextSong() {
    if (_musicPlayerController.currentSong == null) {
      return null;
    }
    int currentSongIndex = _suggestionsController.getIndex(_musicPlayerController.currentSong!);
    if (currentSongIndex + 1 >= _suggestionsController.suggestions.length) {
      return null;
    }
    return _suggestionsController.suggestions[currentSongIndex + 1];
  }

  Future<void> toNextSong() async {
    Suggestion? nextSong = getNextSong();
    if (nextSong != null) {
      await _musicPlayerController.play(nextSong);
    }
  }

  Future<void> toPrevSong() async {
    Suggestion? prevSong = getPrevSong();
    if (prevSong != null) {
      await _musicPlayerController.play(prevSong);
    }
  }
}
