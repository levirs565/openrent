import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:openrent_client/data/remote/auth.dart';
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

  Future<Result<ProductResponseItemDetail>> getById({required int id});

  Future<Result<List<MyProductResponseItemShort>>> getMyProduct();

  Future<Result<MyProductResponseItemDetail>> getMyProductById({
    required int id,
  });

  Future<Result<MyProductResponseItem>> add(ProductAddRequest request);

  Future<Result<MyProductResponseItem>> update(
    int id,
    ProductAddRequest request,
  );

  Future<Result<void>> uploadImage({required int id, required XFile file});
}

class ProductDataSource implements ProductRepository {
  final ProductService service;
  final Dio _dioUploader;

  ProductDataSource({required this.service, required Dio dioUploader})
    : _dioUploader = dioUploader;

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
  Future<Result<ProductResponseItemDetail>> getById({required int id}) async {
    try {
      final result = await service.getProduct(id);
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<List<MyProductResponseItemShort>>> getMyProduct() async {
    try {
      final result = await service.getMyProductList();
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<MyProductResponseItemDetail>> getMyProductById({
    required int id,
  }) async {
    try {
      final result = await service.getMyProductDetail(id);
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<MyProductResponseItem>> add(ProductAddRequest request) async {
    try {
      final result = await service.addProduct(request);
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<MyProductResponseItem>> update(
    int id,
    ProductAddRequest request,
  ) async {
    try {
      final result = await service.updateProduct(id, request);
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }

  @override
  Future<Result<void>> uploadImage({
    required int id,
    required XFile file,
  }) async {
    try {
      final presigned = await service.createProductImagePresigned(
        id,
        ProductImagePresignedRequest(
          size: await file.length(),
          contentType: file.mimeType ?? "image/jpeg",
        ),
      );
      final headers = Map.fromEntries(
        presigned.headers.entries.map((entry) {
          if (entry.value.length == 1) {
            return MapEntry(entry.key, entry.value.first);
          }
          return MapEntry(entry.key, entry.value);
        }),
      );
      await _dioUploader.put(
        presigned.url,
        data: await file.readAsBytes(),
        options: Options(headers: headers),
      );
      await service.confirmProductImage(
        id,
        ProductImageConfirmRequest(name: presigned.name),
      );
      return ResultSuccess(null);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }
}
