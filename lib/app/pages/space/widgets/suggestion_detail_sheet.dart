import 'package:flutter/material.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/suggestion/model.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SuggestionDetailSheet extends StatelessWidget {
  final Suggestion suggestion;
  const SuggestionDetailSheet(this.suggestion, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 56),
      decoration: const BoxDecoration(color: Color(0xFf22242A), borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Header(suggestion: suggestion),
            const Divider(color: Colors.white30, height: 1),
            GestureDetector(
              onTap: () => launchUrl(Uri.parse('https://open.spotify.com/track/${suggestion.spotifyId}'), mode: LaunchMode.externalApplication),
              child: Container(
                color: const Color(0xFf22242A),
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'asset/image/spotify-logo.png',
                          width: 32,
                        ),
                        const SizedBox(width: 20),
                        const Text('Spotify에서 보기', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Icon(PhosphorIcons.regular.caretRight, size: 18, color: Colors.white38)
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.white30, height: 1),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.suggestion,
  });

  final Suggestion suggestion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              suggestion.coverImage,
              width: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                suggestion.songTitle,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 6),
              Text(
                suggestion.artist,
                style: const TextStyle(color: Colors.white60),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
