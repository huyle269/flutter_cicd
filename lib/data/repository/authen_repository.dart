import 'package:crm_app/core/api_service/api_provider.dart';
import 'package:crm_app/core/api_service/single_response.dart';
import 'package:crm_app/data/endpoint/authen_endpoint.dart';
import 'package:crm_app/data/models/user/login_model.dart';

abstract class AuthenRepository {
  Future<SingleResponse<LoginModel>> login();
  Future<bool> logOut(String userName);
  Future<dynamic> signUp();
}

class AuthenRepositoryImpl extends AuthenRepository {
  AuthenRepositoryImpl(this.apiProviderRepository);

  ApiProviderRepositoryImpl apiProviderRepository;

  @override
  Future<bool> logOut(String userName) async {
    try {
      final rawResponse = await apiProviderRepository.getRequest(
        AuthenEnpoint.logOut,
        queryParameters: {
          "userName": userName,
        },
      );
      if (rawResponse.statusCode == 202) {
        return true;
      }
      return false;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<SingleResponse<LoginModel>> login() async {
    try {
      final rawResponse = await apiProviderRepository.postRequest(
        AuthenEnpoint.login,
        queryParameters: {
          "grant_type": "password",
          "username": "kidclient",
          "password": "kidsecret",
        },
      );
      return SingleResponse(rawResponse.data, (itemJson) => LoginModel.fromJson(itemJson));
    } catch (e) {
      throw e;
    }
  }

  @override
  Future signUp() {
    throw UnimplementedError();
  }
}
