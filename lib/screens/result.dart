import 'package:flutter/material.dart';
import 'package:wegesha_client/config/theme.dart';

class ResultsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Results'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildResultCard(
              title: 'Lab Result',
              value: 'Normal',
              icon: Icons.healing,
            ),
            SizedBox(height: 16.0),
            _buildResultCard(
              title: 'Heart Rate',
              value: '78 bpm',
              icon: Icons.favorite,
            ),
            SizedBox(height: 16.0),
            _buildResultCard(
              title: 'Blood Pressure',
              value: '120/80 mmHg',
              icon: Icons.assignment,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  icon,
                  size: 32.0,
                  color: ColorTheme.primaryColor,
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              value,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
