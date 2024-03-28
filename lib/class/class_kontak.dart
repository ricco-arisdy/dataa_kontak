class Kontak {
  final String nama;
  final String email;
  final String alamat;
  final String noTelepon;
  final String foto;

  Kontak({
    required this.nama,
    required this.email,
    required this.alamat,
    required this.noTelepon,
    required this.foto,
  });
  Kontak copyWith(
      {String? nama,
      String? email,
      String? alamat,
      String? noTelepon,
      String? foto}) {
    return Kontak(
        nama: nama ?? this.nama,
        email: email ?? this.email,
        alamat: alamat ?? this.alamat,
        noTelepon: noTelepon ?? this.noTelepon,
        foto: foto ?? this.foto);
  }

  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'email': email,
      'alamat': alamat,
      'no_telepon': noTelepon,
      'foto': foto
    };
  }
}