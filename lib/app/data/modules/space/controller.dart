import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/core/base/base_controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/core/enums/controller_state.dart';
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
  final Rx<List<SuggestionBase>> _suggestions = Rx([]);

  SpaceController(
    this.space, {
    SpaceRepository? repository,
  }) : repository = repository ?? SpaceRepository();

  Future init() async {}
}
