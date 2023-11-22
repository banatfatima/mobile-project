import 'package:flutter/material.dart';
import 'package:project_uni/seatavailabilitypage.dart';

class Flight {
  String destination;
  String departureCity;
  String arrivalCity;
  int ticketPrice;
  int insuranceCost = 100;
  int warranty = 1;
  bool hasInsurance = false;
  String flightClass;
  int classCharge;

  Flight(this.destination, this.departureCity, this.arrivalCity,
      this.ticketPrice, this.flightClass, this.classCharge);

  double getTotalCost(int numberOfAdults, int numberOfChildren) {
    int insuranceAmount = hasInsurance ? insuranceCost : 0;
    int totalPassengers = numberOfAdults + numberOfChildren;
    double totalCost = 0;

    if (warranty == 1) {
      totalCost = (ticketPrice * 1.05 + insuranceAmount) * totalPassengers;
    } else {
      totalCost = (ticketPrice * 1.1 + insuranceAmount) * totalPassengers;
    }

    totalCost += classCharge.toDouble();

    return totalCost;
  }
}

List<Flight> flights = [
  Flight('New York', 'MEA', 'LGA', 500, 'Economy', 0),
  Flight('Paris', 'MEA', 'ORY', 800, 'Business', 200),
  Flight('Tokyo', 'MEA', 'NRT', 1200, 'First Class', 500),
  Flight('Cairo', 'MEA', 'CAI', 800, 'Business', 200),
  Flight('Dubai', 'MEA', 'DXB', 1200, 'First Class', 500),
  Flight('Istanbul', 'MEA', 'IST', 600, 'Economy', 0),
];

class BookingFlight extends StatefulWidget {
  const BookingFlight({Key? key}) : super(key: key);

  @override
  State<BookingFlight> createState() => _BookingFlightState();
}

class _BookingFlightState extends State<BookingFlight> {
  Flight selectedFlight = flights[0];
  bool hasInsurance = false;
  String passengerName = '';
  int numberOfAdults = 1;
  int numberOfChildren = 0;
  String selectedClass = 'Economy';
  bool isRoundTrip = true;
  DateTime departureDate = DateTime.now();
  DateTime arrivalDate = DateTime.now();
  String? passengerSeat;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Flight Booking Page'),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            elevation: 8.0,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.flight_takeoff, color: Colors.green),
                          SizedBox(width: 8.0),
                          Text(
                            'Select Country',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: DropdownButton<Flight>(
                        value: selectedFlight,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24.0,
                        elevation: 16,
                        style: TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colors.transparent,
                        ),
                        onChanged: (Flight? flight) {
                          setState(() {
                            selectedFlight = flight!;
                          });
                        },
                        items: flights.map((Flight flight) {
                          return DropdownMenuItem<Flight>(
                            value: flight,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                flight.destination,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            Icon(Icons.flight_takeoff, color: Colors.green),
                            SizedBox(width: 8.0),
                            Text(
                              'Select Class',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        )),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: DropdownButton<String>(
                        value: selectedClass,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24.0,
                        elevation: 16,
                        style: TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colors.transparent,
                        ),
                        onChanged: (String? flightClass) {
                          setState(() {
                            selectedClass = flightClass!;
                          });
                        },
                        items: ['Economy', 'Business', 'First Class']
                            .map((String flightClass) {
                          return DropdownMenuItem<String>(
                            value: flightClass,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                flightClass,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 21.0),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.green,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              'Enter Your Name',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        )),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          passengerName = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Select Ticket Type',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: true,
                          groupValue: isRoundTrip,
                          onChanged: (value) {
                            setState(() {
                              isRoundTrip = value as bool;
                            });
                          },
                        ),
                        Text('One Way'),
                        Radio(
                          value: false,
                          groupValue: isRoundTrip,
                          onChanged: (value) {
                            setState(() {
                              isRoundTrip = value as bool;
                            });
                          },
                        ),
                        Text('Round Trip'),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration:
                            InputDecoration(labelText: 'Number of Adults'),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {
                                numberOfAdults = int.tryParse(value) ?? 1;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter your number of adults";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: TextFormField(
                            decoration:
                            InputDecoration(labelText: 'Number of Children'),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {
                                numberOfChildren = int.tryParse(value) ?? 0;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Departure Date',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: departureDate,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2101),
                                  );
                                  if (pickedDate != null && pickedDate != departureDate) {
                                    setState(() {
                                      departureDate = pickedDate;
                                    });
                                  }
                                },
                              ),
                            ),

                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Arrival Date',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: arrivalDate,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2101),
                                  );
                                  if (pickedDate != null && pickedDate != arrivalDate) {
                                    setState(() {
                                      arrivalDate = pickedDate;
                                    });
                                  }
                                },
                              ),
                            ),
                            // Add onChanged and validator as needed
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.0),

                    // Add the button to check seat availability
                    ElevatedButton(
                      onPressed: () async {
                        // Navigate to SeatAvailabilityPage and wait for seat selection
                        final selectedSeat = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeatAvailabilityPage(
                              flightDestination: selectedFlight.destination,
                            ),
                          ),
                        );


                        if (selectedSeat != null) {
                          setState(() {
                            // Set the selected seat in the booking details
                            passengerSeat = selectedSeat;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Selected Seat: $selectedSeat'),
                              duration: Duration(seconds: 2),
                            ),

                          );
                        }
                      },
                      child: Text('Check Seat Availability'),

                    ),



                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showFinalCostDialog(context);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Calculate Final Cost',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Icon(Icons.flight),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void showFinalCostDialog(BuildContext context) {
    double finalCost =
    selectedFlight.getTotalCost(numberOfAdults, numberOfChildren);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Details'),
          content: Container(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                buildDetailItem('Selected Flight', selectedFlight.destination),
                buildDetailItem('Departure City', selectedFlight.departureCity),
                buildDetailItem('Arrival City', selectedFlight.arrivalCity),
                buildDetailItem('Passenger Name', passengerName),
                buildDetailItem('Class', selectedClass),
                buildDetailItem('Number of Adults', numberOfAdults.toString()),
                buildDetailItem(
                    'Number of Children', numberOfChildren.toString()),
                buildDetailItem('Ticket Type', isRoundTrip ? 'Round Trip' : 'One Way'),
                buildDetailItem('Selected Seat', passengerSeat ?? 'Not selected'),
                buildDetailItem('Total Cost', '\$$finalCost'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                confirmBooking(context);
                Navigator.of(context).pop();
              },
              child: Text('Confirm Booking'),
            ),
          ],
        );
      },
    );
  }

  void confirmBooking(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Your flight from ${selectedFlight.departureCity} to ${selectedFlight.arrivalCity} has been booked successfully!'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  Widget buildDetailItem(String label, String value) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ]));
  }
}