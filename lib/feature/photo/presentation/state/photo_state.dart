import 'package:pagination/feature/photo/data/model/photos_model.dart';

class PhotoState {
  final List<PhotosModel> photos;
  final bool isLoading;
  final bool hasMaxReached;
  final int page;

  const PhotoState({
    required this.photos,
    required this.isLoading,
    required this.hasMaxReached,
    required this.page,
  });

  factory PhotoState.initial() {
    return const PhotoState(
      photos: [],
      isLoading: false,
      hasMaxReached: false,
      page: 0,
    );
  }

  PhotoState copyWith({
    List<PhotosModel>? photos,
    bool? isLoading,
    bool? hasMaxReached,
    int? page,
  }) {
    return PhotoState(
      photos: photos ?? this.photos,
      isLoading: isLoading ?? this.isLoading,
      hasMaxReached: hasMaxReached ?? this.hasMaxReached,
      page: page ?? this.page,
    );
  }
}
