class ProdukDigital {
  String namaProduk;
  double harga;
  String kategori;

  ProdukDigital(this.namaProduk, this.harga, this.kategori);

  void terapkanDiskon() {
    if (kategori == 'NetworkAutomation') {
      harga *= 0.9; 
      print('Diskon diterapkan. Harga baru: Rp $harga');
    } else {
      print('Produk ini tidak mendapat diskon.');
    }
  }
}

abstract class Karyawan {
  String nama;
  int umur;

  Karyawan(this.nama, this.umur);

  void bekerja();
}

  class Mahasiswa {
  String nama;
  String npm;
  String kelas;

  
  Mahasiswa(this.nama, this.npm,this.kelas);

  void tampilkanData() {
    print('Nama: $nama');
    print('NPM: $npm');
    print('kelas:$kelas');
  }
}

void main() {
  // Membuat objek dari kelas Mahasiswa
  var mahasiswa1 = Mahasiswa('dina', '07352211095','if2');
  
  // Menampilkan data mahasiswa
  mahasiswa1.tampilkanData();
}

class KaryawanTetap extends Karyawan {
  KaryawanTetap(super.nama, super.umur);

  @override
  void bekerja() {
    print('$nama, Karyawan Tetap, bekerja full-time.');
  }
}

class KaryawanKontrak extends Karyawan {
  KaryawanKontrak(super.nama, super.umur);

  @override
  void bekerja() {
    print('$nama, Karyawan Kontrak, bekerja part-time.');
  }
}

class Pegawai {
  String nama;
  int? umur;
  String? peran;

  Pegawai(this.nama, {this.umur, this.peran});
}


mixin Kinerja {
  int produktivitas = 0;

  void tingkatkanProduktivitas() {
    produktivitas += 10;
    print('Produktivitas naik menjadi $produktivitas');
  }
}

class Manager extends Karyawan with Kinerja {
  Manager(super.nama, super.umur);

  @override
  void bekerja() {
    if (produktivitas < 85) {
      produktivitas = 85; 
    }
    print('$nama, Manager, produktivitas: $produktivitas');
  }
}


enum FaseProyek { Perencanaan, Pengembangan, Evaluasi }

class Proyek {
  FaseProyek faseProyek;

  Proyek(this.faseProyek);

  void lanjutkanFase() {
    if (faseProyek == FaseProyek.Evaluasi) {
      print('Proyek telah selesai.');
    } else {
      switch (faseProyek) {
        case FaseProyek.Perencanaan:
          print('Fase Perencanaan selesai. Melanjutkan ke Pengembangan.');
          faseProyek = FaseProyek.Pengembangan;
          break;
        case FaseProyek.Pengembangan:
          print('Fase Pengembangan selesai. Melanjutkan ke Evaluasi.');
          faseProyek = FaseProyek.Evaluasi;
          break;
        default:
          break;
      }
    }
  }
}


class Perusahaan {
  List<Karyawan> karyawanAktif = [];
  List<Karyawan> karyawanNonAktif = [];
  static const int maxKaryawanAktif = 20;

  void tambahkanKaryawan(Karyawan karyawan) {
    if (karyawanAktif.length < maxKaryawanAktif) {
      karyawanAktif.add(karyawan);
      print('${karyawan.nama} berhasil ditambahkan sebagai karyawan aktif.');
    } else {
      print('Tidak bisa menambah ${karyawan.nama}. Batas karyawan aktif tercapai.');
    }
  }

  void karyawanResign(Karyawan karyawan) {
    if (karyawanAktif.contains(karyawan)) {
      karyawanAktif.remove(karyawan);
      karyawanNonAktif.add(karyawan);
      print('${karyawan.nama} telah resign dan kini menjadi karyawan non-aktif.');
    } else {
      print('${karyawan.nama} tidak ditemukan di daftar karyawan aktif.');
    }
  }
}

void main() {
  // Bagian 1
  var produk = ProdukDigital('Firewall', 12000, 'NetworkAutomation');
  produk.terapkanDiskon();
   var karyawanTetap = KaryawanTetap('Budi', 30);
  var karyawanKontrak = KaryawanKontrak('Ani', 25);
  karyawanTetap.bekerja();
  karyawanKontrak.bekerja();

  var pegawai = Pegawai('Siti', umur: 28, peran: 'Manager');
  print('Pegawai: ${pegawai.nama}, Umur: ${pegawai.umur}, Peran: ${pegawai.peran}');

  var manager = Manager('Susi', 35);
  manager.tingkatkanProduktivitas();
  manager.bekerja();

  var proyek = Proyek(FaseProyek.Perencanaan);
  proyek.lanjutkanFase();
  proyek.lanjutkanFase();
  proyek.lanjutkanFase();

  var perusahaan = Perusahaan();
  perusahaan.tambahkanKaryawan(karyawanTetap);
  perusahaan.tambahkanKaryawan(karyawanKontrak);
  perusahaan.karyawanResign(karyawanKontrak);
}
