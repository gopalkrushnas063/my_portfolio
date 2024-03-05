import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/view/banner_view.dart';
import 'package:my_portfolio/viewmodel/home_view_model.dart';
import 'package:my_portfolio/widgets/custom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';




class HomeView extends StatelessWidget {
  final HomeViewModel homeViewModel = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    List<String> imageUrlList = [
      "https://cdn-icons-png.flaticon.com/512/1626/1626319.png",
      "https://upload.wikimedia.org/wikipedia/commons/8/81/LinkedIn_icon.svg",
      "https://user-images.githubusercontent.com/103574856/220100990-cc4ee47d-acb8-4528-ad67-c8cc1eedca68.png",
      "https://user-images.githubusercontent.com/103574856/220102737-cefd3288-19d3-4a84-8435-3dd5f74a0726.png",
      "https://user-images.githubusercontent.com/103574856/220101591-caaceff1-df2e-481c-b554-42825a04375d.png",
    ];

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          textAlign: TextAlign.center,
          text:  TextSpan(
            children: [
              TextSpan(
                text: 'Port',
                style: GoogleFonts.aBeeZee(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'Folio',
                style: GoogleFonts.aBeeZee(
                  color: Colors.red,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      drawer: buildDrawer(context),
      body: Center(
        child: Obx(() {
          if (homeViewModel.isLoading.value) {
            return const CircularProgressIndicator();
          } else {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      homeViewModel.homeModel.value.image,
                      width: 170,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    homeViewModel.homeModel.value.name,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: DefaultTextStyle(
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 18.0,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: homeViewModel.homeModel.value.position
                            .map((position) {
                          return TyperAnimatedText(position);
                        }).toList(),
                        repeatForever: true,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var url in imageUrlList)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: url.endsWith('.svg')
                              ? SvgPicture.network(
                                  url,
                                  width: 30,
                                )
                              : Image.network(
                                  url,
                                  width: 30,
                                ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                 
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: Text(
                      homeViewModel.homeModel.value.careerObjective,
                      style: GoogleFonts.aBeeZee(),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    constraints:
                        const BoxConstraints(maxHeight: 200, maxWidth: 400),
                    child: BannerView(),
                  ),                  
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
