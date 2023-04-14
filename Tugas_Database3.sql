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
MariaDB [dbtoko1]> SELECT id, nama, stok,
    -> CASE
    -> WHEN stok <= min_stok THEN 'Segera Belanja'
    -> ELSE 'Stok Aman'
    -> END AS 'informasi_status'
    -> FROM produk;
-- 2.	Tampilkan data pelanggan: id, nama, umur dan kategori umur : jika umur < 17 → ‘muda’ , 17-55 → ‘Dewasa’, selainnya ‘Tua’
MariaDB [dbtoko1]> SELECT id, nama_pelanggan, YEAR(NOW()) - YEAR(tgl_lahir) AS umur,
    -> CASE
    -> WHEN YEAR(NOW()) - YEAR(tgl_lahir) < 17 THEN 'Muda'
    -> WHEN YEAR(NOW()) - YEAR(tgl_lahir) BETWEEN 17 AND 55 THEN 'Dewasa'
    -> ELSE 'Tua'
    -> END AS 'Kategori_Umur'
    -> FROM pelanggan;
-- 3.	Tampilkan data produk: id, kode, nama, dan bonus untuk kode ‘TV01’ →’DVD Player’ , ‘K001’ → ‘Rice Cooker’ selain dari diatas ‘Tidak Ada’
MariaDB [dbtoko1]> SELECT id, kode, nama,
    -> CASE
    -> WHEN kode = 'TV01' THEN 'DVD Player'
    -> WHEN kode = 'K001' THEN 'Rice Cooker'
    -> ELSE 'Tidak Ada'
    -> END AS 'BONUS'
    -> FROM produk;

-- Soal 3.4
-- 1.	Tampilkan data statistik jumlah tempat lahir pelanggan
MariaDB [dbtoko1]> SELECT tmp_lahir,
    -> COUNT(*) AS jumlah FROM pelanggan GROUP BY tmp_lahir;
-- 2.	Tampilkan jumlah statistik produk berdasarkan jenis produk
MariaDB [dbtoko1]> SELECT jenis_produk_id,
    -> COUNT(*) AS jumlah_jenis_produk FROM produk GROUP BY jenis_produk_id;
-- 3.	Tampilkan data pelanggan yang usianya dibawah rata usia pelanggan
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE YEAR(NOW()) - YEAR(tgl_lahir) < (SELECT AVG(YEAR(NOW()) - YEAR(tgl_lahir)) FROM pelanggan);
-- 4.	Tampilkan data produk yang harganya diatas rata-rata harga produk
MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_jual > (SELECT AVG(harga_jual) FROM produk);
-- 5.	Tampilkan data pelanggan yang memiliki kartu dimana iuran tahunan kartu diatas 90rb
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE kartu_id;
-- 6.	Tampilkan statistik data produk dimana harga produknya dibawah rata-rata harga produk secara keseluruhan
MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_jual < (SELECT AVG(harga_jual) FROM produk);
-- 7.	Tampilkan data pelanggan yang memiliki kartu dimana diskon kartu yang diberikan diatas 3%
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE kartu_id IN (diskon FROM kartu);
