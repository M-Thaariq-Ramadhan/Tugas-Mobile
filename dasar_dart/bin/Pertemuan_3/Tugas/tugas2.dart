import 'dart:io';

void main() {
  // Program Sistem Penilaian Mahasiswa
  print("=== Program Sistem Penilaian Mahasiswa ===");

  // Meminta input skor dari  pengguna yaitu mahasiswa
  stdout.write("Masukkan skor Anda (0 - 100): ");
  String? input = stdin.readLineSync();

  // Cek apakah input tidak kosong dan bisa dikonversi ke angka
  if (input != null) {
    int? skor = int.tryParse(input);

    // Validasi input
    if (skor == null) {
      print("Error: Input bukan angka!");
    } else if (skor < 0 || skor > 100) {
      print("Error: Skor harus dalam rentang 0 - 100.");
    } else {
      // Tentukan grade berdasarkan skor
      String grade;
      if (skor >= 85 && skor <= 100) {
        grade = "A";
      } else if (skor >= 70 && skor <= 84) {
        grade = "B";
      } else if (skor >= 60 && skor <= 69) {
        grade = "C";
      } else if (skor >= 50 && skor <= 59) {
        grade = "D";
      } else {
        grade = "E";
      }

      // Tampilkan hasil
      print("Skor Anda: $skor");
      print("Grade Anda: $grade");
    }
  } else {
    print("Error: Input kosong!");
  }
}
