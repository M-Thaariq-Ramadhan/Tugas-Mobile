// SmartRide.dart

// ====== KELAS ABSTRAK ======
abstract class Transportasi {
  String id, nama;
  double _tarifDasar;
  int kapasitas;

  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);

  double get tarifDasar => _tarifDasar;

  double hitungTarif(int jumlahPenumpang);

  void tampilInfo() {
    print("[$id] $nama | Tarif Dasar: $_tarifDasar | Kapasitas: $kapasitas");
  }
}

// ====== KELAS TURUNAN TAKSI ======
class Taksi extends Transportasi {
  double jarak;

  Taksi(super.id, super.nama, super._tarifDasar, super.kapasitas, this.jarak);

  @override
  double hitungTarif(int jumlahPenumpang) => tarifDasar * jarak;
}

// ====== KELAS TURUNAN BUS ======
class Bus extends Transportasi {
  bool adaWifi;

  Bus(super.id, super.nama, super._tarifDasar, super.kapasitas, this.adaWifi);

  @override
  double hitungTarif(int jumlahPenumpang) =>
      (tarifDasar * jumlahPenumpang) + (adaWifi ? 5000 : 0);
}

// ====== KELAS TURUNAN PESAWAT ======
class Pesawat extends Transportasi {
  String kelas;

  Pesawat(super.id, super.nama, super._tarifDasar, super.kapasitas, this.kelas);

  @override
  double hitungTarif(int jumlahPenumpang) =>
      tarifDasar * jumlahPenumpang * (kelas == "Bisnis" ? 1.5 : 1.0);
}

class Pemesanan {
  String idPemesanan, namaPelanggan;
  Transportasi transportasi;
  int jumlahPenumpang;
  double totalTarif;

  Pemesanan(
    this.idPemesanan,
    this.namaPelanggan,
    this.transportasi,
    this.jumlahPenumpang,
    this.totalTarif,
  );

  void cetakStruk() {
    print("\n=== STRUK PEMESANAN ===");
    print("ID Pemesanan : $idPemesanan");
    print("namaPelanggan : $namaPelanggan");
    print("ID Pemesanan : ${transportasi.nama}");
    print("JumlahPenumpang : $jumlahPenumpang");
    print("TotalTarif : Rp${totalTarif.toStringAsFixed(2)}");
  }

  Map<String, dynamic> toMap() => {
    "idPemesanan": idPemesanan,
    "namaPelanggan": namaPelanggan,
    "transportasi": transportasi.nama,
    "jumlahPenumpang": jumlahPenumpang,
    "totalTarif": totalTarif,
  };
}

Pemesanan buatPemesanan(Transportasi t, String nama, int jumlahPenumpang) {
  return Pemesanan(
    "PSN ${DateTime.now().millisecondsSinceEpoch}",
    nama,
    t,
    jumlahPenumpang,
    t.hitungTarif(jumlahPenumpang),
  );
}

void tampilSemuaPemesanan(List<Pemesanan> daftar) {
  for (var p in daftar) {
    p.cetakStruk();
  }
}

void main() {
  var taksi = Taksi("T01", "Blue", 7000, 4, 12.5);
  var bus = Bus("B01", "Trans", 15000, 40, true);
  var pesawat = Pesawat("P01", "Sriwijaya", 500000, 180, "Bisnis");

  var daftar = [
    buatPemesanan(taksi, "Thariq", 1),
    buatPemesanan(bus, "bimskuy", 20),
    buatPemesanan(pesawat, "pur", 2),
  ];
  tampilSemuaPemesanan(daftar);
}
