import 'dart:convert';
import 'dart:io';

import 'package:dataa_kontak/class/class_kontak.dart';
import 'package:dataa_kontak/class/class_person.dart';
import 'package:dataa_kontak/service/kontak_service.dart';

class KontakController {
  final kontakService = KontakService();

  Future<Map<String, dynamic>> addPerson(Kontak person, File? file) async {
    Map<String, String> data = {
      'nama': person.nama,
      'nama': person.email,
      'nama': person.alamat,
      'nama': person.noTelepon,
    };

    try {
      var response = await kontakService.addPerson(data, file);

      if (response.statusCode == 201) {
        return {
          'success': true,
          'message': 'Data berhasil disimpan',
        };
      } else {
        if (response.headers['content-type']!.contains('aplication/json')) {
          var decodedJson = jsonDecode(response.body);
          return {
            'success': false,
            'message': decodedJson['message'] ?? 'Terjadi Kesalahan',
          };
        }
        var decodedJson = jsonDecode(response.body);
        return {
          'success': false,
          'message':
              decodedJson['message'] ?? 'Terjadi Kesalahan saat menyimpan data',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }

  Future<List<Person>> getPeople() async {
    try {
      List<dynamic> peopleData = await kontakService.fetchPeople();
      List<Person> people =
          peopleData.map((json) => Person.fromMap(json)).toList();
      return people;
    } catch (e) {
      print(e);
    }
    throw Exception('Failed to get people');
  }
}