// To parse this JSON data, do
//
//     final bookingRequest = bookingRequestFromJson(jsonString);

import 'dart:convert';

BookingRequest bookingRequestFromJson(String str) =>
    BookingRequest.fromJson(json.decode(str));

String bookingRequestToJson(BookingRequest data) => json.encode(data.toJson());

class BookingRequest {
  final String nama;
  final String nik;
  final String email;
  final String telp;
  final DateTime tanggal;
  final int idTransportasi;

  BookingRequest({
    required this.nama,
    required this.nik,
    required this.email,
    required this.telp,
    required this.tanggal,
    required this.idTransportasi,
  });

  factory BookingRequest.fromJson(Map<String, dynamic> json) => BookingRequest(
        nama: json["nama"],
        nik: json["nik"],
        email: json["email"],
        telp: json["telp"],
        tanggal: DateTime.parse(json["tanggal"]),
        idTransportasi: json["idTransportasi"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "nik": nik,
        "email": email,
        "telp": telp,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "idTransportasi": idTransportasi,
      };
}
