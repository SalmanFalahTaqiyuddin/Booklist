import 'package:data/controllers/book_controller.dart';
import 'package:data/models/book.dart';
import 'package:data/views/bookdetailview.dart';
import 'package:data/widgets/modal_widget.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class _InteractiveStarRating extends StatefulWidget {
  final TextEditingController controller;

  const _InteractiveStarRating({required this.controller});

  @override
  State<_InteractiveStarRating> createState() => __InteractiveStarRatingState();
}

class __InteractiveStarRatingState extends State<_InteractiveStarRating> {
  double _currentRating = 0.0;

  @override
  void initState() {
    super.initState();
    _currentRating = double.tryParse(widget.controller.text) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Rating:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: List.generate(5, (index) {
            double starPosition = (index + 1).toDouble();

            bool isFilled = starPosition <= _currentRating;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _currentRating = starPosition;
                });
                widget.controller.text = starPosition.toString();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Icon(
                  isFilled ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 35,
                ),
              ),
            );
          }),
        ),
        TextFormField(
          controller: widget.controller,
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Rating Bintang (klik bintang di atas): $_currentRating',
            border: const OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.isEmpty ||
                double.tryParse(value) == null ||
                double.parse(value) < 0 ||
                double.parse(value) > 5) {
              return 'Pilih rating (0.0 - 5.0) dengan mengklik bintang.';
            }
            return null;
          },
        ),
      ],
    );
  }
}

class BookView extends StatefulWidget {
  const BookView({super.key});

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  final formKey = GlobalKey<FormState>();
  BookController bookController = BookController();

  final AudioPlayer _audioPlayer = AudioPlayer();

  TextEditingController titleController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List buttonChoice = ['update', 'delete'];
  List<BookModel> books = [];
  int? bookId;

  void _playSound(String fileName) async {
    await _audioPlayer.play(AssetSource(fileName));
  }

  getBooks() {
    setState(() {
      books = bookController.booksFinished;
    });
  }

  @override
  void initState() {
    super.initState();
    getBooks();
    ratingController.text = '0.0';
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Widget _buildStarRating(double? rating) {
    int fullStars = rating?.floor() ?? 0;
    bool hasHalfStar = (rating! - fullStars) >= 0.5;

    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      if (i < fullStars) {
        stars.add(const Icon(Icons.star, color: Colors.amber, size: 20));
      } else if (i == fullStars && hasHalfStar) {
        stars.add(const Icon(Icons.star_half, color: Colors.amber, size: 20));
      } else {
        stars.add(const Icon(Icons.star_border, color: Colors.amber, size: 20));
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...stars,
        const SizedBox(width: 8),
        Text(
          '(${rating?.toStringAsFixed(1) ?? '0.0'})',
          style: const TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildBookCard(BookModel book, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          _playSound('click.wav');

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookDetailView(book: book)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  book.imageUrl,
                  width: 100,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 100,
                    height: 120,
                    color: Colors.grey,
                    child: const Icon(
                      Icons.image_not_supported,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      book.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A2D25),
                        fontSize: 18,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      book.description ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF1A2D25),
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    _buildStarRating(book.rating),
                  ],
                ),
              ),
              PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return buttonChoice.map((r) {
                    return PopupMenuItem(
                      value: r,
                      child: Text(r),
                      onTap: () {
                        if (r == 'update') {
                          _playSound('click.wav');
                          setState(() {
                            bookId = books[index].id;
                          });
                          titleController.text = books[index].title;
                          imageController.text = books[index].imageUrl;
                          ratingController.text =
                              books[index].rating?.toString() ?? '0.0';
                          descriptionController.text =
                              books[index].description ?? '';

                          Future.delayed(Duration.zero, () {
                            ModalWidget().showFullModal(
                              context,
                              addItem(index),
                            );
                          });
                        } else if (r == 'delete') {
                          _playSound('succes.wav');
                          books.removeWhere(
                            (item) => item.id == books[index].id,
                          );
                          getBooks();
                        }
                      },
                    );
                  }).toList();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget addItem(int? index) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Judul Buku'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Judul harus diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            _InteractiveStarRating(controller: ratingController),
            const SizedBox(height: 15),
            TextFormField(
              controller: imageController,
              decoration: const InputDecoration(labelText: 'URL Gambar'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'URL Gambar harus diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Deskripsi'),
              maxLines: 3,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Deskripsi harus diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  _playSound('succes.wav');
                  if (index != null) {
                    books[index].id = bookId ?? 0;
                    books[index].title = titleController.text;
                    books[index].imageUrl = imageController.text;
                    books[index].rating = double.tryParse(
                      ratingController.text,
                    );
                    books[index].description = descriptionController.text;
                    getBooks();
                    Navigator.pop(context);
                  } else {
                    int id = books.isEmpty ? 1 : books.last.id + 1;
                    books.add(
                      BookModel(
                        id: id,
                        title: titleController.text,
                        imageUrl: imageController.text,
                        rating: double.tryParse(ratingController.text),
                        description: descriptionController.text,
                      ),
                    );
                    getBooks();
                    Navigator.pop(context);
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: const Color(0xFF12BC64),
                foregroundColor: Colors.white,
              ),
              child: Text(
                index != null ? 'UBAH BUKU' : 'SIMPAN BUKU',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalLibraryCard() {
    return Container(
      alignment: Alignment.topRight,
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: const Color(0xFFE0F3EA),
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.fitHeight,
          alignment: Alignment.topRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Personal Library',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A2D25),
                    ),
                  ),
                  const Text(
                    'The books I\'ve read',
                    style: TextStyle(fontSize: 14, color: Color(0xFF1A2D25)),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      _playSound('click.wav');
                      setState(() {
                        bookId = null;
                      });
                      titleController.text = '';
                      imageController.text = '';
                      ratingController.text = '0.0';
                      descriptionController.text = '';
                      ModalWidget().showFullModal(context, addItem(null));
                    },
                    icon: const Icon(Icons.add),
                    label: const Text(
                      'Add New Book',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildPersonalLibraryCard(),
            const SizedBox(height: 0),
            Text(
              'Books Finished',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            books.isEmpty
                ? const Center(
                    child: Text(
                      'Belum ada buku yang selesai dibaca.',
                      style: TextStyle(color: Colors.white70),
                    ),
                  )
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return _buildBookCard(books[index], index);
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
