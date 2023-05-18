class SpotifySong {
  final String name;
  final String artist;
  final String coverImage;
  final String spotifyLink;

  SpotifySong({
    required this.name,
    required this.artist,
    required this.coverImage,
    required this.spotifyLink,
  });

  SpotifySong.fromMap(
    Map<String, dynamic> data,
  )   : name = data['name'],
        artist = (data['artists'] as List).map((e) => e['name']).toList().join(', '),
        coverImage = data['album']['images'][(data['album']['images'] as List).length - 1]['url'],
        spotifyLink = data['external_urls']['spotify'];
}
