class StringEncoder {
  static String encodeWhitespaces(String obj) {
    return obj.replaceAll(" ", "-//-");
  }

  static String decodeWhitespaces(String obj) {
    return obj.replaceAll("-//-", " ");
  }
}

class DateFormat {
  static String monthToString(int month) {
    List<String> monthNameList = ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"];
    return monthNameList[month-1];
  }

  static String format(DateTime dateTime) {
    DateTime now = DateTime.now();

    String year = "";
    if (now.year != dateTime.year)
      year = dateTime.year.toString();

    return "${dateTime.day.toString()} ${monthToString(dateTime.month)} $year";
  }
}

class NumberFormat {
  static String currency(String currentCurrency, num value) {
    return "$currentCurrency ${currencyNumber(value)}";
  }

  static String currencyNumber(num value) {
    return "${value.toStringAsFixed(2)}".replaceAll('.', ',');
  }
}