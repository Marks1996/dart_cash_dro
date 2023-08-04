## 已经支持的接口

1. startOperation 开始交易
2. acknowledgeOperationId 调用交易(先调用startOperation再调用本方法)
3. askOperation 获取当前交易信息
4. askPendingOperations 获取未完成的交易集合
5. cancel 取消交易
6. finish 强制结束交易
7. setoperationImported 交易完成后需要导入(交易操作完成之后需要调用)

