import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Converter',
    
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        primarySwatch: Colors.blue,
      ),
      home: const MoneyConverter(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MoneyConverter extends StatefulWidget {
  const MoneyConverter({super.key});

  @override
  State<MoneyConverter> createState() => _MoneyConverterState();
}

class _MoneyConverterState extends State<MoneyConverter> {
  final TextEditingController _usdController = TextEditingController();
  String _convertedAmount = '';
  final double _usdToBdtRate = 121.0; // Example fixed rate

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Money Converter',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
        backgroundColor: Colors.blue[700],
        
      ),
      body: Center(
        child: Card(
          elevation: 15,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Enter amount in USD',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _usdController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'USD',
                    prefixIcon: Icon(Icons.attach_money),
                    hintText: 'Enter amount in USD',
                  ),
                  onChanged: (value) {
                    final usd = double.tryParse(value);
                    if (usd != null) {
                      setState(() {
                        _convertedAmount = '৳ ${(usd * _usdToBdtRate).toStringAsFixed(2)}';
                      });
                    } else {
                      setState(() {
                        _convertedAmount = 'Invalid input';
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    final usd = double.tryParse(_usdController.text);
                    if (usd != null) {
                      setState(() {
                        _convertedAmount = '৳ ${(usd * _usdToBdtRate).toStringAsFixed(2)}';
                      });
                    } else {
                      setState(() {
                        _convertedAmount = 'Invalid input';
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700], // Button color
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text(
                    'Convert to BDT',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  _convertedAmount,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
