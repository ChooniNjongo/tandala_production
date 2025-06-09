import 'listing_model.dart';

class PaginatedListingResponse {
  final List<ListingModel> content;
  final int totalPages;
  final int totalItems;
  final int currentPage;

  PaginatedListingResponse({
    required this.content,
    required this.totalPages,
    required this.totalItems,
    required this.currentPage,
  });

  factory PaginatedListingResponse.fromJson(Map<String, dynamic> json) {
    return PaginatedListingResponse(
      content: (json['content'] as List<dynamic>)
          .map((item) => ListingModel.fromJson(item))
          .toList(),
      totalPages: json['totalPages'] ?? 0,
      totalItems: json['totalItems'] ?? 0,
      currentPage: json['currentPage'] ?? 0,
    );
  }
}