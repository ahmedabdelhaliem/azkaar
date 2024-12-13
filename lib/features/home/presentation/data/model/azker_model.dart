class Adker {
  final String category;
  final int count;
  final String description;
  final String reference;
  final String content;

  Adker({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.content,
  });

  factory Adker.fromJson(Map<String, dynamic> json) {
    return Adker(
      category: json['category'] ?? '', // التأكد من التعامل مع القيم الفارغة
      count:
          int.tryParse(json['count']) ?? 0, // التأكد من تحويل العدد بشكل صحيح
      description: json['description'] ?? '',
      reference: json['reference'] ?? '',
      content: json['content'] ?? '',
    );
  }
}
