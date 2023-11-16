import 'package:dartz/dartz.dart';
import 'package:e_commerce/common/constants/variables.dart';
import 'package:http/http.dart' as http;

import '../models/responses/product_responses_model.dart';

class ProductRemoteDataSource {
  Future<Either<String, ProductsResponseModel>> getAllProduct() async {
    final response = await http.get(Uri.parse('${Variables.baseUrl}/api/products?populate=*'));

    if (response.statusCode == 200) {
      return Right(ProductsResponseModel.fromJson(response.body));
    } else {
      return const Left("Server Error");
    }
  }
}
