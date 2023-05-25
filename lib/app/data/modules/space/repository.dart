import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/suggestion/model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SpaceRepository {
  final SupabaseClient supabase;

  SpaceRepository({
    SupabaseClient? supabaseClient,
  }) : supabase = supabaseClient ?? Supabase.instance.client;

  Future<List<Space>> getAll() async {
    List res = await supabase.from('profiles').select('space!space_participants(*)').eq("id", Supabase.instance.client.auth.currentUser!.id);
    res = res[0]['space'];
    return res.map<Space>((e) => Space.fromMap(e)).toList();
  }

  Future<Space?> getWithJoinCode(String joinCode) async {
    List res = await supabase.from('space').select().eq('join_code', joinCode);
    if (res.isEmpty) {
      return null;
    } else {
      return Space.fromMap(res[0]);
    }
  }

  Future<void> join(Space space) async {
    await supabase.from('space_participants').insert(
      {
        'profile_id': supabase.auth.currentUser!.id,
        'space_id': space.id,
      },
    );
  }

  Stream<String?> getCurrentPlayingSuggestionStream(Space space) {
    final res = supabase.from('space').stream(primaryKey: ['id']).eq('id', space.id).map<String?>(
          (data) => data[0]['current_playing_suggestion_id'],
        );
    return res;
  }

  Future<void> setCurrentPlayingSong(Space space, Suggestion? suggestion) async {
    await supabase.from('space').update(
      {'current_playing_suggestion_id': suggestion?.id},
    ).eq('id', space.id);
  }

  // getId(id) {
  //   return api.getId(id);
  // }

  // delete(id) {
  //   return api.delete(id);
  // }

  // edit(obj) {
  //   return api.edit(obj);
  // }

  // add(obj) {
  //   return api.add(obj);
  // }
}
