import 'package:hero_premier/core/models/table/table_data.dart';

class TableResponse {
  Object group;
  String stage;
  List<TableData> table;
  String type;

  TableResponse.fromJsonMap(Map<String, dynamic> map)
      : group = map["group"],
        stage = map["stage"],
        table =
            List<TableData>.from(map["table"].map((it) => TableData.fromJsonMap(it))),
        type = map["type"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['group'] = group;
    data['stage'] = stage;
    data['table'] =
        table != null ? this.table.map((v) => v.toJson()).toList() : null;
    data['type'] = type;
    return data;
  }
}
