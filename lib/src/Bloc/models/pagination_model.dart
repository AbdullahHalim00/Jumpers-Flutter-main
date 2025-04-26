class PaginationModel {
  int? current;
  int? last;
  int? count;
  int? total;
  String? prev;
  String? next;

  PaginationModel(
      {this.next, this.prev, this.total, this.current, this.count, this.last});

  PaginationModel.fromJson(Map<String, dynamic> map) {
    prev = map['prev'] ?? '';
    count = map['count'] ?? 0;
    current = map['current'] ?? 0;
    last = map['last'] ?? 0;
    next = map['next'] ?? '';
    total = map['total'] ?? 0;
  }
}
