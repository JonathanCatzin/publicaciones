// To parse this JSON data, do
//
//     final stateEmotionalRequestDto = stateEmotionalRequestDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class StateEmotionalRequestDto {
    StateEmotionalRequestDto({
        required this.idEstadoEmocional,
        required this.nombre,
        required this.statusEstadoEmocional,
    });

    final String idEstadoEmocional;
    final String nombre;
    final String statusEstadoEmocional;

    factory StateEmotionalRequestDto.fromRawJson(String str) => StateEmotionalRequestDto.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory StateEmotionalRequestDto.fromJson(Map<String, dynamic> json) => StateEmotionalRequestDto(
        idEstadoEmocional: json["idEstadoEmocional"],
        nombre: json["nombre"],
        statusEstadoEmocional: json["statusEstadoEmocional"],
    );

    Map<String, dynamic> toJson() => {
        "idEstadoEmocional": idEstadoEmocional,
        "nombre": nombre,
        "statusEstadoEmocional": statusEstadoEmocional,
    };
}
