import 'package:data/models/book.dart';

class BookController {
  final List<BookModel> booksFinished = [
    BookModel(
      id: 1,
      title: 'Vlog Viral Amel',
      rating: 5.0,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd91MIjkuYVL3MzoN8vpl7SpbEYhIMyU4AEQ&s',
      description:
          'Amel adalah seorang YouTuber dengan 5.000 follower. Dengan segala cara, dia berusaha agar followernya bertambah. Namun, siapa sangka, vlog viral yang dia buat justru memicu bencana!',
    ),
    BookModel(
      id: 2,
      title: 'Kopral Jono',
      rating: 4.0,
      imageUrl:
          'https://ebooks.gramedia.com/ebook-covers/33527/image_highres/GPU_KJON2019MTH03KJON1.jpg',
      description:
          'Anjing berisik bernama Kopral Jono yang dirawat Surya menuntunnya pada bangkai orangutan, rencana rahasia dua pemuda mencurigakan, laporan ke Pak Imam, dan akhirnya pengungkapan misteri setelah Jono kabur sehari sebelum rencana rahasia pada 17 Agustus.',
    ),
    BookModel(
      id: 3,
      title: 'The 5 AM Club',
      rating: 4.0,
      imageUrl:
          'https://image.gramedia.net/rs:fit:0:0/plain/https://cdn.gramedia.com/uploads/items/The_5am_Club_Depan.jpg',
      description:
          'The 5 AM Club berdasarkan konsep dan metode yang selama ini telah diajarkan penulis kepada para pengusaha sukses terkenal, CEO dari perusahaan legendaris, bintang olahraga, orang ternama di bidang musik, dan anggota keluarga kerajaan―dengan kesuksesan luar biasa―selama lebih dua puluh tahun. Buku ini membantu Anda melekat pada kebiasaan bangun pagi hari sebagai praktik seumur hidup juga menerapkan The 20/20/20 Formula sebagai rutinitas pagi sehingga Anda mengalami hasil kelas-dunia.',
    ),
  ];
}
