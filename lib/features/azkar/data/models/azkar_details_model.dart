import 'package:islami/features/azkar/domain/entities/azkar_details_entity.dart';

class AzkarDetailsModel extends AzkarDetailsEntity {
  int? id;
  String? text;
  int? count;

  AzkarDetailsModel({this.id, this.text, this.count})
    : super(zekrId: id!, body: text!, countOfZekr: count!);

  factory AzkarDetailsModel.fromJson(Map<String, dynamic> json) {
    return AzkarDetailsModel(
      id: json['id'] as int?,
      text: json['text'] as String?,
      count: json['count'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'text': text, 'count': count};
}
