import 'package:i_dont_like_the_song_playin_rn/app/data/modules/song_suggestion/model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SongSuggestionRepository {
  final SupabaseClient supabase;

  SongSuggestionRepository({
    SupabaseClient? supabaseClient,
  }) : supabase = supabaseClient ?? Supabase.instance.client;

  Future<List<SongSuggestion>> get(String spaceId) async {
    List res = await Supabase.instance.client.from('song_suggestion').select('id, song_title, artist, cover_image, spotify_link').eq("space_id", spaceId);
    return res.map<SongSuggestion>((e) => SongSuggestion.fromMap(e)).toList();
  }

  Stream<List<SongSuggestion>> getStream(String spaceId) {
    final res = Supabase.instance.client.from('song_suggestion').stream(primaryKey: ['id']).eq('space_id', spaceId).map<List<SongSuggestion>>(
          (data) => data.map<SongSuggestion>((e) => SongSuggestion.fromMap(e)).toList(),
        );
    return res;
  }
}
