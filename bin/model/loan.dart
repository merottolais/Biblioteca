class Loan {
  int? id;
  int? bookId;
  int? userId;

  Loan({
    this.id,
    this.bookId,
    this.userId,
  });

  factory Loan.fromJson(Map<String, dynamic> json) {
    return Loan(
      id: json['id'],
      bookId: json['bookId'],
      userId: json['userId'],
    );
  }

  get book => null;

  get user => null;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bookId': bookId,
      'userId': userId,
    };
  }
}
