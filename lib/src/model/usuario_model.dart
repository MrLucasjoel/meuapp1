import 'dart:convert';

class UsuarioModel {
  int? id;
  String nomeCompleto;
  String cpf;
  String email;
  String senha;
  String dataNasc;
  String telefone;
  String cep;
  String endereco;
  String numero;
  String cidade;
  String uf;
  String estadoCivil;

  UsuarioModel({
    this.id,
    required this.nomeCompleto,
    required this.cpf,
    required this.email,
    required this.senha,
    required this.dataNasc,
    required this.telefone,
    required this.cep,
    required this.endereco,
    required this.numero,
    required this.cidade,
    required this.uf,
    required this.estadoCivil,
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id']?.toString() ?? ''),
      nomeCompleto: json['nome'] ?? '',
      cpf: json['cpf'] ?? '',
      email: json['email'] ?? '',
      senha: json['senha'] ?? '',
      dataNasc: json['dataNasc'] ?? '',
      telefone: json['telefone'] ?? '',
      cep: json['cep'] ?? '',
      endereco: json['endereco'] ?? '',
      numero: json['numero'] ?? '',
      cidade: json['cidade'] ?? '',
      uf: json['uf'] ?? '',
      estadoCivil: json['estadoCivil'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nomeCompleto,
      'cpf': cpf,
      'email': email,
      'senha': senha,
      'dataNasc': dataNasc,
      'telefone': telefone,
      'cep': cep,
      'endereco': endereco,
      'numero': numero,
      'cidade': cidade,
      'uf': uf,
      'estadoCivil': estadoCivil,
    };
  }
}

