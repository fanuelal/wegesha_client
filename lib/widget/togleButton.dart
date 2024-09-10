import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class CustomToggleButton extends StatelessWidget {
  final bool isEmergencyMode;
  final bool emergencyBroadCasting;
  final VoidCallback onPressed;

  CustomToggleButton({
    required this.isEmergencyMode,
    required this.emergencyBroadCasting,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: isEmergencyMode ? Colors.black : Colors.red,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: emergencyBroadCasting
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Icon(
                isEmergencyMode
                    ? Symbols.emergency_share_off_rounded
                    : Icons.emergency_share,
                color: Colors.white,
              ),
      ),
    );
  }
}
