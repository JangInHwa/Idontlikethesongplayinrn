class SongSuggestion {
  final String id;
  final String songTitle;
  final String artist;
  final String coverImage;
  final String spotifyLink;

  SongSuggestion({
    required this.id,
    required this.songTitle,
    required this.artist,
    required this.coverImage,
    required this.spotifyLink,
  });

  SongSuggestion.fromMap(
    Map<String, dynamic> data,
  )   : id = data['id'],
        songTitle = data['song_title'],
        artist = data['artist'],
        coverImage = data['cover_image'],
        spotifyLink = data['spotify_link'];
}
