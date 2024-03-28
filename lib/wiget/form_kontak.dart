import 'dart:io';

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

  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _alamatController = TextEditingController();
  final _emailController = TextEditingController();
  final _noTeleponController = TextEditingController();

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
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Alamat", hintText: "Masukkan Alamat"),
                controller: _alamatController,
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
            _image == null
                  ? Text('Tidak ada gambar yang dipilih.')
                  : Image.file(_image!),
              ElevatedButton(
                  onPressed: getImage, child: const Text('Pilih Gambar')),
          ]),
        ));
  }
}
