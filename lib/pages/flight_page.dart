import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/bloc/transportation/transportation_bloc.dart';
import 'package:travel_app/core/assets.gen.dart';
import 'package:travel_app/core/build_context_ext.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/pages/create_order.dart';

class FlightPage extends StatelessWidget {
  const FlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TransportationBloc>().add(const GetTransportationFlights());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesan Tiket Pesawat'),
        shape: Border(
          bottom: BorderSide(color: AppColors.gray, width: 1),
        ),
      ),
      body: BlocConsumer<TransportationBloc, TransportationState>(
        listener: (context, state) {
          if (state is TransportationFailed) {
            context.showDialogError(state.meesage);
          }
        },
        builder: (context, state) {
          if (state is TransportationLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TransportationSuccess) {
            return RefreshIndicator(
              onRefresh: () async => context
                  .read<TransportationBloc>()
                  .add(const GetTransportationFlights()),
              child: ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemCount: state.data.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16.0),
                itemBuilder: (context, index) {
                  final item = state.data[index];
                  return ListTile(
                    leading: Assets.flight.image(),
                    title: Text(
                      item.nama!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.kelas!),
                        Text('${item.pemberangkatan} > ${item.tujuan}'),
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
                  );
                },
              ),
            );
          }
          return Center(
            child: IconButton(
              onPressed: () => context
                  .read<TransportationBloc>()
                  .add(const GetTransportationFlights()),
              icon: const Icon(Icons.refresh),
            ),
          );
        },
      ),
    );
  }
}
