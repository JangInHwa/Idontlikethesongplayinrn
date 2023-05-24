class Space {
  final String id;
  final String name;
  final String? currentPlayingSongId;
  final String joinCode;

  Space({
    required this.id,
    required this.name,
    required this.currentPlayingSongId,
    required this.joinCode,
  });

  Space.fromMap(
    Map<String, dynamic> data,
  )   : id = data['id'],
        name = data['name'],
        currentPlayingSongId = data['currentPlayingSongId'],
        joinCode = data['join_code'];
}
