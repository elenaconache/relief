import 'package:dio/dio.dart';
import 'package:relief/data/model/translation.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(
    baseUrl:
        "https://eu-api.backendless.com/F6A54640-91E5-D0DC-FF13-CC1C187D9700/6B0F25D5-E189-400F-8542-C3F52A78AD6D/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("data/Translation")
  Future<List<Translation>> getTranslations();
}
