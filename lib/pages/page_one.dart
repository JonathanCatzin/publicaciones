import 'package:flutter/material.dart';
import 'package:home_page/main.dart';
import 'package:home_page/pages/page_two.dart';
import 'package:home_page/provider/feelings_provider.dart';
import 'package:provider/provider.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

// bool isSelectedEstresada = false;
// bool isSelectedFeliz = false;
// bool isSelectedTriste= false;
// bool isSelectedEnojada = false;

class _PageOneState extends State<PageOne> {
  bool _isEstresadaSelected = false;
  bool _isFelizSelected = false;
  bool _isTristeSelected = false;
  bool _isEnojadaSelected = false;
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    Provider.of<FeelingsProvider>(context, listen: false).GetFeelings();
  }

  void _toggleButton() {
    setState(() {
      _isButtonDisabled = !(_isEstresadaSelected &&
          _isFelizSelected &&
          _isTristeSelected &&
          _isEnojadaSelected);
    });
  }

  void _toggleEstresada() {
    setState(() {
      _isEstresadaSelected = !_isEstresadaSelected;
      _toggleButton();
    });
  }

  void _toggleFeliz() {
    setState(() {
      _isFelizSelected = !_isFelizSelected;
      _toggleButton();
    });
  }

  void _toggleTriste() {
    setState(() {
      _isTristeSelected = !_isTristeSelected;
      _toggleButton();
    });
  }

  void _toggleEnojada() {
    setState(() {
      _isEnojadaSelected = !_isEnojadaSelected;
      _toggleButton();
    });
  }

  bool _areThreeSelected() {
    int count = 0;
    if (_isEstresadaSelected) count++;
    if (_isFelizSelected) count++;
    if (_isTristeSelected) count++;
    if (_isEnojadaSelected) count++;
    return count == 3;
  }

  int _selectedCount = 0;

  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Por favor selecciona tres emociones antes de continuar'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // ...
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
        body: Consumer<FeelingsProvider>(
          builder: (context, feelinsProvider, child) =>
              feelinsProvider.feelings.isEmpty
                  ? Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Servicios No encontrados')
                      ],
                    ))
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '¡Nos importas mucho! Queremos saber cómo te sientes hoy, ¿podrías compartirnos un poco acerca de tu estado de ánimo?(Selecciona 3)',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: Image.asset(
                                  'assets/emociones.gif',
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (_isEstresadaSelected) {
                                      _isEstresadaSelected = false;
                                      _selectedCount--;
                                    } else {
                                      _isEstresadaSelected = true;
                                      _selectedCount++;
                                    }
                                  });
                                },
                                child: Consumer<FeelingsProvider>(
                                  builder: (context, feelingsProvider, child) {
                                    return Text(
                                        feelingsProvider.feelings[0].nombre);
                                  },
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: _isEstresadaSelected
                                      ? Color.fromARGB(255, 128, 30, 173)
                                      : Colors.deepPurple,
                                  onPrimary: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  minimumSize: Size(100, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (_isFelizSelected) {
                                      _isFelizSelected = false;
                                      _selectedCount--;
                                    } else {
                                      _isFelizSelected = true;
                                      _selectedCount++;
                                    }
                                  });
                                },
                                child: Consumer<FeelingsProvider>(
                                  builder: (context, feelingsProvider, child) {
                                    return Text(
                                        feelingsProvider.feelings[1].nombre);
                                  },
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: _isFelizSelected
                                      ? Color.fromARGB(255, 128, 30, 173)
                                      : Colors
                                          .deepPurple, // Color de fondo del botón
                                  onPrimary:
                                      Colors.white, // Color del texto del botón
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  minimumSize: Size(100, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (_isTristeSelected) {
                                      _isTristeSelected = false;
                                      _selectedCount--;
                                    } else {
                                      _isTristeSelected = true;
                                      _selectedCount++;
                                    }
                                  });
                                },
                                child: Consumer<FeelingsProvider>(
                                  builder: (context, feelingsProvider, child) {
                                    return Text(
                                        feelingsProvider.feelings[2].nombre);
                                  },
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: _isTristeSelected
                                      ? Color.fromARGB(255, 128, 30, 173)
                                      : Colors
                                          .deepPurple, // Color de fondo del botón
                                  onPrimary:
                                      Colors.white, // Color del texto del botón
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  minimumSize: Size(100, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (_isEnojadaSelected) {
                                      _isEnojadaSelected = false;
                                      _selectedCount--;
                                    } else {
                                      _isEnojadaSelected = true;
                                      _selectedCount++;
                                    }
                                  });
                                },
                                child: Consumer<FeelingsProvider>(
                                  builder: (context, feelingsProvider, child) {
                                    return Text(
                                        feelingsProvider.feelings[3].nombre);
                                  },
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: _isEnojadaSelected
                                      ? Color.fromARGB(255, 128, 30, 173)
                                      : Colors
                                          .deepPurple, // Color de fondo del botón
                                  onPrimary:
                                      Colors.white, // Color del texto del botón
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  minimumSize: Size(100, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              if (_selectedCount == 3) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PageTwo()),
                                );
                              } else {
                                _showAlertDialog(context);
                              }
                            },
                            child: Text("Continuar"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 20),
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
                    ),
        ),
      ),
    );
  }
}
