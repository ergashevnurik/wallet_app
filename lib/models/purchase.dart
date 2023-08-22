class PurchaseDetails {
  final int id;
  // final String assignedSubscriber;
  final int quantity;
  final int totalSum;
  final String date;
  final String createdAt;

  PurchaseDetails({
    required this.id,
    // required this.assignedSubscriber,
    required this.quantity,
    required this.totalSum,
    required this.date,
    required this.createdAt
  });

  factory PurchaseDetails.fromJson(Map<String, dynamic> json) {
    return PurchaseDetails(
        id: json['id'],
        quantity: json['quantity'],
        // assignedSubscriber: json['assignedSubscriber'],
        totalSum: json['totalSum'],
        date: json['date'],
        createdAt: json['createdAt']
    );
  }
}