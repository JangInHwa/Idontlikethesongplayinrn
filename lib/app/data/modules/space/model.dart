class Space {
  final String id;
  final String name;

  Space({
    required this.id,
    required this.name,
  });

  Space.fromMap(
    Map<String, dynamic> data,
  )   : id = data['id'],
        name = data['name'];
}
