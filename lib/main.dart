import 'package:flutter/material.dart';

void main() => runApp(TemperatureConverterApp());

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  final TextEditingController _controller = TextEditingController();
  String _convertedValue = '';
  String _selectedConversion = 'FtoC';
  List<String> _conversionHistory = [];

  void _convertTemperature() {
    double userTemp = double.tryParse(_controller.text) ?? 0;
    double convertedTemp;

    if (_selectedConversion == 'FtoC') {
      convertedTemp = (userTemp - 32) * 5 / 9;
    } else {
      convertedTemp = (userTemp * 9 / 5) + 32;
    }

    setState(() {
      _convertedValue = convertedTemp.toStringAsFixed(1);
      _conversionHistory.insert(
        0,
        '${_selectedConversion == 'FtoC' ? 'F to C' : 'C to F'}: $userTemp ➡ ${_convertedValue}',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
            color:Colors.grey // Change this color as needed
        ),

        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Conversion:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title:  const Text('Fahrenheit to Celsius'),
                    leading: Radio(
                      value: 'FtoC',
                      groupValue: _selectedConversion,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedConversion = value!;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('Celsius to Fahrenheit'),
                    leading: Radio(
                      value: 'CtoF',
                      groupValue: _selectedConversion,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedConversion = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter temperature',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  '=',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    _convertedValue,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertTemperature,
              child: const Text('CONVERT'),

            ),

            Expanded(
              child: ListView.builder(
                itemCount: _conversionHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_conversionHistory[index]),

                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
