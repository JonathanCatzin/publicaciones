import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:home_page/pages/post_page.dart';
import 'package:home_page/pages/post_page.dart';
import 'package:home_page/dtos/request/post_request.dart';
import 'package:home_page/provider/publications_provider.dart';
import 'package:provider/provider.dart';

class MyPanel extends StatefulWidget {
  @override
  _MyPanelState createState() => _MyPanelState();
}

class _MyPanelState extends State<MyPanel> {
  @override
  void initState() {
    super.initState();
    Provider.of<PublicationsProvider>(context, listen: false).GetPublications();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Panel expandible',
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
        body: SingleChildScrollView(
          child: Container(
            child: _buildPanel(),
          ),
        ),
      ),
    );
  }


  Widget _buildPanel() {
    return Consumer<PublicationsProvider>(
      builder: (context, publicationssProvider, child) {
        return ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              publicationssProvider.publications[index].isExpanded =
                  !isExpanded;
            });
          },
          children: publicationssProvider.publications
              .map<ExpansionPanel>((var item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            item.imagePublicacion,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              item.tituloPublicacion,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 5),
                            Visibility(
                              visible: item.isExpanded,
                              child: Text(
                                 reduceTextTo50Words(item.cuerpoPublicacion),
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              body: buildContent(context, item.isExpanded,item
                  // padding: EdgeInsets.all(10),
                  // child: Text(item.expandedValue),
                  ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        );
      },
    );
  }

  
  String reduceTextTo50Words(String text) {
  final List<String> words = text.split(' ');
  final int numOfWords = words.length;
  final int numOfWordsToKeep = numOfWords > 15 ? 15 : numOfWords;
  final String reducedText = words.take(numOfWordsToKeep).join(' ');
  return reducedText;
}

  Widget buildContent(BuildContext context, bool isExpanded, dynamic item) {
    return Column(
      children: [
        // Text(
        //   expandedValue,
        //   style: TextStyle(fontSize: 16),
        // ),
        SizedBox(height: 10),
        if (isExpanded)
          Padding(
            padding: EdgeInsets.all(40),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostArticle(publicacion: item)),
                );
              },
              child: Text('Continuar leyendo'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                minimumSize: Size(100, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          )
      ],
    );
  }
}


