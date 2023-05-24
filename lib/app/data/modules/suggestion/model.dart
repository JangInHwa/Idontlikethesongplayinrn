class SuggestionBase {
  final String songTitle;
  final String artist;
  final String coverImage;
  final String spotifyId;
  final String spaceId;

  SuggestionBase({
    required this.songTitle,
    required this.artist,
    required this.coverImage,
    required this.spotifyId,
    required this.spaceId,
  });

  SuggestionBase.fromMap(
    Map<String, dynamic> data,
  )   : songTitle = data['song_title'],
        artist = data['artist'],
        coverImage = data['cover_image'],
        spotifyId = data['spotify_id'],
        spaceId = data['space_id'];
}

class Suggestion extends SuggestionBase {
  final String id;
  final String profileId;

  Suggestion({
    required this.id,
    required super.songTitle,
    required super.artist,
    required super.coverImage,
    required super.spotifyId,
    required super.spaceId,
    required this.profileId,
  });

  Suggestion.fromMap(
    super.data,
  )   : id = data['id'],
        profileId = data['profile_id'],
        super.fromMap();
}
