import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
import 'package:uber_ambev_test/domain/usecases/date_time_format_usecase/date_time_format_usecase.dart';

class DateTimeFormatImplement implements DateTimeFormatUseCase {

  @override
  String call(String date) {
    final localDate = DateTime.parse(date).toLocal();
    final inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    final inputDate = inputFormat.parse(localDate.toString());
    return formatDate(inputDate, [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn]);
  }
}