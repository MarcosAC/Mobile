import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inmediam/features/inspection/presentation/bloc/inspection_event.dart';
import 'package:inmediam/features/inspection/presentation/bloc/inspection_state.dart';

import '../bloc/inspection_bloc.dart';
import 'checklist_page.dart';

class PropertiesPage extends StatefulWidget {
  const PropertiesPage({super.key});

  @override
  State<PropertiesPage> createState() => _PropertiesPageState();
}

class _PropertiesPageState extends State<PropertiesPage> {
  @override
  void initState() {
    super.initState();
    context.read<InspectionBloc>().add(LoadInspectionData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Imóveis")),
      body: BlocBuilder<InspectionBloc, InspectionState>(
        builder: (context, state) {
          if (state is InspectionLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is InspectionLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.properties.length,
              itemBuilder: (context, index) {
                final property = state.properties[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        property.imageUrl,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      ListTile(
                        title: Text(
                          property.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${property.address} • ${property.rooms}",
                        ),
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF15A24),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ChecklistPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Inicial",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(child: Text("Nenhum Imóvel disponível"));
        },
      ),
    );
  }
}
