/// Gerador de caracteres aleatórios
String passwordGenerate({
  int size = 6, 
  PasswordType passwordType = PasswordType.characterMix
}) {

  //Code ==> https://theasciicode.com.ar/
  final List<int> skipCharCode = const 
    [34, 39, 40, 41, 44, 46, 47, 58, 59, 60, 61, 62, 91, 92, 93, 94, 96, 123];
  final Random _random = Random.secure();
  int charCode;

  switch (passwordType) {
    case PasswordType.onlyNumbers:
      return List<String>.generate(
        size, 
        (i) => String.fromCharCode(_random.nextInt(10) + 48), // charCode >= 48 & 57 <=
      ).join('');
    case PasswordType.onlyCapitalLetters:
      return List<String>.generate(
        size, 
        (i) => String.fromCharCode(_random.nextInt(26) + 65),// charCode >= 65 & 90 <=
      ).join('');
    case PasswordType.onlyLowerCaseLetters:
      return List<String>.generate(
        size, 
        (i) => String.fromCharCode(_random.nextInt(26) + 97),// charCode >= 97 & 122 <=
      ).join('');
    case PasswordType.upperLowerCaseLetters: // Characters: CapitalLetters + LowerCaseLetters 
      return List<String>.generate(
        size, 
        (i) {
          do {
            charCode = _random.nextInt(58) + 65; // charCode >= 65 & 122 <=
          } while (
            //transformar as condições em uma única condição
            !<bool>[
              charCode >= 65 && charCode <= 90, //charCode entre 65-90
              charCode >= 97 && charCode <= 122 //charCode entre 97-122
            ].contains(true)
          );
          return String.fromCharCode(charCode);
        },
      ).join('');
    case PasswordType.numbersLetters: // Characters: numbers + CapitalLetters + LowerCaseLetters 
      return List<String>.generate(
        size, 
        (i) {
          do {
            charCode = _random.nextInt(75) + 48; // charCode >= 48 & 122 <=
          } while (
            //transformar as condições em uma única condição
            !<bool>[
              charCode >= 48 && charCode <= 57, //charCode entre 48-57
              charCode >= 65 && charCode <= 90, //charCode entre 65-90
              charCode >= 97 && charCode <= 122 //charCode entre 97-122
            ].contains(true)
          );
          return String.fromCharCode(charCode);
        },
      ).join('');
    default:// Characters: numbers + CapitalLetters + LowerCaseLetters + special characters
      return List<String>.generate(
        size, 
        (i) {
          do {
            charCode = _random.nextInt(90) + 33; // charCode >= 33 & 122 <=
          } while (skipCharCode.contains(charCode));
          return String.fromCharCode(charCode);
        },
      ).join('');
  }

}

enum PasswordType{
  onlyNumbers,
  onlyCapitalLetters,
  onlyLowerCaseLetters,
  upperLowerCaseLetters,
  numbersLetters,
  characterMix
}
