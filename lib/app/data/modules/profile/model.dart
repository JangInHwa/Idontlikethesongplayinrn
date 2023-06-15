class Profile {
  String id;
  String? profileId;

  Profile({
    required this.id,
    this.profileId,
  });

  Profile.fromMap(
    Map<String, dynamic> data,
  )   : id = data['id'],
        profileId = data['profile_id'];
}
