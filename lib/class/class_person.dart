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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama': nama,
      'email': email,
      'gambar': gambar,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      nama: map['nama'] as String,
      email: map['email'] as String,
      gambar: map['gambar'] as String,
    );
  }
}