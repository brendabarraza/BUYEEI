import 'package:flutter/material.dart';
import 'login_page.dart';
import 'perfil_page.dart';
import 'condiciones_page.dart';


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF241E1E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PerfilPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF838383),
                fixedSize: Size(325, 69),
              ),
              child: Text('Perfil'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CondicionesPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF838383),
                fixedSize: Size(325, 69), // Ajusta el tamaño a tus necesidades
              ),
              child: Text('Condiciones de uso'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF838383),
                fixedSize: Size(325, 69), // Ajusta el tamaño a tus necesidades
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Cerrar sesión'),
                      content: Text('¿Desea cerrar sesión?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            primary: Color(0xFF000000),
                          ),
                          child: Text('Si'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: TextButton.styleFrom(
                            primary: Color(0xFF000000), // Establece el color del texto
                          ),
                          child: Text('No'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Cerrar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
