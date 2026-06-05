import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'transactions_page.dart';
import 'kategori_page.dart';
import 'laporan_page.dart';

import 'widgets/add_transaction_bottom_sheet.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const TransactionsPage(),
    const KategoriPage(),
    const LaporanPage(),
  ];

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF07006B);

    return Scaffold(
      body: _pages[_selectedIndex],
      // TOMBOL PLUS
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => const AddTransactionBottomSheet(),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      // BOTTOM NAVIGATION
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(18, 0, 18, 16),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 18,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => setState(() => _selectedIndex = 0),
              behavior: HitTestBehavior.opaque,
              child: BottomMenuItem(
                icon: Icons.grid_view_rounded,
                label: 'Beranda',
                active: _selectedIndex == 0,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() => _selectedIndex = 1),
              behavior: HitTestBehavior.opaque,
              child: BottomMenuItem(
                icon: Icons.receipt_long,
                label: 'Transaksi',
                active: _selectedIndex == 1,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() => _selectedIndex = 2),
              behavior: HitTestBehavior.opaque,
              child: BottomMenuItem(
                icon: Icons.category_outlined,
                label: 'Kategori',
                active: _selectedIndex == 2,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() => _selectedIndex = 3),
              behavior: HitTestBehavior.opaque,
              child: BottomMenuItem(
                icon: Icons.bar_chart,
                label: 'Laporan',
                active: _selectedIndex == 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;

  const BottomMenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF07006B);

    if (active) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: Colors.white),
            const SizedBox(width: 5),
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 17, color: Colors.black87),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(
              fontSize: 9,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
