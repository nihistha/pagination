import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination/feature/photo/data/model/photos_model.dart';

import '../../../../app/constant/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/networking/remote/http_service.dart';

final photoDataSourceProvider = Provider.autoDispose(
        (ref) => PhotoDataSource(ref.read(httpServiceProvider)));

class PhotoDataSource {
  final Dio _dio;
  PhotoDataSource(this._dio);
  Future<Either<Failure, List<PhotosModel>>> getPhotos(int page) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.photos,
        queryParameters: {
          '_page': page,
          '_limit': ApiEndpoints.limitPage,
        },
      );
      final data = response.data as List;
      final photos = data.map((e) => PhotosModel.fromJson(e)).toList();
      return Right(photos);
    } on DioException catch (e) {
      return Left(Failure(message: e.message.toString()));
    }
  }
}
