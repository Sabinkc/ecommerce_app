import 'package:dio/dio.dart';
import 'package:ecommerce_app/common/api/data_response.dart';
import 'package:ecommerce_app/common/constants.dart';
import 'package:ecommerce_app/features/auth/resources/user_repository.dart';
import 'package:ecommerce_app/features/homepage/model/products.dart';

class ProductRepository{
  final UserRepository userRepository;

  ProductRepository({required this.userRepository});
  Future<DataResponse> getAllProduct()async {
    try{
      final dio = Dio();
      final headers = {
        "Authorization": "Bearer ${userRepository.token}",
      };
      final response = await dio.get("${Constants.baseUrl}/products",
      options: Options(
        headers: headers,
      ),
      );
      if(response.statusCode == null) {
        return DataResponse.errror("Unable to fetch products");
      }
      if(response.statusCode! >= 200 && response.statusCode! < 300) {
        final tempList = List.from(response.data["results"]);
        final products = tempList.map((e) => Product.fromJson(e)).toList();
        return DataResponse.success(products);
      }else{
        return DataResponse.errror(response.data["message"]);
      }

    }on DioError catch(e){
      return DataResponse.errror(
        e.response?.data["message"] ?? "Unable to Product");
    }catch(e){
      return DataResponse.errror(e.toString());
    }
  }
}