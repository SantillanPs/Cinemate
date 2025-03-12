import 'package:flutter/material.dart';
import '../widgets/transaction_card.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Transaction History',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.calendar_today, size: 20),
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list, size: 20),
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Tabs
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Incoming'),
              Tab(text: 'Outgoing'),
            ],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
          ),

          const SizedBox(height: 16),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // All Tab
                _buildAllTransactionsTab(),

                // Incoming Tab
                _buildIncomingTransactionsTab(),

                // Outgoing Tab
                _buildOutgoingTransactionsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllTransactionsTab() {
    return ListView(
      children: [
        _buildDateSection('Today', [
          const TransactionCard(
            name: 'Jane Doe',
            time: 'Lunch payment',
            amount: '+\$24.00',
            isIncoming: true,
            avatarText: 'JD',
          ),
        ]),

        const SizedBox(height: 16),

        _buildDateSection('Yesterday', [
          const TransactionCard(
            name: 'Coffee Shop',
            time: 'Morning coffee',
            amount: '-\$5.75',
            isIncoming: false,
            avatarIcon: Icons.store,
          ),

          const SizedBox(height: 12),

          const TransactionCard(
            name: 'Grocery Store',
            time: 'Weekly shopping',
            amount: '-\$42.30',
            isIncoming: false,
            avatarIcon: Icons.shopping_basket,
          ),
        ]),

        const SizedBox(height: 16),

        _buildDateSection('March 10', [
          const TransactionCard(
            name: 'Mike Smith',
            time: 'Concert tickets',
            amount: '-\$18.50',
            isIncoming: false,
            avatarText: 'MS',
          ),

          const SizedBox(height: 12),

          const TransactionCard(
            name: 'Sarah Johnson',
            time: 'Dinner split',
            amount: '+\$32.15',
            isIncoming: true,
            avatarText: 'SJ',
          ),
        ]),
      ],
    );
  }

  Widget _buildIncomingTransactionsTab() {
    return ListView(
      children: [
        _buildDateSection('Today', [
          const TransactionCard(
            name: 'Jane Doe',
            time: 'Lunch payment',
            amount: '+\$24.00',
            isIncoming: true,
            avatarText: 'JD',
          ),
        ]),

        const SizedBox(height: 16),

        _buildDateSection('March 10', [
          const TransactionCard(
            name: 'Sarah Johnson',
            time: 'Dinner split',
            amount: '+\$32.15',
            isIncoming: true,
            avatarText: 'SJ',
          ),
        ]),
      ],
    );
  }

  Widget _buildOutgoingTransactionsTab() {
    return ListView(
      children: [
        _buildDateSection('Yesterday', [
          const TransactionCard(
            name: 'Coffee Shop',
            time: 'Morning coffee',
            amount: '-\$5.75',
            isIncoming: false,
            avatarIcon: Icons.store,
          ),

          const SizedBox(height: 12),

          const TransactionCard(
            name: 'Grocery Store',
            time: 'Weekly shopping',
            amount: '-\$42.30',
            isIncoming: false,
            avatarIcon: Icons.shopping_basket,
          ),
        ]),

        const SizedBox(height: 16),

        _buildDateSection('March 10', [
          const TransactionCard(
            name: 'Mike Smith',
            time: 'Concert tickets',
            amount: '-\$18.50',
            isIncoming: false,
            avatarText: 'MS',
          ),
        ]),
      ],
    );
  }

  Widget _buildDateSection(String date, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),

        const SizedBox(height: 8),

        ...children,
      ],
    );
  }
}
