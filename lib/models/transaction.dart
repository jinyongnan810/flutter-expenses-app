class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  Transaction(this.id, this.title, this.amount, this.date);
  @override
  String toString() {
    return "id:$id,title:$title,amount:$amount,date:$date";
  }
}
