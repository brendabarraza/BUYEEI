import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/nosotros.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'En Buyeei, nos apasiona crear momentos dulces y refrescantes que deleiten tus sentidos y te hagan sonreír. Somos una marca de helados dedicada a ofrecerte la más alta calidad y sabores irresistibles que te transportarán a un mundo de placer helado.\n\nEn Buyeei, creemos en la importancia de la creatividad y la innovación. Nuestro equipo de expertos en helados está constantemente experimentando y desarrollando nuevas recetas para ofrecerte una variedad de sabores que despierten tus papilas gustativas. Desde los clásicos atemporales hasta las combinaciones audaces y vanguardistas, siempre encontrarás algo que se adapte a tu gusto en nuestro amplio catálogo de helados.\n\nAdemás, nos enorgullece decir que nuestra pasión por los helados se combina con un firme compromiso con la sostenibilidad y la responsabilidad social. Nos esforzamos por minimizar nuestro impacto en el medio ambiente, utilizando envases y materiales ecoamigables, y trabajamos en estrecha colaboración con organizaciones benéficas locales para apoyar a nuestras comunidades.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 60,
          left: 0,
          right: 130,
          child: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'SEGUINOS EN NUESTRAS REDES',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 820,
          left: 68,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
            ),
            color: Colors.transparent,
            child: IconButton(
              onPressed: () {
                // Acción al presionar el botón
              },
              icon: Image.asset(
                'assets/Twitter.png',
                width: 50,
                height: 50,
              ),
            ),
          ),
        ),
        Positioned(
          top: 820,
          left: 119,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
            ),
            color: Colors.transparent,
            child: IconButton(
              onPressed: () {
                // Acción al presionar el botón
              },
              icon: Image.asset(
                'assets/Facebook.png',
                width: 50,
                height: 50,
              ),
            ),
          ),
        ),
        Positioned(
          top: 820,
          right: 192,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
            ),
            color: Colors.transparent,
            child: IconButton(
              onPressed: () {
                // Acción al presionar el botón
              },
              icon: Image.asset(
                'assets/Instagram.png',
                width: 50,
                height: 50,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


