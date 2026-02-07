import 'package:flutter/material.dart';
import 'keywords.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool autoReplyOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1720),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.sms, color: Colors.blue, size: 28),
                      SizedBox(width: 10),
                      Text(
                        "SMS AutoReply",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.settings, color: Colors.white70),
                ],
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: cardDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "AutoReply",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Switch(
                      value: autoReplyOn,
                      activeColor: Colors.blue,
                      onChanged: (val) {
                        setState(() => autoReplyOn = val);
                      },
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: const [
                  Expanded(child: StatCard(number: "62", label: "Keywords")),
                  SizedBox(width: 16),
                  Expanded(child: StatCard(number: "18", label: "Scheduled")),
                ],
              ),

              const SizedBox(height: 25),

              const Text(
                "SMS USAGE",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),

              const SizedBox(height: 12),

              Container(
                height: 120,
                padding: const EdgeInsets.all(12),
                decoration: cardDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(
                    10,
                    (index) => Container(
                      width: 10,
                      height: (index.isEven ? 40.0 : 80.0) + (index * 3),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.4,
                children: [
                  MenuCard(
                    icon: Icons.search,
                    label: "Keywords",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const KeywordsScreen(),
                        ),
                      );
                    },
                  ),
                  const MenuCard(icon: Icons.calendar_month, label: "Schedule SMS"),
                  const MenuCard(icon: Icons.call_end, label: "Call Reject Mode"),
                  const MenuCard(icon: Icons.list_alt, label: "SMS Logs"),
                  const MenuCard(icon: Icons.forward, label: "Forwarding"),
                  const MenuCard(icon: Icons.contacts, label: "Contacts"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration cardDecoration() {
    return BoxDecoration(
      color: const Color(0xFF1B2430),
      borderRadius: BorderRadius.circular(18),
    );
  }
}

class StatCard extends StatelessWidget {
  final String number;
  final String label;

  const StatCard({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1B2430),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const MenuCard({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1B2430),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white70, size: 28),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
