import 'package:flutter/material.dart';

class KeywordsScreen extends StatefulWidget {
  const KeywordsScreen({super.key});

  @override
  State<KeywordsScreen> createState() => _KeywordsScreenState();
}

class _KeywordsScreenState extends State<KeywordsScreen> {
  final TextEditingController keywordController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1720),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B2430),
        title: const Text("Keywords"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: keywordController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Keyword",
                labelStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: const Color(0xFF1B2430),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: messageController,
              maxLines: 4,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Reply Message",
                labelStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: const Color(0xFF1B2430),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.all(14),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Saved: ${keywordController.text}",
                      ),
                    ),
                  );
                },
                child: const Text("Save Keyword"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
