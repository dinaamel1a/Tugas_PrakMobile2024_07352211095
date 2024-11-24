import 'package:flutter/material.dart';
import 'package:flutter_application_1/cartPage.dart';
void main() {
  runApp(AplikasiECommerce());
}

class AplikasiECommerce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // Mulai dengan SplashScreen
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Pindah ke halaman utama setelah 4 detik
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HalamanUtama()),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tambahkan logo atau animasi di sini
            Image.asset(
              'assets/images/logotas.png', // Ganti dengan path logo Anda
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            Text(
              "Selamat Datang di dinshop",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// HalamanUtama tetap seperti yang sudah Anda buat
class HalamanUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.grey),
          onPressed: () {
            // Add functionality for menu icon if needed
          },
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/images/logotas.png', // Replace with your icon image path
              width: 35,
              height: 35,
            ),
            SizedBox(width: 8), // Adds space between icon and text
            Text(
              'dinshop',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.grey),
            onPressed: () {},
          ),
         IconButton(
  icon: Icon(Icons.shopping_cart, color: Colors.grey),
  onPressed: () {
    // Navigasi ke halaman keranjang
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartPage()),
    );
  },
),
        ]
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar with icon
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search here',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Banner Promo
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(16),
                color: const Color.fromARGB(255, 248, 158, 109),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Penawaran Hari Ini\nDiskon 50%',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Hanya untuk item terpilih.',
                            style: TextStyle(color: const Color.fromARGB(255, 109, 127, 131)),
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('BELI SEKARANG'),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/profil_website.jpeg',
                      width: 290,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),

            // Freelancer Teratas
SectionHeader(judul: 'Penilaian Teratas', onLihatSemua: () {}),
SizedBox(
  height: 150, // Tinggi total untuk gambar, keterangan, dan rating
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 5,
    itemBuilder: (context, index) {
      // Daftar gambar, keterangan, dan rating
      List<String> imageUrls = [
        'assets/images/tas1.jpeg',
        'assets/images/tas2.jpeg',
        'assets/images/tas3.jpeg',
        'assets/images/tas4.jpeg',
        'assets/images/tas5.jpeg',
      ];
      List<String> captions = [
        'Clarisha Bag',
        'Vintage Bag Honey',
        'Vinolla Bag',
        'Yogodlns Bag',
        'Elizabeth bag',
      ];
      List<double> ratings = [4.5, 4.7, 4.8, 4.3, 4.9];

      return Container(
        width: 100, // Lebar item
        margin: EdgeInsets.symmetric(horizontal: 8.0), // Spasi antar item
        child: Column(
          children: [
            // Gambar berbentuk bulat
            ClipOval(
              child: Container(
                height: 80, // Ukuran lingkaran
                width: 80,
                child: Image.asset(
                  imageUrls[index],
                  fit: BoxFit.cover, // Menyesuaikan gambar ke lingkaran
                ),
              ),
            ),
            SizedBox(height: 8), // Spasi antara gambar dan teks
            // Keterangan gambar
            Text(
              captions[index], // Keterangan berdasarkan indeks
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, // Pusatkan teks
              maxLines: 2, // Maksimal 2 baris
              overflow: TextOverflow.ellipsis, // Tambahkan "..." jika teks terlalu panjang
            ),
            SizedBox(height: 4), // Spasi antara teks dan rating
            // Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 14), // Ikon bintang
                SizedBox(width: 4), // Spasi antara ikon dan rating
                Text(
                  ratings[index].toString(), // Rating berdasarkan indeks
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      );
    },
  ),
),


            // Layanan Teratas
// Layanan Teratas
// Layanan Teratas dengan SingleChildScrollView
SectionHeader(judul: 'Layanan Teratas', onLihatSemua: () {}),
SingleChildScrollView(
  child: Column(
    children: List.generate(3, (index) {
      // Daftar data layanan
      List<Map<String, dynamic>> layananData = [
        {
          'imageUrl': 'assets/images/batambag.jpeg',
          'namaLayanan': 'Batam Bag',
          'kategori': 'Fashion',
          'deskripsi': 'Tas elegan cocok untuk semua suasana.',
          'rating': 4.8,
        },
        {
          'imageUrl': 'assets/images/hanamibag.jpeg',
          'namaLayanan': 'Hanami Bag',
          'kategori': 'Fashion',
          'deskripsi': 'Tas mewah dengan desain modern.',
          'rating': 4.7,
        },
        {
          'imageUrl': 'assets/images/honyanbag.jpeg',
          'namaLayanan': 'Honyan Bag',
          'kategori': 'Fashion',
          'deskripsi': 'Tas bergaya klasik yang memikat.',
          'rating': 4.9,
        },
      ];

      return ServiceCard(
        imageUrl: layananData[index]['imageUrl'],
        namaLayanan: layananData[index]['namaLayanan'],
        kategori: layananData[index]['kategori'],
        rating: layananData[index]['rating'].toString(),
      );
    }),
  ),
),


            // Best Bookings Section with Promo Banner
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(16),
                color: const Color.fromARGB(255, 248, 158, 109),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Penawaran Hari Ini\nDiskon 60%',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Semua layanan tersedia dalam waktu terbatas!',
                            style: TextStyle(color: const Color.fromARGB(255, 109, 127, 131)),
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.timer, color: Color.fromARGB(255, 109, 127, 131)),
                              SizedBox(width: 4),
                              Text('06:34:15', style: TextStyle(color: Color.fromARGB(255, 109, 127, 131))),
                            ],
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Beli Sekarang'),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/profil_websitee.png',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            // Placeholder for Pemesanan Terbaik section
// Bagian Pemesanan Terbaik
SectionHeader(judul: 'Pemesanan Terbaik', onLihatSemua: () {}),

