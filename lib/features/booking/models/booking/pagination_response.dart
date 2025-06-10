// pagination_response.dart
import '../property/listing_model.dart';

class PaginatedResponse {
  final List<ListingModel> content;
  final int totalElements;
  final int totalPages;
  final int currentPage;
  final int size;
  final bool hasNext;
  final bool hasPrevious;
  final bool isFirst;
  final bool isLast;

  PaginatedResponse({
    required this.content,
    required this.totalElements,
    required this.totalPages,
    required this.currentPage,
    required this.size,
    required this.hasNext,
    required this.hasPrevious,
    required this.isFirst,
    required this.isLast,
  });

  factory PaginatedResponse.fromJson(Map<String, dynamic> json) {
    return PaginatedResponse(
      content: (json['content'] as List)
          .map((item) => ListingModel.fromJson(item))
          .toList(),
      totalElements: json['totalElements'] ?? 0,
      totalPages: json['totalPages'] ?? 1,
      currentPage: json['currentPage'] ?? 0,
      size: json['size'] ?? 24,
      hasNext: json['hasNext'] ?? false,
      hasPrevious: json['hasPrevious'] ?? false,
      isFirst: json['isFirst'] ?? true,
      isLast: json['isLast'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content.map((item) => item.toJson()).toList(),
      'totalElements': totalElements,
      'totalPages': totalPages,
      'currentPage': currentPage,
      'size': size,
      'hasNext': hasNext,
      'hasPrevious': hasPrevious,
      'isFirst': isFirst,
      'isLast': isLast,
    };
  }
}