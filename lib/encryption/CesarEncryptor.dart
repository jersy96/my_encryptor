import '../utils/strings.dart';

class CesarEncryptor {
  CesarEncryptor(this.alphabet, this.increment);

  String alphabet;
  int increment;

  // Level 1
  String encrypt(String text) {
    String encryptedText = '';
    bool invalidCharFound = false;
    _iterateString(text, (String char) {
      int index = alphabet.indexOf(char);
      if (index < 0) invalidCharFound = true;
      int newIndex = (index + increment) % alphabet.length;
      if (!invalidCharFound) {
        encryptedText += alphabet[newIndex];
      }
    });
    return invalidCharFound ? '' : encryptedText;
  }

  // Level 2
  void _iterateString(String str, Function callback) {
    StringUtils.iterate(str, callback);
  }
}
