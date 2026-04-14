
import 'package:flutter/material.dart';
import 'package:transit_track_flutter/apps/user_app/features/details/presentation/view/details.dart';
import 'package:transit_track_flutter/core/constants/colors.dart';
import 'package:transit_track_flutter/core/constants/text.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';

class Save extends StatefulWidget {
  const Save({super.key});

  @override
  State<Save> createState() => _SaveState();
}

class _SaveState extends State<Save> {

  TextEditingController searchController = TextEditingController();
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ConstText.save),
      ),

      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: searchController,
              // onChanged: searchBus,
              decoration: InputDecoration(
                hintText: "Search bus...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                // final bus = filteredList[index];

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
                                child: const Icon(Icons.directions_bus,
                                    color: Colors.white),
                              ),

                              const SizedBox(width: 10),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(bus["name"]!,
                                    //     style: const TextStyle(
                                    //         fontWeight: FontWeight.bold)),
                                    // Text(bus["number"]!),
                                    // Text(bus["route"]!,
                                        // style: const TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ),

                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.bookmark,
                                    color: AppColors.black),
                              ),
                            ],
                          ),

                          const SizedBox(height: 15),

                          
                          Row(
                            children: [
                              const Text(ConstText.nextStop),
                              // Text(bus["next"]!,
                              //     style: const TextStyle(
                              //         fontWeight: FontWeight.bold)),
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
                              const Text(ConstText.oline,
                                  style: TextStyle(color: Colors.green)),
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