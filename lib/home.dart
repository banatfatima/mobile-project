import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:project_uni/booking_flight.dart';
import 'package:project_uni/item_flight.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'SAFRA',
                style: TextStyle(
                    color: const Color.fromARGB(255, 46, 45, 45),
                    fontStyle: FontStyle.italic),
              ),
              TextSpan(text: ' AIRLINE'),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 190,
            child: ImageSlideshow(
              indicatorColor: const Color.fromARGB(255, 243, 33, 33),
              onPageChanged: (value) {
                debugPrint('Page changed: $value');
              },
              autoPlayInterval: 2500,
              isLoop: true,
              children: [
                Image.asset(
                  'assests/a1.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assests/a2.jpg',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -20),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 5),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(.2)),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter your Destination',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon:
                        Icon(Icons.location_on_outlined, color: Colors.grey)),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  title: Text('Upcoming Trips',
                      style: Theme.of(context).textTheme.titleLarge),
                  trailing: TextButton(
                    onPressed: () {},
                    child: const Text('Show all'),
                  ),
                ),
                ItemFlight(
                  from: 'Beirut',
                  to: 'London',
                  date: '2023-11-28',
                ),
                ItemFlight(
                  from: 'Beirut',
                  to: 'Paris',
                  date: '2023-12-2',
                ),
                ItemFlight(
                  from: 'Cairo',
                  to: 'Beirut',
                  date: '2023-12-6',
                ),
                ItemFlight(
                  from: 'Dubai',
                  to: 'Beirut',
                  date: '2023-12-8',
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookingFlight()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25.0),
              ),
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Book Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
