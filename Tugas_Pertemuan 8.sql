DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE InputPesanan(id int, tanggal date, total int, pelanggan_id int)
    -> BEGIN
    -> INSERT INTO pesanan (id, tanggal, total, pelanggan_id) VALUES (id, tanggal, total, pelanggan_id);
    -> END$$
 DELIMITER ;
MariaDB [dbtoko1]> CALL InputPesanan('3','2023-07-05','5000000','2');

CREATE TRIGGER list_pembayaran AFTER INSERT ON pesanan
FOR EACH ROW	
BEGIN
INSERT INTO pesanan SET
id = new.id, no_kuitansi= new.no_kuitansi, tanggal= new.tanggal, ke = new.ke, pesanan_id = new.pesanan_id;
END

CREATE TRIGGER status_pembayaran_pesanan
AFTER UPDATE ON pembayaran
FOR EACH ROW
BEGIN
  IF NEW.status_pembayaran = 'Lunas' THEN
    UPDATE pembayaran SET status_pembayaran = 'Lunas'
    WHERE id = NEW.id;
  END IF;
END;