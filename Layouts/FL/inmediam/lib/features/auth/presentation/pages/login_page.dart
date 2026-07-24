import 'package:flutter/material.dart';
import 'package:inmediam/features/inspection/presentation/widgets/circular_stat_card.dart';
import '../../../inspection/presentation/pages/dashboard_page.dart';
import '../../../inspection/presentation/widgets/top_curve_clipper.dart';
import '../../../../core/shared/responsive/responsive_breakpoints.dart';
import '../../../../core/shared/responsive/responsive_layout.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ResponsiveLayout(
        mobileBody: const _LoginMobile(),
        tabletBody: const _LoginTabletOrDesktop(),
        desktopBody: const _LoginTabletOrDesktop(),
      ),
    );
  }
}

/// Layout Otimizado para Celulares (Mantém a identidade original controlando espaçamentos)
class _LoginMobile extends StatelessWidget {
  const _LoginMobile();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipPath(
            clipper: TopCurveClipper(),
            child: Container(
              height: context.responsiveValue(mobile: 260.0, tablet: 300.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFF15A24), Color(0xFFFF914D)],
                ),
              ),
              child: Center(child: _HeaderContent()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: const _LoginForm(),
          ),
        ],
      ),
    );
  }
}

/// Layout Otimizado para Tablets e Web/Desktop (Lado a Lado)
class _LoginTabletOrDesktop extends StatelessWidget {
  const _LoginTabletOrDesktop();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Lado Esquerdo: Painel de Marca com Gradiente
        Expanded(
          flex: 4, // Ocupa 40% da tela horizontalmente
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFF15A24), Color(0xFFFF914D)],
              ),
            ),
            child: const Center(child: _HeaderContent()),
          ),
        ),
        // Lado Direito: Formulário centralizado e encapsulado para não esticar demais
        Expanded(
          flex: 6, // Ocupa 60% da tela horizontalmente
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                // Trava a largura do formulário para manter a bonitesa visual
                constraints: const BoxConstraints(maxWidth: 450),
                child: _LoginForm(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Sub-Widget: Conteúdo do Cabeçalho (Reaproveitado nos dois layouts)
class _HeaderContent extends StatelessWidget {
  const _HeaderContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          Icons.home_work,
          size: context.responsiveValue(
            mobile: 60.0,
            tablet: 80.0,
            desktop: 90.0,
          ),
          color: Colors.white,
        ),
        SizedBox(height: 4),
        Text(
          "InSpect",
          style: TextStyle(
            fontSize: context.responsiveValue(
              mobile: 32.0,
              tablet: 40.0,
              desktop: 46.0,
            ),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

/// Sub-Widget: O Formulário de Login com os Inputs e Botões
class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Boas-vindas ao InInspect",
          style: TextStyle(
            fontSize: context.responsiveValue(mobile: 18.0, tablet: 22.0),
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Password",
            suffixIcon: const Icon(Icons.visibility_off),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF15A24),
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const DashboardPage()),
          ),
          child: const Text(
            "Login",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "ou",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 12),
        IntrinsicHeight(
          child: Row(
            children: [
              CircularStatCard(
                label: "Quero ser Correto",
                value: "",
                icon: Icons.group,
                color: Colors.orange,
              ),
              const SizedBox(width: 8),
              CircularStatCard(
                label: "Administrador",
                value: "",
                icon: Icons.person,
                color: Colors.orange,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Já tenho conta",
            style: TextStyle(color: Color(0xFFF15A24)),
          ),
        ),
      ],
    );
  }
}
