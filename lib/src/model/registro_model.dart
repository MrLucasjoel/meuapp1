class UsuarioModel {
  int? id;
  String nomeCompleto;
  String cpf;
  String email;
  String dataNascimento;
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
    required this.dataNascimento,
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
      id: json['id'],
      nomeCompleto: json['nomeCompleto'],
      cpf: json['cpf'],
      email: json['email'],
      dataNascimento: json['dataNascimento'],
      telefone: json['telefone'],
      cep: json['cep'],
      endereco: json['endereco'],
      numero: json['numero'],
      cidade: json['cidade'],
      uf: json['uf'],
      estadoCivil: json['estadoCivil'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomeCompleto': nomeCompleto,
      'cpf': cpf,
      'email': email,
      'dataNascimento': dataNascimento,
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
