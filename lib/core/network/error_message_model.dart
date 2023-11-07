import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

class ErrorMessageModel extends Equatable {
  final RxString message;

  const ErrorMessageModel({required this.message});

  factory ErrorMessageModel.formJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      message: json["message"],
    );
  }

  @override
  List<Object?> get props => [message];
}
