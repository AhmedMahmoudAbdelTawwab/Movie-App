import 'package:flutter/material.dart';
import 'package:movie_app/core/constant/card.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieSkeletonList extends StatelessWidget {
  const MovieSkeletonList({
    super.key,
    required this.title,
    this.itemCount = 5,
    this.enabled = true,
  });

  final String title;
  final int itemCount;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SkeletonizerConfig(
      data: const SkeletonizerConfigData(
        effect: ShimmerEffect(
          baseColor: Color(0xFF0A0A0A),
          highlightColor: Color(0xFF1A1A1A),
        ),
      ),
      child: Skeletonizer(
        enabled: enabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.primaryTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 220,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                scrollDirection: Axis.horizontal,
                itemCount: itemCount,
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  return const MovieCard(
                    imagePath: '',
                    titleMovie: 'Loading Movie Title',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
