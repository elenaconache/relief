import 'package:dio/dio.dart';
import 'package:relief/data/model/login_body.dart';
import 'package:relief/data/model/register_body.dart';
import 'package:relief/data/model/registration_response.dart';
import 'package:relief/data/model/relief_user.dart';
import 'package:relief/data/model/social_login_body.dart';
import 'package:relief/data/model/translation.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(
    baseUrl:
        "https://eu-api.backendless.com/F6A54640-91E5-D0DC-FF13-CC1C187D9700/6B0F25D5-E189-400F-8542-C3F52A78AD6D/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("data/Translation")
  Future<List<Translation>> getTranslations(
      @Query("pageSize") int pageSize, @Query("offset") int offset);

  @POST("users/login")
  Future<ReliefUser> login(@Body() LoginBody user);

  @POST("users/social/facebook/sdk/login")
  Future<ReliefUser> loginWithFacebook(@Body() SocialLoginBody user);

  @POST("users/social/googleplus/sdk/login")
  Future<ReliefUser> loginWithGoogle(@Body() SocialLoginBody user);

  @POST("data/Users")
  Future<RegistrationResponse> register(@Body() RegisterBody user);

  @GET("users/restorepassword/{email}")
  Future<void> resetPassword(@Path("email") String email);
}
