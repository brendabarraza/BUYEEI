import 'package:flutter/material.dart';
import 'main.dart';
import 'login_page_reg.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/inicio.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 80.0),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 100, 30, 1),
                  child: Text(
                    'BUYEEI',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'PassThrough',
                      fontSize: 45,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 2.0),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 1),
                  child: Text(
                    '¡Hazte socio de la comunidad y comienza \na canjear tus beneficios!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'PassThrough',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 0.0),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 70, 50, 0),
                  child: Container(
                    width: 100.0,
                    height: 60.0,
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Correo Electrónico',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 0.0),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 18, 50, 0),
                  child: Container(
                    height: 60.0,
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      obscureText: true,
                    ),
                  ),
                ),
                SizedBox(height: 0.0),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 18, 50, 6),
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown,
                      minimumSize: Size(double.infinity, 59.0),
                    ),
                    child: _isLoading ? CircularProgressIndicator() :
                    Text('Continuar',
                      style: TextStyle(
                        fontFamily: 'PassThrough',
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.0), // Espacio entre el botón "Continuar" y los botones de iconos
                Padding(
                    padding: EdgeInsets.fromLTRB(30, 1, 30, 50),
                    child: TextButton(
                      onPressed: _isLoading ? null : _login,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        minimumSize: Size(double.infinity, 0.0),
                      ),
                      child: _isLoading ? CircularProgressIndicator() :
                      Text(
                        '¿Olvidaste tu contraseña?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'PassThrough',
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.brown,
                        ),
                      ),)
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Acción para la imagen de Facebook
                      },
                      child: Image.asset(
                        'assets/Facebook Button.png',
                        width: 110,
                        height: 110,
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        // Acción para la imagen de Google
                      },
                      child: Image.asset(
                        'assets/Google Button.png',
                        width: 110,
                        height: 110,
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        // Acción para la imagen de Twitter
                      },
                      child: Image.asset(
                        'assets/Twitter Button.png',
                        width: 110,
                        height: 110,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 0.0), // Espacio entre los botones de iconos y el texto "¿Ya tienes una cuenta?"
                Text(
                  '¿Aun no tienes una cuenta?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'PassThrough',
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.brown,
                  ),
                ),

                SizedBox(height: 0.0), // Espacio entre el texto "¿Ya tienes una cuenta?" y el botón "Iniciar sesión"

                Padding(
                  padding: EdgeInsets.fromLTRB(130, 15, 130, 0),
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPageReg()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      minimumSize: Size(double.infinity, 40.0),
                    ),
                    child: _isLoading ? CircularProgressIndicator() :
                    Text('Registrate',
                      style: TextStyle(
                        fontFamily: 'PassThrough',
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 130.0),
              ],
            ),
          )
      ),
    );
  }


  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    setState(() {
      _isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      // Verifica las credenciales
      if (username == 'admin' && password == 'password') {
        // Credenciales válidas, redirige a la página principal
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(),
          ),
        );      } else {
        // Credenciales inválidas, muestra un diálogo de error
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error de inicio de sesión'),
              content: Text('Usuario o contraseña incorrectos.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }

      setState(() {
        _isLoading = false;
      });
    });
  }
}


