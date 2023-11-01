import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/models/responses/product_responses_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDataSource {
  Future<Either<String, ProductResponseModel>> getAllProduct() async {
    final response = await http.get(Uri.parse('http://localhost:1337/api/local/product'));

    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return const Left("Server Error");
    }
  }
}
