/// Json Utilities base class
class JSONUtils {
  JSONUtils();

  /// Returns <String,dynamic> || String
  ///
  /// follow a given path in a given <String,dynamic>json
  /// and return found value if present or defaultValue if not present
  dynamic get(dynamic json, String path,dynamic defaultValue) {
    final List<String> pathSplitter = path.split('.');
    /// <String,dynamic> || String
    dynamic returnValue;

    json.forEach((String key, dynamic value) {
      if (key == pathSplitter[0]) {
        if (pathSplitter.length == 1) {
          returnValue = value;
          return;
        }
        pathSplitter.remove(key);

        if (value == null) {
          returnValue = defaultValue;
          return;
        }
        try{
          try{
            value = value.toJson();
          }catch(error){
            // handle error
          }
          returnValue = get(value, pathSplitter.join('.'), defaultValue);
        }catch(error){
          returnValue = defaultValue;
        }
        return;
      }
    });

    return returnValue ?? defaultValue;
  }
}