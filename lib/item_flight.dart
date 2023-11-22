import 'package:flutter/material.dart';

class ItemFlight extends StatefulWidget {
  final String from;
  final String to;
  final String date;

  const ItemFlight({
    required this.from,
    required this.to,
    required this.date,
  });

  @override
  State<ItemFlight> createState() => _ItemFlightState();
}

class _ItemFlightState extends State<ItemFlight> {
  @override
  Widget build(BuildContext context) {
    
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
     
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.flight_takeoff, color: Colors.green),
                SizedBox(width: 8.0),
                Text(
                  'From: ${widget.from}',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.flight_land, color: Colors.red),
                SizedBox(width: 8.0),
                Text(
                  'To: ${widget.to}',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.black),
                SizedBox(width: 8.0),
                Text(
                  'Date: ${widget.date}',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
