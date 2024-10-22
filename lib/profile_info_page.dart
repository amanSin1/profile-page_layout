import 'package:flutter/material.dart';

class ProfileInfoPage extends StatefulWidget {
  final String label; // Label for the text field (Email, Name, Phone)
  final String initialValue; // Initial value for the text field

  ProfileInfoPage({required this.label, required this.initialValue}); // Constructor

  @override
  _ProfileInfoPageState createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  late final TextEditingController _controller; // Declare the controller

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue); // Initialize with the passed initial value
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          // Dynamic text field
          TextFormField(
            controller: _controller, // Use the controller to manage text
            decoration: InputDecoration(
              labelText: widget.label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            readOnly: true, // Ensures the field is non-editable
          ),
          // Change button overlay
          Positioned(
            right: 10, // Adjust the position as needed
            top: 4, // Adjust the position as needed
            child: TextButton(
              onPressed: () {
                // Show dialog to change value
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Change ${widget.label}'),
                    content: TextField(
                      controller: _controller, // Use the same controller
                      decoration: InputDecoration(labelText: 'Enter new ${widget.label.toLowerCase()}'),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            // You may want to do something with the updated value
                          });
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text('Change'),
                      ),
                    ],
                  ),
                );
              },
              child: Text(
                'CHANGE',
                style: TextStyle(
                  color: Colors.red, // Change button color to red
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
