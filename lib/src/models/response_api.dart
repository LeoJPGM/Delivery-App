import 'dart:convert';

ResponseApi responseApiFromJson(String str) {
  final jsonData = json.decode(str);
  return ResponseApi.fromJson(jsonData);
}

String responseApiToJson(ResponseApi data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class ResponseApi {
  String? message; // Usar "?" para permitir valores nulos
  String? error;
  bool success;
  dynamic data;

  ResponseApi({
    this.message,
    this.error,
    required this.success, // "required" para asegurar que se pase
    this.data, // Agregar data al constructor
  });

  factory ResponseApi.fromJson(Map<String, dynamic> json) {
    return ResponseApi(
      message: json["message"],
      error: json["error"],
      success:
          json["success"] ?? false, // Valor predeterminado si no está presente
      data: json['data'], // Asignar directamente
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "success": success,
        "data": data, // Incluir data en la serialización
      };
}
