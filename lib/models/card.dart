

class CardDetails {
  final String holder;
  final String assignedSubscriber;

  final String issued;
  final String name;

  CardDetails({
    required this.holder,
    required this.assignedSubscriber,
    required this.issued,
    required this.name,
  });

  factory CardDetails.fromJson(Map<String, dynamic> json) {
    return CardDetails(
      holder: json['holder'],
      assignedSubscriber: json['assignedSubscriber'],
      issued: json['issued'],
      name: json['name']
    );
  }
}