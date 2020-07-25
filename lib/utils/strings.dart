class StringUtils {
  // Level 1
  static void iterate(String str, Function callback) {
    List<int> stringIndexList =
        new List<int>.generate(str.length, (int index) => index);
    stringIndexList.forEach((index) {
      var char = str[index];
      callback(char);
    });
  }
}
