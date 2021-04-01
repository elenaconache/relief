import 'package:dio/dio.dart' hide Headers;

class ApiError implements Exception {
  int errorCode;
  String errorMessageTag = "";

  ApiError({this.errorCode, this.errorMessageTag});

  static String mapMessage(DioError error) {
    print(
        'parsing result $error.errorCode $error.message from ${error.response.data}');
    switch (error.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        return "error_api_connection";
        break;
      case DioErrorType.DEFAULT:
        return "error_api_internet";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        return "error_api_timeout";
        break;
      case DioErrorType.RESPONSE:
        return "error_api_status";
        break;
      case DioErrorType.SEND_TIMEOUT:
        return "error_api_send";
        break;
      case DioErrorType.CANCEL:
        return "error_api_cancelled";
        break;
    }
    return "";
  }

  @override
  String toString() {
    return 'ApiError[code: $errorCode, message: $errorMessageTag]';
  }
}
