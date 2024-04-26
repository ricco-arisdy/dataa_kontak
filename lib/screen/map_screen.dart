import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  final Function(String) onLocationSelected;
  const MapScreen({super.key, required this.onLocationSelected});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}