import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/routes/pages.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DevPage extends StatelessWidget {
  const DevPage({super.key});

  Future f() async {
    await SpotifySdk.connectToSpotifyRemote(clientId: "ab59d37825a8489591577d54bb0b352a", redirectUrl: "com.uglyonlytoday.idontlikethesongplayinrn://spotify-login-callback");
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
            onPressed: () => Supabase.instance.client.auth.signOut(),
            child: Text('logout'),
          ),
          TextButton(
            onPressed: () => Get.toNamed(Routes.HOME),
            child: Text(Routes.HOME),
          ),
          TextButton(
            onPressed: () => Get.toNamed(Routes.SPACE),
            child: Text(Routes.SPACE),
          ),
        ],
      ),
    );
  }
}
