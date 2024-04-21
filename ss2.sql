drop database secontDB;
create database secontDB;
use secontDB;
create table NhaCungCap
(
    maNCC     varchar(4) primary key not null,
    tenNCC    varchar(50)            not null,
    Diachi    varchar(50)            not null,
    Dienthoai varchar(15)            not null,
    email     varchar(30)            not null,
    Website   varchar(30)
);
create table KHACHHANG
(
    maKH     varchar(4) primary key not null,
    tenKH    varchar(50)            not null,
    Diachi   varchar(50),
    NgaySinh DATE,
    soDT     nvarchar(15)
);
CREATE TABLE `nhanvien`
(
    `maNV`      VARCHAR(5)  NOT NULL,
    `Hoten`     VARCHAR(45) NOT NULL,
    `Gioitinh`  BIT         NOT NULL,
    `Diachi`    VARCHAR(45) NOT NULL,
    `NgaySinh`  date        NULL,
    `DienThoai` VARCHAR(15) NOT NULL,
    `email`     TEXT(30)    NULL,
    `Noisinh`   varchar(20) NOT NULL,
    `maNQL`     VARCHAR(4)  NOT NULL,
    PRIMARY KEY (`maNV`)
);
CREATE TABLE ` loaisp`
(
    `MaLoaiSp`  VARCHAR(4)   NOT NULL,
    `TenLoaiSP` VARCHAR(45)  NOT NULL,
    `GhiChu`    VARCHAR(105) NULL,
    PRIMARY KEY (`MaLoaiSp`)
);
CREATE TABLE ` sanpham`
(
    `maSp`      VARCHAR(4)  NOT NULL,
    `MaloaiSP`  VARCHAR(4)  NOT NULL,
    `tenSP`     VARCHAR(45) NOT NULL,
    `DonViTinh` VARCHAR(10) NOT NULL,
    `Ghichu`    VARCHAR(100),
    PRIMARY KEY (`maSp`),
    foreign key (MaloaiSP) references ` loaisp` (MaLoaiSp)
);
CREATE TABLE phieunhap
(
    soPN     VARCHAR(5) NOT NULL,
    maNV     VARCHAR(5) NOT NULL,
    maNCC    VARCHAR(4) NOT NULL,
    NgayNhap DATETIME,
    ghichu   VARCHAR(105),
    PRIMARY KEY (soPN, maNV),
    FOREIGN KEY (maNCC) REFERENCES NhaCungCap (maNCC),
    FOREIGN KEY (maNV) REFERENCES nhanvien (maNV)
);
CREATE TABLE ` ctphieunhap`
(
    `maSp`     VARCHAR(4)    NOT NULL,
    `SoPN`     VARCHAR(5)    NOT NULL,
    ` SoLuong` SMALLINT(125) NOT NULL,
    `GiaNhap`  REAL          NOT NULL,
    PRIMARY KEY (`maSp`, `SoPN`)
);
CREATE TABLE `phieuxuat`
(
    `SoPX`    VARCHAR(5) NOT NULL,
    `MaNV`    VARCHAR(5) NOT NULL,
    `MaKH`    VARCHAR(5) NOT NULL,
    `NgayBan` DATETIME   NOT NULL,
    `GhiChu`  TEXT(50)   NULL,
    PRIMARY KEY (`SoPX`)
);
CREATE TABLE `ctphieuxuat`
(
    `soPX`    VARCHAR(5),
    `maSP`    VARCHAR(4)    NOT NULL,
    `SOLUONG` SMALLINT(100) NOT NULL,
    `GiaBan`  REAL          NOT NULL,
    PRIMARY KEY (`soPX`, `maSP`)
);

alter table ctphieuxuat
    add constraint fk foreign key (soPX) references phieuxuat (soPx),
    add constraint fk1 foreign key (maSP) references ` sanpham` (maSp);

alter table phieuxuat
    add constraint fk2 foreign key (MaNV) references nhanvien (maNV),
    add constraint fk3 foreign key (MaKH) references khachhang (maKH);

alter table ` ctphieunhap`
    add constraint fk4 foreign key (SoPN) references phieunhap (soPN),
    add constraint fk5 foreign key (maSp) references ` sanpham` (maSp);


INSERT INTO nhanvien (maNV, Hoten, Gioitinh, Diachi, NgaySinh, DienThoai, email, Noisinh, maNQL)
VALUES ('NV1', 'NHAN VAN VIEN', 1, 'HN', '2001-04-19', '0862181033', 'NV1@gmail.com', 'HN', 'NQL1');
INSERT INTO nhanvien (maNV, Hoten, Gioitinh, Diachi, NgaySinh, DienThoai, email, Noisinh, maNQL)
    VALUE ('NV2', 'NHAN THI VIEN', 0, 'HN', '2024-04-19', 0862181032, 'NV2@gmail.com', 'HN', 'NQL1');


