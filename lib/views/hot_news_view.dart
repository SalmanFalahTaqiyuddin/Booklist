import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class NewsItem {
  final String title;
  final String imageUrl;
  final String source;
  final String content;

  NewsItem({
    required this.title,
    required this.imageUrl,
    required this.source,
    required this.content,
  });
}

final List<NewsItem> mockNews = [
  NewsItem(
    title: 'Menyelami Denyut Terakhir Sentra Buku Kwitang',
    imageUrl:
        'https://asset.kompas.com/crops/FI4isjF0-vy2K6Ci3-3X7pRlNn8=/0x0:0x0/1200x800/data/photo/2025/11/06/690c7de118cbf.jpeg',
    source: 'Kompas.com',
    content:
        'Artikel ini menyoroti kondisi Sentra Buku Kwitang di Jalan Kramat Raya, Senen, Jakarta Pusat, yang kini berada di ujung masa kejayaannya. Para pedagang buku bekas di sana menghadapi tantangan besar dari perkembangan digital dan kurangnya minat baca. Mereka berharap ada intervensi pemerintah untuk melestarikan kawasan bersejarah ini sebagai pusat literasi, sekaligus menyediakan fasilitas yang lebih memadai untuk menjaga keberlangsungan usaha mereka. Kisah-kisah sedih tentang toko-toko yang gulung tikar menjadi pengingat akan pentingnya menjaga warisan budaya ini.',
  ),
  NewsItem(
    title: 'Bedah Buku "Bawa Mereka Pulang", Waka MPR Bicara Nilai Kemanusia',
    imageUrl:
        'https://akcdn.detik.net.id/community/media/visual/2025/11/07/wakil-ketua-mpr-lestari-moerdijat-1762516005151_169.jpeg?w=700&q=90',
    source: 'news.detik.com',
    content:
        'Wakil Ketua MPR RI, Lestari Moerdijat (Rerie), menghadiri acara bedah buku "Bawa Mereka Pulang" karya Fenty Effendy di Kampus Pascasarjana UGM, Yogyakarta. Dalam pidatonya, Rerie menekankan pentingnya nilai-nilai kemanusiaan dan keadilan sosial yang terkandung dalam buku tersebut, terutama yang berkaitan dengan isu-isu hak asasi manusia dan kepulangan warga negara Indonesia yang bermasalah di luar negeri. Beliau mengajak seluruh elemen masyarakat, khususnya generasi muda, untuk mengambil peran aktif dalam upaya kemanusiaan. Acara ini juga dihadiri oleh akademisi dan pegiat HAM.',
  ),
  NewsItem(
    title: 'India Kalahkan Negara Maju dalam Budaya Baca, RI Jangan Ditanya',
    imageUrl:
        'https://awsimages.detik.net.id/visual/2023/04/28/ilustrasi-1_169.jpeg?w=900&q=80',
    source: 'cnbcindonesia.com',
    content:
        'Berita ini menyoroti data dari World Population Review tentang minat baca global, yang menunjukkan posisi mengejutkan dari India dan kondisi Indonesia. India menempati posisi teratas dengan rata-rata jam membaca per minggu yang jauh melampaui banyak negara maju di Eropa dan Amerika. Sementara itu, Indonesia masih berkutat di peringkat bawah, meskipun upaya pemerintah dalam menggalakkan literasi terus dilakukan. Analisis dalam artikel ini menyimpulkan bahwa faktor akses terhadap buku, infrastruktur perpustakaan, dan kurikulum pendidikan masih menjadi tantangan utama yang harus segera diatasi untuk meningkatkan budaya baca di Indonesia.',
  ),
  NewsItem(
    title:
        'Depok Gelar Literacy Fest Seminggu Penuh, Dari Bazar Buku hingga Hiburan',
    imageUrl:
        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjXCr1HnMPl5CDXnt_3AHu9_C3S3JYrajFgr1SPRVRPQ0P623vPeMvZj4Srqv83cV1EWMhL0uquJdcoZWtPMxLF3PW-NTm-aHDyIY4IoJss2uEGBhgh4fMDLWhIK7iHTTnCfyKcvOIpAvKz0TDaT8fkpzNZBuaD9gAkq9LDWQ4RGRMb3BTXpROg3uN1P1MW/w700-h400-c/1002448857.jpg',
    source: 'beritasatu.com',
    content:
        'Pemerintah Kota (Pemkot) Depok melalui Dinas Kearsipan dan Perpustakaan menyelenggarakan Depok Literacy Fest 2025 sebagai upaya untuk meningkatkan minat baca dan memperkuat budaya literasi di kalangan masyarakat. Festival yang berlangsung selama seminggu penuh ini menampilkan berbagai kegiatan menarik, mulai dari bazar buku besar-besaran dengan diskon menarik, diskusi literasi dengan penulis terkenal, hingga pertunjukan seni dan hiburan keluarga. Walikota Depok, dalam sambutannya, berharap acara ini dapat menjadi agenda tahunan yang dinanti-nantikan dan berhasil mencetak generasi Depok yang gemar membaca.',
  ),
  NewsItem(
    title:
        'Fadli Zon Luncurkan Buku Sejarah Indonesia Versi Terbaru Bulan Depan',
    imageUrl:
        'https://akcdn.detik.net.id/visual/2025/10/02/fadli-zon-1759404769981_169.jpeg?w=650&q=90',
    source: 'cnnindonesia.com',
    content:
        'Menteri Kebudayaan RI, Fadli Zon, mengumumkan bahwa hasil proyek penulisan ulang sejarah Indonesia versi terbaru akan dirilis pada Desember 2025. Buku ini diklaim akan menawarkan perspektif yang lebih komprehensif dan inklusif mengenai narasi sejarah bangsa, melibatkan para sejarawan dari berbagai latar belakang. Rencananya, buku ini akan menjadi materi utama dalam kurikulum pendidikan nasional. Langkah ini memicu perdebatan di kalangan akademisi dan masyarakat tentang urgensi dan objektivitas penulisan ulang sejarah. Peluncuran buku ini dijanjikan akan diiringi dengan seminar nasional yang melibatkan publik.',
  ),
];

