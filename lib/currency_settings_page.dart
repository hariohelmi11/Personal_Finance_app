import 'package:flutter/material.dart';

class CurrencySettingsPage extends StatelessWidget {
  const CurrencySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF07006B);
    const Color bgColor = Color(0xFFF7F8FC);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 14, 18, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Currency Settings',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // BASE CURRENCY
              const Text(
                'BASE CURRENCY',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 12),

              // IDR CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0F084B), Color(0xFF1B1464)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'IDR - Indonesian Rupiah',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Default for all transactions and reporting',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white.withOpacity(0.3)),
                      ),
                      child: const Text(
                        'Change',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // EXCHANGE RATES HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Exchange Rates',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Relative to 1 IDR',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Updated 5m ago',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // CURRENCY LIST
              const CurrencyTile(
                icon: Icons.payments,
                code: 'USD',
                name: 'US Dollar',
                rate: '0.000064',
                change: '+ 0.2%',
                changeColor: Colors.green,
                trendIcon: Icons.trending_up,
                bgColor: Color(0xFFEDEEFF),
                iconColor: primaryColor,
              ),
              const CurrencyTile(
                icon: Icons.euro,
                code: 'EUR',
                name: 'Euro',
                rate: '0.000059',
                change: '- 0.1%',
                changeColor: Color(0xFFA11C1C),
                trendIcon: Icons.trending_down,
                bgColor: Color(0xFFF2F2F6),
                iconColor: primaryColor,
              ),
              const CurrencyTile(
                icon: Icons.monetization_on,
                code: 'SGD',
                name: 'Singapore Dollar',
                rate: '0.000086',
                change: '+ 0.05%',
                changeColor: Colors.green,
                trendIcon: Icons.trending_up,
                bgColor: Color(0xFFEDEEFF),
                iconColor: primaryColor,
              ),
              const CurrencyTile(
                icon: Icons.currency_yen,
                code: 'JPY',
                name: 'Japanese Yen',
                rate: '0.0097',
                change: '- 0.0%',
                changeColor: Colors.black54,
                trendIcon: Icons.remove,
                bgColor: Color(0xFFF2F2F6),
                iconColor: primaryColor,
              ),

              const SizedBox(height: 12),

              // ADD WATCHLIST CURRENCY BUTTON
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1.5,
                    style: BorderStyle.solid, // Should be dashed ideally
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add_circle_outline, color: primaryColor, size: 18),
                    SizedBox(width: 8),
                    Text(
                      'Add Watchlist Currency',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // LIVE MONITORING
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Live Monitoring',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Real-time updates from global financial markets ensure your portfolio valuation is always accurate.',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black54,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Icon(
                      Icons.manage_search, // A placeholder icon for the graphic
                      size: 64,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrencyTile extends StatelessWidget {
  final IconData icon;
  final String code;
  final String name;
  final String rate;
  final String change;
  final Color changeColor;
  final IconData trendIcon;
  final Color bgColor;
  final Color iconColor;

  const CurrencyTile({
    super.key,
    required this.icon,
    required this.code,
    required this.name,
    required this.rate,
    required this.change,
    required this.changeColor,
    required this.trendIcon,
    required this.bgColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withOpacity(0.04)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: bgColor,
            child: Icon(icon, color: iconColor, size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  code,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                rate,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xFF07006B),
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Icon(trendIcon, size: 12, color: changeColor),
                  const SizedBox(width: 2),
                  Text(
                    change,
                    style: TextStyle(
                      fontSize: 11,
                      color: changeColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
