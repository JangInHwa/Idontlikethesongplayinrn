import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/routes/pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DevPage extends StatelessWidget {
  const DevPage({super.key});

  Future f() async {
    final data = await Supabase.instance.client.from('profiles').select('space!space_participants(id, name)').eq("id", Supabase.instance.client.auth.currentUser!.id);
    print(data.runtimeType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dev Page'),
      ),
      body: ListView(
        children: [
          TextButton(
            onPressed: f,
            child: Text('Hit!!'),
          ),
          TextButton(
            onPressed: () => Get.toNamed(Routes.LOGIN),
            child: Text(Routes.LOGIN),
          ),
          TextButton(
            onPressed: () => Get.toNamed(Routes.HOME),
            child: Text(Routes.HOME),
          ),
        ],
      ),
    );
  }
}
