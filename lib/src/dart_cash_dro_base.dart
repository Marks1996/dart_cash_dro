import 'dart:convert';

import 'package:dart_cash_dro/src/http.dart';
import 'package:dart_cash_dro/src/model/export.dart';

/// A CashDro3WS library.
/// 单例模式
class CashDro {
  factory CashDro(
          {required String serverport,
          required String user,
          required String password}) =>
      CashDro._internal(serverport, user, password);
  CashDro._internal(this.serverport, this.user, this.password);

  final String serverport;
  final String user;
  final String password;
  final _http = Http();
  String get url => "https://$serverport/Cashdro3WS/index.php";

  /// 支付交易调用
  /// [amount] 金额
  /// [posid] pos机编号
  /// [posuser] pos机用户
  Future<Result<String>> startOperation(
    int amount, {
    String? posid,
    String? posuser,
  }) async {
    final params = {
      'operation': 'startOperation',
      'user': user,
      'password': password,
      'posid': posid,
      'amount': amount,
      'type': 3,
      'parameters': '{"amount":"$amount"}',
      'startnow': 'true',
      'posuser': posuser,
    };
    params.removeWhere((key, value) => value == null);
    return await _http.get<String>(url, queryParameters: params);
  }

  /// 调用运行支付交易
  /// [operationId] 操作id
  Future<Result<String>> acknowledgeOperationId(String operationId) async {
    final params = {
      'operation': 'acknowledgeOperationId',
      'user': user,
      'password': password,
      'operationId': operationId,
    };
    return await _http.get<String>(url, queryParameters: params);
  }

  /// 支付交易的当前状态
  /// [operationId] 操作id
  Future<Result<AskOperation>> askOperation(String operationId) async {
    final params = {
      'operation': 'askOperation',
      'user': user,
      'password': password,
      'operationId': operationId,
    };
    return await _http.get<AskOperation>(url,
        queryParameters: params, jsonAsT: _convertAskOperation);
  }

  /// json转换支付交易的当前状态
  /// [json] json字符串
  AskOperation _convertAskOperation(String json) {
    return AskOperation.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }

  /// 检查待导入的操作
  /// [posid] pos机编号
  Future<Result<List<PendingOperation>>> askPendingOperations(
      {String? posid}) async {
    final params = {
      'operation': 'askPendingOperations',
      'user': user,
      'password': password,
      'importManualOperations': 'true',
      'terminal': posid,
    };
    return await _http.get<List<PendingOperation>>(url,
        queryParameters: params, jsonAsT: convertAskPendingOperations);
  }

  /// json转换待导入的操作
  /// [json] json字符串
  List<PendingOperation> convertAskPendingOperations(String json) {
    List? dataList = jsonEncode(json) as List?;
    return dataList
            ?.map((e) => PendingOperation.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
  }

  /// 导入操作
  /// [operationId] 操作id
  Future<Result<String>> setoperationImported(String operationId) async {
    final params = {
      'operation': 'setoperationImported',
      'user': user,
      'password': password,
      'operationId': operationId,
    };
    return await _http.get<String>(url, queryParameters: params);
  }

  /// 取消支付交易
  /// [operationId] 操作id
  Future<Result<String>> cancel(String operationId) async {
    final params = {
      'operation': 'finishOperation',
      'user': user,
      'password': password,
      'type': '2',
      'operationId': operationId,
    };
    return await _http.get<String>(url, queryParameters: params);
  }

  /// 结束支付交易
  /// [operationId] 操作id
  Future<Result<String>> finish(String operationId) async {
    final params = {
      'operation': 'finishOperation',
      'user': user,
      'password': password,
      'type': '1',
      'operationId': operationId,
    };
    return await _http.get<String>(url, queryParameters: params);
  }
}
