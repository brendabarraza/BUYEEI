import 'package:flutter/material.dart';

class CondicionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF241E1E),
        title: Text('Condiciones de uso'),
      ),
      backgroundColor: Color(0xFF444141),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Términos y condiciones',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor porta nisl non bibendum. Mauris at ex volutpat, suscipit leo id, rutrum purus. Vivamus elementum metus ut justo facilisis, eget pellentesque est mattis. Phasellus bibendum vehicula massa, quis hendrerit metus feugiat non. Vestibulum facilisis semper malesuada. Nullam et purus ac odio fringilla luctus. Suspendisse et arcu non tortor consectetur ultrices. Morbi rutrum varius nisl, non faucibus nulla semper a. Cras ultrices finibus ante ut fringilla.',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                'Política de privacidad',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor porta nisl non bibendum. Mauris at ex volutpat, suscipit leo id, rutrum purus. Vivamus elementum metus ut justo facilisis, eget pellentesque est mattis. Phasellus bibendum vehicula massa, quis hendrerit metus feugiat non. Vestibulum facilisis semper malesuada. Nullam et purus ac odio fringilla luctus. Suspendisse et arcu non tortor consectetur ultrices. Morbi rutrum varius nisl, non faucibus nulla semper a. Cras ultrices finibus ante ut fringilla.',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
