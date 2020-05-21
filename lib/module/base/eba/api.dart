import 'package:flerp/http.dart';

class BaseEba {
  static data(Map<String, dynamic> parameters) {
    return http.get("/base/eba/data/", parameters:parameters);
  }
}
