class ApiResponse<T> {
  final T data;
  final String? message;
  final int? statusCode;
  final int? code;

  ApiResponse({required this.data, this.message, this.statusCode, this.code});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) {
    return ApiResponse<T>(
      data: fromJsonT(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      statusCode: json['statusCode'] as int?,
      code: json['code'] as int?,
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T value) toJsonT) => {
    'data': toJsonT(data),
    'message': message,
    'statusCode': statusCode,
    'code': code,
  };
}
