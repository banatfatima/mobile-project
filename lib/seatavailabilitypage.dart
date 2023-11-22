import 'package:flutter/material.dart';

class SeatAvailabilityPage extends StatefulWidget {
  final String flightDestination;

  SeatAvailabilityPage({required this.flightDestination});

  @override
  _SeatAvailabilityPageState createState() => _SeatAvailabilityPageState();
}

class _SeatAvailabilityPageState extends State<SeatAvailabilityPage> {

  List<String> availableSeats = [
    'A1', 'A2', 'A3', 'A4', 'A5',
    'B1', 'B2', 'B3', 'B4', 'B5',
    'C1', 'C2', 'C3', 'C4', 'C5',
    'D1', 'D2', 'D3', 'D4', 'D5',
  ];


  List<String> occupiedSeats = ['B3', 'C2', 'D4','A1','D5'];


  String? selectedSeat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seat Availability'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Available Seats for ${widget.flightDestination}:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: availableSeats.length,
              itemBuilder: (BuildContext context, int index) {
                final seat = availableSeats[index];
                final isOccupied = occupiedSeats.contains(seat);

                return ElevatedButton(
                  onPressed: isOccupied
                      ? null
                      : () {

                    setState(() {
                      selectedSeat = seat;
                    });

                    Navigator.pop(context, selectedSeat);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: isOccupied ? Colors.red : Colors.green,
                  ),
                  child: Text(seat),
                );
              },
            ),
            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LegendTile(color: Colors.green, label: 'Available'),
                SizedBox(width: 16),
                LegendTile(color: Colors.red, label: 'Occupied'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LegendTile extends StatelessWidget {
  final Color color;
  final String label;

  LegendTile({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          color: color,
        ),
        SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}
