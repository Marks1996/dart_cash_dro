class Device {
  String? type;
  String? state;
  String? totalin;
  String? totalout;
  List<dynamic>? pieces;

  Device({this.type, this.state, this.totalin, this.totalout, this.pieces});

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        type: json['type'] as String?,
        state: json['state'] as String?,
        totalin: json['totalin'] as String?,
        totalout: json['totalout'] as String?,
        pieces: json['pieces'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'state': state,
        'totalin': totalin,
        'totalout': totalout,
        'pieces': pieces,
      };
}
