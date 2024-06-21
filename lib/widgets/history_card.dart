import 'package:flutter/widgets.dart';
import 'package:travel_app/core/assets.gen.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/models/booking_model.dart';
import 'package:travel_app/widgets/dotted_divider.dart';

class HistoryCard extends StatelessWidget {
  final History item;
  const HistoryCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.transportasi!.kelas!,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                item.tanggal!,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              if (item.transportasi?.tipe == 'Kereta')
                Assets.train.image(width: 48.0)
              else
                Assets.flight.image(width: 48.0),
              const SizedBox(width: 32.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.transportasi!.nama!,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(item.transportasi!.priceFormatted),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          const DottedDivider(),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Text(
                item.transportasi!.pemberangkatan!,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Assets.icDoubleArrow.image(width: 16.0),
              const Spacer(),
              Text(
                item.transportasi!.tujuan!,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
