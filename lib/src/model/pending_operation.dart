class PendingOperation {
  String? operationId;

  PendingOperation({this.operationId});

  factory PendingOperation.fromJson(Map<String, dynamic> json) {
    return PendingOperation(
      operationId: json['OperationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'OperationId': operationId,
      };
}
