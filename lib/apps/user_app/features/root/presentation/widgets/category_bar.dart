import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({super.key});

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  List<String> items = ["All", "Buses", "Routes", "Stops"];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: w(0.04)),
      child: SizedBox(
        height: h(0.05),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            bool isSelected = selected == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selected = index;
                });
              },
              child: AnimatedContainer(
                padding: EdgeInsets.symmetric(horizontal: w(0.053)),
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOutCubic,
                decoration: BoxDecoration(
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppTheme.color.withOpacity(.3),
                            blurRadius: 15,
                          ),
                        ]
                      : [],
                  color: isSelected
                      ? AppTheme.color
                      : const Color.fromARGB(255, 225, 225, 225),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    items[index],
                    style: GoogleFonts.inter(fontSize: w(0.04)),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (_, _) => SizedBox(width: w(0.02)),
          itemCount: items.length,
        ),
      ),
    );
  }
}
