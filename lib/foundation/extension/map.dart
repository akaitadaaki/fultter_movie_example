extension ToJsonMapExt on Map<String, dynamic> {
  Map<String, dynamic> changeKey(Map<String, String> changeMap, {Map<String, String>? checkColumns}) {
    Map<String, dynamic> newMap = <String, dynamic>{};
    for (var key in keys) {
      final newKey = changeMap.containsKey(key) ? changeMap[key]! : key;
      if (checkColumns == null || checkColumns.containsKey(newKey)) {
        newMap[newKey] = this[key];
      }
    }
    return newMap;
  }

  Map<String, dynamic> restoreKey(Map<String, String> changeMap, {List<String>? boolList}) {
    Map<String, dynamic> newMap = <String, dynamic>{};
    // last_update のみ intでDBに登録して管理するので特別に変換する。
    // （サーバ側からはISO8601形式の文字列で来てエンティティはDateTimeとしている。）
    // intにすることで検索時に間違いが起こらないようにする
    for (var key in keys) {
      newMap[changeMap.keys.firstWhere((k) => changeMap[k] == key, orElse: () => key)] =
          (key == "last_update") ? this[key].toString() : this[key];
    }

    // boolListを受け取ったときは int → bool 変換もする
    if (boolList != null) {
      for (var element in boolList) {
        if (newMap.containsKey(element)) {
          newMap[element] = (newMap[element] == 1);
        }
      }
    }
    return newMap;
  }

  Map<String, dynamic> removeNullValue() {
    Map<String, dynamic> newMap = <String, dynamic>{};
    forEach((key, value) {
      if (value != null) {
        newMap[key] = value;
      }
    });

    return newMap;
  }
}