class NewsDetailPage extends StatelessWidget {
  final NewsItem news;
  const NewsDetailPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          news.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff189B56),
        foregroundColor: Colors.white,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xff189B56),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  12,
                ),
                child: Image.network(
                  news.imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    color: Colors.grey[200],
                    child: const Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                news.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sumber: ${news.source}',
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 14,
                ),
              ),
              const Divider(
                height: 30,
                color: Colors.white54,
              ),

              Text(
                news.content,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class HotNewsView extends StatefulWidget {
  const HotNewsView({super.key});

  @override
  State<HotNewsView> createState() => _HotNewsViewState();
}

class _HotNewsViewState extends State<HotNewsView> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playSound(String fileName) async {
    await _audioPlayer.play(AssetSource(fileName));
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page != null) {
        int next = _pageController.page!.round();
        if (_currentPage != next) {
          setState(() {
            _currentPage = next;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _showNewsDetail(NewsItem news) {
    _playSound('click.wav');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewsDetailPage(news: news)),
    );
  }

  Widget _buildCarouselItem(NewsItem news) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double scale = 1.0;
        if (_pageController.position.haveDimensions) {
          scale = (_pageController.page! - mockNews.indexOf(news)).abs().clamp(
            0.0,
            1.0,
          );
          scale = 1 - (scale * 0.2);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeOut.transform(scale) * 200,
            child: child,
          ),
        );
      },
      child: InkWell(
        onTap: () => _showNewsDetail(news),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  news.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: Icon(Icons.broken_image, color: Colors.grey),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black87],
                      stops: [0.5, 1.0],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12,
                  left: 12,
                  right: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.source,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        news.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: mockNews.map((news) {
        int index = mockNews.indexOf(news);
        return AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
          height: 8.0,
          width: 8.0,
          decoration: BoxDecoration(
            color: _currentPage == index
                ? const Color.fromARGB(255, 255, 255, 255)
                : Colors.white54,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNewsListItem(NewsItem news) {
    return Column(
      children: [
        InkWell(
          onTap: () => _showNewsDetail(news),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    news.imageUrl,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 90,
                      height: 90,
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(Icons.broken_image, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        news.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Sumber: ${news.source}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        news.content,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff189B56),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: mockNews.length,
                itemBuilder: (context, index) {
                  return _buildCarouselItem(mockNews[index]);
                },
              ),
            ),
            _buildPageIndicator(),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                      child: Text(
                        'Recommendations',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff189B56),
                        ),
                      ),
                    ),
                    ...mockNews
                        .map((news) => _buildNewsListItem(news))
                        .toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
