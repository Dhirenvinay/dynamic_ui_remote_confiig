import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:dynamiui/app_config.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final urls = AppConfig.sliderImages.split(",");
    return Container(
      margin: const EdgeInsets.all(16),
      height: 200,
      width: double.infinity,
      child: FlutterCarousel(
        options: FlutterCarouselOptions(
          height: 200,

          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          enlargeCenterPage: true,
          aspectRatio: AppConfig.siderAspectRatio,
          viewportFraction: 0.8,
        ),
        items:
            urls.map((url) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              const Icon(Icons.error, color: Colors.grey),
                    ),
                  );
                },
              );
            }).toList(),
      ),
    );
  }
}
