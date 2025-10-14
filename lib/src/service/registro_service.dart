import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RegistroService {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'usuarios.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE usuarios(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            cpf TEXT,
            email TEXT UNIQUE,
            senha TEXT,
            dataNasc TEXT,
            telefone TEXT,
            cep TEXT,
            endereco TEXT,
            numero TEXT,
            cidade TEXT,
            uf TEXT,
            estadoCivil TEXT
          )
        ''');
        print('📦 Banco de dados criado com sucesso!');
      },
    );
  }

  /// Salva o usuário no banco local (SQLite)
  Future<void> salvarUsuario(Map<String, dynamic> usuarioJson) async {
    final db = await database;
    await db.insert(
      'usuarios',
      usuarioJson,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('✅ Usuário salvo no SQLite');
  }


  /// Retorna todos os usuários cadastrados
  Future<List<Map<String, dynamic>>> listarUsuarios() async {
    final db = await database;
    return await db.query('usuarios');
  }

  /// Remove um usuário pelo email
  Future<void> removerUsuario(String email) async {
    final db = await database;
    await db.delete('usuarios', where: 'email = ?', whereArgs: [email]);
    print('🗑️ Usuário removido do SQLite');
  }

  /// Busca um usuário pelo email e senha (para login)
  Future<Map<String, dynamic>?> autenticarUsuario(
      String email, String senha) async {
    final db = await database;
    final result = await db.query(
      'usuarios',
      where: 'email = ? AND senha = ?',
      whereArgs: [email, senha],
    );

    if (result.isNotEmpty) {
      print('🔓 Login bem-sucedido para $email');
      return result.first;
    } else {
      print('❌ Email ou senha inválidos.');
      return null;
    }
  }
}


