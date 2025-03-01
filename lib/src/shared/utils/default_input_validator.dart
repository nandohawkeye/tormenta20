abstract class DefaultInputValidator {
  static String? valid(String? value) {
    if ((value ?? '').isEmpty) {
      return 'Obrigatório!';
    }

    return null;
  }
}
