import 'package:intl/intl.dart';

class DateTimeHelper {
  static String outputDateTimeDb = 'y-MM-dd HH:mm:ss';

  static String? formatToString({required String date}) {
    var parse = DateTime.parse(date);
    var format = DateFormat(outputDateTimeDb).format(parse);

    return format;
  }
}
