import 'package:flutter/material.dart';
import 'package:tamagochi/models/pet_state.dart';
import 'package:tamagochi/widgets/lcd_painter.dart';

class AnimatedPet extends StatefulWidget {
  final double pixelSize;
  final int gridWidth;
  final int gridHeight;
  final PetState initialState;

  const AnimatedPet({super.key, 
    required this.pixelSize,
    required this.gridWidth,
    required this.gridHeight,
    this.initialState = PetState.idle,
  });

  @override
  _AnimatedPetState createState() => _AnimatedPetState();
}

class _AnimatedPetState extends State<AnimatedPet> with SingleTickerProviderStateMixin {
  late PetState _currentState;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _currentState = widget.initialState;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeState(PetState newState) {
    setState(() {
      _currentState = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: LCDPainter(
            pixelSize: widget.pixelSize,
            gridWidth: widget.gridWidth,
            gridHeight: widget.gridHeight,
            offsetX: 0,
            offsetY: 0,
            petState: _currentState,
          ),
          size: Size(
            widget.gridWidth * widget.pixelSize,
            widget.gridHeight * widget.pixelSize,
          ),
        );
      },
    );
  }
}