import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/viewmodel/banner_view_viewmodel.dart';

class BannerView extends StatelessWidget {
  final BannerViewModel bannerViewModel = Get.put(BannerViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          if (bannerViewModel.isLoading.value) {
            return const CircularProgressIndicator();
          } else {
            if (bannerViewModel.banners.isEmpty) {
              return const Text('No data available');
            } else {
              return SizedBox(
                height: 170.0,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 170.0,
                    autoPlay: true,
                  ),
                  itemCount: bannerViewModel.banners.length,
                  itemBuilder: (context, itemIndex, realIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            bannerViewModel.banners[itemIndex].image,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        }),
      ),
    );
  }
}
