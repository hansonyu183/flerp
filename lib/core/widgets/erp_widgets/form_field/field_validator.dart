import 'package:intl/intl.dart';

class FieldValidator {
  
  static String data(String format,String value){
    try {
      final DateTime _date=DateFormat(format).parse(value);
      return DateFormat(format).format(_date)==value ? null : '日期格式有误';
    } catch (_) {
      return '日期格式有误';
    }    
  }
  
  static String vouNo (String value) { 
    final RegExp vouNo = RegExp(r'^[a-zA-Z]{2}-[0-9]{8}-[0-9]{3}');
    const String errMsg ='单号格式有误';
    return !vouNo.hasMatch(value)
              ?errMsg
              : data('yyyy-MM-dd',
                '${value.substring(3,7)}-${value.substring(7,9)}-${value.substring(9,11)}');
  }

}