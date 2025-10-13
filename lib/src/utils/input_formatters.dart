import 'package:flutter/services.dart';

class CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String cpf = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (cpf.length > 11) cpf = cpf.substring(0, 11);

    String formatted = '';
    if (cpf.length <= 3) {
      formatted = cpf;
    } else if (cpf.length <= 6) {
      formatted = '${cpf.substring(0, 3)}.${cpf.substring(3)}';
    } else if (cpf.length <= 9) {
      formatted = '${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6)}';
    } else {
      formatted = '${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}';
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class TelefoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String telefone = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (telefone.length > 11) telefone = telefone.substring(0, 11);

    String formatted = '';
    if (telefone.length <= 2) {
      formatted = '($telefone';
    } else if (telefone.length <= 6) {
      formatted = '(${telefone.substring(0, 2)}) ${telefone.substring(2)}';
    } else if (telefone.length <= 10) {
      formatted = '(${telefone.substring(0, 2)}) ${telefone.substring(2, 6)}-${telefone.substring(6)}';
    } else {
      formatted = '(${telefone.substring(0, 2)}) ${telefone.substring(2, 7)}-${telefone.substring(7)}';
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class CepInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String cep = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (cep.length > 8) cep = cep.substring(0, 8);

    String formatted = '';
    if (cep.length <= 5) {
      formatted = cep;
    } else {
      formatted = '${cep.substring(0, 5)}-${cep.substring(5)}';
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
