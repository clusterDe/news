// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryModel {
  String? name;
  String? value;
  bool? selected;

  CategoryModel({
    this.name,
    this.value,
    this.selected,
  });

  CategoryModel copyWith({
    String? name,
    String? value,
    bool? selected,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      value: value ?? this.value,
      selected: selected ?? this.selected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'value': value,
      'selected': selected,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'] != null ? map['name'] as String : null,
      value: map['value'] != null ? map['value'] as String : null,
      selected: map['selected'] != null ? map['selected'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CategoryModel(name: $name, value: $value, selected: $selected)';

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.value == value &&
        other.selected == selected;
  }

  @override
  int get hashCode => name.hashCode ^ value.hashCode ^ selected.hashCode;
}
