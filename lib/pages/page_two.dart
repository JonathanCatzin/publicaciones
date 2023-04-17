import 'package:flutter/material.dart';
import 'package:home_page/main.dart';
import 'package:home_page/pages/text_title_page.dart';
import 'package:home_page/provider/publications_provider.dart';
import 'package:provider/provider.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

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
              color: Colors.white,
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Image.asset('assets/foto3.jpg'),
    SizedBox(height: 50),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Buscamos inspirar a mujeres para que puedan alcanzar su mejor versión de sí mismas',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        
      ],
    ),
    SizedBox(height: 30),
    ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChangeNotifierProvider( create: (BuildContext context) =>
                    PublicationsProvider(), 
                    child: (MaterialApp(
                       debugShowCheckedModeBanner: false,
                        title: 'Material App',
                        home: MyPanel()))))
        );
      },
      
      child: Text("Continuar"),
    
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
    SizedBox(
      height: 20,
    ),
  ],
),
            ],
          ),
        ),
      ),
    );
  }
}
