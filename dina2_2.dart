enum StatusMahasiswa {
  aktif,
  cuti,
  lulus,
  dropout,
}

abstract class Person {
  String nama;

  Person(this.nama);

  void perkenalanDiri();
}

class Dosen extends Person {
  String matkul;

  Dosen(super.nama, this.matkul);
 
  @override
  void perkenalanDiri() {
    print('Halo, saya $nama, dosen pengajar mata kuliah $matkul.');
  }
}

mixin Kinerja {
  int produktivitas = 100;

  void tingkatkanProduktivitas() {
    produktivitas += 10;
    print('Produktivitas meningkat menjadi $produktivitas.');
  }
}

class Mahasiswa {
  String nama;
  String npm;
  String jurusan;
  double _ipk; 

  Mahasiswa(this.nama, this.npm, {required this.jurusan, required double ipk}) : _ipk = ipk;

  double get ipk => _ipk;
  set ipk(double nilai) {
    if (nilai >= 0.0 && nilai <= 4.0) {
      _ipk = nilai;
    } else {
      print('Nilai IPK harus antara 0.0 dan 4.0');
    }
  }

  void belajar() {
    print('$nama sedang belajar.');
  }
}

class MahasiswaAktif extends Mahasiswa {
  int semester;

  MahasiswaAktif(super.nama, super.npm, {required super.jurusan, required super.ipk, required this.semester});

  @override
  void belajar() {
    print('$nama, mahasiswa aktif semester $semester, sedang belajar.');
  }
}

class MahasiswaBerprestasi extends Mahasiswa with Kinerja {
  MahasiswaBerprestasi(super.nama, super.npm, {required super.jurusan, required super.ipk});

  void capaiPrestasi() {
    tingkatkanProduktivitas();
    print('$nama telah mencapai prestasi dengan produktivitas $produktivitas.');
  }
}

class MahasiswaStatus extends Mahasiswa {
  StatusMahasiswa status;

  MahasiswaStatus(super.nama, super.npm, {required super.jurusan, required super.ipk, required this.status});

  void tampilkanStatus() {
    print('$nama saat ini berstatus $status.');
  }
}

void main() {
  var mhs1 = Mahasiswa('dina', '123456', jurusan: 'Teknik Informatika', ipk: 3.5);
  mhs1.belajar();
  mhs1.ipk = 3.7; 
  print('IPK dina: ${mhs1.ipk}'); 
  var mhsAktif = MahasiswaAktif('dini', '654321', jurusan: 'Teknik Mesin', ipk: 3.2, semester: 5);
  mhsAktif.belajar();

  var mhsBerprestasi = MahasiswaBerprestasi('azila', '789101', jurusan: 'Teknik Kimia', ipk: 3.9);
  mhsBerprestasi.capaiPrestasi();

  var dosen = Dosen('Pak Yanto', 'Pemrograman');
  dosen.perkenalanDiri();

  var mhsStatus = MahasiswaStatus('alisa', '111213', jurusan: 'Biologi', ipk: 3.6, status: StatusMahasiswa.aktif);
  mhsStatus.tampilkanStatus();
}