insert into nhacungcap (maNCC, tenNCC, Diachi, Dienthoai, email, Website) value (1, 'mot', 'hn', 08621810000, 'mot@gmail.com', 'cc.com');
insert into nhacungcap (maNCC, tenNCC, Diachi, Dienthoai, email, Website) value (2, 'hai', 'hn', 08621810001, 'hai@gmail.com', 'cc2.com');


insert into phieunhap (soPN, maNV, maNCC, NgayNhap, ghichu) value ('PN1', 'NV1', 1, now(), 'ghichu');
insert into phieunhap (soPN, maNV, maNCC, NgayNhap, ghichu) value ('PN2', 'NV2', 2, now(), 'ghichu2');


INSERT INTO ` loaisp` (MaLoaiSp, TenLoaiSP, GhiChu) VALUE ('LSP1', 'LSP1', 'GHICHU');

INSERT INTO ` sanpham` (maSp, MaloaiSP, tenSP, DonViTinh, Ghichu) VALUE ('SP1', 'LSP1', 'SP1', 'C', 'GHICHU');
INSERT INTO ` sanpham` (maSp, MaloaiSP, tenSP, DonViTinh, Ghichu) VALUE ('SP2', 'LSP1', 'SP2', 'C', 'GHICHU');


insert into ` ctphieunhap` (maSp, SoPN, ` SoLuong`, GiaNhap) value ('SP1', 'PN1', 2, 1234);
insert into ` ctphieunhap` (maSp, SoPN, ` SoLuong`, GiaNhap) value ('SP2', 'PN2', 2, 1234);


INSERT INTO KHACHHANG (maKH, tenKH, Diachi, NgaySinh, soDT) VALUE ('KH10', 'KHACHNGU', 'HN', '2000-12-12', 0862811055);
INSERT INTO KHACHHANG (maKH, tenKH, Diachi, NgaySinh, soDT) VALUE ('KH5', 'KHACHNGUVCL', 'HN', '2000-12-12', 0862811056);
INSERT INTO KHACHHANG (maKH, tenKH, Diachi, NgaySinh, soDT) VALUE ('KH1', 'KHACHNGUVCL', 'HN', '2000-12-12', 0862811054);
INSERT INTO KHACHHANG (maKH, tenKH, Diachi, NgaySinh, soDT) VALUE ('KH2', 'KHACHNGUVCL', 'HN', '2000-12-12', 0862811050);


insert into phieuxuat (SoPX, MaNV, MaKH, NgayBan, GhiChu) value ('PX1', 'NV1', 'KH1', now(), 'ghichuphieuxuat');
insert into phieuxuat (SoPX, MaNV, MaKH, NgayBan, GhiChu) value ('PX2', 'NV1', 'KH2', now(), 'ghichuphieuxuat2');


insert into ctphieuxuat (soPX, maSP, SOLUONG, GiaBan) value ('PX1', 'SP1', 3, 123456);
insert into ctphieuxuat (soPX, maSP, SOLUONG, GiaBan) value ('PX2', 'SP2', 3, 123456);


UPDATE KHACHHANG
SET soDT = 0862181045
WHERE maKH = 'KH10';
UPDATE KHACHHANG
SET Diachi = 'PT'
WHERE maKH = 'KH5';


DELETE
FROM khachhang
WHERE maKH = 'KH10';


INSERT INTO NhaCungCap (maNCC, tenNCC, Diachi, Dienthoai, email, Website)
VALUES ('NCC1', 'Nhà cung cấp 1', 'Địa chỉ 1', '0123456789', 'info@ncc1.com', 'www.ncc1.com'),
       ('NCC2', 'Nhà cung cấp 2', 'Địa chỉ 2', '0987654321', 'info@ncc2.com', NULL),
       ('NCC3', 'Nhà cung cấp 3', 'Địa chỉ 3', '0369852147', 'info@ncc3.com', 'www.ncc3.com'),
       ('NCC4', 'Nhà cung cấp 4', 'Địa chỉ 4', '0214785632', 'info@ncc4.com', 'www.ncc4.com'),
       ('NCC5', 'Nhà cung cấp 5', 'Địa chỉ 5', '0541236987', 'info@ncc5.com', NULL);
