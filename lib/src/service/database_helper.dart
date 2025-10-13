import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:meuapp/src/model/usuario_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'usuarios.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE usuarios(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        cpf TEXT,
        email TEXT,
        senha TEXT,
        dataNascimento TEXT,
        telefone TEXT,
        cep TEXT,
        endereco TEXT,
        numero TEXT,
        cidade TEXT,
        uf TEXT,
        estadoCivil TEXT
      )
    ''');
  }

  /// Insere um usuário no banco
  Future<void> inserirUsuario(UsuarioModel usuario) async {
    final db = await database;
    await db.insert(
      'usuarios',
      usuario.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('✅ Usuário inserido: ${usuario.email}');
  }

  /// Retorna todos os usuários
  Future<List<UsuarioModel>> listarUsuarios() async {
    final db = await database;
    final result = await db.query('usuarios');
    return result.map((json) => UsuarioModel.fromJson(json)).toList();
  }

  /// Busca usuário pelo email
  Future<UsuarioModel?> buscarUsuarioPorEmail(String email) async {
    final db = await database;
    final result = await db.query(
      'usuarios',
      where: 'email = ?',
      whereArgs: [email],
    );

    if (result.isNotEmpty) {
      return UsuarioModel.fromJson(result.first);
    }
    return null;
  }

  /// Remove um usuário pelo email
  Future<void> removerUsuario(String email) async {
    final db = await database;
    await db.delete(
      'usuarios',
      where: 'email = ?',
      whereArgs: [email],
    );
    print('🗑️ Usuário removido: $email');
  }

  /// Limpa todos os dados da tabela
  Future<void> limparUsuarios() async {
    final db = await database;
    await db.delete('usuarios');
    print('🧹 Todos os usuários foram removidos');
  }
}