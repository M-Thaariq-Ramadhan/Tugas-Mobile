import 'dart:io';

void main() {
  String correctUsername = "Thariq";
  String correctPassword = "07352211165";

  print("=== Login Sederhana ===");

  stdout.write("Masukkan Username: ");
  String? username = stdin.readLineSync();

  stdout.write("Masukkan Password: ");
  String? password = stdin.readLineSync();

  if (username == correctUsername && password == correctPassword) {
    print("\nLogin berhasil!");
  } else {
    print("\nLogin gagal!");
  }
}
