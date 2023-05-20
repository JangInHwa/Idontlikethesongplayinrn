import 'package:i_dont_like_the_song_playin_rn/app/data/modules/song_suggestion/model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SongSuggestionRepository {
  final SupabaseClient supabase;

  SongSuggestionRepository({
    SupabaseClient? supabaseClient,
  }) : supabase = supabaseClient ?? Supabase.instance.client;

  Future<List<SongSuggestion>> get(String spaceId) async {
    List res = await supabase.from('song_suggestion').select('id, song_title, artist, cover_image, spotify_link, profile_id').eq("space_id", spaceId);
    return res.map<SongSuggestion>((e) => SongSuggestion.fromMap(e)).toList();
  }

  Stream<List<SongSuggestion>> getStream(String spaceId) {
    final res = supabase.from('song_suggestion').stream(primaryKey: ['id']).eq('space_id', spaceId).map<List<SongSuggestion>>(
          (data) => data.map<SongSuggestion>((e) => SongSuggestion.fromMap(e)).toList(),
        );
    return res;
  }

  Future insert(SongSuggestionBase newSongSuggestion) async {
    await supabase.from('song_suggestion').insert({
      'profile_id': supabase.auth.currentUser!.id,
      'song_title': newSongSuggestion.songTitle,
      'artist': newSongSuggestion.artist,
      'cover_image': newSongSuggestion.coverImage,
      'spotify_link': newSongSuggestion.spotifyLink,
      'space_id': newSongSuggestion.spaceId,
    });
  }
}
