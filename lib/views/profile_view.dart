import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:audioplayers/audioplayers.dart';

class ProfileItem {
  String label;
  String value;
  IconData icon;
  TextEditingController controller;
  String? imagePath;

  ProfileItem({
    required this.label,
    required this.value,
    required this.icon,
    this.imagePath,
  }) : controller = TextEditingController(text: value);
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final String _defaultAssetImagePath = 'assets/background.png';

  final List<ProfileItem> _profileData = [
    ProfileItem(
      label: 'Nama Lengkap',
      value: 'Salman Falah',
      icon: Icons.person,
      imagePath: null,
    ),
    ProfileItem(label: 'Email', value: 'salman@gmail.com', icon: Icons.email),
    ProfileItem(
      label: 'Nomor Telepon',
      value: '081252583280',
      icon: Icons.phone,
    ),
    ProfileItem(
      label: 'Tanggal Lahir',
      value: '9 Oktober 2008',
      icon: Icons.cake,
    ),
    ProfileItem(
      label: 'Alamat',
      value: 'JL. Danau Ranau',
      icon: Icons.location_on,
    ),
  ];

  bool _isEditing = false;
  final ImagePicker _picker = ImagePicker();
  File? _currentProfileImageFile;
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _playSound(String assetFileName) async {
    try {
      await _audioPlayer.play(AssetSource(assetFileName));
    } catch (e) {
      print("Gagal memutar audio $assetFileName: $e");
    }
  }

  String? _getCurrentImagePath() {
    return _profileData
        .firstWhere((item) => item.label == 'Nama Lengkap')
        .imagePath;
  }

  Future<void> _pickImage() async {
    await _playSound('click.wav');

    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _currentProfileImageFile = File(pickedFile.path);
        final nameItem = _profileData.firstWhere(
          (item) => item.label == 'Nama Lengkap',
        );
        nameItem.imagePath = pickedFile.path;
      });

      _playSound('succes.wav');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gambar profil berhasil diganti!'),
          backgroundColor: Color(0xff189B56),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  void _saveChanges() {
    setState(() {
      for (var item in _profileData) {
        item.value = item.controller.text;
      }
      _isEditing = false;
    });

    _playSound('succes.wav');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Perubahan profil berhasil disimpan!'),
        backgroundColor: Color(0xff189B56),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _cancelEdit() {
    setState(() {
      for (var item in _profileData) {
        item.controller.text = item.value;
      }
      final path = _getCurrentImagePath();
      _currentProfileImageFile = path != null ? File(path) : null;

      _isEditing = false;
    });

    _playSound('failing.wav');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pengeditan profil dibatalkan.'),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 1),
      ),
    );
  }

  Widget _buildProfileItem(ProfileItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.label,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 4),
          _isEditing
              ? TextFormField(
                  controller: item.controller,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      item.icon,
                      color: Colors.white54,
                      size: 20,
                    ),
                    enabledBorder: const UnderlineInputBorder(
<<<<<<< HEAD
                      borderSide: BorderSide(color: Colors.white38),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
=======
                      borderSide: BorderSide(
                        color: Colors.white38,
                      ), 
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ), 
>>>>>>> 527f104cae95da18fd3adb881bba17c2f940a6bd
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                  ),
                )
              : Row(
                  children: [
                    Icon(
                      item.icon,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        item.value,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
          if (!_isEditing)
<<<<<<< HEAD
            const Divider(color: Color.fromARGB(59, 255, 255, 255), height: 16),
=======
            const Divider(
              color: Color.fromARGB(59, 255, 255, 255),
              height: 16,
            ), 
>>>>>>> 527f104cae95da18fd3adb881bba17c2f940a6bd
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final initialPath = _getCurrentImagePath();
    if (initialPath != null) {
      _currentProfileImageFile = File(initialPath);
    }
  }

  @override
  void dispose() {
    for (var item in _profileData) {
      item.controller.dispose();
    }
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageFileToDisplay = _currentProfileImageFile;
    final fullName = _profileData
        .firstWhere((item) => item.label == 'Nama Lengkap')
        .value;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: const Color.fromARGB(137, 255, 255, 255),
                  backgroundImage: imageFileToDisplay != null
                      ? FileImage(imageFileToDisplay) as ImageProvider
                      : AssetImage(_defaultAssetImagePath) as ImageProvider,
                  child: null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xffFFA500),
<<<<<<< HEAD
                        borderRadius: BorderRadius.circular(20),
=======
                        borderRadius: BorderRadius.circular(20), 
>>>>>>> 527f104cae95da18fd3adb881bba17c2f940a6bd
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              fullName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!_isEditing)
                  ElevatedButton.icon(
                    onPressed: () {
                      _playSound('click.wav');
                      setState(() {
                        _isEditing = true;
                      });
                    },
                    icon: const Icon(Icons.edit, color: Colors.white),
                    label: const Text(
                      'Edit Profil',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFFA500),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                if (_isEditing) ...[
                  ElevatedButton.icon(
                    onPressed: _saveChanges,
                    icon: const Icon(Icons.check, color: Colors.white),
                    label: const Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFFA500),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      minimumSize: const Size(120, 40),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: _cancelEdit,
                    icon: const Icon(Icons.cancel, color: Colors.white),
                    label: const Text(
                      'Batal',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      minimumSize: const Size(120, 40),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
<<<<<<< HEAD
                borderRadius: BorderRadius.circular(10),
=======
                borderRadius: BorderRadius.circular(10), 
>>>>>>> 527f104cae95da18fd3adb881bba17c2f940a6bd
                border: Border.all(color: Colors.white38),
              ),
              child: Column(
                children: _profileData.map(_buildProfileItem).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
