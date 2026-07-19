import 'package:flutter/material.dart';

class MediaDetailsPage extends StatelessWidget {
  final dynamic item;
  const MediaDetailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final mockGrid = [
      "https://images.unsplash.com/photo-1556911220-e15b29be8c8f?w=150",
      "https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=150",
      "https://images.unsplash.com/photo-1505691938895-1758d7feb511?w=150",
      "https://images.unsplash.com/photo-1540518614846-7eded433c457?w=150",
      "https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=150",
      "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=150",
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF15A24),
        title: const Text(
          "Mídias e Detalhes",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Mídias e Arquivos",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              itemCount: mockGrid.length,
              itemBuilder: (context, idx) => ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(mockGrid[idx], fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildToolBtn(Icons.camera_alt, "Câmera"),
                _buildToolBtn(Icons.videocam, "Vídeo"),
                _buildToolBtn(Icons.photo, "Galeria"),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "cozinha: Detalhes dos Armarios",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            const SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.add, color: Colors.orange),
                suffixIcon: const Icon(Icons.add, color: Colors.orange),
                hintText: "Adicionar um detahe",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Quarto 1: Janela",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            const SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.add, color: Colors.orange),
                suffixIcon: const Icon(Icons.add, color: Colors.orange),
                hintText: "Adicionar um detalhe",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF15A24),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Confirmar",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolBtn(IconData icon, String txt) {
    return Column(
      children: [
        Icon(icon, color: Colors.grey.shade700),
        Text(txt, style: const TextStyle(fontSize: 11)),
      ],
    );
  }
}
