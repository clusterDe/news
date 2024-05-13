// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'data_channel.dart';

class NewsChannelModel {
  String? status;
  List<DataChannel>? sources;

  NewsChannelModel({
    this.status,
    this.sources,
  });

  NewsChannelModel copyWith({
    String? status,
    List<DataChannel>? sources,
  }) {
    return NewsChannelModel(
      status: status ?? this.status,
      sources: sources ?? this.sources,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'sources': sources?.map((x) => x.toMap()).toList(),
    };
  }

  factory NewsChannelModel.fromMap(Map<String, dynamic> map) {
    return NewsChannelModel(
      status: map['status'] != null ? map['status'] as String : null,
      sources: map['sources'] != null
          ? List<DataChannel>.from(
              (map['sources'] as List<dynamic>).map<DataChannel?>(
                (x) => DataChannel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsChannelModel.fromJson(String source) =>
      NewsChannelModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NewsChannelModel(status: $status, sources: $sources)';

  @override
  bool operator ==(covariant NewsChannelModel other) {
    if (identical(this, other)) return true;

    return other.status == status && listEquals(other.sources, sources);
  }

  @override
  int get hashCode => status.hashCode ^ sources.hashCode;
}
