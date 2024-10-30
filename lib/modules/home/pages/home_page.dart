import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/images/png/profile1.png'), // Your image path here
                      radius: 30.0,
                    ),
                    SizedBox(width: 16.0), // Spacing between avatar and text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello!',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          'Muhammad Bilal',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.notifications, size: 30.0),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 180,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 15, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Your Today Tasks',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Container(
                              color: Colors.white38,
                              child: const Icon(
                                Icons.more_horiz,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'is almost done!',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(
                              height: 60, // Increase the size of the circle
                              width: 60,
                              child: CircularProgressIndicator(
                                value: 0.7, // Set the progress value
                                backgroundColor: Colors.white.withOpacity(0.3),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Colors.white),
                                strokeWidth: 6.0,
                              ),
                            ),
                            const Text(
                              '70%', // Display percentage inside the circle
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                              child: Text(
                                'View Task',
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    const Text(
                      'In Progress',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      color: Colors.white38,
                      child: const Icon(
                        Icons.local_fire_department,
                        color: Colors.deepPurple,
                        size: 15,
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 120,
                        width: 220,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Office Project',
                                    style: TextStyle(color: Colors.white, fontSize: 10),
                                  ),
                                  Container(
                                    color: Colors.grey.shade400,
                                    child: const Icon(
                                      Icons.business_center,
                                      color: Colors.pinkAccent,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Grocery shopping app design',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height:20 ,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 8, // Height of the line
                                      color: Colors.blue, // First half (blue)
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 8, // Height of the line
                                      color: Colors.white, // Second half (white)
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 120,
                        width: 220,
                        decoration: BoxDecoration(
                            color: Colors.redAccent.shade100,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, right: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Personal Project',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                  Container(
                                    color: Colors.redAccent.shade100,
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Uber Eats redesign challange',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height:20 ,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 8,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 8,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 120,
                        width: 220,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey.shade100,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, right: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Daily Study',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                  Container(
                                    color: Colors.blueGrey.shade100,
                                    child: const Icon(
                                      Icons.auto_stories,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Manage time for my tasks',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height:20 ,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 8,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 8, // Height of the line
                                      color: Colors.white, // Second half (white)
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 120,
                        width: 220,
                        decoration: BoxDecoration(
                            color: Colors.brown.shade100,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, right: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Games Time',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                  Container(
                                    color: Colors.brown.shade100,
                                    child: const Icon(
                                      Icons.sports_volleyball,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Manage time for playing games',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height:20 ,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 8,
                                      color: Colors.brown,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 8,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      'Tasks Groups',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '4',
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      height: 80,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.business_center,
                                  color: Colors.pink,
                                  size: 30.0,
                                ),
                                SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Office Project',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '23 Tasks',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  height: 40, // Size of the circle
                                  width: 40,
                                  child: CircularProgressIndicator(
                                    value: 0.7, // Set the progress value
                                    backgroundColor:
                                        Colors.pink.withOpacity(0.3),
                                    valueColor: const AlwaysStoppedAnimation<Color>(
                                        Colors.pink),
                                    strokeWidth: 6.0,
                                  ),
                                ),
                                const Text(
                                  '80%', // Display percentage inside the circle
                                  style: TextStyle(
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      height: 80,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.deepPurple,
                                  size: 30.0,
                                ),
                                SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Personal Project',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '30 Tasks',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  height: 40, // Size of the circle
                                  width: 40,
                                  child: CircularProgressIndicator(
                                    value: 0.55, // Set the progress value
                                    backgroundColor:
                                        Colors.deepPurple.withOpacity(0.3),
                                    valueColor: const AlwaysStoppedAnimation<Color>(
                                        Colors.deepPurple),
                                    strokeWidth: 6.0,
                                  ),
                                ),
                                const Text(
                                  '55%', // Display percentage inside the circle
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      height: 80,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             const Row(
                              children: [
                                Icon(
                                  Icons.auto_stories,
                                  color: Colors.orange,
                                  size: 30.0,
                                ),
                                SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Daily Study',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '30 Tasks',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  height: 40, // Size of the circle
                                  width: 40,
                                  child: CircularProgressIndicator(
                                    value: 0.80, // Set the progress value
                                    backgroundColor:
                                        Colors.orange.withOpacity(0.3),
                                    valueColor: const AlwaysStoppedAnimation<Color>(
                                        Colors.orange),
                                    strokeWidth: 6.0,
                                  ),
                                ),
                                const Text(
                                  '87%', // Display percentage inside the circle
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      height: 80,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.sports_volleyball,
                                  color: Colors.green,
                                  size: 30.0,
                                ),
                                SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Game Time',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '20 Tasks',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  height: 40, // Size of the circle
                                  width: 40,
                                  child: CircularProgressIndicator(
                                    value: 0.70, // Set the progress value
                                    backgroundColor:
                                        Colors.green.withOpacity(0.3),
                                    valueColor: const AlwaysStoppedAnimation<Color>(
                                        Colors.green),
                                    strokeWidth: 6.0,
                                  ),
                                ),
                                const Text(
                                  '70%', // Display percentage inside the circle
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
