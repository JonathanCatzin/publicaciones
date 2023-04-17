import 'package:flutter/material.dart';
import 'package:home_page/dtos/request/post_request.dart';

class PostArticle extends StatelessWidget {
  final dynamic publicacion;
  const PostArticle({
    super.key,
    this.publicacion,
  });

  @override
  Widget build(BuildContext context) {
    final bool _isRead = false;

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
            TextTitlePage(title: '${publicacion.tituloPublicacion}'),
            Image.network(
              publicacion.imagePublicacion,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(
              '${publicacion.cuerpoPublicacion}',
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
                    onPressed: () {},
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
