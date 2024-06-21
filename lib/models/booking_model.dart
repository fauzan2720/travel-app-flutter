// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

import 'package:travel_app/core/num_ext.dart';

BookingModel bookingModelFromJson(String str) =>
    BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
  final int? code;
  final String? status;
  final String? message;
  final Booking? data;

  BookingModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Booking.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Booking {
  final List<History>? history;

  Booking({
    this.history,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        history: json["history"] == null
            ? []
            : List<History>.from(
                json["history"]!.map((x) => History.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "history": history == null
            ? []
            : List<dynamic>.from(history!.map((x) => x.toJson())),
      };
}

class History {
  final String? tanggal;
  final Penumpang? penumpang;
  final Transportasi? transportasi;

  History({
    this.tanggal,
    this.penumpang,
    this.transportasi,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        tanggal: json["tanggal"],
        penumpang: json["penumpang"] == null
            ? null
            : Penumpang.fromJson(json["penumpang"]),
        transportasi: json["transportasi"] == null
            ? null
            : Transportasi.fromJson(json["transportasi"]),
      );

  Map<String, dynamic> toJson() => {
        "tanggal": tanggal,
        "penumpang": penumpang?.toJson(),
        "transportasi": transportasi?.toJson(),
      };
}

class Penumpang {
  final String? nama;
  final String? nik;
  final String? email;
  final String? telp;

  Penumpang({
    this.nama,
    this.nik,
    this.email,
    this.telp,
  });

  factory Penumpang.fromJson(Map<String, dynamic> json) => Penumpang(
        nama: json["nama"],
        nik: json["nik"],
        email: json["email"],
        telp: json["telp"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "nik": nik,
        "email": email,
        "telp": telp,
      };
}

class Transportasi {
  final String? nama;
  final String? pemberangkatan;
  final String? tujuan;
  final int? harga;
  final String? kelas;
  final String? tipe;

  Transportasi({
    this.nama,
    this.pemberangkatan,
    this.tujuan,
    this.harga,
    this.kelas,
    this.tipe,
  });

  String get priceFormatted => harga!.currencyFormatRp;

  factory Transportasi.fromJson(Map<String, dynamic> json) => Transportasi(
        nama: json["nama"],
        pemberangkatan: json["pemberangkatan"],
        tujuan: json["tujuan"],
        harga: json["harga"],
        kelas: json["kelas"],
        tipe: json["tipe"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "pemberangkatan": pemberangkatan,
        "tujuan": tujuan,
        "harga": harga,
        "kelas": kelas,
        "tipe": tipe,
      };
}
