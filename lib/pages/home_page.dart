import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/bloc/all_transportation/all_transportation_bloc.dart';
import 'package:travel_app/core/assets.gen.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/core/build_context_ext.dart';
import 'package:travel_app/models/transportation_model.dart';
import 'package:travel_app/pages/create_order.dart';
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
  List<Transportasi> searchResults = [];

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
                    BlocBuilder<AllTransportationBloc, AllTransportationState>(
                      builder: (context, state) {
                        if (state is AllTransportationLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is AllTransportationSuccess) {
                          return SearchInput(
                            controller: searchController,
                            onChanged: (value) {
                              setState(() {
                                final transportations = state.data;
                                final lowerCaseValue = value.toLowerCase();
                                searchResults =
                                    transportations.where((transportation) {
                                  final tujuan =
                                      transportation.tujuan!.toLowerCase();
                                  return tujuan.contains(lowerCaseValue);
                                }).toList();
                              });
                            },
                          );
                        }
                        return Center(
                          child: IconButton(
                            onPressed: () => context
                                .read<AllTransportationBloc>()
                                .add(const GetAllTransportations()),
                            icon: const Icon(Icons.refresh),
                          ),
                        );
                      },
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
                    if (searchController.text.isEmpty) ...[
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
                      const SizedBox(height: 24.0),
                      const Text(
                        'Team',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Assets.team1.image(),
                      const SizedBox(height: 16.0),
                      Assets.team2.image(),
                      const SizedBox(height: 16.0),
                      Assets.team3.image(),
                    ] else ...[
                      const Text(
                        'Hasil Pencarian',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      if (searchResults.isEmpty)
                        const Text('-')
                      else
                        ...searchResults
                            .map(
                              (item) => ListTile(
                                leading: item.tipe == 'Kereta'
                                    ? Assets.train.image()
                                    : Assets.flight.image(),
                                title: Text(
                                  item.nama!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.kelas!),
                                    Text(
                                        '${item.pemberangkatan} > ${item.tujuan}'),
                                  ],
                                ),
                                trailing: Text(
                                  item.priceFormatted,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.secondary,
                                    fontSize: 12.0,
                                  ),
                                ),
                                onTap: () => context.push(CreateOrder(
                                  item: item,
                                )),
                              ),
                            )
                            .toList(),
                    ],
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
