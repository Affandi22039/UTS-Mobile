import 'package:flutter/material.dart';
import 'quiz_api.dart'; // Mengimpor modul quiz_api.dart

void main() {
  runApp(QuizApp()); // Memulai aplikasi dengan widget QuizApp
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuis untuk Maba', // Judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.blue, // Tema utama aplikasi
      ),
      home: QuizScreen(), // Menetapkan QuizScreen sebagai halaman beranda aplikasi
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState(); // Membuat stateful widget QuizScreen
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0; // Indeks pertanyaan yang sedang ditampilkan
  TextEditingController _nameController = TextEditingController(); // Controller untuk input nama
  TextEditingController _NumberController = TextEditingController(); // Controller untuk input NIM
  QuizAPI _quizAPI = QuizAPI(); // Instance dari kelas QuizAPI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Maba'), // Judul AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    'Nama : ',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Masukkan nama', // Label untuk input nama
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0), // Garis tepi input
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'NIM :  ',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextField(
                      controller: _NumberController,
                      decoration: InputDecoration(
                        labelText: 'Masukkan NIM', // Label untuk input NIM
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0), // Garis tepi input
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Column(
                children: [
                  Text(
                    _quizAPI.getQuestions()[_currentIndex], // Mendapatkan pertanyaan saat ini
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  Column(
                    children: _quizAPI.getOptions(_currentIndex)
                        .asMap()
                        .entries
                        .map(
                          (entry) => GestureDetector(
                            onTap: () {
                              setState(() {
                                _quizAPI.setUserAnswer(_currentIndex, entry.key); // Menetapkan jawaban pengguna
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: _quizAPI.getUserAnswer(_currentIndex) == entry.key
                                      ? Colors.blue // Warna border jika jawaban dipilih
                                      : Colors.grey, // Warna border jika jawaban tidak dipilih
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: EdgeInsets.all(10.0),
                              margin: EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                entry.value, // Pilihan jawaban
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_currentIndex < _quizAPI.getTotalQuestions() - 1) {
                      _currentIndex++; // Pindah ke pertanyaan berikutnya jika tersedia
                    } else {
                      // Kuis selesai, hitung skor
                      int score = _quizAPI.calculateScore();
                      String name = _nameController.text;
                      String nim = _NumberController.text;
                      // Tampilkan dialog dengan skor
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          double nilai = (score / _quizAPI.getTotalQuestions()) * 100;
                          return AlertDialog(
                            title: Text('Kuis telah selesai'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nama: $name'),
                                Text('NIM: $nim'),
                                SizedBox(height: 10),
                                Text('Anda menjawab: $score soal yang benar dari ${_quizAPI.getTotalQuestions()} total soal.'),
                                Text('Nilai: ${nilai.toStringAsFixed(2)}'), // Menampilkan nilai dengan 2 angka di belakang koma
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Selesai'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  });
                },
                child: Text(
                  _currentIndex < _quizAPI.getTotalQuestions() - 1 ? 'Lanjut' : 'Selesai', // Tombol 'Lanjut' jika masih ada pertanyaan, 'Selesai' jika kuis telah selesai
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
