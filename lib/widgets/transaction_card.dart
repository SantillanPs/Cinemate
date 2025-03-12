import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String name;
  final String time;
  final String amount;
  final bool isIncoming;
  final String? avatarText;
  final IconData? avatarIcon;

  const TransactionCard({
    super.key,
    required this.name,
    required this.time,
    required this.amount,
    required this.isIncoming,
    this.avatarText,
    this.avatarIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue.withOpacity(0.1),
              child:
                  avatarIcon != null
                      ? Icon(avatarIcon, color: Colors.blue)
                      : Text(
                        avatarText ?? '',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
            ),

            const SizedBox(width: 12),

            // Name and Time
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    time,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            // Amount
            Text(
              amount,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isIncoming ? Colors.green[600] : Colors.red[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
