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
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transaction History',
                style: theme.textTheme.headlineMedium,
              ),
              Row(
                children: [
                  _buildIconButton(
                    context: context,
                    icon: Icons.calendar_today,
                    onTap: () {},
                  ),
                  const SizedBox(width: 12),
                  _buildIconButton(
                    context: context,
                    icon: Icons.filter_list,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Tabs
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'Incoming'),
                Tab(text: 'Outgoing'),
              ],
              labelColor: theme.colorScheme.primary,
              unselectedLabelColor: theme.colorScheme.onSurface.withOpacity(
                0.6,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: theme.colorScheme.primary.withOpacity(0.1),
              ),
            ),
          ),

          const SizedBox(height: 20),

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
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            date,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.primary,
            ),
          ),
        ),

        const SizedBox(height: 12),

        ...children,
      ],
    );
  }

  Widget _buildIconButton({
    required BuildContext context,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(icon, size: 20, color: theme.colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
