import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/user_app/features/details/presentation/view/details.dart';
import 'package:transit_track_flutter/apps/user_app/features/root/presentation/widgets/category_bar.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class Rout extends StatefulWidget {
  const Rout({super.key});

  @override
  State<Rout> createState() => _RoutState();
}

class _RoutState extends State<Rout> {
  TextEditingController searchController = TextEditingController();

  List<Map<String, String>> busList = [
    {
      "name": "STRANGER",
      "number": "KL07C0312",
      "route": "Vytila Hub → Aluva",
      "next": "Idappally",
    },
    {
      "name": "CITY FAST",
      "number": "KL08A1234",
      "route": "Kakkanad → Kaloor",
      "next": "Edappally",
    },
  ];

  List<Map<String, String>> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = busList;
  }

  void searchBus(String value) {
    setState(() {
      filteredList = busList
          .where(
            (bus) =>
                bus["name"]!.toLowerCase().contains(value.toLowerCase()) ||
                bus["number"]!.toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Scaffold(
      backgroundColor: AppColors.ThemeDasrkWhite(context),
      appBar: AppBar(
        backgroundColor: AppColors.ThemeDasrkWhite(context),
        title: Text(
          "Rout",
          style: GoogleFonts.poppins(
            fontSize: w(0.045),
            fontWeight: FontWeight(550),
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(w(0.04)),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(
                    255,
                    136,
                    136,
                    136,
                  ).withOpacity(.25),
                  blurRadius: 25,
                ),
              ],
            ),
            child: TextField(
              controller: searchController,
              onChanged: searchBus,
              decoration: InputDecoration(
                hintText: "Search buses or route",
                hintStyle: GoogleFonts.inter(fontSize: w(0.04)),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          CategoryBar(),
          Padding(
            padding: EdgeInsets.all(w(0.04)),
            child: Text("Search Results", style: GoogleFonts.inter()),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final bus = filteredList[index];

                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const BusScreen()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: AppTheme.color,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Icon(
                                  Icons.directions_bus,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(width: 10),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      bus["name"]!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(bus["number"]!),
                                    Text(
                                      bus["route"]!,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),

                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.bookmark,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 15),

                          Row(
                            children: [
                              const Text("Next Stop : "),
                              Text(
                                bus["next"]!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                "Online",
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
