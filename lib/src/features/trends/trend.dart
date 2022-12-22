class Trend {
  final String title;
  final int numberOfMessages;
  final String? category;

  Trend(this.title, this.numberOfMessages, {this.category});

  Trend copyWith({int? numberOfMessages}) =>
      Trend(title, numberOfMessages ?? this.numberOfMessages, category: category);
}