INSERT INTO KHACHHANG (maKH, tenKH, Diachi, NgaySinh, soDT)
    VALUE
    ('KH3', 'Khách hàng 3', 'Địa chỉ 3', '1985-06-15', '0369852147'),
    ('KH4', 'Khách hàng 4', 'Địa chỉ 4', '1998-12-31', NULL);
INSERT INTO nhanvien (maNV, Hoten, Gioitinh, Diachi, NgaySinh, DienThoai, email, Noisinh, maNQL)
VALUES ('NV3', 'Nhân viên 3', 1, 'Địa chỉ 3', '1988-08-20', '0369852147', 'nv3@email.com', 'Nơi sinh 3', 'NQL1'),
       ('NV4', 'Nhân viên 4', 0, 'Địa chỉ 4', '1995-11-10', '0214785632', NULL, 'Nơi sinh 4', 'NQL3'),
       ('NV5', 'Nhân viên 5', 1, 'Địa chỉ 5', '1999-04-25', '0541236987', NULL, 'Nơi sinh 5', 'NQL2');

INSERT INTO ` loaisp` (MaLoaiSp, TenLoaiSP, GhiChu)
VALUES ('LSP2', 'Loại sản phẩm 2', NULL),
       ('LSP3', 'Loại sản phẩm 3', 'Ghi chú 3'),
       ('LSP4', 'Loại sản phẩm 4', 'Ghi chú 4'),
       ('LSP5', 'Loại sản phẩm 5', NULL);

INSERT INTO ` sanpham` (maSp, MaloaiSP, tenSP, DonViTinh, Ghichu) VALUE
    ('SP3', 'LSP3', 'Sản phẩm 3', 'Đơn vị 3', 'Ghi chú 3'),
    ('SP4', 'LSP4', 'Sản phẩm 4', 'Đơn vị 4', NULL),
    ('SP5', 'LSP5', 'Sản phẩm 5', 'Đơn vị 5', 'Ghi chú 5');
INSERT INTO phieunhap (soPN, maNV, maNCC, NgayNhap, ghichu)
VALUES ('PN3', 'NV3', 'NCC3', '2024-04-03 14:45:00', 'Ghi chú 3'),
       ('PN4', 'NV4', 'NCC4', '2024-04-04 09:15:00', 'Ghi chú 4'),
       ('PN5', 'NV5', 'NCC5', '2024-04-05 16:20:00', NULL);
INSERT INTO ` ctphieunhap` (maSp, SoPN, ` SoLuong`, GiaNhap)
VALUES ('SP3', 'PN3', 8, 15000.0),
       ('SP4', 'PN4', 12, 12000.0),
       ('SP5', 'PN5', 15, 18000.0);
INSERT INTO phieuxuat (SoPX, MaNV, MaKH, NgayBan, GhiChu)
VALUES ('PX3', 'NV3', 'KH3', '2024-04-03 14:00:00', 'Ghi chú 3'),
       ('PX4', 'NV4', 'KH4', '2024-04-04 11:20:00', 'Ghi chú 4'),
       ('PX5', 'NV5', 'KH5', '2024-04-05 09:10:00', NULL);
INSERT INTO ctphieuxuat (soPX, maSP, SOLUONG, GiaBan)
VALUES ('PX3', 'SP3', 10, 12000.0),
       ('PX4', 'SP4', 12, 18000.0),
       ('PX5', 'SP5', 15, 10000.0);
#1:
select maNV, Hoten, Gioitinh, NgaySinh, Diachi, DienThoai, TIMESTAMPDIFF(YEAR, nhanvien.NgaySinh, CURDATE()) AS TUOI
FROM nhanvien
ORDER BY TUOI DESC;
#2:
select soPN, phieunhap.maNV, Hoten, phieunhap.maNCC, tenNCC NgayNhap, ghichu
from phieunhap
         join nhanvien n on n.maNV = phieunhap.maNV
         join NhaCungCap NCC on phieunhap.maNCC = NCC.maNCC
WHERE MONTH(phieunhap.NgayNhap) = 4
  AND YEAR(phieunhap.NgayNhap) = 2024;
#3:
select *
from ` sanpham`
where DonViTinh = 'C';
#4:
select ` ctphieunhap`.SoPN,
       ` ctphieunhap`.maSp,
       ` sanpham`.tenSP,
       ` sanpham`.MaloaiSP,
       ` sanpham`.DonViTinh,
       ` SoLuong`,
       GiaNhap,
       (` SoLuong` * GiaNhap) as thanhtien
from ` ctphieunhap`
         join ` sanpham` on ` ctphieunhap`.maSp = ` sanpham`.maSp;
