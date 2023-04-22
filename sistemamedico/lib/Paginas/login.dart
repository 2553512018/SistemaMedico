import 'package:flutter/material.dart';
import 'package:sistemamedico/Paginas/menuprincipal.dart';

class login extends StatelessWidget {
  TextEditingController nameValue = TextEditingController(text: "");
  TextEditingController contrasena = TextEditingController(text: "");

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
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
                padding: const EdgeInsets.fromLTRB(100, 300, 100, 0),
                child: Form(
                  key: formKey,
                  child: Column(children: <Widget>[
                    TextFormField(
                        controller: nameValue,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 18.0),
                        decoration: const InputDecoration(
                          label: Text(
                            "Usuario:",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Introduce este campo";
                          }
                        }),
                    TextFormField(
                      controller: contrasena,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 18.0),
                      decoration: const InputDecoration(
                        label: Text(
                          "Contraseña:",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Introduce este campo";
                        }
                      },
                      obscureText: true,
                    ),
                    ElevatedButton(
                      child: Text("Ingresar"),
                      onPressed: () {
                        _showMenuPrincipal(context);
                        nameValue.clear();
                        contrasena.clear();
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
                  ]),
                )),
          ),
        ),
      ),
    );
  }

  void _showMenuPrincipal(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (nameValue.text == "admin" && contrasena.text == "12345") {
        Navigator.of(context).pushNamed(
          "/Menuprincipal",
          arguments: const menuprincipal(),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error de inicio de sesión"),
              content: const Text("Usuario o contraseña incorrectos."),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cerrar"),
                ),
              ],
            );
          },
        );
      }
    }
  }
}
