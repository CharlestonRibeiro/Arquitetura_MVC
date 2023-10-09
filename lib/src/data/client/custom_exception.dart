class CustomException implements Exception {
  final Object error;

  CustomException({required this.error});

  String get message => 'Erro de conexão externa não especificado: $error';
}
