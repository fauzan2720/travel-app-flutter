// To parse this JSON data, do
//
//     final transportationModel = transportationModelFromJson(jsonString);

import 'dart:convert';

import 'package:travel_app/core/num_ext.dart';

TransportationModel transportationModelFromJson(String str) =>
    TransportationModel.fromJson(json.decode(str));

String transportationModelToJson(TransportationModel data) =>
    json.encode(data.toJson());

class TransportationModel {
  final int? code;
  final String? status;
  final String? message;
  final Transportation? data;

  TransportationModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  factory TransportationModel.fromJson(Map<String, dynamic> json) =>
      TransportationModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data:
            json["data"] == null ? null : Transportation.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Transportation {
  final List<Transportasi>? transportasi;

  Transportation({
    this.transportasi,
  });

  factory Transportation.fromJson(Map<String, dynamic> json) => Transportation(
        transportasi: json["transportasi"] == null
            ? []
            : List<Transportasi>.from(
                json["transportasi"]!.map((x) => Transportasi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "transportasi": transportasi == null
            ? []
            : List<dynamic>.from(transportasi!.map((x) => x.toJson())),
      };
}

class Transportasi {
  final int? id;
  final String? nama;
  final String? pemberangkatan;
  final String? tujuan;
  final int? harga;
  final String? kelas;
  final String? tipe;

  Transportasi({
    this.id,
    this.nama,
    this.pemberangkatan,
    this.tujuan,
    this.harga,
    this.kelas,
    this.tipe,
  });

  String get priceFormatted => harga!.currencyFormatRp;

  factory Transportasi.fromJson(Map<String, dynamic> json) => Transportasi(
        id: json["id"],
        nama: json["nama"],
        pemberangkatan: json["pemberangkatan"],
        tujuan: json["tujuan"],
        harga: json["harga"],
        kelas: json["kelas"],
        tipe: json["tipe"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "pemberangkatan": pemberangkatan,
        "tujuan": tujuan,
        "harga": harga,
        "kelas": kelas,
        "tipe": tipe,
      };
}
