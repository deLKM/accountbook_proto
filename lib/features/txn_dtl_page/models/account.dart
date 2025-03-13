class Account {
  final String internalId;
  final String displayId;
  final String title;
  final String subtitle;
  final String subOf;
  final bool? deleted;

  Account({
    required this.internalId,
    required this.displayId,
    required this.title,
    required this.subtitle,
    required this.subOf,
    this.deleted = false,
  });

  Account copyWith({
    String? internalId,
    String? displayId,
    String? title,
    String? subtitle,
    String? subOf,
    bool? deleted,
  }) {
    return Account(
      internalId: internalId ?? this.internalId,
      displayId: displayId ?? this.displayId,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      subOf: subOf ?? this.subOf,
      deleted: deleted ?? this.deleted,
    );
  }
}