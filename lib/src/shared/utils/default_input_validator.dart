abstract class DefaultInputValidator {
  static String? valid(String? value) {
    if ((value ?? '').isEmpty) {
      return 'É obrigatório!';
    }

    return null;
  }
}
