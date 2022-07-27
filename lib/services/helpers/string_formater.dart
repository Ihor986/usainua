class StringFormater {
  static String formatPhoneNumber(String number) {
    String formatedNumber = '';
    formatedNumber = '${number.substring(0, 3)} ';
    formatedNumber = '$formatedNumber${number.substring(3, 6)} ';
    formatedNumber = '$formatedNumber${number.substring(6, 9)} ';
    formatedNumber = '$formatedNumber${number.substring(9)}';
    return formatedNumber;
  }
}
