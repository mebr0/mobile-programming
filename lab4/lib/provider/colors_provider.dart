import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyColor {
  final Color value;
  final String name;

  MyColor({
    required this.value,
    required this.name,
  });
}

final _colors = [
  MyColor(
    value: const Color.fromARGB(255, 153, 0, 0),
    name: 'Crimson Red',
  ),
  MyColor(
    value: const Color.fromARGB(255, 167, 13, 42),
    name: 'Carbon Red',
  ),
  MyColor(
    value: const Color.fromARGB(255, 220, 56, 31),
    name: 'Grapefruit',
  ),
  MyColor(
    value: const Color.fromARGB(255, 255, 36, 0),
    name: 'Scarlet',
  ),
  MyColor(
    value: const Color.fromARGB(255, 255, 128, 64),
    name: 'Mango Orange',
  ),
  MyColor(
    value: const Color.fromARGB(255, 248, 128, 23),
    name: 'Carrot Orange',
  ),
  MyColor(
    value: const Color.fromARGB(255, 212, 160, 23),
    name: 'Orange Gold',
  ),
  MyColor(
    value: const Color.fromARGB(255, 233, 171, 23),
    name: 'Bee Yellow',
  ),
  MyColor(
    value: const Color.fromARGB(255, 251, 177, 23),
    name: 'Beer',
  ),
  MyColor(
    value: const Color.fromARGB(255, 255, 255, 51),
    name: 'Neon Yellow',
  ),
  MyColor(
    value: const Color.fromARGB(255, 152, 255, 152),
    name: 'Mint Green',
  ),
  MyColor(
    value: const Color.fromARGB(255, 106, 251, 146),
    name: 'Dragon Green',
  ),
  MyColor(
    value: const Color.fromARGB(255, 89, 232, 23),
    name: 'Nebula Green',
  ),
  MyColor(
    value: const Color.fromARGB(255, 65, 163, 23),
    name: 'Dark Lime Green',
  ),
  MyColor(
    value: const Color.fromARGB(255, 70, 199, 199),
    name: 'Jellyfish',
  ),
  MyColor(
    value: const Color.fromARGB(255, 10, 255, 255),
    name: 'Bright Cyan',
  ),
  MyColor(
    value: const Color.fromARGB(255, 92, 179, 255),
    name: 'Crystal Blue',
  ),
  MyColor(
    value: const Color.fromARGB(255, 48, 144, 199),
    name: 'Blue Ivy',
  ),
  MyColor(
    value: const Color.fromARGB(255, 37, 84, 199),
    name: 'Sapphire Blue',
  ),
  MyColor(
    value: const Color.fromARGB(255, 137, 59, 255),
    name: 'Aztech Purple',
  ),
  MyColor(
    value: const Color.fromARGB(255, 132, 45, 206),
    name: 'Clematis Violet',
  ),
];

final colorsProvider = Provider<List<MyColor>>((ref) {
  return _colors;
});