#5:
select nhacungcap.MaNCC,
       nhacungcap.tenNCC,
       nhacungcap.DiaChi,
       nhacungcap.Dienthoai,
       nhacungcap.Email,
       p.soPN,
       p.NgayNhap
from nhacungcap
         join phieunhap p on nhacungcap.maNCC = p.maNCC
where month(NgayNhap) = month(curdate())
order by NgayNhap;
#6:
SELECT ctphieuxuat.SoPX,
       nhanvien.Hoten,
       p.NgayBan,
       s.maSp,
       s.tenSP,
       s.DonViTinh,
       ctphieuxuat.SOLUONG,
       ctphieuxuat.GiaBan,
       (ctphieuxuat.SOLUONG * ctphieuxuat.GiaBan) AS DoanhThu
FROM ctphieuxuat
         JOIN phieuxuat p ON ctphieuxuat.SoPX = p.SoPX
         JOIN nhanvien ON p.maNV = nhanvien.MaNV
         JOIN ` sanpham` s ON ctphieuxuat.maSP = s.maSp
WHERE MONTH(p.NgayBan) <= 6
  AND YEAR(p.NgayBan) = 2024;
#7:
select *
from khachhang
where month(NgaySinh) = month(curdate());
#8:
SELECT phieuxuat.SoPX,
       nhanvien.Hoten,
       phieuxuat.NgayBan,
       s.MaSP,
       s.TenSP,
       s.DonViTinh,
       ctphieuxuat.SoLuong,
       ctphieuxuat.GiaBan,
       (ctphieuxuat.SoLuong * ctphieuxuat.GiaBan) AS DoanhThu
FROM phieuxuat
         JOIN nhanvien ON phieuxuat.MaNV = nhanvien.MaNV
         JOIN ctphieuxuat ON phieuxuat.SoPX = ctphieuxuat.SoPX
         JOIN ` sanpham` s ON ctphieuxuat.MaSP = s.MaSP
WHERE phieuxuat.NgayBan BETWEEN '2024-04-15' AND '2024-05-15';
#9:
SELECT phieuxuat.SoPX, phieuxuat.NgayBan, khachhang.MaKH, khachhang.TenKH, SUM(c.SoLuong * c.GiaBan) AS TriGia
FROM phieuxuat
         JOIN khachhang ON phieuxuat.MaKH = khachhang.MaKH
         JOIN ctphieuxuat c on phieuxuat.SoPX = c.soPX
GROUP BY phieuxuat.SoPX, khachhang.MaKH;
#10:
SELECT s.tenSP, SUM(ctphieuxuat.SoLuong) AS TongSoLuong
FROM phieuxuat
         JOIN ctphieuxuat ON phieuxuat.SoPX = ctphieuxuat.soPX
         join ` sanpham` s on ctphieuxuat.maSP = s.maSp
WHERE YEAR(phieuxuat.NgayBan) = 2024
  AND MONTH(phieuxuat.NgayBan) <= 6
  AND ctphieuxuat.maSP = 'SP1';

#11:
SELECT DATE_FORMAT(phieuxuat.NgayBan, '%Y-%m')       AS Thang,
       khachhang.MaKH,
       khachhang.TenKH,
       khachhang.DiaChi,
       SUM(ctphieuxuat.SoLuong * ctphieuxuat.GiaBan) AS TongTien
FROM phieuxuat
         JOIN khachhang ON phieuxuat.MaKH = khachhang.MaKH
         JOIN ctphieuxuat ON phieuxuat.SoPX = ctphieuxuat.soPX
GROUP BY Thang, khachhang.MaKH;

#12:
SELECT YEAR(phieuxuat.NgayBan)  AS Nam,
       MONTH(phieuxuat.NgayBan) AS Thang,
       s.maSp,
       s.tenSP,
       s.DonViTinh,
       SUM(ctphieuxuat.SoLuong) AS TongSoLuong
FROM phieuxuat
         JOIN ctphieuxuat ON phieuxuat.SoPX = ctphieuxuat.soPX
         JOIN ` sanpham` s ON ctphieuxuat.maSP = s.maSp
GROUP BY Nam, Thang, s.maSp;

#13:
SELECT MONTH(phieuxuat.NgayBan) AS Thang, SUM(ctphieuxuat.SoLuong * ctphieuxuat.GiaBan) AS DoanhThu
FROM phieuxuat
         JOIN ctphieuxuat ON phieuxuat.SoPX = ctphieuxuat.soPX
WHERE YEAR(phieuxuat.NgayBan) = 2024
  AND MONTH(phieuxuat.NgayBan) <= 6
GROUP BY Thang;

