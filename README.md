# Tugas 7: Elemen Dasar Flutter
Pemrograman Berbasis Platform (CSGE602022) - diselenggarakan oleh Fakultas Ilmu Komputer Universitas Indonesia, Semester Ganjil 2022/2023

### *Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.*
Stateless widget adalah widget yang tidak bergantung pada sebuah state. Seluruh konfigurasi yang berada dalam widget stateless telah diinisiasi sejak awal, sehingga setelah di-buils perubahan tidak akan terjadi. 
Stateful widget adalah widget yang bergantung pada sebuah state. Stateful widget bersifat dinamis, sehingga terdapat perubahan pada widget ketika terjadi perubahan data atau berdasarkan user actions. 
Perbedaanya, ketika kita ingin membuat komponen sederhana dan bersifat statis maka kita dapat menggunakan stateless widget. Sedangkan apabila kita ingin membuat komponen yang dinamis maka kita dapat menggunakan stateful widget. 

### *Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.*
- Text: widget ini digunakan untuk menampilkan tulisan seperti 'GANJIL', 'GENAP', 'COUNTER'.
- Padding: widget ini digunakan untuk memberikan padding. Pada proyek kali ini digunakan sebagai parent widget dari FloatingAcitonButton agar memiliki jarak antara ujung layar dan FloatingAcitonButton.
- Stack: widget ini digunakan untuk menampilkan child widget seperti tumpukan. Pada proyek ini digunakan untuk menampilkan 2 button FloatingAcitonButton. 
- FloatingAcitonButton: widget ini digunakan untuk membuat floating button. Pada proyek ini terdapat 2 button FloatingAcitonButton yang digunakan untuk menambahkan dan mengurangi counter. 

### *Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.*
setState() digunakan untuk memberi informasi kepada flutter framework bahwa terdapat state yang mengalami perubahan. setState() digunakan ketika terdapat perubahan yang ingin ditampilkan di user interface. Method build akan run ulang dan menampilkan tampilan yang sesuai dengan perubahan terbaru. Jika sebuah state yang ingin diubah tidak berada dalam setState(), maka perubahan state tersebut tidak akan merubah tampilan perubahan terbaru. 
Variabel yang terdampak pada proyek ini adalah _counter. Dari _counter akan mengalami perubahan tampilan di text, yaitu genap ataupun ganjil. 

### *Jelaskan perbedaan antara const dengan final.*
Const digunakan untuk mendeklarasikan value yang bersifat immutable. Value dari variabel tersebut harus bersifat konstan dan sudah diketahui pada saat compile program. Sedangkan final dapat digunakan untuk mendeklarasikan variabel yang bersifat immutable. Value dari variabel dapat diubah dan tidak harus diketahui pada saat compile program.

### *Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.*
- Membuat program flutter baru dengan menjalankan flutter create counter_7
- Membuat isi field FloatingAcitonButton sesuai dengan kebutuhan proyek, yaitu berisi 2 buah button dimana terdapat button decrement di kiri bawah dan button increment di kanan bawah. Kedua button tersebut juga disambungkan dengan properti onPressed.
- Mengganti tulisan diatas button counter dengan menambahkan text untuk menampilkan tulisan 'GANJIL' berwarna merah dan 'GENAP' berwarna biru. Kedua text tersebut dimasukkan ke dalam conditional, sehingga text ditampilkan sesuai dengan kondisi _counter.
- Menambahkan fungsi _incrementCounter() dan _decrementCounter. Di dalam masing-masing fungsi terdapat setState() yang berfungsi untuk menambah/mengurangi counter. _counter hanya akan dikurangi jika _counter > 0.
