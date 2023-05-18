class SongSuggestionBase {
  final String songTitle;
  final String artist;
  final String coverImage;
  final String spotifyLink;
  final String spaceId;

  SongSuggestionBase({
    required this.songTitle,
    required this.artist,
    required this.coverImage,
    required this.spotifyLink,
    required this.spaceId,
  });

  SongSuggestionBase.fromMap(
    Map<String, dynamic> data,
  )   : songTitle = data['song_title'],
        artist = data['artist'],
        coverImage = data['cover_image'],
        spotifyLink = data['spotify_link'],
        spaceId = data['space_id'];
}

class SongSuggestion extends SongSuggestionBase {
  final String id;

  SongSuggestion({
    required this.id,
    required super.songTitle,
    required super.artist,
    required super.coverImage,
    required super.spotifyLink,
    required super.spaceId,
  });

  SongSuggestion.fromMap(
    super.data,
  )   : id = data['id'],
        super.fromMap();
}