#14:
select phieuxuat.soPX,
       YEAR(phieuxuat.NgayBan)  AS Nam,
       MONTH(phieuxuat.NgayBan) AS Thang,
       Hoten,
       tenKH,
       sum(SOLUONG * GiaBan)       tongTG
from phieuxuat
         join nhanvien on phieuxuat.MaNV = nhanvien.maNV
         join khachhang on phieuxuat.MaKH = KHACHHANG.maKH
         join ctphieuxuat c on phieuxuat.SoPX = c.soPX
where month(NgayBan) = 4
   or month(ngayban) = 6
group by Thang, Nam, phieuxuat.soPX;

#15:
select phieuxuat.soPX, phieuxuat.MaKH, tenKH, Hoten, NgayBan day, sum(SOLUONG * GiaBan) total
from phieuxuat
         join khachhang on phieuxuat.MaKH = KHACHHANG.maKH
         join nhanvien n on phieuxuat.MaNV = n.maNV
         join ctphieuxuat c on phieuxuat.SoPX = c.soPX
group by c.soPX, day;

#16:
select nhanvien.maNV, Hoten, c.maSP, tenSP, DonViTinh, sum(SOLUONG) total
from nhanvien
         join phieuxuat p on nhanvien.maNV = p.MaNV
         join ctphieuxuat c on p.SoPX = c.soPX
         join ` sanpham` on c.maSP = ` sanpham`.maSp
group by nhanvien.maNV, ` sanpham`.maSp;

#17:
SELECT phieuxuat.SoPX,
       phieuxuat.NgayBan,
       s.MaSP,
       s.TenSP,
       s.DonViTinh,
       ctphieuxuat.SoLuong,
       ctphieuxuat.GiaBan,
       ctphieuxuat.SoLuong * ctphieuxuat.GiaBan AS ThanhTien
FROM phieuxuat
         JOIN ctphieuxuat ON phieuxuat.SoPX = ctphieuxuat.SoPX
         JOIN ` sanpham` s ON ctphieuxuat.MaSP = s.MaSP
WHERE phieuxuat.MaKH = 'KH1'
  AND YEAR(phieuxuat.NgayBan) = 2024
  AND MONTH(phieuxuat.NgayBan) BETWEEN 4 AND 6;

#18:
SELECT s.MaSP, s.TenSP, s.MaloaiSP, s.DonViTinh
FROM ` sanpham` s
         LEFT JOIN ctphieuxuat ON s.MaSP = ctphieuxuat.MaSP
         LEFT JOIN phieuxuat ON ctphieuxuat.SoPX = phieuxuat.SoPX
WHERE YEAR(phieuxuat.NgayBan) = 2024
  AND MONTH(phieuxuat.NgayBan) <= 6
  AND ctphieuxuat.SOLUONG = 0;

#19:
SELECT nhacungcap.MaNCC, nhacungcap.TenNCC, nhacungcap.DiaChi, nhacungcap.Dienthoai
FROM nhacungcap
         LEFT JOIN phieunhap ON nhacungcap.MaNCC = phieunhap.MaNCC
WHERE YEAR(phieunhap.NgayNhap) = 2018
  AND MONTH(phieunhap.NgayNhap) NOT BETWEEN 4 AND 6
  AND phieunhap.MaNCC IS NULL;

#20:
SELECT khachhang.MaKH, khachhang.TenKH, SUM(c.GiaBan) AS TongTriGia
FROM khachhang
         JOIN phieuxuat p on khachhang.maKH = p.MaKH
         JOIN ctphieuxuat c ON p.SoPX = c.soPX
WHERE YEAR(p.NgayBan) = 2018
  AND MONTH(p.NgayBan) <= 6
GROUP BY khachhang.MaKH, khachhang.TenKH
ORDER BY TongTriGia DESC
LIMIT 1;
#21:
SELECT khachhang.MaKH, COUNT(p.SoPX) AS SoLuongDonDatHang
FROM khachhang
         LEFT JOIN phieuxuat p on khachhang.maKH = p.MaKH
GROUP BY khachhang.MaKH;
#22:
SELECT nhanvien.MaNV, nhanvien.Hoten, khachhang.TenKH
FROM nhanvien
         JOIN phieuxuat ON nhanvien.MaNV = phieuxuat.MaNV
         left join khachhang on phieuxuat.MaKH = KHACHHANG.maKH;
#23:
SELECT SUM(CASE WHEN nhanvien.GioiTinh = 'Nam' THEN 1 ELSE 0 END) AS SoLuongNam,
       SUM(CASE WHEN nhanvien.GioiTinh = 'Nữ' THEN 1 ELSE 0 END) AS SoLuongNu
FROM nhanvien;

