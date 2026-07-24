import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/shared/responsive/responsive_breakpoints.dart';
import '../../../../core/shared/responsive/responsive_layout.dart';
import '../bloc/inspection_bloc.dart';
import '../bloc/inspection_event.dart';
import '../widgets/circular_stat_card.dart';
import '../widgets/inspection_card.dart';
import 'properties_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF15A24),
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: ResponsiveLayout(
            mobileBody: const _DashboardMobile(),
            tabletBody: const _DashboardTabletOrDesktop(),
            desktopBody: const _DashboardTabletOrDesktop(),
          ),
        ),
      ),
    );
  }
}

/// Layout para Celulares (Fluxo Vertical)
class _DashboardMobile extends StatelessWidget {
  const _DashboardMobile();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _StatCardsHeader(),
          const SizedBox(height: 24),
          const _InspectionHistorySection(),
          const SizedBox(height: 20),
          const _TeamStatusSection(),
          const SizedBox(height: 32),
          const _ActionButton(),
        ],
      ),
    );
  }
}

/// Layout para Tablets e Desktop (Layout em Grid / Multi-Colunas)
class _DashboardTabletOrDesktop extends StatelessWidget {
  const _DashboardTabletOrDesktop();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabeçalho de estatísticas adaptável
          const _StatCardsHeader(),
          const SizedBox(height: 32),

          // Lado a lado: Histórico de Inspeções e Team Status
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [_InspectionHistorySection()],
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _TeamStatusSection(),
                    SizedBox(height: 24),
                    _ActionButton(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Componente de Estatísticas (Adaptável para Row/Grid)
class _StatCardsHeader extends StatelessWidget {
  const _StatCardsHeader();

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: const [
          CircularStatCard(
            label: "Total de\nInspeções",
            value: "12",
            icon: Icons.assignment,
            color: Colors.orange,
          ),
          SizedBox(width: 8),
          CircularStatCard(
            label: "Concluídas",
            value: "8",
            icon: Icons.check_circle,
            color: Colors.green,
          ),
          SizedBox(width: 8),
          CircularStatCard(
            label: "Pendente",
            value: "4",
            icon: Icons.info,
            color: Colors.orangeAccent,
          ),
        ],
      ),
    );
  }
}

/// Seção: Histórico de Inspeções
class _InspectionHistorySection extends StatelessWidget {
  const _InspectionHistorySection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Histórico de Inspeções",
          style: TextStyle(
            fontSize: context.responsiveValue(mobile: 16, tablet: 18.0),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        const InspectionCard(
          title: "Inspeção de Insped",
          inspectionId: "1223",
          progress: 0.75,
          role: "Corretor",
          name: "Granador",
          avatarUrl:
              "https://images.unsplash.com/photo-1560250097-0b93528c311a?w=100",
        ),
        const SizedBox(height: 12),
        const InspectionCard(
          title: "Inspeção Residencial",
          inspectionId: "1224",
          progress: 0.40,
          role: "Inspetor",
          name: "Carlos Silva",
          avatarUrl:
              "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100",
        ),
        // Card(
        //   color: Colors.white,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(12),
        //   ),
        //   child: Padding(
        //     padding: const EdgeInsets.all(14.0),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         const Text(
        //           "Inspeção de Insped",
        //           style: TextStyle(fontWeight: FontWeight.bold),
        //         ),
        //         const Text(
        //           "ID 1223",
        //           style: TextStyle(color: Colors.grey, fontSize: 12),
        //         ),
        //         const SizedBox(height: 10),
        //         ClipRRect(
        //           borderRadius: BorderRadius.circular(4),
        //           child: const LinearProgressIndicator(
        //             value: 0.75,
        //             minHeight: 8,
        //             backgroundColor: Color(0xFFE0E0E0),
        //             valueColor: AlwaysStoppedAnimation<Color>(
        //               Color(0xFF2ecc71),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

/// Seção: Team Status
class _TeamStatusSection extends StatelessWidget {
  const _TeamStatusSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Team Status",
          style: TextStyle(
            fontSize: context.responsiveValue(mobile: 16.0, tablet: 18.0),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ListTile(
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1560250097-0b93528c311a?w=100",
            ),
          ),
          title: const Text(
            "Corretor",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          subtitle: const Text("Granador", style: TextStyle(fontSize: 12)),
        ),
      ],
    );
  }
}

/// Botão Principal de Ação (Acessa o BLoC)
class _ActionButton extends StatelessWidget {
  const _ActionButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF15A24),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {
        context.read<InspectionBloc>().add(LoadInspectionData());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PropertiesPage()),
        );
      },
      child: const Text(
        "Avançar",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
