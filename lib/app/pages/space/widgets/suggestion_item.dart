import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/suggestion/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/space/widgets/suggestion_detail_sheet.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SuggestionItem extends StatelessWidget {
  final Suggestion suggestion;
  final SpaceController spaceController = Get.find<SpaceController>();
  SuggestionItem(this.suggestion, {super.key});

  Widget othersSuggestion() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 12),
        const CircleAvatar(radius: 14),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'mingsung',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => Get.bottomSheet(SuggestionDetailSheet(suggestion), enterBottomSheetDuration: Duration(milliseconds: 150), isScrollControlled: true),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(16), bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xFF282828),
                  ),
                ),
                width: 256,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        suggestion.coverImage,
                        width: 48,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            suggestion.songTitle,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            suggestion.artist,
                            style: const TextStyle(color: Colors.white60, fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ],
    );
  }

  Widget mySuggestion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12, bottom: 16),
          child: GestureDetector(
            onTap: () => Get.bottomSheet(SuggestionDetailSheet(suggestion), enterBottomSheetDuration: Duration(milliseconds: 150), isScrollControlled: true),
            child: Obx(
              () => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                  color: spaceController.currentPlayingSong?.id == suggestion.id ? Colors.red : Color(0xFF1B1D22),
                ),
                width: 256,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        suggestion.coverImage,
                        width: 48,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            suggestion.songTitle,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            suggestion.artist,
                            style: const TextStyle(color: Colors.white60, fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (suggestion.profileId == Supabase.instance.client.auth.currentUser!.id) {
      return mySuggestion();
    } else {
      return othersSuggestion();
    }
  }
}
