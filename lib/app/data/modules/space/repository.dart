import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SpaceRepository {
  final SupabaseClient supabase;

  SpaceRepository({
    SupabaseClient? supabaseClient,
  }) : supabase = supabaseClient ?? Supabase.instance.client;

  Future<List<Space>> getAll() async {
    List res = await Supabase.instance.client.from('profiles').select('space!space_participants(*)').eq("id", Supabase.instance.client.auth.currentUser!.id);
    res = res[0]['space'];
    return res.map<Space>((e) => Space.fromMap(e)).toList();
  }

  Future<Space?> getWithJoinCode(String joinCode) async {
    List res = await Supabase.instance.client.from('space').select().eq('join_code', joinCode);
    if (res.isEmpty) {
      return null;
    } else {
      return Space.fromMap(res[0]);
    }
  }

  Future<void> join(Space space) async {
    await Supabase.instance.client.from('space_participants').insert(
      {
        'profile_id': Supabase.instance.client.auth.currentUser!.id,
        'space_id': space.id,
      },
    );
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
