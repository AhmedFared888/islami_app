import 'package:islami/features/azkar/domain/entities/azkar_details_entity.dart';

class AzkarDetailsModel extends AzkarDetailsEntity {
  String? category;
  String? count;
  String? description;
  String? reference;
  String? content;

  AzkarDetailsModel({
    this.category,
    this.count,
    this.description,
    this.reference,
    this.content,
  }) : super(
         categoryItem: category ?? '',
         body: content ?? '',
         numberOfRepetitions: int.tryParse(count ?? '0') ?? 0,
         descriptionOfzekr: description ?? '',
       );

  factory AzkarDetailsModel.fromJson(Map<String, dynamic> json) {
    return AzkarDetailsModel(
      category: json['category'] as String?,
      count: json['count'] as String?,
      description: json['description'] as String?,
      reference: json['reference'] as String?,
      content: json['content'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'category': category,
    'count': count,
    'description': description,
    'reference': reference,
    'content': content,
  };
}
