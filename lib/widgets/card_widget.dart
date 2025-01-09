
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final int? id;
  final String? name; 
  final String? description;
  final String? country;
  final String? image;
  const CardWidget({super.key, this.description, this.id, this.name, this.country,this.image });

  @override
  Widget build(BuildContext context) {
    return Card(  elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row for id and name
            Row(
              children: [
                Text("($id)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(width: 12),
                Text(
                  name ?? "Unknown",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Country Text
            Text(
              country ?? "Unknown Country",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            // Description Text
            Text(
              description ?? "No description available.",
              style: TextStyle(fontSize: 14, color: Colors.black87),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            // Image Display (if image URL is provided)
            image != null
                ? Image.network(image!, height: 150, fit: BoxFit.cover)
                : Container(height: 150, color: Colors.grey[300], child: Center(child: Text("No Image"))),
          ],
        ),
      ),
    );
  }
}