import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text('Mobile Banking'),
        backgroundColor: Colors.blue,
        actions: [
          Icon(Icons.notifications),
          SizedBox(width: 10),
        ],
      ),

      body: Column(
        children: [

          // HEADER
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Halo, Alfina',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Saldo Anda Rp 5.000.000'),
              ],
            ),
          ),

          // GRID MENU
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(15),
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: [
                menu(Icons.send, 'Transfer'),
                menu(Icons.account_balance_wallet, 'Top Up'),
                menu(Icons.payment, 'Pembayaran'),
                menu(Icons.history, 'Riwayat'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // WIDGET MENU
  Widget menu(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          SizedBox(height: 10),
          Text(title, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}