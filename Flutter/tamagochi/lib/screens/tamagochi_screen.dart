import 'package:flutter/material.dart';
import '../widgets/lcd_screen.dart';
import '../models/pet_state.dart';

class TamagochiScreen extends StatefulWidget {
  const TamagochiScreen({super.key});

  @override
  State<TamagochiScreen> createState() => _TamagochiScreenState();
}

class _TamagochiScreenState extends State<TamagochiScreen> with TickerProviderStateMixin {
  PetState petState = PetState.idle; // Estado inicial
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // Configura o controlador de animação
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _changePetState(PetState newState) {
    setState(() {
      petState = newState;
      
      // Reinicia a animação quando o estado muda
      _animationController
        ..reset()
        ..repeat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              // Usamos AnimatedBuilder para reconstruir quando a animação é atualizada
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return LCDScreen(petState: petState);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Botões para estados estáticos
                    _buildStateButton('Feliz', PetState.happy),
                    _buildStateButton('Triste', PetState.sad),
                    _buildStateButton('Fome', PetState.hungry),
                    _buildStateButton('Doente', PetState.sick),
                    // Botões para estados animados
                    _buildStateButton('Feliz (A)', PetState.happy_animated),
                    _buildStateButton('Triste (A)', PetState.sad_animated),
                    _buildStateButton('Fome (A)', PetState.hungry_animated),
                    _buildStateButton('Doente (A)', PetState.sick_animated),
                    _buildStateButton('Ocioso', PetState.idle),
                    _buildStateButton('Dormindo', PetState.sleeping),
                    _buildStateButton('Comendo', PetState.eating),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStateButton(String text, PetState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: () => _changePetState(state),
        child: Text(text),
      ),
    );
  }
}