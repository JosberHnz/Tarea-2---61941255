import 'package:flutter/material.dart';

void main() => runApp(CalcApp());

class CalcApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _operation = 'Suma';
  String _result = '';

  // Función para validar y calcular el resultado
  void _calculate() {
    setState(() {
      int? num1 = int.tryParse(_num1Controller.text);
      int? num2 = int.tryParse(_num2Controller.text);

      if (num1 == null || num2 == null) {
        _result = 'Ingrese números válidos';
        return;
      }

      switch (_operation) {
        case 'Suma':
          _result = (num1 + num2).toString();
          break;
        case 'Resta':
          _result = (num1 - num2).toString();
          break;
        case 'Multiplicación':
          _result = (num1 * num2).toString();
          break;
        case 'División':
          if (num2 == 0) {
            _result = 'No se puede dividir por cero';
          } else {
            _result = (num1 / num2).toStringAsFixed(2);
          }
          break;
        default:
          _result = 'Operación desconocida';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operaciones Aritméticas'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Primer número',
                errorText: _num1Controller.text.isNotEmpty &&
                        int.tryParse(_num1Controller.text) == null
                    ? 'Ingrese un número entero válido'
                    : null,
              ),
              onChanged: (value) => _calculate(),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Segundo número',
                errorText: _num2Controller.text.isNotEmpty &&
                        int.tryParse(_num2Controller.text) == null
                    ? 'Ingrese un número entero válido'
                    : null,
              ),
              onChanged: (value) => _calculate(),
            ),
            DropdownButton<String>(
              value: _operation,
              onChanged: (String? newValue) {
                setState(() {
                  _operation = newValue!;
                  _calculate();
                });
              },
              items: <String>['Suma', 'Resta', 'Multiplicación', 'División']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Resultado: $_result',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
