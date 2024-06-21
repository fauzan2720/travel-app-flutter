import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/bloc/booking/booking_bloc.dart';
import 'package:travel_app/bloc/page_bloc.dart';
import 'package:travel_app/core/assets.gen.dart';
import 'package:travel_app/core/build_context_ext.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/models/booking_request.dart';
import 'package:travel_app/models/transportation_model.dart';
import 'package:travel_app/widgets/custom_text_field.dart';
import 'package:travel_app/widgets/dotted_divider.dart';

class CreateOrder extends StatefulWidget {
  final Transportasi item;
  const CreateOrder({super.key, required this.item});

  @override
  State<CreateOrder> createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  final nikController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void dispose() {
    nikController.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Buat Pesanan'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.gray),
              borderRadius: BorderRadius.circular(12.0),
              color: AppColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Assets.icTask.image(width: 24.0),
                    const SizedBox(width: 16.0),
                    const Text(
                      'Detail Pesanan Anda',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                const DottedDivider(),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    const Text(
                      'Nama Kereta',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      widget.item.nama!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    const Text(
                      'Kelas',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      widget.item.kelas!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    const Text(
                      'Pemberangkatan',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      widget.item.pemberangkatan!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    const Text(
                      'Tujuan',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      widget.item.tujuan!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    const Text(
                      'Harga',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      widget.item.priceFormatted,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    const Text(
                      'Tanggal Keberangakatan',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      DateFormat('dd MMMM yyyy').format(DateTime.now()),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.gray),
              borderRadius: BorderRadius.circular(12.0),
              color: AppColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Assets.icTask.image(width: 24.0),
                    const SizedBox(width: 16.0),
                    const Text(
                      'Informasi Penumpang',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                const DottedDivider(),
                const SizedBox(height: 16.0),
                CustomTextField(
                  controller: nikController,
                  label: 'No KTP',
                  hintText: 'Nomor Induk KTP (NIK)',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16.0),
                CustomTextField(
                  controller: nameController,
                  label: 'Nama Penumpang',
                  hintText: 'Siapa nama lengkap anda (sesuai KTP)',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16.0),
                CustomTextField(
                  controller: emailController,
                  label: 'Alamat Email',
                  hintText: 'Masukkan alamat email anda',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16.0),
                CustomTextField(
                  controller: phoneNumberController,
                  label: 'Nomor Telepone',
                  hintText: 'Masukkan nomor telepone anda',
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(top: BorderSide(color: AppColors.gray)),
        ),
        child: BlocConsumer<BookingBloc, BookingState>(
          listener: (context, state) {
            if (state is BookingFailed) {
              context.showDialogError(state.meesage);
            } else if (state is BookingSuccess) {
              context.popToRoot();
              context.showDialogSuccess('Pemesanan berhasil.');
              context.read<PageBloc>().add(1);
            }
          },
          builder: (context, state) {
            if (state is BookingLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ElevatedButton(
              onPressed: () {
                late int idTransportasi;
                if (widget.item.tipe == 'Kereta') {
                  idTransportasi = 1001;
                } else {
                  idTransportasi = 1501;
                }
                final request = BookingRequest(
                  nama: nameController.text,
                  nik: nikController.text,
                  email: emailController.text,
                  telp: phoneNumberController.text,
                  tanggal: DateTime.now(),
                  idTransportasi: idTransportasi,
                );
                if (nameController.text.isEmpty ||
                    nikController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    phoneNumberController.text.isEmpty) {
                  context.showDialogError('Inputan ada yang kosong.');
                } else {
                  context.read<BookingBloc>().add(CreateBooking(request));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Pesan Sekarang',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
