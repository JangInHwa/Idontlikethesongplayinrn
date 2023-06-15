import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/profile/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/suggestion/model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SuggestionRepository {
  final SupabaseClient _supabase;

  final List<Profile> _profileCache = [];

  Future<Profile> _getProfile(String suggestorId) async {
    final cacheResult = _profileCache.firstWhereOrNull((element) => element.id == suggestorId);
    if (cacheResult != null) {
      return cacheResult;
    }
    final res = await _supabase.from('profiles').select().eq('id', suggestorId);
    _profileCache.add(Profile.fromMap(res[0]));
    return Profile.fromMap(res[0]);
  }

  SuggestionRepository({
    SupabaseClient? supabaseClient,
  }) : _supabase = supabaseClient ?? Supabase.instance.client;

  Stream<List<Suggestion>> getStream(String spaceId) {
    final res = _supabase.from('song_suggestion').stream(primaryKey: ['id']).eq('space_id', spaceId).asyncMap<List<Suggestion>>(
          (data) async {
            Set<String> suggestorIds = data.map<String>((e) => e['profile_id']).toSet();
            await Future.wait(suggestorIds.map<Future<Profile>>((e) => _getProfile(e)).toList());

            return data.map<Suggestion>((e) => Suggestion.fromMap(e, suggestor: _profileCache.firstWhere((element) => element.id == e['profile_id']))).toList();
          },
        );
    return res;
  }

  Future insert(SuggestionBase newSuggestion) async {
    await _supabase.from('song_suggestion').insert({
      'profile_id': _supabase.auth.currentUser!.id,
      'song_title': newSuggestion.songTitle,
      'artist': newSuggestion.artist,
      'cover_image': newSuggestion.coverImage,
      'spotify_id': newSuggestion.spotifyId,
      'space_id': newSuggestion.spaceId,
    });
  }
}
