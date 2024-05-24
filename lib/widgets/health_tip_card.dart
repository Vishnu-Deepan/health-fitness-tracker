import 'package:flutter/material.dart';

import '../models/health_tip.dart';

class HealthTipCard extends StatelessWidget {
  final HealthTip healthTip;

  HealthTipCard({required this.healthTip});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Image.network(healthTip.imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              healthTip.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(healthTip.description),
          ),
        ],
      ),
    );
  }
}
