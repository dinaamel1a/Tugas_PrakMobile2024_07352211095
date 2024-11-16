import 'dart:async';

// Enum Role untuk menunjukkan peran pengguna
enum Role { Admin, Customer }

// Model Produk
class Product {
  String productName;
  double price;
  bool inStock;

  Product(this.productName, this.price, this.inStock);
}

// Model User
class User {
  String name;
  int age;
  late List<Product> products;
  Role? role;

  User(this.name, this.age, {this.role});

  void viewProducts() {
    if (products.isEmpty) {
      print('Tidak ada produk yang tersedia.');
    } else {
      for (var product in products) {
        print('Nama Produk: ${product.productName}, Harga: ${product.price}, InStock: ${product.inStock}');
      }
    }
  }
}

// Subclass AdminUser yang dapat menambah/menghapus produk
class AdminUser extends User {
  AdminUser(String name, int age) : super(name, age, role: Role.Admin);

  // Menambahkan produk ke daftar produk
  void addProduct(Product product) {
    if (!product.inStock) {
      throw Exception('Produk ${product.productName} tidak tersedia dalam stok!');
    }
    products.add(product);
    print('Produk ${product.productName} berhasil ditambahkan.');
  }

  // Menghapus produk dari daftar produk
  void removeProduct(String productName) {
    products.removeWhere((product) => product.productName == productName);
    print('Produk $productName berhasil dihapus.');
  }
}

// Subclass CustomerUser yang hanya bisa melihat produk
class CustomerUser extends User {
  CustomerUser(String name, int age) : super(name, age, role: Role.Customer);

  @override
  void viewProducts() {
    print('Daftar Produk untuk Pelanggan:');
    super.viewProducts();
  }
}

// Fungsi asinkron untuk mengambil detail produk
Future<void> fetchProductDetails(String productName) async {
  print('Mengambil detail untuk produk $productName...');
  await Future.delayed(Duration(seconds: 2)); // Simulasi delay
  print('Detail produk $productName berhasil diambil.');
}

void main() {
  // Daftar produk menggunakan Map dan Set untuk unik produk
  Map<String, Product> productCatalog = {
    'Laptop': Product('Laptop', 15000.0, true),
    'Smartphone': Product('Smartphone', 8000.0, true),
    'Tablet': Product('Tablet', 5000.0, false)
  };
  
  Set<String> addedProducts = {};

  // Membuat instance AdminUser
  var admin = AdminUser('Admin1', 30);
  admin.products = [];

  // Membuat instance CustomerUser
  var customer = CustomerUser('Customer1', 25);
  customer.products = [];

  // Menambahkan produk sebagai admin
  try {
    admin.addProduct(productCatalog['Laptop']!);
    admin.addProduct(productCatalog['Tablet']!); // Ini akan menyebabkan exception
  } catch (e) {
    print('Kesalahan: ${e.toString()}');
  }

  // Menampilkan produk yang tersedia untuk customer
  customer.viewProducts();

  // Mengambil detail produk secara asinkron
  fetchProductDetails('Smartphone').then((_) {
    print('Detail produk selesai diambil.');
  });
}
