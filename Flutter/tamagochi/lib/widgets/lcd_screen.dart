import 'package:flutter/material.dart';
import 'lcd_painter.dart';
import '../models/pet_state.dart'; // Importamos o enum PetState

class LCDScreen extends StatelessWidget {
  static const int gridWidth = 64; // Número de pixels na largura
  static const int gridHeight = 64; // Número de pixels na altura

  final PetState petState; // Estado do bichinho

  const LCDScreen({super.key, required this.petState});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calcula o tamanho de cada pixel para garantir que sejam quadrados
        final double pixelSize = (constraints.maxWidth / gridWidth < constraints.maxHeight / gridHeight)
            ? constraints.maxWidth / gridWidth // Baseado na largura
            : constraints.maxHeight / gridHeight; // Baseado na altura

        // Calcula o tamanho total da grade de pixels
        final double gridTotalWidth = pixelSize * gridWidth;
        final double gridTotalHeight = pixelSize * gridHeight;

        // Centraliza a grade na tela
        final double offsetX = (constraints.maxWidth - gridTotalWidth) / 2;
        final double offsetY = (constraints.maxHeight - gridTotalHeight) / 2;

        return CustomPaint(
          size: Size(constraints.maxWidth, constraints.maxHeight),
          painter: LCDPainter(
            pixelSize: pixelSize,
            gridWidth: gridWidth,
            gridHeight: gridHeight,
            offsetX: offsetX,
            offsetY: offsetY,
            petState: petState, // Passamos o estado do bichinho
          ),
        );
      },
    );
  }
}