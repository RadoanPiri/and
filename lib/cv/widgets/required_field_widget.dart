import 'package:flutter/material.dart';

class RequiredFieldWidget extends StatelessWidget {
  final String label;
  final String keyName;
  final TextEditingController controller;
  RequiredFieldWidget({required this.label, required this.keyName, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(label,              style: const TextStyle(color: Color(0xFF085399)), // Label color
              ),
                 const Text(
                  ' *',
                  style: TextStyle(color: Colors.red),
                ),

            ],
          ),
          TextFormField(
            controller: controller,
            key: Key(keyName), // Use label as a key
            decoration: InputDecoration(

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xFF14386E),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xFF14386E),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal:  8.0,
                vertical:  0.012,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
