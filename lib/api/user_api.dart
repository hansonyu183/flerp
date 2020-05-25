import 'package:flerp/models/respone_body.dart';
import 'package:flerp/utils/httpUtil.dart';

class UserApi {
  static Future<ResponeBody> register(data) async {
    ResponeBody responeBody = await HttpUtil.post('/user/register', data: data, requestToken: false);
    return responeBody;
  }

  static Future<ResponeBody> login(data) async {
    // String basic = 'Basic ' + base64.encode(utf8.encode('$login:$pwd'));
    ResponeBody responeBody = await HttpUtil.post('/user/login', data: data, requestToken: false);
    return responeBody;
  }
}
