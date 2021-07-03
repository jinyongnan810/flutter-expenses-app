class OneDayAmount {
  final String day;
  final double amount;
  final double percentage;
  OneDayAmount(this.day, this.amount, this.percentage);
}

class OneWeekAmount {
  final double total;
  final List<OneDayAmount> daily;
  OneWeekAmount(this.total, this.daily);
}
