-- Fungsi inputPelanggan
DELIMITER $$
CREATE PROCEDURE inputPelanggan(kode varchar(10), nama_pelanggan varchar(50), jk char(1), tmp_lahir varchar(20), tgl_lahir date, email varchar(30), kartu_id int(11), alamat varchar(40))
    -> BEGIN
    -> INSERT INTO pelanggan (kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, kartu_id, alamat) VALUES (kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, kartu_id, alamat);
    -> END$$

DELIMITER ;
CALL inputPelanggan('10011','Chika','P','Jakarta','2002-02-01','chika@gmail.com','2','Jakarta');
SELECT * FROM pelanggan;
+----+-------+----------------+------+-----------+------------+------------------------+----------+----------+
| id | kode  | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email                  | kartu_id | alamat   |
+----+-------+----------------+------+-----------+------------+------------------------+----------+----------+
|  1 | 10001 | Atanasius      | L    | Jakarta   | 2001-10-01 | atanasius256@gmail.com |        1 | Bekasi   |
|  2 | 10002 | Lili           | P    | Bekasi    | 2001-11-23 | lili@gmail.com         |        2 | Cikarang |
|  3 | 10003 | Lukman         | P    | Bandung   | 2002-11-24 | lukman@gmail.com       |        1 | Bandung  |
|  4 | 10004 | Rohen          | L    | Cirebon   | 2002-12-25 | rohenn@gmail.com       |        1 | Cirebon  |
|  5 | 10005 | Angela         | P    | Batam     | 2001-01-26 | angela@gmail.com       |        4 | Bekasi   |
|  6 | 10006 | Yodayo         | L    | Bandung   | 2001-02-27 | yuda@gmail.com         |        2 | Cilengsi |
|  7 | 10007 | Alfi           | L    | Cirebon   | 2002-03-10 | alfi@gmail.com         |        4 | Cirebon  |
|  8 | 10008 | Sani           | P    | Subang    | 2002-06-12 | yani@gmail.com         |        1 | Bogor    |
|  9 | 10009 | Tika           | P    | Aceh      | 2002-05-11 | Tika@gmail.com         |        2 | Aceh     |
| 10 | 10010 | Bolang         | L    | Makasar   | 2001-07-13 | Bolang@gmail.com       |        4 | Makasar  |
| 11 | 10011 | Chika          | P    | Jakarta   | 2002-02-01 | chika@gmail.com        |        2 | Jakarta  |
+----+-------+----------------+------+-----------+------------+------------------------+----------+----------+

-- Fungsi showPelanggan
DELIMITER $$
CREATE PROCEDURE showPelanggan()
    -> BEGIN
    -> SELECT kode, nama_pelanggan, email, alamat FROM pelanggan;
    -> END$$
DELIMITER ;
CALL showPelanggan();
+-------+----------------+------------------------+----------+
| kode  | nama_pelanggan | email                  | alamat   |
+-------+----------------+------------------------+----------+
| 10001 | Atanasius      | atanasius256@gmail.com | Bekasi   |
| 10002 | Lili           | lili@gmail.com         | Cikarang |
| 10003 | Lukman         | lukman@gmail.com       | Bandung  |
| 10004 | Rohen          | rohenn@gmail.com       | Cirebon  |
| 10005 | Angela         | angela@gmail.com       | Bekasi   |
| 10006 | Yodayo         | yuda@gmail.com         | Cilengsi |
| 10007 | Alfi           | alfi@gmail.com         | Cirebon  |
| 10008 | Sani           | yani@gmail.com         | Bogor    |
| 10009 | Tika           | Tika@gmail.com         | Aceh     |
| 10010 | Bolang         | Bolang@gmail.com       | Makasar  |
| 10011 | Chika          | chika@gmail.com        | Jakarta  |
+-------+----------------+------------------------+----------+

