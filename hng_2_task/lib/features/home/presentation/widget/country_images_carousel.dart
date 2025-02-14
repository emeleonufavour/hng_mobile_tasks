// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hng_2_task/core/core.dart';

class CountryImagesCarousel extends StatefulWidget {
  final String flagUrl;
  final String? coatOfArmsUrl;

  const CountryImagesCarousel({
    required this.flagUrl,
    this.coatOfArmsUrl,
    super.key,
  });

  @override
  State<CountryImagesCarousel> createState() => _CountryImagesCarouselState();
}

class _CountryImagesCarouselState extends State<CountryImagesCarousel> {
  int currentIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasMultipleImages = widget.coatOfArmsUrl != null;

    return SizedBox(
      height: 200.h,
      child: Stack(
        children: [
          Hero(
            tag: widget.flagUrl,
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ImageWidget(
                    height: 200.h,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                    url: widget.flagUrl,
                  ),
                ),
                if (hasMultipleImages)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: ImageWidget(
                      height: 200.h,
                      width: double.maxFinite,
                      fit: BoxFit.contain,
                      url: widget.coatOfArmsUrl!,
                    ),
                  ),
              ],
            ),
          ),
          if (hasMultipleImages) ...[
            Positioned(
              left: 8,
              top: 0,
              bottom: 0,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: currentIndex == 1
                          ? Palette.grey100
                          : Colors.white.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.chevron_left,
                      color: currentIndex == 1 ? Palette.black : Palette.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 8,
              top: 0,
              bottom: 0,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: currentIndex == 1
                          ? Palette.grey100
                          : Colors.white.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.chevron_right,
                      color: currentIndex == 1 ? Palette.black : Palette.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 2; i++)
                    Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == i
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
