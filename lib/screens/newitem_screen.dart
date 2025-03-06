import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For price formatting

class NewItemScreen extends StatefulWidget {
  @override
  _NewItemScreenState createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {
  final TextEditingController _imagePathController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final NumberFormat _formatter =
      NumberFormat("#,##0.00", "en_US"); // Formats number with separators

  // Function to format price input
  void _formatPriceInput(String value) {
    value = value.replaceAll(',', ''); // Remove existing commas
    if (value.isNotEmpty) {
      double parsedValue = double.tryParse(value) ?? 0.0;
      setState(() {
        _priceController.text = _formatter.format(parsedValue);
        _priceController.selection = TextSelection.fromPosition(
          TextPosition(offset: _priceController.text.length),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Item", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Colors.black), // Ensures back button is visible
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Static Image from Assets
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(0),
                color: Colors.grey[200],
                image: DecorationImage(
                  image:
                      AssetImage("assets/lego.jpg"), // Ensure this file exists
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),

            // Browse TextField + Button in a Row
            TextField(
              controller: _imagePathController,
              readOnly: true, // The user can't type manually
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: ElevatedButton(
                  onPressed: () {
                    print("Browse Clicked");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF76300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // Rectangular button
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                  ),
                  child: Text("Browse", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Title Field
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "Title",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
              ),
            ),
            SizedBox(height: 16),

            // Description Field
            TextField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Description",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
              ),
            ),
            SizedBox(height: 16),

            // Price Input Field with Separate Boxed Peso Symbol
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6), // Space between label and input field
                Row(
                  children: [
                    // Boxed Peso Symbol
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.black), // Border for box
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      child: Text(
                        "₱",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // TextField for Price
                    Expanded(
                      child: TextField(
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        onChanged:
                            _formatPriceInput, // Format input while typing
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.zero, // Match boxed style
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Align Save Button to Right
            Align(
              alignment: Alignment.centerRight, // Moves the button to the right
              child: SizedBox(
                width: 100, // Button width
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Text("Save",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
