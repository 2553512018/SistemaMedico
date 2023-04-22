import 'package:flutter/material.dart';
import 'package:sistemamedico/Paginas/menuprincipal.dart';

class proveedor extends StatelessWidget {
  const proveedor({super.key});

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
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/simbolo.png'),
                opacity: 200.0,
                fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 200, left: 30, right: 30, bottom: 100),
                child: GridView.count(
                  crossAxisCount: 3,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/images/bayer.png',
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset('assets/images/colgate.png'),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset('assets/images/johsom.png'),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset('assets/images/medifarma.png'),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset('assets/images/unilever.png'),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset('assets/images/nestle.png'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 100.0, top: 30.0),
                child: Text(
                  'Proveedores',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 175.0, top: 600.0),
                child: ElevatedButton(
                  child: Text("Regresar"),
                  onPressed: () {
                    _showMenuPrincipal(context);
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
            ],
          ),
        ),
      ),
    );
  }

  void _showMenuPrincipal(BuildContext context) {
    Navigator.of(context).pushNamed(
      "/Menuprincipal",
      arguments: menuprincipal(),
    );
  }
}
