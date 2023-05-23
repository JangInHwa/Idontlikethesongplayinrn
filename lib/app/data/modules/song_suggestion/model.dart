class SongSuggestionBase {
  final String songTitle;
  final String artist;
  final String coverImage;
  final String spotifyId;
  final String spaceId;

  SongSuggestionBase({
    required this.songTitle,
    required this.artist,
    required this.coverImage,
    required this.spotifyId,
    required this.spaceId,
  });

  SongSuggestionBase.fromMap(
    Map<String, dynamic> data,
  )   : songTitle = data['song_title'],
        artist = data['artist'],
        coverImage = data['cover_image'],
        spotifyId = data['spotify_id'],
        spaceId = data['space_id'];
}

class SongSuggestion extends SongSuggestionBase {
  final String id;
  final String profileId;

  SongSuggestion({
    required this.id,
    required super.songTitle,
    required super.artist,
    required super.coverImage,
    required super.spotifyId,
    required super.spaceId,
    required this.profileId,
  });

  SongSuggestion.fromMap(
    super.data,
  )   : id = data['id'],
        profileId = data['profile_id'],
        super.fromMap();
}
