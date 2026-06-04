import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF07006B);
    const Color bgColor = Color(0xFFF7F8FC);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 14, 18, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                children: [
                  const CircleAvatar(
                    radius: 16,
                    backgroundColor: Color(0xFFEDEEFF),
                    child: Icon(
                      Icons.person,
                      size: 18,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Personal Finance',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      color: primaryColor,
                      size: 20,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, Dimas',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Selamat datang kembali',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'JANUARI 2024',
                    style: TextStyle(
                      fontSize: 10,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // SALDO CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SALDO SAAT INI',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Rp 12.450.000',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // PEMASUKAN PENGELUARAN
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.circle, size: 8, color: Colors.green),
                        SizedBox(width: 5),
                        Text(
                          'Pemasukan',
                          style: TextStyle(fontSize: 10),
                        ),
                        Spacer(),
                        Icon(Icons.circle, size: 8, color: Colors.red),
                        SizedBox(width: 5),
                        Text(
                          'Pengeluaran',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: 0.85,
                        minHeight: 8,
                        backgroundColor: Colors.red.shade200,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.green,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Text(
                          'Rp 15.000.000',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Rp 2.550.000',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // KATEGORI
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      'Kategori Terbesar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Lihat Semua',
                    style: TextStyle(
                      fontSize: 10,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1.65,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: const [
                  CategoryCard(
                    icon: Icons.restaurant,
                    title: 'Makanan',
                    amount: 'Rp 850.000',
                    iconColor: Colors.orange,
                    bgColor: Color(0xFFFFF1DE),
                  ),
                  CategoryCard(
                    icon: Icons.directions_bus,
                    title: 'Transport',
                    amount: 'Rp 420.000',
                    iconColor: Colors.blue,
                    bgColor: Color(0xFFEAF0FF),
                  ),
                  CategoryCard(
                    icon: Icons.shopping_bag_outlined,
                    title: 'Belanja',
                    amount: 'Rp 1.100.000',
                    iconColor: Colors.purple,
                    bgColor: Color(0xFFF4E9FF),
                  ),
                  CategoryCard(
                    icon: Icons.receipt_long,
                    title: 'Tagihan',
                    amount: 'Rp 480.000',
                    iconColor: Colors.green,
                    bgColor: Color(0xFFE7F8EF),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // TRANSAKSI TERAKHIR
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      'Transaksi Terakhir',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Semua',
                    style: TextStyle(
                      fontSize: 10,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              const TransactionTile(
                icon: Icons.local_cafe,
                title: 'Kopi Kenangan',
                date: 'Hari ini, 09:15',
                amount: '- Rp 28.000',
                isIncome: false,
              ),
              const TransactionTile(
                icon: Icons.account_balance_wallet,
                title: 'Gaji Bulanan',
                date: 'Kemarin, 20:00',
                amount: '+ Rp 8.500.000',
                isIncome: true,
              ),
              const TransactionTile(
                icon: Icons.directions_car,
                title: 'Pertamina',
                date: '22 Okt, 14:30',
                amount: '- Rp 350.000',
                isIncome: false,
              ),
              const TransactionTile(
                icon: Icons.shopping_cart,
                title: 'Indomaret',
                date: '21 Okt, 18:20',
                amount: '- Rp 124.500',
                isIncome: false,
              ),
              const TransactionTile(
                icon: Icons.play_arrow,
                title: 'Transfer dari Ibu',
                date: '20 Okt, 11:00',
                amount: '+ Rp 500.000',
                isIncome: true,
              ),
            ],
          ),
        ),
      ),

      // TOMBOL PLUS
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {},
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
          children: const [
            BottomMenuItem(
              icon: Icons.dashboard,
              label: 'Beranda',
              active: true,
            ),
            BottomMenuItem(
              icon: Icons.receipt_long,
              label: 'Transaksi',
              active: false,
            ),
            BottomMenuItem(
              icon: Icons.category_outlined,
              label: 'Kategori',
              active: false,
            ),
            BottomMenuItem(
              icon: Icons.bar_chart,
              label: 'Laporan',
              active: false,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String amount;
  final Color iconColor;
  final Color bgColor;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.amount,
    required this.iconColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: bgColor,
            child: Icon(
              icon,
              size: 17,
              color: iconColor,
            ),
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final String amount;
  final bool isIncome;

  const TransactionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
    required this.isIncome,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF07006B);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 17,
            backgroundColor: const Color(0xFFEDEEFF),
            child: Icon(
              icon,
              color: primaryColor,
              size: 17,
            ),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 12,
              color: isIncome ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
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

    return Column(
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
    );
  }
}