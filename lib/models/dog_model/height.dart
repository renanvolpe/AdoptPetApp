// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Height {
  String imperial;
  String metric;
  Height({
    required this.imperial,
    required this.metric,
  });

  Height copyWith({
    String? imperial,
    String? metric,
  }) {
    return Height(
      imperial: imperial ?? this.imperial,
      metric: metric ?? this.metric,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imperial': imperial,
      'metric': metric,
    };
  }

  factory Height.fromMap(Map<String, dynamic> map) {
    return Height(
      imperial: map['imperial'] as String,
      metric: map['metric'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Height.fromJson(String source) => Height.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Height(imperial: $imperial, metric: $metric)';

  @override
  bool operator ==(covariant Height other) {
    if (identical(this, other)) return true;
  
    return 
      other.imperial == imperial &&
      other.metric == metric;
  }

  @override
  int get hashCode => imperial.hashCode ^ metric.hashCode;
}
