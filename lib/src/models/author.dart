import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable()
class Author {
  const Author({
    required this.id,
    required this.name,
    required this.surname,
  });

  Map<String, dynamic> toJson() => _$AuthorToJson(this);

  final String id;
  final String name;
  final String surname;

  static const empty = Author(
    id: '',
    name: '',
    surname: '',
  );
}
