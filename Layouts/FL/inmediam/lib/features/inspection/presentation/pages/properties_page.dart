import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/inspection_bloc.dart';
import '../bloc/inspection_state.dart';
import '../widgets/property_card.dart';
import 'checklist_page.dart';

class PropertiesPage extends StatelessWidget {
  const PropertiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF15A24),
        title: const Text(
          "Imóveis",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<InspectionBloc, InspectionState>(
        builder: (context, state) {
          if (state is InspectionLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFFF15A24)),
            );
          }
          if (state is InspectionLoaded) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PropertyCard(
                    title: "Casa Residencial - São Paulo",
                    location: "Osasco  •  2.50",
                    tagText: "Liberado para vistoria",
                    tagColor: Colors.green,
                    imageUrl:
                        "https://images.unsplash.com/photo-1580587771525-78b9dba3b914?w=300",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ChecklistPage()),
                    ),
                  ),
                  PropertyCard(
                    title: "Casa Residencial - Minas Gerais",
                    location: "Viçosa  •  1.50",
                    tagText: "Tenante  •  Inspeção",
                    tagColor: Colors.grey,
                    imageUrl:
                        "https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=300",
                    onTap: () {},
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Minhas Visitas e Vistorias",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildVisitRow(
                    "16 de 2023\nDes 2023",
                    "Ondisbeele",
                    Colors.green,
                  ),
                  _buildVisitRow(
                    "25 de 2023\nDes 2023",
                    "Pendente",
                    Colors.amber.shade600,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF15A24),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ChecklistPage()),
                    ),
                    child: const Text(
                      "Adicionar Visitas",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text("Carregando..."));
        },
      ),
    );
  }

  Widget _buildVisitRow(String date, String status, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              const SizedBox(width: 8),
              Text(date, style: const TextStyle(fontSize: 12)),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
