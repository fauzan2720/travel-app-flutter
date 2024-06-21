import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/bloc/booking/booking_bloc.dart';
import 'package:travel_app/bloc/page_bloc.dart';
import 'package:travel_app/bloc/transportation/transportation_bloc.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/pages/main_page.dart';
import 'package:travel_app/services/booking_service.dart';
import 'package:travel_app/services/transportation_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PageBloc>(create: (context) => PageBloc()),
        BlocProvider<TransportationBloc>(
            create: (context) => TransportationBloc(TransportationService())),
        BlocProvider<BookingBloc>(
            create: (context) => BookingBloc(BookingService())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travel App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
        ),
        home: const MainPage(),
      ),
    );
  }
}
