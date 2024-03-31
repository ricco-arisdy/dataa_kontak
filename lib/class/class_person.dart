class Person {
  String nama;
  String email;
  String gambar;
  Person({
    required this.nama,
    required this.email,
    required this.gambar,
  });

  Person copyWith({
    String? nama,
    String? email,
    String? gambar,
  }) {
    return Person(
      nama: nama ?? this.nama,
      email: email ?? this.email,
      gambar: gambar ?? this.gambar,
    );
  }
}