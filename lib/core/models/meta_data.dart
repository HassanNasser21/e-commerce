class MetaData {
  final int currentPage;
  final int numberOfPages;
  final int limit;
  final int? nextPage;
  const MetaData({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    required this.nextPage,
  });
  factory MetaData.fromJson(Map<String, dynamic> josn) => MetaData(
    currentPage: josn['currentPage'] as int,
    numberOfPages: josn['numberOfPages'] as int,
    limit: josn['limit'] as int,
    nextPage: josn['nextPage'] as int?,
  );
}
