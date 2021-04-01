import 'package:relief/data/model/api_error.dart';

class BaseApiResponse<T> {
  ApiError error;
  T data;
}
