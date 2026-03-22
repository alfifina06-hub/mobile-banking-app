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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 

      appBar: AppBar(
        title: Text('Mobile Banking'),
        backgroundColor:Color.fromARGB(255, 105, 149, 233),
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
                colors: [Colors.blue, const Color.fromARGB(255, 43, 116, 176)],
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
                
              ],
            ),
          ),

          // MENU ATAS
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), 
                  ),
                ],
            ),
            child: Column(children: [
Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color.fromARGB(255, 14, 91, 153), Colors.blue.shade100],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Saldo Rekening Utama',
                      style: TextStyle(color: Colors.white70, fontSize: 14)),
                  SizedBox(height: 4),
                  Row(
                    children: [
                    Text(
                      isHidden ? 'Rp **********' : 'Rp 10.000.000',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isHidden = !isHidden;
                        });
                      },
                      child:
                    Icon(Icons.visibility_off, color: Colors.white70, size: 16),),
                    SizedBox(width: 4),
                    Text(
                       isHidden ? 'Sembunyikan' : 'Tampilkan',
                        style: TextStyle(color: Colors.white70, fontSize: 12)),
                        
                    ],
                    ),
                     SizedBox(height: 4),
                    Text(
                     "semua Rekeningmu",
                      style: TextStyle(color: Colors.white70, fontSize: 12)),
                  ],
                ),
),
       SizedBox(height: 15),
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: [
                menu(Icons.send, 'Transfer'),
                menu(Icons.account_balance_wallet, 'BRIVA'),
                menu(Icons.phone_android, "Pulsa"),
                menu(Icons.monetization_on, 'PDAM'),

              ],
            ),
                ],
          ),
            ),
          ),
           
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 15), 
           child: TextField(
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: "Cari layanan, produk, atau promo",
              hintStyle: TextStyle(color: Colors.white70),
              filled: true,
              fillColor: Colors.blue.shade300,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.search, color: Colors.white70),
    
            ),
           ),
           ),

          // GRID MENU
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(15),
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                menuGrid(Icons.monetization_on, "Top Up"),
                menuGrid(Icons.local_fire_department, "BRIZZi"),
                menuGrid(Icons.receipt, "Tagihan"),
                menuGrid(Icons.send,    "Transfer"),
                menuGrid(Icons.shopping_basket, "Lifestyle"),
                menuGrid(Icons.account_balance, "Setor & Tarik Tunai"),
                menuGrid(Icons.note, "Catatan Keuangan"),
                menuGrid(Icons.support, "Investasi"),
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
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.blue, size: 28),
        ),
        SizedBox(height: 8),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}