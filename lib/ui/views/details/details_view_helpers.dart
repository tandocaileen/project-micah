import 'package:flutter/material.dart';
import 'package:project_micah/ui/utils/constants/ui_helpers.dart';
import 'package:project_micah/ui/utils/constants/app_colors.dart';

class ToggleButton extends StatelessWidget {
  final bool isAssembleMode;
  final bool isEnabled;
  final VoidCallback onToggle;

  const ToggleButton({
    super.key,
    required this.isAssembleMode,
    this.isEnabled = true,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Switch(
          value: !isAssembleMode,
          onChanged: isEnabled ? (_) => onToggle() : null,
          activeThumbColor: AppColors.primary,
        ),
        UIHelpers.horizontalSpace4,
        Text(
          !isAssembleMode ? 'DISASSEMBLE' : 'ASSEMBLE',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight:
                    !isAssembleMode ? FontWeight.bold : FontWeight.normal,
                color: !isAssembleMode
                    ? AppColors.textPrimary
                    : AppColors.textSecondary,
              ),
        ),
      ],
    );
  }
}

class ControlItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String action;

  const ControlItem({
    super.key,
    required this.icon,
    required this.label,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 14,
          color: AppColors.textSecondary,
        ),
        UIHelpers.horizontalSpace4,
        Text(
          '$label: $action',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 11,
                color: AppColors.textSecondary,
              ),
        ),
      ],
    );
  }
}
