import 'package:flutter/material.dart';

class MetodoPagoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Método de Pago'),
        backgroundColor: Color(0xFF241E1E),
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Text(
          'Selecciona tu método de pago',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
