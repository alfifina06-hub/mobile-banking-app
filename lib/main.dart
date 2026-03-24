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

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 

      appBar: AppBar(
        title: Text(
          'BRImo',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor:Color.fromARGB(255, 105, 149, 233),
        actions: [
          Row(
            children: [
              Icon(Icons.notifications_none, color: Colors.white),
              SizedBox(width: 10),
              Icon(Icons.headset_mic, color: Colors.white),
              SizedBox(width: 5),
              Text(
                'Pusat Bantuan',
                style: TextStyle(color: Colors.white, fontSize: 14)
                ,)
            ],
          ),
         
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/lebaran.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 40, 15, 20),
              color: Colors.black.withOpacity(0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo, Alfina',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ], 
          ),
            ),
        ),
 
        Transform.translate(
          offset: Offset(0, -40),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
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
                        isHidden ?  'Rp **********' : 'Rp 1.000.000.000',
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
                      Icon(
                       Icons.visibility_off, color: Colors.white70 , size:16),),
                      SizedBox(width: 4),
                      Text(
    isHidden ? 'Tampilkan Saldo' : 'Sembunyikan Saldo', 
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
                menuGrid(Icons.send, 'Transfer', Colors.blue),
                menuGrid(Icons.account_balance_wallet, 'BRIVA', Colors.green),
                menuGrid(Icons.phone_android, "Pulsa", Colors.orange),
                menuGrid(Icons.monetization_on, 'PDAM', Colors.red),

              ],
            ),
                ],
          ),
            ),
          ),
        ), 
        SizedBox(height: 10),

        Container(
          height: 55,
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: PageView(
            controller: PageController(viewportFraction: 0.9),
            children: [ 
              promoCard("Promo Lebaran: Diskon hingga 50%"),
              promoCard("BRImo Cashback: Dapatkan cashback setiap transaksi"),
              promoCard("Gratis Biaya Admin untuk Transfer Antar Bank"),
            ],
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
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(15),
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                menuGrid(Icons.monetization_on, "Top Up", Colors.green),
                menuGrid(Icons.local_fire_department, "BRIZZi", Colors.greenAccent),
                menuGrid(Icons.receipt, "Tagihan", Colors.red),
                menuGrid(Icons.send,    "Transfer", Colors.blue),
                menuGrid(Icons.shopping_basket, "Lifestyle", Colors.pinkAccent),
                menuGrid(Icons.account_balance, "Setor & Tarik Tunai", Colors.indigo),
                menuGrid(Icons.note, "Catatan Keuangan" , Colors.brown ),
                menuGrid(Icons.support, "Investasi", Colors.yellow.shade700),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
         selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: 'Mutasi'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Aktivitas'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
    ),

    );
  }

      Widget promoCard(String text) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal:5),
    padding: EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.lightBlueAccent],
      ),
    ),
        
        child: Align(
          alignment: Alignment.centerLeft,
          child:Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
  );
}



       
      
    
  Widget menuGrid(IconData icon, String title, Color warna) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: warna.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: warna, size: 28),
        ),
        SizedBox(height: 8),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}