ListView.builder(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(), // Agar tidak scroll sendiri
  itemCount: 2, // Jumlah pemesanan terbaik (sesuai screenshot)
  itemBuilder: (context, index) {
    List<Map<String, dynamic>> pemesananData = [
      {
        'imageUrl': 'assets/images/ollembag.jpeg',
        'nama': 'Ollem Bag',
        'kategori': 'Fashion',
        'deskripsi': 'Occacati aut nam beatae quo non deserunt consequuntur.',
        'rating': 4.9,
      },
      {
        'imageUrl': 'assets/images/honyanbag.jpeg',
        'nama': 'Honyan Bag',
        'kategori': 'Fashion',
        'deskripsi': 'Occacati aut nam beatae quo non deserunt consequuntur.',
        'rating': 4.9,
      },
    ];

    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar header
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              pemesananData[index]['imageUrl'],
              height: 350,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Foto profil bulat
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(pemesananData[index]['imageUrl']),
                ),
                SizedBox(width: 16), // Spasi antara foto dan teks
                // Detail layanan
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pemesananData[index]['nama'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        pemesananData[index]['kategori'],
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                      SizedBox(height: 8),
                      Text(
                        pemesananData[index]['deskripsi'],
                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                        maxLines: 8,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 10),
                          Text(
                            pemesananData[index]['rating'].toString(),
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  },
),
            // Placeholder for Pemesanan Terbaik section
           // Bagian Rekomendasi Workshop
// Bagian Rekomendasi Workshop dalam Grid 2x2
SectionHeader(judul: 'Rekomendasi', onLihatSemua: () {}),

GridView.builder(
  physics: NeverScrollableScrollPhysics(), // Agar tidak scroll, hanya bagian body yang scroll
  shrinkWrap: true, // Menyesuaikan tinggi grid dengan kontennya
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2, // Jumlah kolom
    crossAxisSpacing: 2.0, // Spasi horizontal antar item
    mainAxisSpacing: 8.0, // Spasi vertikal antar item
    childAspectRatio: 2 / 2, // Rasio aspek item (lebar : tinggi)
  ),
  itemCount: 4, // Jumlah workshop yang ditampilkan (2x2 = 4)
  itemBuilder: (context, index) {
    // Data workshop
    List<Map<String, dynamic>> workshopData = [
      {
        'imageUrl': 'assets/images/tas1.jpeg',
        'nama': 'Vinolla Bag',
        'rating': 4.9,
      },
      {
        'imageUrl': 'assets/images/tas2.jpeg',
        'nama': 'Clarisha Bag',
        'rating': 4.8,
      },
      {
        'imageUrl': 'assets/images/tas3.jpeg',
        'nama': 'Yogodlns Bag',
        'rating': 4.7,
      },
      {
        'imageUrl': 'assets/images/ollembag.jpeg',
        'nama': 'Vintage Bag Honey',
        'rating': 4.6,
      },
    ];

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar workshop
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
            child: Image.asset(
              workshopData[index]['imageUrl'], // Perbaikan key tanpa spasi
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama workshop
                Text(
                  workshopData[index]['nama'],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2),
                // Rating workshop
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 2),
                    Text(
                      workshopData[index]['rating'].toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  },
),



          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.book_online), label: 'blog'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String judul;
  final VoidCallback onLihatSemua;

  SectionHeader({required this.judul, required this.onLihatSemua});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            judul,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: onLihatSemua,
            child: Text('Lihat Semua'),
          ),
        ],
      ),
    );
  }
}

class CircleAvatarWithText extends StatelessWidget {
  final String imageUrl;
  final String nama;
  final String rating;

  CircleAvatarWithText({
    required this.imageUrl,
    required this.nama,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imageUrl),
          ),
          SizedBox(height: 4),
          Text(nama, style: TextStyle(fontSize: 12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: const Color.fromARGB(255, 248, 247, 245), size: 12),
              Text(rating, style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

// Updated ServiceCard widget with image on the left
class ServiceCard extends StatelessWidget {
  final String imageUrl;
  final String namaLayanan;
  final String kategori; // Tambahan kategori
  final String rating;

  ServiceCard({
    required this.imageUrl,
    required this.namaLayanan,
    required this.kategori, // Parameter kategori
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Layer bawah: gambar besar
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imageUrl,
              width:220,
              height: 220,
              fit: BoxFit.fill,
            ),
          ),
          // Layer atas: card informasi
          Positioned(
            left: 90,
            bottom: 25, // untuk membuat card informasi terlihat menumpuk
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8)],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(imageUrl),
                    radius: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          namaLayanan,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          kategori,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 249, 135, 49),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          kategori,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Color.fromARGB(255, 239, 244, 106), size: 20),
                            const SizedBox(width: 4),
                            Text(
                              rating.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 243, 171, 38),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Book Now",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}