class Space {
  final String id;
  final String name;
  final String? currentPlayingSongId;

  Space({
    required this.id,
    required this.name,
    required this.currentPlayingSongId,
  });

  Space.fromMap(
    Map<String, dynamic> data,
  )   : id = data['id'],
        name = data['name'],
        currentPlayingSongId = data['currentPlayingSongId'];
}
