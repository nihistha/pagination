import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photos_model.g.dart';

@JsonSerializable()
class PhotosModel extends Equatable {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const PhotosModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotosModel.fromJson(Map<String, dynamic> json) => _$PhotosModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhotosModelToJson(this);

  @override
  List<Object?> get props => [
    albumId,
    id,
    title,
    url,
    thumbnailUrl,
  ];
}
