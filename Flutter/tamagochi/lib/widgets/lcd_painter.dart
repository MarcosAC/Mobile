import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/pet_state.dart';

class LCDPainter extends CustomPainter {
  final double pixelSize;
  final int gridWidth;
  final int gridHeight;
  final double offsetX;
  final double offsetY;
  final PetState petState;

  const LCDPainter({
    required this.pixelSize,
    required this.gridWidth,
    required this.gridHeight,
    required this.offsetX,
    required this.offsetY,
    required this.petState,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintBackground = Paint()
      ..color = AppColors.pixelOffColor // Cinza claro para o fundo
      ..style = PaintingStyle.fill;

    final paintPet = Paint()
      ..color = AppColors.pixelOnColor // Preto para o bichinho
      ..style = PaintingStyle.fill;

    final paintBorder = Paint()
      ..color = AppColors.borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Primeiro desenha o fundo todo cinza claro
    final backgroundRect = Rect.fromLTWH(
      offsetX,
      offsetY,
      gridWidth * pixelSize,
      gridHeight * pixelSize,
    );
    canvas.drawRect(backgroundRect, paintBackground);

    // Desenha o bichinho em preto
    final petPattern = petState.pixelPattern;
    final petWidth = petPattern[0].length;
    final petHeight = petPattern.length;

    // Centraliza o bichinho na tela
    final petOffsetX = offsetX + (gridWidth - petWidth) / 2 * pixelSize;
    final petOffsetY = offsetY + (gridHeight - petHeight) / 2 * pixelSize;

    for (int y = 0; y < petHeight; y++) {
      for (int x = 0; x < petWidth; x++) {
        if (petPattern[y][x]) {
          final rect = Rect.fromLTWH(
            petOffsetX + x * pixelSize,
            petOffsetY + y * pixelSize,
            pixelSize,
            pixelSize,
          );
          canvas.drawRect(rect, paintPet);
        }
      }
    }

    // Desenha as bordas dos pixels (opcional)
    for (int y = 0; y < gridHeight; y++) {
      for (int x = 0; x < gridWidth; x++) {
        final rect = Rect.fromLTWH(
          offsetX + x * pixelSize,
          offsetY + y * pixelSize,
          pixelSize,
          pixelSize,
        );
        canvas.drawRect(rect, paintBorder);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}