-- Soal 3.1
-- 1.	Tampilkan produk yang asset nya diatas 20jt
MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_beli * stok > 20000000;
-- 2.	Tampilkan data produk beserta selisih stok dengan minimal stok
MariaDB [dbtoko1]> SELECT SUM(stok - min_stok) as selisih from produk;

-- 3.	Tampilkan total asset produk secara keseluruhan
MariaDB [dbtoko1]> SELECT sum(stok) as total_asset from produk;
-- 4.	Tampilkan data pelanggan yang lahirnya antara tahun 1999 sampai 2004
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN 1999 AND 2004;
-- 5.	Tampilkan data pelanggan yang lahirnya tahun 1998
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir)=1998;
-- 6.	Tampilkan data pelanggan yang berulang tahun bulan agustus
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE MONTH(tgl_lahir)=08;
-- 7.	Tampilkan data pelanggan : nama, tmp_lahir, tgl_lahir dan umur (selisih tahun sekarang dikurang tahun kelahiran)
MariaDB [dbtoko1]> SELECT nama, tmp_lahir, tgl_lahir, (YEAR(NOW())-YEAR(tgl_lahir)) AS umur FROM pelanggan;



-- Soal 3.2
-- 1.	Berapa jumlah pelanggan yang tahun lahirnya 1998
MariaDB [dbtoko1]> SELECT COUNT(*) AS Jumlah_Pelanggan_Kelahiran_1998 FROM pelanggan WHERE YEAR(tgl_lahir) = 1998;
-- 2.	Berapa jumlah pelanggan perempuan yang tempat lahirnya di Jakarta
MariaDB [dbtoko1]> SELECT COUNT(*) AS Jumlah_Pelanggan_Perempuan FROM pelanggan WHERE jk = 'P' AND tmp_lahir = 'Jakarta';
-- 3.	Berapa jumlah total stok semua produk yang harga jualnya dibawah 10rb
MariaDB [dbtoko1]> SELECT SUM(stok) AS total_stok FROM produk WHERE harga_jual < 10000;
-- 4.	Ada berapa produk yang mempunyai kode awal K
MariaDB [dbtoko1]> SELECT COUNT(*) AS jumlah_produk_kode_K FROM produk WHERE kode LIKE 'K%';
-- 5.	Berapa harga jual rata-rata produk yang diatas 1jt
MariaDB [dbtoko1]> SELECT AVG(harga_jual) AS harga_rata2 FROM produk WHERE harga_jual > 1000000;
-- 6.	Tampilkan jumlah stok yang paling besar
MariaDB [dbtoko1]> SELECT MAX(stok) AS Jumlah_Stok FROM produk;
-- 7.	Ada berapa produk yang stoknya kurang dari minimal stok
MariaDB [dbtoko1]> SELECT COUNT(*) AS jumlah_produk FROM produk WHERE stok < min_stok;
-- 8.	Berapa total asset dari keseluruhan produk
MariaDB [dbtoko1]> SELECT SUM(stok*harga_beli) AS total_asset FROM produk; --Berdasarkan harga beli
MariaDB [dbtoko1]> SELECT SUM(stok*harga_jual) AS total_asset FROM produk; --Berdasarkan harga jual


-- Soal 3.3
-- 1.	Tampilkan data produk : id, nama, stok dan informasi jika stok telah sampai batas minimal atau kurang dari minimum stok dengan informasi ‘segera belanja’ jika tidak ‘stok aman’.
-- 2.	Tampilkan data pelanggan: id, nama, umur dan kategori umur : jika umur < 17 → ‘muda’ , 17-55 → ‘Dewasa’, selainnya ‘Tua’
-- 3.	Tampilkan data produk: id, kode, nama, dan bonus untuk kode ‘TV01’ →’DVD Player’ , ‘K001’ → ‘Rice Cooker’ selain dari diatas ‘Tidak Ada’


-- Soal 3.4
-- 1.	Tampilkan data statistik jumlah tempat lahir pelanggan
-- 2.	Tampilkan jumlah statistik produk berdasarkan jenis produk
-- 3.	Tampilkan data pelanggan yang usianya dibawah rata usia pelanggan
-- 4.	Tampilkan data produk yang harganya diatas rata-rata harga produk
-- 5.	Tampilkan data pelanggan yang memiliki kartu dimana iuran tahunan kartu diatas 90rb
-- 6.	Tampilkan statistik data produk dimana harga produknya dibawah rata-rata harga produk secara keseluruhan
-- 7.	Tampilkan data pelanggan yang memiliki kartu dimana diskon kartu yang diberikan diatas 3%
