import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pie_chart/pie_chart.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                child: Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: FaIcon(
                          FontAwesomeIcons.star,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'PortFolio',
                        style: GoogleFonts.actor(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 21,
                          ),
                        ),
                      ),
                      Text(
                        "My Profile",
                        style: GoogleFonts.actor(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home_outlined,
                  size: 25,
                ),
                title: Text(
                  'Home',
                  style: GoogleFonts.actor(
                    textStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                onTap: () {
                  Get.toNamed("/");
                },
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: Text(
                  'About',
                  style: GoogleFonts.actor(
                    textStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                onTap: () {
                  Get.toNamed("/about");
                },
              ),
              ExpansionTile(
                // initiallyExpanded: true,
                leading: const FaIcon(Icons.memory),
                title: Text(
                  'Skills',
                  style: GoogleFonts.actor(
                    textStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                children: [
                  ListTile(
                    leading: const FaIcon(
                      FontAwesomeIcons.brain,
                      size: 22,
                    ),
                    title: Text(
                      'Soft Skills',
                      style: GoogleFonts.actor(
                        textStyle: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    onTap: () {
                      // Handle user skills tap
                      Get.toNamed("/soft_skill");
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.power),
                    title: Text(
                      'Tech Skills',
                      style: GoogleFonts.actor(
                        textStyle: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.toNamed("/tech_skill");
                    },
                  ),
                ],
              ),
              ListTile(
                leading: const FaIcon(
                  FontAwesomeIcons.diagramProject,
                  size: 22,
                ),
                title: Text(
                  'Projects',
                  style: GoogleFonts.actor(
                    textStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const FaIcon(
                  FontAwesomeIcons.award,
                  size: 22,
                ),
                title: Text(
                  'Certification',
                  style: GoogleFonts.actor(
                    textStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const FaIcon(FontAwesomeIcons.file),
                title: Text(
                  'Resume',
                  style: GoogleFonts.actor(
                    textStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
       
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Row(
            children: [
              Expanded(
                child: PieChart(
                  dataMap: const {
                    'Flutter': 5,
                    'Dart': 3,
                    'Others': 2,
                  },
                  chartType: ChartType.disc,
                  chartRadius: MediaQuery.of(context).size.width / 4,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
