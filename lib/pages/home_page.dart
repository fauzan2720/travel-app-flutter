import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/assets.gen.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/core/build_context_ext.dart';
import 'package:travel_app/pages/flight_page.dart';
import 'package:travel_app/pages/train_page.dart';
import 'package:travel_app/widgets/search_input.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  final images = [
    Assets.banner1.path,
    Assets.banner2.path,
  ];
  int _currentIndex = 0;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              ColoredBox(
                color: AppColors.primary,
                child: SizedBox(
                  width: context.deviceWidth,
                  height: 210.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Selamat Datang',
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                    const Text(
                      'Putri Wulandari Sabrina',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    SearchInput(
                      controller: searchController,
                    ),
                    const SizedBox(height: 24.0),
                    StatefulBuilder(
                      builder: (context, setIndexCarousel) => Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 150.0,
                                autoPlay: true,
                                viewportFraction: 1.0,
                                onPageChanged: (index, reason) {
                                  setIndexCarousel(() {
                                    _currentIndex = index;
                                  });
                                },
                              ),
                              items: images.map((imagePath) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return InkWell(
                                      onTap: () {},
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Image.asset(
                                          imagePath,
                                          fit: BoxFit.cover,
                                          height: 150.0,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: images.asMap().entries.map((entry) {
                              return Container(
                                width: 70.0,
                                height: 4.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.0),
                                  color: _currentIndex == entry.key
                                      ? AppColors.white
                                      : AppColors.gray,
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    const Text(
                      'Transportasi',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    InkWell(
                      onTap: () => context.push(const FlightPage()),
                      child: Assets.flightBanner.image(),
                    ),
                    const SizedBox(height: 16.0),
                    InkWell(
                      onTap: () => context.push(const TrainPage()),
                      child: Assets.trainBanner.image(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
