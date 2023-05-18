import 'package:dio/dio.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/spotify_song/model.dart';

class SpotifyRepository {
  final Dio dio;

  SpotifyRepository({
    Dio? dio,
  }) : dio = dio ?? Dio();

  Future<List<SpotifySong>> searchSong(String keyword) async {
    Response response = await dio.get(
      'https://i-dont-like-the-song-playin-rn-vmungvnntq-du.a.run.app/search',
      queryParameters: {'q': keyword},
    );
    return (response.data['tracks']['items'] as List).map<SpotifySong>((e) => SpotifySong.fromMap(e)).toList();
  }
}
