import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:sistemamedico/Controllers/Medicamentos.dart';
import 'package:path/path.dart';

class DBProvider {
  static DBProvider db = DBProvider();
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'Sistemamedico.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE Medicamentos(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, marca TEXT, precio DOUBLE, principioactivo TEXT, fecha TEXT,  proveedor TEXT)",
      );
    }, version: 1);
  }

  static Future<int> insert(Medicamentos medicamentos) async {
    Database database = await _openDB();

    return database.insert("Medicamentos", medicamentos.toMap());
  }

  static Future<int> delete(Medicamentos medicamentos) async {
    Database database = await _openDB();

    return database
        .delete("Medicamentos", where: "id = ?", whereArgs: [medicamentos.id]);
  }

  static Future<int> update(Medicamentos medicamentos) async {
    Database database = await _openDB();

    return database.update("Medicamentos", medicamentos.toMap(),
        where: "id = ?", whereArgs: [medicamentos.id]);
  }

  static Future<List<Medicamentos>?>? medicamentos() async {
    Database database = await _openDB();

    final List<Map<String, dynamic>> medicamentosMap =
        await database.query("Medicamentos");

    return List.generate(
        medicamentosMap.length,
        (i) => Medicamentos(
            id: medicamentosMap[i]['id'],
            nombre: medicamentosMap[i]['nombre'],
            marca: medicamentosMap[i]['marca'],
            precio: medicamentosMap[i]['precio'],
            principioactivo: medicamentosMap[i]['principioactivo'],
            fecha: medicamentosMap[i]['fecha'],
            proveedor: medicamentosMap[i]['proveedor']));
  }

  static Future<List<Map<String, dynamic>>> getLastId() async {
    final db = await _openDB();
    final result = await db.rawQuery("SELECT MAX(id) as id FROM Medicamentos");
    return result;
  }
}
