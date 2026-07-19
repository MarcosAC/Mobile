import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/inspection_bloc.dart';
import '../bloc/inspection_event.dart';
import '../widgets/circular_stat_card.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularStatCard(
                  label: "Total de\nInspeções",
                  value: "12",
                  icon: Icons.assignment,
                  color: Colors.orange,
                ),
                CircularStatCard(
                  label: "Concluídas",
                  value: "8",
                  icon: Icons.check_circle,
                  color: Colors.green,
                ),
                CircularStatCard(
                  label: "Pendente",
                  value: "4",
                  icon: Icons.info,
                  color: Colors.orangeAccent,
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "Histórico de Inspeções",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Inspeção de Insped",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "ID 1223",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: const LinearProgressIndicator(
                        value: 0.75,
                        minHeight: 8,
                        backgroundColor: Color(0xFFE0E0E0),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF2ecc71),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Team Status",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
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
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF15A24),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
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
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
