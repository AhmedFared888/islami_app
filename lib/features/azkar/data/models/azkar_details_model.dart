class AzkarDetailsModel {
  AzkarDetailsModel({
    required this.fluffy,
    required this.tentacled,
    required this.indigo,
    required this.indecent,
    required this.sticky,
    required this.purple,
    required this.azkarDetailsModel,
    required this.empty,
  });

  final List<dynamic> fluffy;
  final List<Empty> tentacled;
  final List<Empty> indigo;
  final List<Empty> indecent;
  final List<Empty> sticky;
  final List<Empty> purple;
  final List<Empty> azkarDetailsModel;
  final List<Empty> empty;

  factory AzkarDetailsModel.fromJson(Map<String, dynamic> json) {
    return AzkarDetailsModel(
      fluffy: json["أذكار الصباح"] == null
          ? []
          : List<dynamic>.from(json["أذكار الصباح"]!.map((x) => x)),
      tentacled: json["أذكار المساء"] == null
          ? []
          : List<Empty>.from(
              json["أذكار المساء"]!.map((x) => Empty.fromJson(x)),
            ),
      indigo: json["أذكار بعد السلام من الصلاة المفروضة"] == null
          ? []
          : List<Empty>.from(
              json["أذكار بعد السلام من الصلاة المفروضة"]!.map(
                (x) => Empty.fromJson(x),
              ),
            ),
      indecent: json["تسابيح"] == null
          ? []
          : List<Empty>.from(json["تسابيح"]!.map((x) => Empty.fromJson(x))),
      sticky: json["أذكار النوم"] == null
          ? []
          : List<Empty>.from(
              json["أذكار النوم"]!.map((x) => Empty.fromJson(x)),
            ),
      purple: json["أذكار الاستيقاظ"] == null
          ? []
          : List<Empty>.from(
              json["أذكار الاستيقاظ"]!.map((x) => Empty.fromJson(x)),
            ),
      azkarDetailsModel: json["أدعية قرآنية"] == null
          ? []
          : List<Empty>.from(
              json["أدعية قرآنية"]!.map((x) => Empty.fromJson(x)),
            ),
      empty: json["أدعية الأنبياء"] == null
          ? []
          : List<Empty>.from(
              json["أدعية الأنبياء"]!.map((x) => Empty.fromJson(x)),
            ),
    );
  }
}

class Empty {
  Empty({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.content,
  });

  final String? category;
  final String? count;
  final String? description;
  final String? reference;
  final String? content;

  factory Empty.fromJson(Map<String, dynamic> json) {
    return Empty(
      category: json["category"],
      count: json["count"],
      description: json["description"],
      reference: json["reference"],
      content: json["content"],
    );
  }
}
