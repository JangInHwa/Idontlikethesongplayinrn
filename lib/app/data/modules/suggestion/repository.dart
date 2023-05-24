import 'package:i_dont_like_the_song_playin_rn/app/data/modules/suggestion/model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SuggestionRepository {
  final SupabaseClient supabase;

  SuggestionRepository({
    SupabaseClient? supabaseClient,
  }) : supabase = supabaseClient ?? Supabase.instance.client;

  Future<List<Suggestion>> get(String spaceId) async {
    List res = await supabase.from('song_suggestion').select().eq("space_id", spaceId);
    return res.map<Suggestion>((e) => Suggestion.fromMap(e)).toList();
  }

  Stream<List<Suggestion>> getStream(String spaceId) {
    final res = supabase.from('song_suggestion').stream(primaryKey: ['id']).eq('space_id', spaceId).map<List<Suggestion>>(
          (data) => data.map<Suggestion>((e) => Suggestion.fromMap(e)).toList(),
        );
    return res;
  }

  Future insert(SuggestionBase newSuggestion) async {
    await supabase.from('song_suggestion').insert({
      'profile_id': supabase.auth.currentUser!.id,
      'song_title': newSuggestion.songTitle,
      'artist': newSuggestion.artist,
      'cover_image': newSuggestion.coverImage,
      'spotify_id': newSuggestion.spotifyId,
      'space_id': newSuggestion.spaceId,
    });
  }
}
