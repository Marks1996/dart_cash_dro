class Operation {
  String? operationid;
  String? batchid;
  String? state;
  String? payInProgress;
  String? payOutProgress;
  String? total;
  String? totalin;
  String? totalout;
  String? type;
  String? datefinish;
  String? hourfinish;
  String? amountchangenotavailable;
  String? totalrounded;
  String? error;
  String? posuser;
  String? posid;
  int? progressPartial;
  int? progressTotal;
  String? aliasid;
  int? canceled;
  String? userId;
  String? userName;
  String? rfId;
  String? roundValue;
  String? finalStatus;

  Operation({
    this.operationid,
    this.batchid,
    this.state,
    this.payInProgress,
    this.payOutProgress,
    this.total,
    this.totalin,
    this.totalout,
    this.type,
    this.datefinish,
    this.hourfinish,
    this.amountchangenotavailable,
    this.totalrounded,
    this.error,
    this.posuser,
    this.posid,
    this.progressPartial,
    this.progressTotal,
    this.aliasid,
    this.canceled,
    this.userId,
    this.userName,
    this.rfId,
    this.roundValue,
    this.finalStatus,
  });

  factory Operation.fromJson(Map<String, dynamic> json) => Operation(
        operationid: json['operationid'] as String?,
        batchid: json['batchid'] as String?,
        state: json['state'] as String?,
        payInProgress: json['payInProgress'] as String?,
        payOutProgress: json['payOutProgress'] as String?,
        total: json['total'] as String?,
        totalin: json['totalin'] as String?,
        totalout: json['totalout'] as String?,
        type: json['type'] as String?,
        datefinish: json['datefinish'] as String?,
        hourfinish: json['hourfinish'] as String?,
        amountchangenotavailable: json['amountchangenotavailable'] as String?,
        totalrounded: json['totalrounded'] as String?,
        error: json['error'] as String?,
        posuser: json['posuser'] as String?,
        posid: json['posid'] as String?,
        progressPartial: json['progressPartial'] as int?,
        progressTotal: json['progressTotal'] as int?,
        aliasid: json['aliasid'] as String?,
        canceled: json['canceled'] as int?,
        userId: json['userId'] as String?,
        userName: json['userName'] as String?,
        rfId: json['rfId'] as String?,
        roundValue: json['roundValue'] as String?,
        finalStatus: json['finalStatus'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'operationid': operationid,
        'batchid': batchid,
        'state': state,
        'payInProgress': payInProgress,
        'payOutProgress': payOutProgress,
        'total': total,
        'totalin': totalin,
        'totalout': totalout,
        'type': type,
        'datefinish': datefinish,
        'hourfinish': hourfinish,
        'amountchangenotavailable': amountchangenotavailable,
        'totalrounded': totalrounded,
        'error': error,
        'posuser': posuser,
        'posid': posid,
        'progressPartial': progressPartial,
        'progressTotal': progressTotal,
        'aliasid': aliasid,
        'canceled': canceled,
        'userId': userId,
        'userName': userName,
        'rfId': rfId,
        'roundValue': roundValue,
        'finalStatus': finalStatus,
      };
}
