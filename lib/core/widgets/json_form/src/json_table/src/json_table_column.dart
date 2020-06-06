typedef ValueBuilder = String Function(dynamic value);

class JsonTableColumn {
  JsonTableColumn(this.field,
      {this.label, this.defaultValue = '', this.valueBuilder}) {
    label = label ?? field;
  }

  JsonTableColumn.fromJson(Map<String, String> json) {
    field = json['field'];
    label = json['label'];
    defaultValue = json['defaultValue'];
  }

  String label;
  String field;
  String defaultValue;
  ValueBuilder valueBuilder;

}
