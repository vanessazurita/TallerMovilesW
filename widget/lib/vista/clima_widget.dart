import 'package:flutter/material.dart';

class ClimaWidget extends StatelessWidget {
  final String ciudad;
  final double temperatura;
  final String descripcion;

  const ClimaWidget({
    Key? key,
    required this.ciudad,
    required this.temperatura,
    required this.descripcion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        width: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              ciudad,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Icon(Icons.sunny, size: 50, color: Colors.yellow),
            SizedBox(height: 20),

            Text(
              '${temperatura.toStringAsFixed(1)} °C',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 20),
            Text(
              descripcion,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: const Color.fromARGB(255, 204, 230, 252),
              ),
            ),
          ],
        ),
      )

    );
  }
}