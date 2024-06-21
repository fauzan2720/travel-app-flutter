import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/bloc/booking/booking_bloc.dart';
import 'package:travel_app/core/build_context_ext.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/widgets/history_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BookingBloc>().add(const GetBookings());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pemesanan'),
        shape: Border(
          bottom: BorderSide(color: AppColors.gray, width: 1),
        ),
      ),
      body: BlocConsumer<BookingBloc, BookingState>(
        listener: (context, state) {
          if (state is BookingFailed) {
            context.showDialogError(state.meesage);
          }
        },
        builder: (context, state) {
          if (state is BookingLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BookingSuccess) {
            return RefreshIndicator(
              onRefresh: () async =>
                  context.read<BookingBloc>().add(const GetBookings()),
              child: ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemCount: state.data.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16.0),
                itemBuilder: (context, index) => HistoryCard(
                  item: state.data[index],
                ),
              ),
            );
          }
          return Center(
            child: IconButton(
              onPressed: () =>
                  context.read<BookingBloc>().add(const GetBookings()),
              icon: const Icon(Icons.refresh),
            ),
          );
        },
      ),
    );
  }
}
