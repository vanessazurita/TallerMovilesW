import 'package:flutter/material.dart';
import '../modelo/clima_modelo.dart';
import '../controlador/clima_controlador.dart';
import 'clima_widget.dart';

class ClimaVista extends StatefulWidget {
  @override
  ClimaVistaState createState() => ClimaVistaState();
}

class ClimaVistaState extends State<ClimaVista> {
  final TextEditingController ciudadC = TextEditingController();
  final ClimaControlador climaC = ClimaControlador();
  ClimaModelo? climaModelo;
  bool isLoading = false;

  void obtenerClima() async {
    setState(() {
      isLoading = true;
    });
    try {
      ClimaModelo? clima = await climaC.obtenerClima(ciudadC.text);
      setState(() {
        climaModelo = clima;
      });
    } catch (e) {
      setState(() {
        climaModelo = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al obtener el clima')));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clima'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo de texto para ingresar la ciudad
            TextField(
              controller: ciudadC,
              decoration: InputDecoration(
                labelText: 'Ingrese la ciudad',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Botón para obtener el clima
            ElevatedButton(
              onPressed: obtenerClima,
              child: Text('Consultar Clima'),
            ),
            SizedBox(height: 20),
            // Mostrar cargando si es necesario
            if (isLoading)
              CircularProgressIndicator()
            else if (climaModelo != null)
              // Mostrar los datos del clima si están disponibles
              ClimaWidget(
                ciudad: climaModelo!.ciudad,
                temperatura: climaModelo!.temperatura,
                descripcion: climaModelo!.descripcion,
              )
            else
              Text('No se ha obtenido el clima'),
          ],
        ),
      ),
    );
  }
}