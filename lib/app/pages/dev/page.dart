import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/routes/pages.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DevPage extends StatelessWidget {
  const DevPage({super.key});

  Future f() async {
    await SpotifySdk.connectToSpotifyRemote(clientId: "ab59d37825a8489591577d54bb0b352a", redirectUrl: "com.uglyonlytoday.idontlikethesongplayinrn://spotify-login-callback");
    // SpotifySdk.play(spotifyUri: 'https://open.spotify.com/track/1IdZvb2XK8NmsovQlV6CPn?si=a090ee6ffcf74595');
    await SpotifySdk.play(spotifyUri: 'spotify:track:7DfFc7a6Rwfi3YQMRbDMau');
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
