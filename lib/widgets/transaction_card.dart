import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

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
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:
                      isIncoming
                          ? [
                            AppTheme.successColor.withOpacity(0.2),
                            AppTheme.successColor.withOpacity(0.1),
                          ]
                          : [
                            AppTheme.errorColor.withOpacity(0.2),
                            AppTheme.errorColor.withOpacity(0.1),
                          ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child:
                    avatarIcon != null
                        ? Icon(
                          avatarIcon,
                          color:
                              isIncoming
                                  ? AppTheme.successColor
                                  : AppTheme.errorColor,
                          size: 24,
                        )
                        : Text(
                          avatarText ?? '',
                          style: TextStyle(
                            color:
                                isIncoming
                                    ? AppTheme.successColor
                                    : AppTheme.errorColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
              ),
            ),

            const SizedBox(width: 16),

            // Name and Time
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: theme.textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 13,
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),

            // Amount
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color:
                    isIncoming
                        ? AppTheme.successColor.withOpacity(0.1)
                        : AppTheme.errorColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                amount,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color:
                      isIncoming ? AppTheme.successColor : AppTheme.errorColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
