import 'package:dio/dio.dart';
import 'package:openrent_client/data/remote/product.dart';
import 'package:openrent_client/data/resource.dart';

class ProductLocationSearchParameter {
  final double lat;
  final double lng;
  final int radiusKm;

  ProductLocationSearchParameter({
    required this.lat,
    required this.lng,
    required this.radiusKm,
  });
}

abstract interface class ProductRepository {
  Future<Result<List<ProductResponseItemShort>>> searchProduct({
    required String keyword,
    bool? disableAiSearch,
    List<String>? regions,
    ProductLocationSearchParameter? location,
    CancelToken? cancelToken,
  });

  Future<Result<ProductResponseItem>> getById({required int id});

  Future<Result<List<ProductResponseItemShort>>> getMyProduct();
}

class ProductDataSource implements ProductRepository {
  final ProductService service;

  ProductDataSource({required this.service});

  @override
  Future<Result<List<ProductResponseItemShort>>> searchProduct({
    required String keyword,
    bool? disableAiSearch,
    List<String>? regions,
    ProductLocationSearchParameter? location,
    CancelToken? cancelToken,
  }) async {
    try {
      final result = await service.listProduct(
        query: keyword,
        disableAiSearch: disableAiSearch,
        regions: regions,
        lat: location?.lat,
        lng: location?.lng,
        radiusKm: location?.radiusKm,
        cancelToken: cancelToken,
      );
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<ProductResponseItem>> getById({required int id}) async {
    try {
      final result = await service.getProduct(id);
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<List<ProductResponseItemShort>>> getMyProduct() async {
    try {
      final result = await service.listProduct(owner: true);
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }
}
