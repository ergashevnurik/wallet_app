class Subscriber {
  final String id;
  final String contact;
  final String first;
  final String last;
  final String birthday;
  final String gender;
  final String percentage;
  final String uploaded;
  final String username;
  final bool admin;
  final bool verified;

  Subscriber({required this.first,required  this.last,required  this.birthday,required  this.gender,required  this.percentage,required  this.uploaded,required  this.username,required  this.admin,required  this.verified, required this.contact, required this.id});

  factory Subscriber.fromJson(Map<String, dynamic> json) {
    return Subscriber(
      id: json['id'],
      contact: json['contact'],
      first: json['first'],
      last: json['last'],
      birthday: json['birthday'],
      gender: json['gender'],
      percentage: json['percentage'],
      uploaded: json['uploaded'],
      username: json['username'],
      admin: json['admin'],
      verified: json['verified'],
    );
  }
}