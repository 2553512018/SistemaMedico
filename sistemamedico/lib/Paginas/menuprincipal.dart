import 'package:flutter/material.dart';
import 'package:sistemamedico/Paginas/medicamentos.dart';
import 'package:sistemamedico/Paginas/Sucusales.dart';
import 'package:sistemamedico/Paginas/paginappal.dart';
import 'package:sistemamedico/Paginas/proveedores.dart';
import 'package:sistemamedico/Paginas/contactos.dart';
import 'package:sistemamedico/Controllers/Medicamentos.dart';
import 'package:sistemamedico/Controllers/Db.dart';

class menuprincipal extends StatelessWidget {
  const menuprincipal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
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
            child: Stack(children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 150, left: 50, right: 50, bottom: 100),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/images/medicamentos.png',
                      ),
                      onPressed: () {
                        _showmedicamentos(context);
                      },
                    ),
                    IconButton(
                      icon: Image.asset('assets/images/sucursales.png'),
                      onPressed: () {
                        _showsucursal(context);
                      },
                    ),
                    IconButton(
                      icon: Image.asset('assets/images/provedores.png'),
                      onPressed: () {
                        _showsprovedor(context);
                      },
                    ),
                    IconButton(
                      icon: Image.asset('assets/images/contactos.png'),
                      onPressed: () {
                        _showcontactos(context);
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 150,
                right: 150,
                bottom: 50,
                child: ElevatedButton(
                  child: const Text("Salir"),
                  onPressed: () {
                    _showppal(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: Colors.blueGrey,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void _showcontactos(BuildContext context) {
    Navigator.of(context).pushNamed(
      "/contactos",
      arguments: Contactos(),
    );
  }

  void _showsucursal(BuildContext context) {
    Navigator.of(context).pushNamed(
      "/sucursal",
      arguments: sucursales(),
    );
  }

  void _showmedicamentos(BuildContext context) {
    Navigator.of(context).pushNamed(
      "/medicamentos",
      arguments: Medicamentosview(),
    );
  }

  void _showsprovedor(BuildContext context) {
    Navigator.of(context).pushNamed(
      "/proveedor",
      arguments: proveedor(),
    );
  }

  void _showppal(BuildContext context) {
    Navigator.of(context).pushNamed(
      "/",
      arguments: paginappal(),
    );
  }
}
