import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sistemamedico/Controllers/Medicamentos.dart';
import 'package:sistemamedico/Controllers/Db.dart';
import 'package:sistemamedico/Paginas/AgregarMedicamentos.dart';
import 'package:sistemamedico/Paginas/menuprincipal.dart';

class Medicamentosview extends StatefulWidget {
  Medicamentosview({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  @override
  State<Medicamentosview> createState() => _MedicamentosStateview();
}

String nameValue = "";

class _MedicamentosStateview extends State<Medicamentosview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover),
        ),
        child: Container(
          margin:
              const EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 100),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/simbolo.png'),
                opacity: 220.0,
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100, 100, 100, 0),
            child: Column(
              children: [
                const Text(
                  'Medicamentos',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: FutureBuilder<List<Medicamentos>?>(
                    future: DBProvider.medicamentos(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Medicamentos>?> snapshot) {
                      if (!snapshot.hasData || snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      List<Medicamentos> medicamentos = snapshot.data!;

                      return ListView(
                        children: medicamentos.map((medicamento) {
                          return ListTile(
                            leading: Icon(Icons.local_pharmacy),
                            title: Text(
                              medicamento.nombre,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  medicamento.marca,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  'Precio: ${medicamento.precio}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Principio activo: ${medicamento.principioactivo}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 48, 211, 240))),
                      child: const Text("Regresar"),
                      onPressed: () {
                        _showMenuPrincial(context);
                      },
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 48, 211, 240))),
                      child: const Text("Agregar Nuevo"),
                      onPressed: () {
                        _showmedicamentosagregar(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showmedicamentosagregar(BuildContext context) {
    Navigator.of(context).pushNamed(
      "/agregarmedicamentos",
      arguments: AgregarMedicamentos(),
    );
  }

  void _showMenuPrincial(BuildContext context) {
    Navigator.of(context).pushNamed(
      "/Menuprincipal",
      arguments: menuprincipal(),
    );
  }
}
