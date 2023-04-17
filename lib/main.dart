import 'package:flutter/material.dart';
import 'package:home_page/pages/page_one.dart';
import 'package:home_page/provider/feelings_provider.dart';
import 'package:provider/provider.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: homeScreen(),
    );
  }
}

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Powerfullmind',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Piensa,sueña, cree y atrevete',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade600,
                  ),
                )
              ],
            ),
            Image.asset('assets/logo1.png'),
            Column(
              children: [
                ElevatedButton( //PRIMER BOTON
                  onPressed: () {
                    
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ChangeNotifierProvider( create: (BuildContext context) =>
                    FeelingsProvider(), 
                    child: (const MaterialApp(
                       debugShowCheckedModeBanner: false,
                        title: 'Material App',
                        home: PageOne ()))))
                     );
                  },
                  child: Text("Iniciar sesión"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton( //SEGUNDO BOTON 
                    onPressed:
                    () {},

                  child: Text(
                    "Registrate",
                    style: TextStyle(color: Colors.purple.shade200),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                    side: BorderSide(color: Colors.purpleAccent.shade100),
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ));
  }
}
