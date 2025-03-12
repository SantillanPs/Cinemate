import 'package:flutter/material.dart';
import '../widgets/contact_card.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
          const Text(
            'Send Money',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          // Search Bar
          TextField(
            decoration: InputDecoration(
              hintText: 'Search name or phone number',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),

          const SizedBox(height: 16),

          // Tabs
          TabBar(
            controller: _tabController,
            tabs: const [Tab(text: 'Contacts'), Tab(text: 'Recent')],
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
                // Contacts Tab
                ListView(
                  children: [
                    const ContactCard(
                      name: 'Jane Doe',
                      subtitle: '+1 (555) 123-4567',
                      avatarText: 'JD',
                    ),

                    const SizedBox(height: 12),

                    const ContactCard(
                      name: 'Mike Smith',
                      subtitle: '+1 (555) 987-6543',
                      avatarText: 'MS',
                    ),

                    const SizedBox(height: 12),

                    const ContactCard(
                      name: 'Sarah Johnson',
                      subtitle: '+1 (555) 456-7890',
                      avatarText: 'SJ',
                    ),

                    const SizedBox(height: 16),

                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person_add),
                          SizedBox(width: 8),
                          Text('Add New Contact'),
                        ],
                      ),
                    ),
                  ],
                ),

                // Recent Tab
                ListView(
                  children: const [
                    ContactCard(
                      name: 'Jane Doe',
                      subtitle: 'Yesterday',
                      avatarText: 'JD',
                    ),

                    SizedBox(height: 12),

                    ContactCard(
                      name: 'Mike Smith',
                      subtitle: 'Mar 10',
                      avatarText: 'MS',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
