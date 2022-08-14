import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:news_app/services/http_service.dart';

const BASE_URL = "https://newsapi.org/";
const API_KEY = "add9838fcd7a44549d691066fad4c9d1";

class httpsServiceImpl implements HttpService {
  late Dio _dio;
  @override
  Future<Response> getRequest(String url) async {
    Response response;
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      // TODO
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  initializeInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          print(error.message);
        },
        onRequest: ((request, handler) {
          print(
            "${request.method} | ${request.path}",
          );
        }),
        onResponse: (response, handler) {
          print(
              "${response.statusCode} ${response.statusMessage} ${response.data}");
        },
      ),
    );
  }

  @override
  void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        headers: {"Authorization" : "Bearer $API_KEY"},
      ),
    );
    initializeInterceptor();
  }
}
