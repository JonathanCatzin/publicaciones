import 'package:flutter/material.dart';
import 'package:home_page/dtos/request/post_request.dart';

void main() => runApp(const PostArticle());

class PostArticle extends StatefulWidget {
  const PostArticle({Key? key}) : super(key: key);

  @override
  _PostArticleState createState() => _PostArticleState();
}

class _PostArticleState extends State<PostArticle> {
  bool _isRead = false;

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Text(
            'Powerfullmind',
            style: TextStyle(
              color: _isRead ? Colors.grey : Colors.white,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const TextTitlePage(
                title:
                    'Cómo el manejo de las emociones puede mejorar nuestra calidad de vida'),
            Image.network(
              'https://www.hakunamatata.com.co/wp-content/uploads/2022/11/que-son-emociones.jpg',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Comprender mejor lo que sentimos implica tanto escuchar lo que nos pasa por dentro, como atender al contexto en el que nos sucede. Identificar qué le pasa a nuestro cuerpo frente a las emociones, reconocer qué nos pone en movimiento y qué nos paraliza. Tomar conciencia del efecto contagio, propio del mundo emocional.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const Divider(),
            Container(
              width: 200.0,
              height: 100.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Publicado por: Juan Perez',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        'Hace 2 horas',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  IconButton(
                    iconSize: 50.0,
                    icon: Icon(
                      _isRead ? Icons.check_box : Icons.circle_outlined,
                      color: _isRead ? Colors.green : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isRead = true;
                      });
                    },
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

class TextTitlePage extends StatelessWidget {
  final String title;

  const TextTitlePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
