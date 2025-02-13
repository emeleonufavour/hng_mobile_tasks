// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaginatedResponse<T> {
  final List<T> data;
  final PaginationLinks links;
  final PaginationMeta meta;

  PaginatedResponse({
    required this.data,
    required this.links,
    required this.meta,
  });

  PaginatedResponse<T> copyWith({
    List<T>? data,
    PaginationLinks? links,
    PaginationMeta? meta,
  }) {
    return PaginatedResponse<T>(
      data: data ?? this.data,
      links: links ?? this.links,
      meta: meta ?? this.meta,
    );
  }
}

class PaginationLinks {
  final String first;
  final String last;
  final String? prev;
  final String? next;

  PaginationLinks({
    required this.first,
    required this.last,
    this.prev,
    this.next,
  });

  factory PaginationLinks.fromJson(Map<String, dynamic> json) {
    return PaginationLinks(
      first: json['first'],
      last: json['last'],
      prev: json['prev'],
      next: json['next'],
    );
  }
}

class PaginationMeta {
  final int currentPage;
  final int from;
  final int lastPage;
  final String path;
  final int perPage;
  final int to;
  final int total;

  PaginationMeta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory PaginationMeta.fromJson(Map<String, dynamic> json) {
    return PaginationMeta(
      currentPage: json['current_page'],
      from: json['from'],
      lastPage: json['last_page'],
      path: json['path'],
      perPage: json['per_page'],
      to: json['to'],
      total: json['total'],
    );
  }
}
