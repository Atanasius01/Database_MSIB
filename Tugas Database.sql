// masuk kedalam mariadb dengan cmd
C:\Users\Acer>cd \xampp\mysql\bin
C:\xampp\mysql\bin>mysql -u root -p

Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 10
Server version: 10.4.27-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+

//Membuat database baru 
MariaDB [(none)]> CREATE DATABASE dbtoko1;

//Membua table kartu
MariaDB [dbtoko1]> CREATE TABLE kartu(
    -> id int NOT NULL auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(30) NOT NULL,
    -> diskon double default 0,
    -> iuran double default 0);

//Membuat table pelanggan
MariaDB [dbtoko1]> CREATE TABLE pelanggan(
    -> id int NOT NULL auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(45),
    -> jk char(1),
    -> tmp_lahir varchar(20),
    -> tgl_lahir date,
    -> email varchar(30),
    -> kartu_id int NOT NULL references kartu(id));

//Membuat table pesanan
MariaDB [dbtoko1]> CREATE TABLE pesanan(
    -> id int NOT NULL auto_increment primary key,
    -> tanggal date,
    -> total double,
    -> pelanggan_id int NOT NULL REFERENCES pelanggan(id));

//Membuat table pembayaran
MariaDB [dbtoko1]> CREATE TABLE pembayaran(
    -> id int NOT NULL auto_increment primary key,
    -> no_kuitansi varchar(10) unique,
    -> tanggal date,
    -> ke int,
    -> pesanan_id int NOT NULL REFERENCES pesanan(id));

//Membuat table jenis_produk
MariaDB [dbtoko1]> CREATE TABLE jenis_produk(
    -> id int NOT NULL auto_increment primary key,
    -> nama varchar(20));

//Menambahkan colum keterangan, mengubah nama dan tipe data pada jenis produk
MariaDB [dbtoko1]> ALTER TABLE jenis_produk
    -> ADD COLUMN keterangan varchar(30) AFTER nama;
MariaDB [dbtoko1]> ALTER TABLE jenis_produk
    -> CHANGE keterangan ket varchar(30);
MariaDB [dbtoko1]> ALTER TABLE jenis_produk
    -> MODIFY ket varchar(50) AFTER nama;

//Membuat table produk 
MariaDB [dbtoko1]> CREATE TABLE produk(
    -> id int NOT NULL auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(45),
    -> harga_beli double,
    -> harga_jual double,
    -> stok int,
    -> min_stok int,
    -> jenis_produk_id int NOT NULL REFERENCES jenis_produk(id));

//Membuat table pesanan_items
MariaDB [dbtoko1]> CREATE TABLE pesanan_items(
    -> id int NOT NULL auto_increment primary key,
    -> pruduk_id int NOT NULL REFERENCES produk(id),
    -> pesanan_id int NOT NULL REFERENCES pesanan(id),
    -> qty int,
    -> harga double);

//membuat table vendor
MariaDB [dbtoko1]> CREATE TABLE vendor(
    -> id int NOT NULL auto_increment primary key,
    -> nomor varchar(4),
    -> nama varchar(40),
    -> kota varchar(30),
    -> kontak varchar(30));

//Membuat table pembelian
MariaDB [dbtoko1]> CREATE TABLE pembelian(
    -> id int NOT NULL auto_increment primary key,
    -> tanggal varchar(45),
    -> nomor varchar(10),
    -> produk_id int NOT NULL REFERENCES produk(id),
    -> jumlah int,
    -> harga double,
    -> vendor_id int NOT NULL REFERENCES vendor(id));

//Menampillan tables data base
MariaDB [dbtoko1]> show tables;
+-------------------+
| Tables_in_dbtoko1 |
+-------------------+
| jenis_produk      |
| kartu             |
| pelanggan         |
| pembayaran        |
| pembelian         |
| pesanan           |
| pesanan_items     |
| produk            |
| vendor            |
+-------------------+

//menampilkan table pelanggan
MariaDB [dbtoko1]> desc pelanggan;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| id        | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode      | varchar(10) | YES  | UNI | NULL    |                |
| nama      | varchar(45) | YES  |     | NULL    |                |
| jk        | char(1)     | YES  |     | NULL    |                |
| tmp_lahir | varchar(20) | YES  |     | NULL    |                |
| tgl_lahir | date        | YES  |     | NULL    |                |
| email     | varchar(30) | YES  |     | NULL    |                |
| kartu_id  | int(11)     | NO   |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+

//Tambahkan kolom alamat pada pelanggan dengan tipe data varchar (40)
MariaDB [dbtoko1]> ALTER TABLE pelanggan
    -> ADD alamat varchar(40);

//Ubah kolom nama pada pelanggan menjadi nama_pelanggan
MariaDB [dbtoko1]> ALTER TABLE pelanggan
    -> CHANGE nama nama_pelanggan varchar(45);

//edit tipe data nama_pelanggan menjadi varchar(50)
MariaDB [dbtoko1]> ALTER TABLE pelanggan
    -> MODIFY nama_pelanggan varchar(50);

//menampilkan table pelanggan terupdate
MariaDB [dbtoko1]> desc pelanggan;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode           | varchar(10) | YES  | UNI | NULL    |                |
| nama_pelanggan | varchar(50) | YES  |     | NULL    |                |
| jk             | char(1)     | YES  |     | NULL    |                |
| tmp_lahir      | varchar(20) | YES  |     | NULL    |                |
| tgl_lahir      | date        | YES  |     | NULL    |                |
| email          | varchar(30) | YES  |     | NULL    |                |
| kartu_id       | int(11)     | NO   |     | NULL    |                |
| alamat         | varchar(40) | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

