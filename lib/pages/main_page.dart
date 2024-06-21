import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/bloc/page_bloc.dart';
import 'package:travel_app/core/assets.gen.dart';
import 'package:travel_app/core/build_context_ext.dart';
import 'package:travel_app/core/colors.dart';

import 'home_page.dart';
import 'history_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _widgets = [
    const HomePage(),
    const HistoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, int>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state,
            children: _widgets,
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(
                vertical: 10.0, horizontal: context.deviceWidth / 4),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.gray),
              color: AppColors.white,
            ),
            child: Theme(
              data: ThemeData(
                splashColor: Colors.white,
                highlightColor: Colors.white,
              ),
              child: BottomNavigationBar(
                backgroundColor: AppColors.white,
                useLegacyColorScheme: false,
                currentIndex: state,
                onTap: (value) => context.read<PageBloc>().add(value),
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: const TextStyle(color: AppColors.primary),
                selectedIconTheme:
                    const IconThemeData(color: AppColors.primary),
                elevation: 0,
                items: [
                  BottomNavigationBarItem(
                    icon: Assets.icHome.image(
                      height: 24.0,
                      color: state == 0 ? AppColors.primary : null,
                    ),
                    label: 'Beranda',
                  ),
                  BottomNavigationBarItem(
                    icon: Assets.icOrder.image(
                      height: 24.0,
                      color: state == 1 ? AppColors.primary : null,
                    ),
                    label: 'Pesanan',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
