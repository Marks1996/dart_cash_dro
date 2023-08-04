import 'device.dart';
import 'operation.dart';

class AskOperation {
  Operation? operation;
  List<Device>? devices;
  List<dynamic>? messages;
  List<dynamic>? messagesFixed;
  String? withError;
  bool? withErrorMrx;

  AskOperation({
    this.operation,
    this.devices,
    this.messages,
    this.messagesFixed,
    this.withError,
    this.withErrorMrx,
  });

  factory AskOperation.fromJson(Map<String, dynamic> json) => AskOperation(
        operation: json['operation'] == null
            ? null
            : Operation.fromJson(json['operation'] as Map<String, dynamic>),
        devices: (json['devices'] as List<dynamic>?)
            ?.map((e) => Device.fromJson(e as Map<String, dynamic>))
            .toList(),
        messages: json['messages'] as List<dynamic>?,
        messagesFixed: json['messagesFixed'] as List<dynamic>?,
        withError: json['withError'] as String?,
        withErrorMrx: json['withErrorMRX'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'operation': operation?.toJson(),
        'devices': devices?.map((e) => e.toJson()).toList(),
        'messages': messages,
        'messagesFixed': messagesFixed,
        'withError': withError,
        'withErrorMRX': withErrorMrx,
      };
}
