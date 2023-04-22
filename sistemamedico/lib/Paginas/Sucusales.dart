import 'package:flutter/material.dart';
import 'package:sistemamedico/Paginas/menuprincipal.dart';

class sucursales extends StatefulWidget {
  const sucursales({super.key});

  @override
  State<sucursales> createState() => _PrincipalState();
}

String nameValue = "";

class _PrincipalState extends State<sucursales> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 100),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Mapa.png'),
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 00.0, top: 50.0),
              child: Text(
                'Sucursal',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 00.0, top: 500.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 48, 211, 240),
                  ),
                ),
                child: const Text("Regresar"),
                onPressed: () {
                  _showMenuPrincial(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMenuPrincial(BuildContext context) {
    Navigator.of(context).pushNamed(
      "/Menuprincipal",
      arguments: const menuprincipal(),
    );
  }
}
