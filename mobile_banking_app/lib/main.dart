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
      backgroundColor: Colors.grey, 

      appBar: AppBar(
        title: Text('Mobile Banking'),
        backgroundColor: const Color.fromARGB(255, 42, 43, 45),
        actions: [
          Icon(Icons.notifications),
          SizedBox(width: 10),
        ],
      ),

      body: Column(
        children: [

          // HEADER
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.blue.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Halo, Alfina',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Saldo Anda',
                    style: TextStyle(color: Colors.white70, fontSize: 14)),
                SizedBox(height: 4),
                Text('Rp 10.000.000',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 15),
              ],
            ),
          ),

          // MENU ATAS
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // ❗ huruf kecil
              children: [
                menu(Icons.send, 'Transfer'),
                menu(Icons.qr_code, 'Qris'),
                menu(Icons.account_balance_wallet, 'BRIVA'),
                menu(Icons.money, 'Topup'),
              ],
            ),
          ),

          // GRID MENU
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(15),
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: [
                menuGrid(Icons.history, "Mutasi"),
                menuGrid(Icons.phone_android, "Pulsa"),
                menuGrid(Icons.receipt, "Tagihan"),
                menuGrid(Icons.savings, "Tabungan"),
                menuGrid(Icons.credit_card, "Kartu Kredit"),
                menuGrid(Icons.more_horiz, "Lainnya"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // MENU ATAS
  Widget menu(IconData icon, String title) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.blue, size: 28),
        ),
        SizedBox(height: 8),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  // MENU GRID
  Widget menuGrid(IconData icon, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.blue, size: 28),
        ),
        SizedBox(height: 8),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}