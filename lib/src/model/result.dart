class Result<T> {
  int? code;
  T? data;

  Result({this.code, this.data});

  factory Result.fromJson(Map<String, dynamic> json,
          [T Function(Map<String, dynamic> data)? jsonAsT]) =>
      Result(
        code: json['code'] as int?,
        data: jsonAsT?.call(json['data']) ?? json['data'] as T?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'data': data,
      };
}
