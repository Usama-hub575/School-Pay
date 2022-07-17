String getDashedEmiratesId(String emiratesID) {
  List<String> result = emiratesID.split('');

  result.insert(3, '-');
  result.insert(8, '-');
  result.insert(15, '-');
  return result.join();
}