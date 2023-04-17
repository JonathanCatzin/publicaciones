// To parse this JSON data, do
//
//     final postRequestDto = postRequestDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PostRequestDto postRequestDtoFromJson(String str) => PostRequestDto.fromJson(json.decode(str));

String postRequestDtoToJson(PostRequestDto data) => json.encode(data.toJson());

class PostRequestDto {
  PostRequestDto({
    required this.idPublicacion,
    required this.imagePublicacion,
    required this.tituloPublicacion,
    required this.cuerpoPublicacion,
    required this.fechaRegistroPublicacion,
    required this.statusPublicacion,
    required this.vistas,
    required this.psicologoId,
    this.isExpanded = false,
  });

  final String idPublicacion;
  final String imagePublicacion;
  final String tituloPublicacion;
  final String cuerpoPublicacion;
  final DateTime fechaRegistroPublicacion;
  final String statusPublicacion;
  final int vistas;
  final dynamic psicologoId;
  bool isExpanded;

  factory PostRequestDto.fromJson(Map<String, dynamic> json) => PostRequestDto(
        idPublicacion: json["idPublicacion"],
        imagePublicacion: json["imagePublicacion"],
        tituloPublicacion: json["tituloPublicacion"],
        cuerpoPublicacion: json["cuerpoPublicacion"],
        fechaRegistroPublicacion: DateTime.parse(json["fechaRegistroPublicacion"]),
        statusPublicacion: json["statusPublicacion"],
        vistas: json["vistas"],
        psicologoId: json["psicologoId"],
        isExpanded: false,
      );

  Map<String, dynamic> toJson() => {
        "idPublicacion": idPublicacion,
        "imagePublicacion": imagePublicacion,
        "tituloPublicacion": tituloPublicacion,
        "cuerpoPublicacion": cuerpoPublicacion,
        "fechaRegistroPublicacion":
            "${fechaRegistroPublicacion.year.toString().padLeft(4, '0')}-${fechaRegistroPublicacion.month.toString().padLeft(2, '0')}-${fechaRegistroPublicacion.day.toString().padLeft(2, '0')}",
        "statusPublicacion": statusPublicacion,
        "vistas": vistas,
        "psicologoId": psicologoId,
        "isExpanded": false
      };
}


