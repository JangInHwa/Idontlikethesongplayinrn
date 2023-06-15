import 'package:i_dont_like_the_song_playin_rn/app/data/modules/profile/model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepository {
  final SupabaseClient supabase;

  ProfileRepository({
    SupabaseClient? supabaseClient,
  }) : supabase = supabaseClient ?? Supabase.instance.client;

  Future<Profile> get() async {
    String currentUserId = supabase.auth.currentUser!.id;
    List res = await supabase.from('profiles').select().eq("id", currentUserId);
    return Profile.fromMap(res.first);
  }

  Future<bool> profileIdAlreadyExtists(String profileId) async {
    List res = await supabase.from('profiles').select().eq('profile_id', profileId);
    return res.isNotEmpty;
  }

  Future<void> setProfileId(String id, String profileId) async {
    await supabase.from('profiles').update({'profile_id': profileId}).eq('id', id);
  }
}
