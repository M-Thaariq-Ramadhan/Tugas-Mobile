void main() {
  String nama = "M Thaariq Ramadhan";
  int umur = 20;
  double tinggiBadan = 177.5;
  bool statusMahasiswa = true;

  print("=== Biodata Mahasiswa ===");
  print("Nama           : $nama");
  print("Umur           : $umur tahun");
  print("Tinggi Badan   : $tinggiBadan cm");
  print(
    "Status Mahasiswa: ${statusMahasiswa ? "Masih Mahasiswa" : "Bukan Mahasiswa"}",
  );
}
