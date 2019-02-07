import 'package:simple_blog/models/account_model.dart';
import 'package:sqflite/sqflite.dart';

class AccountRepository {
  AccountRepository() {
    getDatabasesPath().then((result) => open(result + '/database.db'));
  }

  Database _db;

  final String table = 'accounts';
  final String columnId = '_id';
  final String columnEmail = 'email';
  final String columnFirstName = 'firstName';
  final String columnLastName = 'lastName';

  Future open(String path) async {
    _db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $table ( 
  $columnId integer primary key autoincrement, 
  $columnEmail text not null,
  $columnLastName text not null,
  $columnFirstName text null)
  ''');
    });
  }

  Future<Account> create(Account account) async {
    account.id = await _db.insert(table, account.toMap());
    return account;
  }

  Future<List<Account>> getAccounts() async {
    List<Account> result = new List<Account>();
    var accountsMap = await _db.query(table);

    for (var item in accountsMap) {
      result.add(Account.fromMap(item));
    }

    return result;
  }

  Future<Account> login(String email, String password) async {
    // TODO: Change to API logic
    List<Map> maps = await _db.query(table,
        columns: [columnId, columnEmail, columnFirstName, columnLastName],
        where: '$columnEmail = ?',
        whereArgs: [email]);
    if (maps.length > 0) {
      return Account.fromMap(maps.first);
    }
    return null;
  }

  Future<Account> getAccount(int id) async {
    List<Map> maps = await _db.query(table,
        columns: [columnId, columnEmail, columnFirstName, columnLastName],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Account.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await _db.delete(table, where: "$columnId = ?", whereArgs: [id]);
  }

  Future<int> update(Account account) async {
    return await _db.update(table, account.toMap(),
        where: '$columnId = ?', whereArgs: [account.id]);
  }

  Future close() => _db.close();
}
