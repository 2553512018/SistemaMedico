import 'package:sistemamedico/Paginas/medicamentos.dart';
import 'package:flutter/material.dart';
import 'package:sistemamedico/Controllers/Medicamentos.dart';
import 'package:sistemamedico/Controllers/Db.dart';

class AgregarMedicamentos extends StatefulWidget {
  AgregarMedicamentos({super.key});

  final formKey = GlobalKey<FormState>();
  @override
  State<AgregarMedicamentos> createState() => _AgregarMedicamentosState();
}

class _AgregarMedicamentosState extends State<AgregarMedicamentos> {
  int id = 1;
  TextEditingController nombreController = TextEditingController(text: "");
  TextEditingController marcaController = TextEditingController(text: "");
  TextEditingController precioController = TextEditingController(text: "");
  TextEditingController stockController = TextEditingController(text: "");
  TextEditingController principioactivoController =
      TextEditingController(text: "");
  TextEditingController fechaController = TextEditingController(text: "");
  TextEditingController proveedorController = TextEditingController(text: "");

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
                  opacity: 200.0,
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(100, 200, 100, 0),
              child: Column(children: [
                TextField(
                  controller: nombreController,
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                  decoration: const InputDecoration(
                    hintText: 'Ingrese un valor',
                    label: Text(
                      "Nombre Medicamento:",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                TextField(
                  controller: marcaController,
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                  decoration: const InputDecoration(
                    hintText: 'Ingrese un valor',
                    label: Text(
                      "Marca:",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                TextField(
                  controller: precioController,
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                  decoration: const InputDecoration(
                    hintText: 'Ingrese un valor',
                    label: Text(
                      "precio:",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                TextField(
                  controller: principioactivoController,
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                  decoration: const InputDecoration(
                    hintText: 'Ingrese un valor',
                    label: Text(
                      "Principio activo:",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                TextField(
                  controller: fechaController,
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                  decoration: const InputDecoration(
                    hintText: 'Ingrese un valor',
                    label: Text(
                      "Fecha Vencimiento:",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                TextField(
                  controller: proveedorController,
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                  decoration: const InputDecoration(
                    hintText: 'Ingrese un valor',
                    label: Text(
                      "Proveedor:",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 48, 211, 240))),
                      child: const Text("Guardar"),
                      onPressed: () async {
                        int lastId = await _getLastId();
                        Medicamentos newMedicamento = Medicamentos(
                            id: lastId + 1,
                            nombre: nombreController.text,
                            marca: marcaController.text,
                            precio: double.parse(precioController.text),
                            principioactivo: principioactivoController.text,
                            fecha: fechaController.text,
                            proveedor: proveedorController.text);

                        DBProvider.insert(newMedicamento);
                        nombreController.clear();
                        marcaController.clear();
                        precioController.clear();
                        principioactivoController.clear();
                        fechaController.clear();
                        proveedorController.clear();
                      },
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 48, 211, 240))),
                      child: const Text("Volver"),
                      onPressed: () {
                        _showmedicamentos(context);
                      },
                    ),
                  ],
                )
              ]),
            )),
      ),
    );
  }

  void _showmedicamentos(BuildContext context) {
    Navigator.of(context).pushNamed(
      "/medicamentos",
      arguments: Medicamentosview(),
    );
  }

  Future<int> _getLastId() async {
    final lastMedicamento = await DBProvider.getLastId();
    return lastMedicamento[0]['id'] + 1;
  }
}
