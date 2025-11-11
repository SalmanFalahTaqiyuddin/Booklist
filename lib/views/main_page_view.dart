import 'package:data/views/book_view.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:data/views/hot_news_view.dart';
import 'package:data/views/profile_view.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageState();
}

class _MainPageState extends State<MainPageView> {
  int _selectedIndex = 0;

  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _playSound(String assetFileName) async {
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(assetFileName));
  }

  static const List<Widget> _widgetOptions = <Widget>[
    BookView(),
    HotNewsView(),
    ProfileView(),
  ];

  final List<Map<String, dynamic>> _drawerItems = const [
    {'title': 'Booklist', 'icon': Icons.home, 'index': 0},
    {'title': 'News', 'icon': Icons.newspaper, 'index': 1},
    {'title': 'Profile', 'icon': Icons.person, 'index': 2},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Widget _buildDrawer() {
    return Drawer(
<<<<<<< HEAD
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
=======
      backgroundColor: const Color.fromARGB(
        255,
        255,
        255,
        255,
      ), 
>>>>>>> 527f104cae95da18fd3adb881bba17c2f940a6bd
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
<<<<<<< HEAD
            decoration: BoxDecoration(color: Color(0xff189B56)),
=======
            decoration: BoxDecoration(
              color: Color(0xff189B56),
            ), 
>>>>>>> 527f104cae95da18fd3adb881bba17c2f940a6bd
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Booklist App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Personal Library',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          ..._drawerItems.map((item) {
            final isSelected = item['index'] == _selectedIndex;
            return ListTile(
              leading: Icon(
                item['icon'],
<<<<<<< HEAD
                color: isSelected ? const Color(0xff189B56) : Colors.grey[700],
=======
                color: isSelected
                    ? const Color(0xff189B56)
                    : Colors.grey[700], 
>>>>>>> 527f104cae95da18fd3adb881bba17c2f940a6bd
              ),
              title: Text(
                item['title'],
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
<<<<<<< HEAD
                  color: isSelected ? const Color(0xff189B56) : Colors.black,
=======
                  color: isSelected
                      ? const Color(0xff189B56)
                      : Colors.black, 
>>>>>>> 527f104cae95da18fd3adb881bba17c2f940a6bd
                ),
              ),
              onTap: () {
                _playSound('click.wav');
                _onItemTapped(item['index']);
              },
            );
          }).toList(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: const Color(0xff189B56),
      appBar: AppBar(
        backgroundColor: const Color(0xff189B56),
=======
      backgroundColor: const Color(0xff189B56), 
      appBar: AppBar(
        backgroundColor: const Color(0xff189B56), 
>>>>>>> 527f104cae95da18fd3adb881bba17c2f940a6bd
        elevation: 0,
        scrolledUnderElevation: 0.0,
        foregroundColor: Colors.white,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                _playSound('click.wav');
                Scaffold.of(context).openDrawer();
              },
              padding: const EdgeInsets.only(left: 16.0),
              icon: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
<<<<<<< HEAD
                  color: const Color(0xffFFA500),
=======
                  color: const Color(
                    0xffFFA500,
                  ), 
>>>>>>> 527f104cae95da18fd3adb881bba17c2f940a6bd
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.menu, color: Colors.white, size: 24),
              ),
            );
          },
        ),
        title: Text(
          _drawerItems[_selectedIndex]['title']!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
<<<<<<< HEAD
            color: Colors.white,
=======
            color: Colors.white, 
>>>>>>> 527f104cae95da18fd3adb881bba17c2f940a6bd
            fontSize: 28,
          ),
        ),
      ),
      drawer: _buildDrawer(),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
