import 'package:flutter/material.dart';

// Este es el punto de entrada de la aplicación.
void main() {
  runApp(const CinepolisApp());
}

// Esta clase configura el tema principal de la aplicación.
class CinepolisApp extends StatelessWidget {
  const CinepolisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la etiqueta de "Debug"
      title: 'Cinépolis Valtierra',
      // Definimos el tema con los colores azul y blanco.
      theme: ThemeData(
        // Usamos SeedColor para que Flutter genere variaciones de azul automáticamente.
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF003D7C)),
        useMaterial3: true,
      ),
      home: const CarteleraScreen(),
    );
  }
}

// Esta clase representa la pantalla principal con la cartelera.
class CarteleraScreen extends StatelessWidget {
  const CarteleraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Barra superior (AppBar) con el título
      appBar: AppBar(
        title: const Text(
          'Cinépolis Valtierra',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // Color azul oscuro para la AppBar.
        backgroundColor: const Color(0xFF003D7C),
        centerTitle: true,
      ),
      // El cuerpo principal de la pantalla.
      body: Container(
        // Fondo blanco para la aplicación.
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinea todo a la izquierda
          children: [
            // 2. Subtítulo "Películas"
            const Text(
              'Películas',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF003D7C), // Texto en azul
              ),
            ),
            const SizedBox(height: 16), // Espacio de separación

            // 3. Columna de 5 tarjetas (ListView)
            Expanded(
              child: ListView(
                children: const [
                  // Llamamos a nuestra función 'peliculaWidget' 5 veces con datos diferentes.
                  PeliculaWidget(
                    imageUrl: 'https://raw.githubusercontent.com/JazminAnaya/UII-Act-2-Tarjetas-Cinepolis-Valtierra-0716/refs/heads/main/avengers.jfif',
                    titulo: 'Avengers: Endgame',
                    director: 'Anthony & Joe Russo',
                    clasificacion: 'B (Mayores de 12 años)',
                    calificacion: '4.8 estrellas',
                  ),
                  PeliculaWidget(
                    imageUrl: 'https://raw.githubusercontent.com/JazminAnaya/UII-Act-2-Tarjetas-Cinepolis-Valtierra-0716/refs/heads/main/avatar.jfif',
                    titulo: 'Avatar',
                    director: 'James Cameron',
                    clasificacion: 'PG-13',
                    calificacion: '4 estrellas',
                  ),
                  PeliculaWidget(
                    imageUrl: 'https://raw.githubusercontent.com/JazminAnaya/UII-Act-2-Tarjetas-Cinepolis-Valtierra-0716/refs/heads/main/intensamente.jfif',
                    titulo: 'Intensamente',
                    director: 'Kelsey Mann',
                    clasificacion: 'AA (Todo público)',
                    calificacion: '4.7 estrellas',
                  ),
                  PeliculaWidget(
                    imageUrl: 'https://raw.githubusercontent.com/JazminAnaya/UII-Act-2-Tarjetas-Cinepolis-Valtierra-0716/refs/heads/main/star%20wars.jfif',
                    titulo: 'Star Wars',
                    director: 'George Lucas',
                    clasificacion: 'PG',
                    calificacion: '4.9 estrellas',
                  ),
                  PeliculaWidget(
                    imageUrl: 'https://raw.githubusercontent.com/JazminAnaya/UII-Act-2-Tarjetas-Cinepolis-Valtierra-0716/refs/heads/main/toy%20story.jpg',
                    titulo: 'Toy Story',
                    director: 'John Lasseter',
                    clasificacion: 'AA (Todo público)',
                    calificacion: '5.0 estrellas',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Este widget representa una sola tarjeta de película.
// Es un widget personalizado que reutilizamos para cada película.
class PeliculaWidget extends StatelessWidget {
  final String imageUrl;
  final String titulo;
  final String director;
  final String clasificacion;
  final String calificacion;

  // Constructor para recibir los datos de la película.
  const PeliculaWidget({
    super.key,
    required this.imageUrl,
    required this.titulo,
    required this.director,
    required this.clasificacion,
    required this.calificacion,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Sombra de la tarjeta
      margin: const EdgeInsets.only(bottom: 16), // Espacio entre tarjetas
      color: Colors.white, // Color de la tarjeta
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 4. Imagen de la película (izquierda)
            // ClipRRect para bordes redondeados.
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageUrl, // URL de la imagen (puedes cambiarla aquí)
                width: 100,
                height: 150,
                fit: BoxFit.cover, // Ajusta la imagen al tamaño.
              ),
            ),
            const SizedBox(width: 16), // Espacio de separación

            // 5. Información de la película (derecha)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Alineación izquierda
                children: [
                  // Título de la película en negrita.
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12), // Espacio

                  // Lista simple (Column) con el resto de la información.
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Director: $director', style: const TextStyle(color: Colors.black54)),
                      const SizedBox(height: 4), // Pequeño espacio
                      Text('Clasificación: $clasificacion', style: const TextStyle(color: Colors.black54)),
                      const SizedBox(height: 4),
                      Text('Calificación: $calificacion', style: const TextStyle(color: Colors.amber)), // Color para las estrellas
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}