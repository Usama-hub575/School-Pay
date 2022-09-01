String amountFormater(double amountToConvert) {
  String amount = amountToConvert.toStringAsFixed(1).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  return amount;
}