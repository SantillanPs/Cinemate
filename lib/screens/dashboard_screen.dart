import 'package:flutter/material.dart';
import '../widgets/transaction_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting and Balance
          const Text(
            'Hello, Alex',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text('Your balance', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text(
                '\$2,458.20',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Row(
                children: [
                  const Icon(Icons.trending_up, size: 16, color: Colors.green),
                  Text(
                    '+2.5%',
                    style: TextStyle(fontSize: 14, color: Colors.green[500]),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Quick Actions
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 2.5,
            children: [
              _buildActionButton(
                icon: Icons.arrow_upward,
                label: 'Send Money',
                onTap: () {},
              ),
              _buildActionButton(
                icon: Icons.arrow_downward,
                label: 'Request',
                onTap: () {},
              ),
              _buildActionButton(
                icon: Icons.credit_card,
                label: 'Cards',
                onTap: () {},
              ),
              _buildActionButton(
                icon: Icons.attach_money,
                label: 'Cashback',
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Recent Transactions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Transactions',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              TextButton(onPressed: () {}, child: const Text('View all')),
            ],
          ),

          const SizedBox(height: 8),

          // Transaction List
          const TransactionCard(
            name: 'Jane Doe',
            time: 'Today, 2:34 PM',
            amount: '+\$24.00',
            isIncoming: true,
            avatarText: 'JD',
          ),

          const SizedBox(height: 12),

          const TransactionCard(
            name: 'Coffee Shop',
            time: 'Yesterday, 9:15 AM',
            amount: '-\$5.75',
            isIncoming: false,
            avatarIcon: Icons.store,
          ),

          const SizedBox(height: 12),

          const TransactionCard(
            name: 'Mike Smith',
            time: 'Mar 10, 6:45 PM',
            amount: '-\$18.50',
            isIncoming: false,
            avatarText: 'MS',
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.blue, size: 20),
          const SizedBox(height: 5),
          Text(label),
        ],
      ),
    );
  }
}
