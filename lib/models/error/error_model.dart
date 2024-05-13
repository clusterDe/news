// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ErrorModel {
  String? status;
  String? code;
  String? message;

  ErrorModel({
    this.status,
    this.code,
    this.message,
  });

  ErrorModel copyWith({
    String? status,
    String? code,
    String? message,
  }) {
    return ErrorModel(
      status: status ?? this.status,
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'code': code,
      'message': message,
    };
  }

  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
      status: map['status'] != null ? map['status'] as String : null,
      code: map['code'] != null ? map['code'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorModel.fromJson(String source) =>
      ErrorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ErrorModel(status: $status, code: $code, message: $message)';

  @override
  bool operator ==(covariant ErrorModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.code == code &&
        other.message == message;
  }

  @override
  int get hashCode => status.hashCode ^ code.hashCode ^ message.hashCode;
}
