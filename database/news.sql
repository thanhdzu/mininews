-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2018 at 09:58 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `idcategory` int(11) NOT NULL,
  `namecategory` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`idcategory`, `namecategory`) VALUES
(3, 'Công nghệ'),
(2, 'Du lịch'),
(1, 'Thể thao');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `idnews` int(11) NOT NULL,
  `idcat` int(11) NOT NULL,
  `title` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `annotation` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(25) CHARACTER SET latin1 NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'img/default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`idnews`, `idcat`, `title`, `annotation`, `text`, `author`, `date`, `image`) VALUES
(20, 1, 'Ronaldo và những lần mang Bồ Đào Nha trở về ‘từ cõi chết’', ' tuổi 33, Ronaldo vẫn duy trì sở thích quen thuộc, đó là giải cứu cho “Brazil châu Âu” mỗi khi đội bóng gặp nguy khó.', 'Bồ Đào Nha 2 -1 Ai Cập (giao hữu quốc tế)\r\n\r\nLà đương kim vô địch Euro, Bồ Đào Nha được đánh giá cao hơn Ai Cập trong trận giao hữu trước thềm World Cup 2018 mới đây. Chính vì vậy cũng dễ hiểu khi “Brazil châu Âu” là đội kiểm soát bóng vượt trội hơn.\r\nTuy nhiên, Ai Cập hiện tại đang sở hữu một cầu thủ thượng hạng làm cả thế giới phải “phát sốt”: Mohamed Salah.\r\n\r\nCũng chính chân sút đang dẫn đầu danh sách Vua phá lưới Ngoại hạng Anh mùa này (28 bàn) đã tung cú sút một chạm từ ngoài vòng cấm mở tỉ số cho Ai Cập ở phút 56 làm thẫn thờ người xem.', 'admin@email.com', '2018-03-24 08:39:32', 'img/1.jpg'),
(21, 3, 'Những công nghệ chữa cháy hiện đại nhất thế giới hiện nay dành cho chung cư, nhà cao tầng', 'Để bảo toàn cho tính mạng người dân sống ở các tòa nhà cao tầng, các nhà khoa học đã tạo nên những thiết bị chữa cháy tân tiến nhất trên thế giới.', 'Ngày nay, các tòa nhà cao tầng là tiêu chuẩn mới của thế giới. Do sự khan hiếm đất đai, thế nên các tòa nhà này thường có xu hướng càng cao càng tốt. Tuy nhiên, lợi thế chiều cao cũng là một phần bất lợi của ngôi nhà, bởi vì khi có sự cố xảy ra, đây cũng là nguyên nhân cản trở mọi người thoát thân cũng như gây khó khăn cho việc cứu hộ. Để giải quyết vấn đề này, các nhà khoa học trên thế giới đã chế tạo nên những thiết bị chữa cháy tân tiến nhất nhằm bảo toàn cho tính mạng của hàng ngàn người sinh sống.', 'admin@email.com', '2018-03-24 08:42:00', 'img/2.jpg'),
(22, 3, 'Huawei ra mắt smartphone giá rẻ Y7 Pro 2018 tại Việt Nam: giá 4 triệu nhưng có camera kép', 'Với giá bán 3,99 triệu đồng, HUAWEI Y7 Pro 2018 nằm ở phân khúc giá thấp/ cận tầm trung.', 'Huawei mới đây đã chính thức ra mắt chiếc HUAWEI Y7 Pro 2018 tại thị trường Việt Nam. Với giá bán 3,99 triệu đồng, chiếc máy này được xếp vào phân khúc giá thấp/ cận tầm trung.\r\n\r\n\r\nĐiểm nhấn của HUAWEI Y7 Pro 2018 nằm ở camera kép ở mặt lưng với khả năng tạo ra các hiệu ứng như xóa phông. Camera trước của máy trong khi được hỗ trợ thêm nhiều tính năng làm đẹp.\r\n\r\nỞ tầm giá này, người dùng sẽ có một thiết bị với mà hình kích thước 5,99 inch độ phân giải HD+ cùng tỷ lệ 18:9 giúp người dùng có không gian sử dụng tốt hơn trong một than amays gọn gàng hơn. HUAWEI Y7 Pro 2018 được nhà sản xuất trang bị chip xử lý Snapdragon 430, hỗ trợ bởi RAM 3 GB và bộ nhớ trong 32 GB. Một số thông số khác cũng có trên chiếc điện thoại này bao gồm camera kép 13 MP + 2 MP ở mặt lưng, camera trước 8 MP có đèn flash LED trợ sáng cùng với đó là viên pin dung lượng 3.000 mAh.', 'admin@email.com', '2018-03-24 08:46:32', 'img/3.jpg'),
(23, 3, 'BPhone 2018 lần đầu lộ diện, có thể là một chiếc điện thoại giá rẻ?', 'Hai chiếc smartphone trước đó BKAV ra mắt đều hướng vào phân khúc cận cao cấp/ cao cấp.', 'Kênh YouTube của Schannel mới đây đã bất ngờ đăng tải một clip dài 15 giây ghi lại hình ảnh một thiết bị được cho là chiếc BPhone 2018. Quan sát cho thấy chiếc BKAV BPhone 2018 có khá nhiều điểm tương đồng về thiết kế so với thiết bị tiền nhiệm. Dù vậy, chiếc máy trong đoạn video lại sở hữu thân máy kim loại nguyên khối thay vì có khung viền kim loại và hai mặt kính như trước.\r\n\r\n\r\nChiếc BPhone 2018 có thân máy cấu thành hoàn toàn từ kim loại. Chất liệu này có thể giúp trọng lượng thân máy giảm xuống.\r\n\r\nVới chất liệu thân máy này, Bphone 2018 sẽ không bóng bẩy như phiên bản 2017. Tuy nhiên, điểm cộng của chất liệu này nằm ở việc chi phí chất liệu thấp hơn, kéo theo giá thành của máy. Ngoài ra, chất liệu kính cũng dễ bám mồ hôi, dấu vân tay trong quá trình sử dụng hơn.\r\n\r\n\r\nDải ăng ten bằng nhựa chạy sát đỉnh và đuôi mặt lưng. Cách thiết kế này tương tự trên nhiều điện thoại như iPhone 7.\r\n\r\nCũng có thể thấy Bphone 2018 tiếp tục chỉ có camera đơn ở mặt lưng cùng đèn flash LED trợ sáng bên cạnh. Phiên máy rò rỉ này có thân máy màu bạc cùng logo chữ B quen thuộc ở mặt lưng. Ở mặt trước, người dùng vẫn có nút Home vật lý trong khi đó nhiều khả năng tỷ lệ màn hình mà Bphone 2018 áp dụng sẽ là 16:9. Bphone 2018 cũng nhiều khả năng không có jack cắm tai nghe 3,5 mm.', 'admin@email.com', '2018-03-24 08:48:09', 'img/4.jpg'),
(24, 3, 'iPhone SE 2 tiếp tục lộ diện với mặt lưng kính, thiết kế không thay đổi', 'Theo nhiều nguồn tin, Apple sẽ trình làng chiếc iPhone SE 2 vào trước thềm sự kiện WWDC 2018.', 'Dạo gần đây, những hình ảnh rò rỉ về thế hệ iPhone SE tiếp theo của Apple xuất hiện liên tục trên internet. Chỉ mới hai hôm trước, một đoạn video trên tay thiết bị, tạm cho là iPhone SE 2, đã được đăng tải lên mạng xã hội Weibo, Trung Quốc bởi tài khoản có tên kimmi0005. Theo đó, chiếc iPhone SE 2 trong đoạn video kể trên có thiết kế tương tự như iPhone X cả mặt trước lẫn sau.\r\n\r\nVà mới đây, một hình ảnh rò rỉ khác được cho là mặt lưng của iPhone SE 2 cũng đã được đăng tải lên mạng xã hội Weibo, Trung Quốc.\r\n\r\n\r\n\r\nQua bức ảnh rò rỉ này, ta có thể thấy mặt lưng của chiếc iPhone SE 2 này có thiết kế tương tự như thiết bị tiền nhiệm iPhone SE và iPhone 5. Điểm khác biệt duy nhất mà người nhìn có thể dễ dàng nhận thấy là chất liệu nhôm nguyên khối giờ đây đã được thay đổi thành kính như bộ đôi iPhone 8/8+ và iPhone X.\r\n\r\nBên cạnh đó, mặt lưng của thiết bị cũng được thiết kế trông liền mạch hơn nhờ việc trang bị một tấm kính duy nhất chứ không còn chia ra làm hai phần trên dưới và phần giữa như trước đây. Ngoài ra, cụm camera hơi lồi lên cũng hứa hẹn những cải tiến về chất lượng ảnh chụp.', 'admin@email.com', '2018-03-24 08:49:39', 'img/5.jpg'),
(25, 3, 'Auto-Tune, công nghệ ‘phù thủy’ khiến ca sỹ hát dở cũng thành hát hay', 'Auto-Tune chính là công nghệ chỉnh giọng mà nhiều người cho rằng đã phá hủy ngành công nghiệp thu âm.', '“Do you believe in life after love?”, đây là câu hát nổi tiếng trong ca khúc Believe của Cher mà phần lớn những người là fan của âm nhạc US - UK đều biết. Ca khúc đánh dấu sự trở lại của Cher vào năm 1998 này cũng được ghi nhận là lần đầu tiên một công nghệ có tên Auto-Tune được tận dụng đậm nét tới vậy trong một tác phẩm âm nhạc. CNN đánh giá đây là công nghệ chỉnh giọng đã thay đổi ngành công nghiệp âm nhạc.\r\n\r\n\r\n\r\nCa khúc “Believe” của Cher, một trong những bản hit thành công nhất những năm 90 của thế kỉ trước.\r\n\r\nAuto-Tune có thể được sử dụng để chỉnh giọng hát sao cho nó hòa hợp một cách hoàn hảo với nhịp điệu. Nếu được sử dụng đúng lúc đúng chỗ và nhẹ nhàng, việc áp dụng công nghệ này có thể hợp lý đến mức không thể nhận ra. Thế nhưng, trong bài nhạc của Cher, nhà sản xuất đã chỉnh Auto-Tune tới cấp độ 11, tạo ra một âm thanh nghe như một sự pha trộn giữa giọng người và giọng robot.\r\n\r\nAndy Hildebrand, người tạo ra Auto-Tune, chia sẻ với CNN: “Tôi từng nghĩ là, ok, mình sẽ đặt ra một thiết lập như thế trong phần mềm. Nhưng chẳng bao giờ tôi nghĩ rằng sẽ có ai đấy dùng nó.”\r\n\r\nSau khi Cher ra mắt Believe, nhiều người gọi hiệu ứng âm thanh trong bài hát là “hiệu ứng Cher”. Believe cũng trở thành một trong những bản hit thành công nhất những năm 90 thế kỉ trước.', 'admin@email.com', '2018-03-24 08:51:15', 'img/6.png'),
(26, 2, 'Bí ẩn về lăng mộ của vị vua Nguyễn', 'Đường đi vào lăng Gia Long qua một khu rừng thông rộng lớn. Lăng vua đặt tại xã Hương Thọ, Thị xã Hương Trà, tỉnh Thừa Thiên Huế. Có thể đi theo đường sông từ TP Huế khoảng 18km hay bằng đường bộ khoảng 15km.', 'Lăng Gia Long hay còn gọi là Thiên Thọ Lăng. Toàn bộ khu lăng này được bao quanh bởi 42 ngọn núi lớn nhỏ. Theo TS. Trần Đức Anh Sơn, sử cũ cho hay, thầy Địa lý Lê Duy Thanh (con trai nhà bác học Lê Quý Đôn) là người tìm được thế đất này, nơi mà theo ông “đã tập trung được mọi ảnh hưởng tốt lành tỏa ra từ nhiều núi đồi bao quanh”, nơi mà “ảnh hưởng tốt lành sẽ còn mãi mãi trong suốt 10 ngàn năm”.\r\n\r\nDu khách thắp hương lên cho ngài Gia Long. Chinh chiến sau nhiều năm, đánh bại triều Tây Sơn (1788-1801), ngài lên ngôi hoàng đế năm ngày mùng 2 tháng Năm năm Nhâm Tuất (01/06/1802), lập nên triều Nguyễn, thống nhất đất nước và đóng đô ở Phú Xuân (là cố đô Huế ngày nay). Tháng 3/1804, vua đặt quốc hiệu Việt Nam.', 'admin@email.com', '2018-03-24 08:53:54', 'img/7.jpg'),
(27, 2, 'Điều đặc biệt của ‘thị trấn ngoại tình’ nổi tiếng ở Anh', 'Theo một cuộc khảo sát, thị trấn Stratford-upon-Avon là nơi có tỷ lệ ngoại tình cao nhất nước Anh khi 1.047 người có mối quan hệ ngoài hôn nhân trong tổng số 27.455 dân số tại đây.', '“Thị trấn ngoại tình” Stratford-upon-Avon là một địa điểm ở hạt Warwickshire, Anh. Nơi đây nổi tiếng khi là quê hương của nhà văn và nhà thơ William Shakespeare. Theo một cuộc khảo sát ở 150 địa điểm được tiến hành bởi IllicitEncounters.com, trang web hẹn hò dành cho những người đã lập gia đình, Stratford-upon-Avon đứng đầu danh sách những nơi có tỷ lệ ngoại tình cao nhất Anh khi có tới 1.047 người có mối quan hệ ngoài hôn nhân trong tổng số 27.455 dân số tại đây.', 'admin@email.com', '2018-03-24 08:55:02', 'img/8.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` varchar(25) CHARACTER SET latin1 NOT NULL,
  `username` varchar(25) CHARACTER SET latin1 NOT NULL,
  `usersurname` varchar(25) CHARACTER SET latin1 NOT NULL,
  `userpassword` varchar(25) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `username`, `usersurname`, `userpassword`) VALUES
('admin@email.com', 'Nguyen', 'Thanh', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idcategory`),
  ADD UNIQUE KEY `idcategory_UNIQUE` (`idcategory`),
  ADD UNIQUE KEY `namecategory_UNIQUE` (`namecategory`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`idnews`),
  ADD UNIQUE KEY `idnews_UNIQUE` (`idnews`),
  ADD KEY `id_cat_idx` (`idcat`),
  ADD KEY `id_author_idx` (`author`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`),
  ADD UNIQUE KEY `iduser_UNIQUE` (`iduser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `idcategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `idnews` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `id_author` FOREIGN KEY (`author`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_cat` FOREIGN KEY (`idcat`) REFERENCES `category` (`idcategory`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
