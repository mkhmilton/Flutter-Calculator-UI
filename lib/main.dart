import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
          child: Container(
            width: 350, // Set a fixed width for the calculator
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white, // Background of the calculator
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment:
                  CrossAxisAlignment.stretch, // Align to stretch horizontally
              children: [
                // Calculator title inside blue bar above the buttons
                Container(
                  color: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Calculator',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 5), // Reduced space between title and display
                // Display Screen
                Container(
                  width: double.infinity,
                  height: 80,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12, width: 2),
                  ),
                  alignment: Alignment.centerRight,
                  
                ),
                SizedBox(
                    height: 5), // Reduced space between display and buttons
                // Button layout with minimal spacing
                buildWideRow(['DEL', '='], Colors.blue, Colors.blue),
                buildRow(['1', '2', '3', '/'], Colors.orange, Colors.green),
                buildRow(['4', '5', '6', '-'], Colors.orange, Colors.green),
                buildRow(['7', '8', '9', 'X'], Colors.orange, Colors.green),
                buildRow(['.', '0', '%', '+'], Colors.orange, Colors.green),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method for the wide row (for DEL and = buttons)
  Widget buildWideRow(List<String> labels, Color leftColor, Color rightColor) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 2), // Reduced vertical spacing
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjusted alignment
        children: [
          // DEL button spans two columns
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(1),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: leftColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  labels[0],
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ), 
              ),
            ),
          ),
          // = button spans two columns
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(1),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: rightColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  labels[1],
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build a row of buttons
  Widget buildRow(List<String> labels, Color numberColor, Color operatorColor) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 2), // Reduced vertical spacing
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjusted alignment
        children: labels.map((label) {
          Color color = label == '/' ||
                  label == 'X' ||
                  label == '-' ||
                  label == '+' ||
                  label == '%'
              ? operatorColor
              : numberColor;
          return buildButton(label, color);
        }).toList(),
      ),
    );
  }

  // Helper method to build a single button
  Widget buildButton(String label, Color color) {
    return Container(
      width: 70, // Button size to make it more compact
      height: 70,
      margin: EdgeInsets.all(1), // Reduced margin between buttons
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
