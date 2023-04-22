import 'package:flutter/material.dart';
import 'package:sistemamedico/Paginas/menuprincipal.dart';

class Contactos extends StatelessWidget {
  String nameValue = "";
  String contrasena = "";

  final formKey = GlobalKey<FormState>();

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
                const EdgeInsets.only(top: 0, left: 20, right: 0, bottom: 0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment(-0.85, -1.0),
                image: AssetImage('assets/images/contactos.png'),
              ),
            ),
            child: Stack(children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 100, left: 30, right: 30, bottom: 100),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/images/Giovanni.png',
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset('assets/images/Mauricio.png'),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset('assets/images/Daniel.png'),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset('assets/images/Edgar.png'),
                      onPressed: () {},
                    ),
                    IconButton(
                      alignment: const Alignment(4.0, 0),
                      icon: Image.asset('assets/images/Leslie.png'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 120.0, top: 30.0),
                child: Text(
                  'Contacto',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                left: 150,
                right: 150,
                bottom: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 48, 211, 240))),
                  child: const Text("Regresar"),
                  onPressed: () {
                    _showMenuPrincial(context);
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void _showMenuPrincial(BuildContext context) {
    Navigator.of(context).pushNamed(
      "/Menuprincipal",
      arguments: menuprincipal(),
    );
  }
}