--Fungsi inputProduk
DELIMITER $$
CREATE PROCEDURE inputProduk(kode varchar(10), nama varchar(45), harga_beli double, harga_jual double, stok int(11), min_stok int(11), jenis_produk_id int(11))
    -> BEGIN
    -> INSERT INTO produk (kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id) VALUES (kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id);
    -> END$$

DELIMITER ;
MariaDB [dbtoko1]> CALL inputProduk('TB0001', 'Teh Botol', '3500', '5000', '15', '10', '3');
SELECT * FROM produk;
+----+--------+------------+------------+------------+------+----------+-----------------+
| id | kode   | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+--------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01   | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02   | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K0001  | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001   | Lemari     |    1000000 |    2000000 |    2 |        2 |               4 |
|  5 | T0001  | Taro       |       4000 |       5000 |    5 |        2 |               2 |
|  6 | TK001  | Teh Kotak  |       3000 |       4000 |    5 |        2 |               3 |
|  7 | TB0001 | Teh Botol  |       3500 |       5000 |   15 |       10 |               3 |
+----+--------+------------+------------+------------+------+----------+-----------------+

-- Fungsi showProduk
DELIMITER $$
CALL showProduks();
+--------+------------+------------+------+
| kode   | nama       | harga_jual | stok |
+--------+------------+------------+------+
| TV01   | TV         |    4000000 |    3 |
| TV02   | TV 21 Inch |    3000000 |   10 |
| K0001  | Kulkas     |    5000000 |   10 |
| M001   | Lemari     |    2000000 |    2 |
| T0001  | Taro       |       5000 |    5 |
| TK001  | Teh Kotak  |       4000 |    5 |
| TB0001 | Teh Botol  |       5000 |   15 |
+--------+------------+------------+------+

-- Fungsi totalPesanan
DELIMITER $$
CREATE PROCEDURE totalPesanan()
    ->BEGIN
    ->SELECT SUM(total) FROM pesanan;
    ->END$$
DELIMITER ;
CALL totalPesanan();
+------------+
| SUM(total) |
+------------+
|     230000 |
+------------+

-- Tampilkan seluruh pesanan
DELIMITER $$
CREATE PROCEDURE AllPesanan()
    -> BEGIN
    -> SELECT * FROM pesanan;
    -> END$$
DELIMITER ;
CALL AllPesanan();
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 2023-03-03 | 200000 |            1 |
|  2 | 2022-02-02 |  30000 |            1 |
+----+------------+--------+--------------+

CREATE VIEW AllPesananPelanggan AS
SELECT pesanan.tanggal, pesanan.total, pelanggan.nama_pelanggan, pelanggan.email FROM pelanggan 
JOIN pesanan ON pelanggan.id = pesanan.pelanggan_id;
+------------+--------+----------------+------------------------+
| tanggal    | total  | nama_pelanggan | email                  |
+------------+--------+----------------+------------------------+
| 2023-03-03 | 200000 | Atanasius      | atanasius256@gmail.com |
| 2022-02-02 |  30000 | Lili           | lili@gmail.com         |
+------------+--------+----------------+------------------------+

-- pesanan_produk_vw (menggunakan join dari table pesanan, pelanggan dan produk)
CREATE VIEW pesanan_produk_vw AS
    -> SELECT pesanan.tanggal, produk.nama, produk.kode, pesanan.total, pelanggan.nama_pelanggan, pelanggan.email FROM pelanggan
    -> JOIN pesanan ON pelanggan.id = pesanan.pelanggan_id
    -> JOIN produk ON pesanan.pelanggan_id = produk.id;
SELECT * FROM pesanan_produk_vw;
+------------+------------+------+--------+----------------+------------------------+
| tanggal    | nama       | kode | total  | nama_pelanggan | email                  |
+------------+------------+------+--------+----------------+------------------------+
| 2023-03-03 | TV         | TV01 | 200000 | Atanasius      | atanasius256@gmail.com |
| 2022-02-02 | TV 21 Inch | TV02 |  30000 | Lili           | lili@gmail.com         |
+------------+------------+------+--------+----------------+------------------------+