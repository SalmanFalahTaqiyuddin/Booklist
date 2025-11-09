import 'package:data/models/book.dart';
import 'package:flutter/material.dart';

class BookDetailView extends StatelessWidget {
  final BookModel book;

  const BookDetailView({super.key, required this.book});

  Widget _buildStarRatingDisplay(double? rating) {
    final nonNullRating = rating ?? 0.0;
    final fullStars = nonNullRating.floor();
    final hasHalfStar = (nonNullRating - fullStars) >= 0.5;

    final stars = List.generate(5, (index) {
      if (index < fullStars) {
        return const Icon(Icons.star, color: Colors.amber, size: 30);
      } else if (index == fullStars && hasHalfStar) {
        return const Icon(Icons.star_half, color: Colors.amber, size: 30);
      } else {
        return const Icon(Icons.star_border, color: Colors.amber, size: 30);
      }
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...stars,
        const SizedBox(width: 10),
        Text(
          book.rating?.toStringAsFixed(1) ?? 'N/A',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF1A2D25);
    const backgroundColor = Color.fromARGB(255, 255, 255, 255);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          book.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: backgroundColor,
        foregroundColor: primaryColor,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  book.imageUrl,
                  height: 300,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 300,
                    width: 200,
                    color: Colors.grey,
                    child: const Icon(
                      Icons.image_not_supported,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(child: _buildStarRatingDisplay(book.rating)),
            const SizedBox(height: 30),
            Text(
              book.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const Divider(color: primaryColor),
            const SizedBox(height: 10),
            const Text(
              'Deskripsi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              book.description ?? 'Deskripsi tidak tersedia.',
              style: const TextStyle(
                fontSize: 16,
                color: primaryColor,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
