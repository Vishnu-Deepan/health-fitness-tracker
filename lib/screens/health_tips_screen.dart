import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/health_provider.dart';
import '../widgets/health_tip_card.dart';

class HealthTipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final healthProvider = Provider.of<HealthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Health Tips'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () async {
              await healthProvider.setDailyReminder();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Daily reminder set for 8 AM')),
              );
            },
          ),
        ],
      ),
      body: healthProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: healthProvider.healthTips.length,
        itemBuilder: (context, index) {
          return HealthTipCard(healthTip: healthProvider.healthTips[index]);
        },
      ),
    );
  }
}
