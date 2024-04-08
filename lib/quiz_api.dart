class QuizAPI {
  //Bank soal
   List<String> _questions = [
    'Apa yang dimaksud dengan IDE?',
    'Bahasa pemrograman manakah yang digunakan untuk membuat aplikasi Android?',
    'Apa fungsi dari statement "import" dalam bahasa pemrograman Python?',
    'Apa yang dimaksud dengan HTTP?',
    'Pada bahasa pemrograman JavaScript, mana yang digunakan untuk mendapatkan elemen HTML berdasarkan ID?',
    'Apa itu looping dalam pemrograman?',
    'Apa perbedaan antara "==" dan "===" dalam JavaScript?',
    'Apa yang dimaksud dengan SQL?',
    'Apa itu paradigma pemrograman berorientasi objek?',
    'Apa yang dimaksud dengan "branching" dalam Git?',
    'Apa itu "loop for" dalam pemrograman?',
    'Pada Python, bagaimana cara menambahkan elemen baru ke dalam daftar (list)?',
    'Apa yang dimaksud dengan "syntax error" dalam pemrograman?',
    'Apa fungsi dari perintah "git clone"?',
    'Apa yang dimaksud dengan "boolean" dalam pemrograman?',
  ];
  //Daftar pilihan jawaban
  List<List<String>> _options = [
    ['Input Data Execution', 'Integrated Development Environment', 'International Data Exchange', 'Integrated Debugging Environment'],
    ['Java', 'Python', 'C++', 'JavaScript'],
    ['Untuk menambahkan modul atau pustaka ke dalam program', 'Untuk mengimpor data dari file eksternal', 'Untuk memasukkan input dari pengguna', 'Untuk mengekspor variabel ke file lain'],
    ['Hyperlink Transfer Protocol', 'Hypertext Transfer Protocol', 'High-level Text Protocol', 'Hyper Terminal Protocol'],
    ['getElementByName', 'getElementByClass', 'getElementByID', 'getElementByTag'],
    ['Proses untuk menjalankan serangkaian pernyataan secara berulang', 'Proses untuk membuat tata letak halaman web', 'Proses untuk menangani kesalahan dalam program', 'Proses untuk mengompilasi kode menjadi bahasa mesin'],
    ['Tidak ada perbedaan, keduanya sama-sama digunakan untuk perbandingan nilai', '"==" digunakan untuk perbandingan nilai, sedangkan "===" digunakan untuk perbandingan nilai dan tipe data', '"===" digunakan untuk perbandingan nilai, sedangkan "==" digunakan untuk perbandingan nilai dan tipe data', '"==" digunakan untuk perbandingan nilai, sedangkan "===" digunakan untuk perbandingan tipe data'],
    ['Structured Query Language', 'Simple Query Language', 'Scripted Query Language', 'Syntax Query Language'],
    ['Pendekatan dalam pemrograman yang menggunakan objek sebagai basis utama untuk representasi data dan fungsionalitas', 'Pendekatan dalam pemrograman yang hanya menggunakan prosedur', 'Pendekatan dalam pemrograman yang hanya menggunakan fungsi', 'Pendekatan dalam pemrograman yang tidak menggunakan algoritma'],
    ['Proses untuk membuat cabang atau percabangan dari kode', 'Proses untuk membuat salinan repositori lokal', 'Proses untuk menggabungkan perubahan dari repositori lokal ke repositori pusat', 'Proses untuk mengekspor repositori ke repositori eksternal'],
    ['Looping yang berjalan hingga kondisi tertentu terpenuhi', 'Looping yang berjalan mundur', 'Looping yang hanya dieksekusi sekali', 'Looping yang berjalan secara tak terbatas'],
    ['add()', 'push()', 'append()', 'insert()'],
    ['Kesalahan yang terjadi karena penulisan kode yang tidak sesuai dengan aturan bahasa pemrograman', 'Kesalahan yang terjadi saat program dijalankan', 'Kesalahan yang terjadi pada tahap kompilasi', 'Kesalahan yang terjadi pada saat debug'],
    ['Untuk membuat salinan lokal dari repositori pusat', 'Untuk mengirim perubahan dari repositori lokal ke repositori pusat', 'Untuk mengunduh salinan repositori dari repositori pusat ke lokal', 'Untuk menghapus repositori lokal'],
    ['Jenis data yang hanya memiliki dua nilai: benar atau salah', 'Jenis data yang hanya dapat menyimpan angka bulat', 'Jenis data yang hanya dapat menyimpan angka desimal', 'Jenis data yang hanya dapat menyimpan string'],
  ];
  //Kunci jawaban
  List<int> _answers = [1, 0, 0, 1, 2, 2, 1, 0, 1, 2, 1, 2, 1, 2, 0];
  //Menetapkan nilai awal dari jawaban pengguna menjadi null
  List<int?> _userAnswers = [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null];

  List<String> getQuestions() {
    // Mengembalikan daftar pertanyaan
    return _questions;
  }

 List<String> getOptions(int index) {
  // Mengembalikan opsi untuk pertanyaan tertentu
  return _options[index];
}
  int getTotalQuestions() {
    // Mengembalikan total pertanyaan
    return _questions.length;
  }

  void setUserAnswer(int index, int? answer) {
    // Mengatur jawaban pengguna untuk pertanyaan tertentu
    _userAnswers[index] = answer;
  }

  int? getUserAnswer(int index) {
    // Mendapatkan jawaban pengguna untuk pertanyaan tertentu
    return _userAnswers[index];
  }

  int calculateScore() {
    // Menghitung skor kuis
    int score = 0;
    for (int i = 0; i < _answers.length; i++) {
      if (_answers[i] == _userAnswers[i]) {
        score++;
      }
    }
    return score;
  }
}
