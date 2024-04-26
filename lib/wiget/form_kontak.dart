import 'dart:io';

import 'package:dataa_kontak/class/class_kontak.dart';
import 'package:dataa_kontak/controller/kontak_controller.dart';
import 'package:dataa_kontak/screen/Home_View.dart';
import 'package:dataa_kontak/screen/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormKontak extends StatefulWidget {
  const FormKontak({super.key});

  @override
  State<FormKontak> createState() => _FormKontakState();
}

class _FormKontakState extends State<FormKontak> {
  File? _image;
  final _imagePicker = ImagePicker();
  String? _alamat;

  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _alamatController = TextEditingController();
  final _emailController = TextEditingController();
  final _noTeleponController = TextEditingController();

  final KontakController _personController = KontakController();

  Future<void> getImage() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Input Data Kontak')),
        ),
        body: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Nama", hintText: "Masukkan Nama"),
                controller: _namaController,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Email", hintText: "Masukkan Email"),
                controller: _emailController,
              ),
            ),
            Container(
              width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Alamat"),
                      _alamat == null
                          ? const SizedBox(
                              width: double.infinity,
                              child: Text('Alamat kosong'))
                          : Text('$_alamat'),
                      _alamat == null
                          ? TextButton(
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MapScreen(
                                                onLocationSelected:
                                                    (selectedAddress) {
                                              setState(() {
                                                _alamat = selectedAddress;
                                              });
                                            })));
                              },
                              child: const Text('Pilih Alamat'),
                            )
                          : TextButton(
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MapScreen(
                                                onLocationSelected:
                                                    (selectedAddress) {
                                              setState(() {
                                                _alamat = selectedAddress;
                                              });
                                            })));
                                setState(() {});
                              },
                              child: const Text('Ubah Alamat'),
                            ),
                    ],
                  ),
                ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "NoTelpon", hintText: "Masukkan NoTelpon"),
                controller: _noTeleponController,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            _image == null
                ? const Text("Tidak ada gambar yang dipilih")
                : Image.file(_image!),
            Padding(
              padding: const EdgeInsets.only(bottom: 25, top: 35),
              child: ElevatedButton(
                onPressed: () {
                  getImage();
                },
                child: Text("Pilih Gambar"),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Kontak _person = Kontak(
                      nama: _namaController.text,
                      email: _emailController.text,
                      alamat: _alamat ?? '',
                      noTelepon: _noTeleponController.text,
                      foto: _image!.path,
                    );
                    // Proses simpan data
                    var result =
                        await _personController.addPerson(_person, _image);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(result['message'])),
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeView()),
                      (route) => false,
                    );
                  }
                },
                child: const Text("Submit"),
              ),
            ),
          ]),
        )));
  }
}
