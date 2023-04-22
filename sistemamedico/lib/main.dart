import 'package:flutter/material.dart';
import 'package:sistemamedico/Paginas/AgregarMedicamentos.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sistemamedico/Paginas/contactos.dart';
import 'package:sistemamedico/Paginas/medicamentos.dart';
import 'package:sistemamedico/Paginas/menuprincipal.dart';
import 'package:sistemamedico/Paginas/paginappal.dart';
import 'package:sistemamedico/Paginas/Sucusales.dart';
import 'package:sistemamedico/Paginas/proveedores.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistema Medico',
      initialRoute: '/',
      routes: {
        '/': (context) => paginappal(),
        '/Menuprincipal': (context) => const menuprincipal(),
        '/medicamentos': (context) => Medicamentosview(),
        '/sucursal': (context) => const sucursales(),
        '/proveedor': (context) => const proveedor(),
        '/contactos': (context) => Contactos(),
        '/agregarmedicamentos': (context) => AgregarMedicamentos(),
      },
    );
  }
}
