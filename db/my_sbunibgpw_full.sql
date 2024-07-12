-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 16, 2024 at 09:44 PM
-- Server version: 8.0.32
-- PHP Version: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_sbunibgpw`
--

-- --------------------------------------------------------

--
-- Table structure for table `ActivePlates`
--

CREATE TABLE `ActivePlates` (
  `number` varchar(7) DEFAULT NULL,
  `emissionDate` varchar(10) DEFAULT NULL,
  `vehicleNumber` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ActivePlates`
--

INSERT INTO `ActivePlates` (`number`, `emissionDate`, `vehicleNumber`) VALUES
('MXY51J0', '2023-02-15', 7497410),
('RZW0KWH', '2022-12-18', 1314411),
('L0SJRCW', '2022-06-27', 4990155),
('5EGBMTZ', '2023-02-06', 5576531),
('NPUMNJ6', '2022-10-03', 7976007),
('9PWEJBU', '2023-05-28', 2751226),
('LJOPBYD', '2023-01-10', 4099776),
('VGE3Y2K', '2023-05-15', 6605475),
('M0YCNHH', '2023-02-08', 9609237),
('HYZX4N0', '2023-07-22', 2912699),
('CX2WRBT', '2023-06-17', 3380654),
('3EHISJ4', '2023-02-18', 1151033),
('H4RE0YY', '2023-04-28', 7178047),
('2ICAOUN', '2022-09-23', 7036840),
('MUL70BR', '2023-05-07', 3268785),
('K5LJ9RF', '2022-12-03', 1004521),
('1UNPJDG', '2023-01-25', 8874643),
('W108GC2', '2022-11-01', 8450408),
('99RIS4N', '2022-12-16', 9830640),
('I4L28EP', '2023-05-01', 8125073),
('X96UPS6', '2023-02-22', 6059240),
('WRKCYU6', '2022-11-05', 7747731),
('FJT6COE', '2023-03-06', 3269220),
('ENY1756', '2022-10-23', 6727881),
('LNVPLBE', '2023-02-05', 201449),
('2YXUHBL', '2023-02-23', 1918997),
('FPWTN0R', '2023-07-18', 638603),
('DYRGMW1', '2023-06-17', 2383813),
('6579U1C', '2023-07-01', 1947421),
('ROXRKTD', '2022-11-02', 6544561),
('WCHSVM7', '2023-03-23', 1632374),
('P4LMYLI', '2022-09-12', 4201269),
('U9IC3LO', '2023-06-19', 8320816),
('0K12NFE', '2022-12-14', 6758038),
('BJG4Z74', '2023-04-22', 3215533),
('X1XVQHU', '2023-09-05', 4281302),
('OC1677Q', '2022-10-31', 8810966),
('V1WOCE5', '2023-03-18', 2525354),
('PJE8AC8', '2022-12-26', 6170938),
('GUR9FWF', '2023-06-14', 3344501),
('XYYK089', '2023-05-03', 9398782),
('MEY61WT', '2022-08-04', 2169962),
('02GU3D2', '2023-09-12', 4601136),
('NCRMOVC', '2023-01-26', 8115007),
('59Z6LZ4', '2023-09-17', 5104021),
('R46K02H', '2023-02-03', 2682643),
('Q21Q47Y', '2022-10-13', 1779464),
('R274RDH', '2023-02-18', 2237906),
('KH45CQJ', '2023-05-28', 5828543),
('PGBAN5T', '2022-07-06', 6101097),
('TOF7S6M', '2023-06-15', 1763462),
('JP8JXMO', '2022-12-26', 8059565);

-- --------------------------------------------------------

--
-- Table structure for table `InactivePlates`
--

CREATE TABLE `InactivePlates` (
  `number` varchar(7) DEFAULT NULL,
  `emissionDate` varchar(10) DEFAULT NULL,
  `vehicleNumber` int DEFAULT NULL,
  `resDate` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `InactivePlates`
--

INSERT INTO `InactivePlates` (`number`, `emissionDate`, `vehicleNumber`, `resDate`) VALUES
('4ZD850M', '2023-01-13', 7497410, '2023-02-14'),
('X2L9MDP', '2023-05-04', 5669853, '2024-04-17'),
('MEA0Z7E', '2023-01-08', 8377870, '2023-01-28'),
('T0SY701', '2023-01-28', 6242879, '2023-02-17'),
('58B2119', '2022-10-25', 6242879, '2022-11-15'),
('C0RTMBQ', '2022-10-26', 4099776, '2022-11-11'),
('IMTKQ6Y', '2023-03-16', 6605475, '2023-04-18'),
('357Y10F', '2022-12-18', 6605475, '2023-02-18'),
('9RCMG9A', '2022-10-31', 9609237, '2023-01-12'),
('Q9PMEO3', '2022-09-29', 9609237, '2022-10-22'),
('P7L8GZM', '2023-08-30', 2428580, '2024-03-14'),
('S3DIS6Y', '2023-07-03', 2428580, '2023-08-21'),
('V2GCLEY', '2023-04-29', 2428580, '2023-05-15'),
('KCCO5M6', '2023-05-14', 2912699, '2023-05-30'),
('PEB8ZHG', '2023-02-15', 2912699, '2023-05-13'),
('M8HRA7V', '2022-08-27', 3032184, '2023-01-23'),
('SB25LIR', '2023-04-06', 3380654, '2023-06-01'),
('TQG5MAI', '2023-02-25', 3380654, '2023-03-30'),
('7VEFBOS', '2022-11-17', 1151033, '2022-12-09'),
('GOIERR2', '2022-09-10', 1151033, '2022-11-10'),
('DZCVFGQ', '2023-01-06', 4248727, '2024-03-29'),
('7XI0L4K', '2022-10-30', 4248727, '2022-11-25'),
('L71KOWD', '2022-10-30', 3608090, '2023-04-09'),
('CSKP0AH', '2022-08-24', 3608090, '2022-10-05'),
('LFF8KTM', '2022-06-28', 3608090, '2022-07-18'),
('I0Y15YE', '2022-11-11', 8874643, '2023-01-01'),
('Z7JX0AL', '2023-02-11', 6440953, '2023-05-30'),
('335YY8A', '2022-11-14', 6440953, '2022-12-26'),
('673Y1EM', '2022-10-01', 8450408, '2022-10-30'),
('5ISADMC', '2023-04-06', 5945497, '2023-07-04'),
('W6LS8DR', '2023-02-25', 5945497, '2023-03-29'),
('33VAANY', '2023-03-19', 8125073, '2023-04-08'),
('8LV9P9G', '2022-08-03', 1163929, '2023-11-10'),
('BZ9QBWR', '2022-09-25', 6313226, '2023-08-23'),
('K0J6G96', '2022-06-22', 6313226, '2022-08-01'),
('J8SV7I4', '2023-08-28', 1086479, '2024-01-13'),
('H1XZXKF', '2023-06-24', 1086479, '2023-08-03'),
('YEZM2HD', '2023-03-31', 1086479, '2023-04-15'),
('7Y7667Q', '2022-12-01', 3269220, '2023-01-14'),
('TQZC8MS', '2022-10-12', 3269220, '2022-11-23'),
('TYO35Y5', '2022-10-24', 9012280, '2023-09-16'),
('ABPZXQ9', '2023-04-27', 4214405, '2023-09-26'),
('09FS9CO', '2023-01-25', 4214405, '2023-04-23'),
('0ZLBGIK', '2022-12-12', 4214405, '2023-01-16'),
('AU96SQ6', '2022-12-05', 201449, '2022-12-29'),
('1Y1RSUY', '2023-06-13', 3726894, '2024-01-27'),
('J2TWYM9', '2023-03-08', 3726894, '2023-03-24'),
('V9P60LH', '2022-12-02', 3726894, '2023-01-05'),
('0LY5SRL', '2023-05-14', 638603, '2023-06-02'),
('FJM7MKK', '2023-04-09', 638603, '2023-04-17'),
('CX12N8R', '2023-04-25', 2383813, '2023-06-05'),
('AILN9VW', '2023-03-24', 2383813, '2023-03-30'),
('IT8NNNZ', '2023-05-12', 1947421, '2023-05-19'),
('PQZCBU4', '2023-02-12', 1632374, '2023-03-21'),
('C6ZZHMC', '2022-07-15', 4201269, '2022-08-06'),
('Y6Q7MSJ', '2023-09-28', 9386363, '2024-04-03'),
('NTR4WV7', '2023-07-19', 9386363, '2023-07-28'),
('EV42A7L', '2023-05-25', 9386363, '2023-07-05'),
('CPLXF86', '2023-05-06', 8320816, '2023-05-24'),
('6VILBZU', '2023-01-15', 3215533, '2023-02-20'),
('PPZ1JFR', '2022-10-20', 3215533, '2023-01-03'),
('2GGB13O', '2023-07-21', 4281302, '2023-08-29'),
('U7PNV6M', '2023-05-21', 4281302, '2023-06-22'),
('JLAPWZN', '2023-06-25', 7446075, '2023-10-07'),
('6QSNW68', '2023-05-14', 7446075, '2023-06-22'),
('JR44QKZ', '2023-03-25', 7446075, '2023-04-22'),
('2EW2IXT', '2023-01-03', 2525354, '2023-03-02'),
('C4V3MCS', '2022-10-28', 6170938, '2022-11-15'),
('COGCFGJ', '2022-07-20', 6170938, '2022-10-19'),
('6EB7R3V', '2023-03-19', 3344501, '2023-05-11'),
('USLVWAP', '2023-02-07', 9398782, '2023-03-18'),
('4P9I2VP', '2023-02-12', 2577777, '2023-06-15'),
('JVMV0SA', '2023-06-13', 4601136, '2023-08-27'),
('ZRVM5S7', '2023-03-10', 4601136, '2023-04-18'),
('DEAX2S8', '2022-11-28', 8115007, '2022-12-24'),
('W2UI7BT', '2022-09-22', 8115007, '2022-11-11'),
('JJ7165L', '2023-07-22', 5104021, '2023-08-15'),
('YTHTZIB', '2023-04-28', 5104021, '2023-05-19'),
('ZVE5WF9', '2022-11-28', 2682643, '2023-01-04'),
('9HV0BX5', '2022-07-22', 1779464, '2022-07-29'),
('NV5OQS8', '2023-01-05', 1820462, '2023-09-03'),
('3IVVVPL', '2022-11-24', 1820462, '2022-12-12'),
('J62V1WA', '2022-12-30', 2237906, '2023-01-20'),
('Q358QYL', '2023-04-26', 5828543, '2023-05-16'),
('4IFLH1I', '2023-02-20', 5828543, '2023-03-05'),
('AH8MUTO', '2023-05-10', 1763462, '2023-05-27'),
('RS0KZJ1', '2023-09-18', 3477763, '2023-11-15'),
('3C8E8IY', '2023-07-08', 3477763, '2023-09-09'),
('IYKYZKR', '2023-04-03', 3477763, '2023-05-01'),
('6BENCKG', '2023-06-16', 6765212, '2023-08-24'),
('C9OJVMT', '2023-04-21', 6765212, '2023-05-31'),
('B6Y491B', '2022-09-19', 8059565, '2022-10-26'),
('CZ2KRRL', '2023-07-25', 2085224, '2024-04-17'),
('UMYWMD5', '2023-06-18', 2085224, '2023-06-24'),
('3RCNUDL', '2023-03-23', 2085224, '2023-05-14'),
('MFRA8C1', '2023-03-23', 1376692, '2023-07-27');

-- --------------------------------------------------------

--
-- Table structure for table `Plates`
--

CREATE TABLE `Plates` (
  `number` varchar(7) DEFAULT NULL,
  `emissionDate` varchar(10) DEFAULT NULL,
  `vehicleNumber` int DEFAULT NULL,
  `active` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Plates`
--

INSERT INTO `Plates` (`number`, `emissionDate`, `vehicleNumber`, `active`) VALUES
('MXY51J0', '2023-02-15', 7497410, 1),
('4ZD850M', '2023-01-13', 7497410, 0),
('RZW0KWH', '2022-12-18', 1314411, 1),
('L0SJRCW', '2022-06-27', 4990155, 1),
('X2L9MDP', '2023-05-04', 5669853, 0),
('MEA0Z7E', '2023-01-08', 8377870, 0),
('5EGBMTZ', '2023-02-06', 5576531, 1),
('T0SY701', '2023-01-28', 6242879, 0),
('58B2119', '2022-10-25', 6242879, 0),
('NPUMNJ6', '2022-10-03', 7976007, 1),
('9PWEJBU', '2023-05-28', 2751226, 1),
('LJOPBYD', '2023-01-10', 4099776, 1),
('C0RTMBQ', '2022-10-26', 4099776, 0),
('VGE3Y2K', '2023-05-15', 6605475, 1),
('IMTKQ6Y', '2023-03-16', 6605475, 0),
('357Y10F', '2022-12-18', 6605475, 0),
('M0YCNHH', '2023-02-08', 9609237, 1),
('9RCMG9A', '2022-10-31', 9609237, 0),
('Q9PMEO3', '2022-09-29', 9609237, 0),
('P7L8GZM', '2023-08-30', 2428580, 0),
('S3DIS6Y', '2023-07-03', 2428580, 0),
('V2GCLEY', '2023-04-29', 2428580, 0),
('HYZX4N0', '2023-07-22', 2912699, 1),
('KCCO5M6', '2023-05-14', 2912699, 0),
('PEB8ZHG', '2023-02-15', 2912699, 0),
('M8HRA7V', '2022-08-27', 3032184, 0),
('CX2WRBT', '2023-06-17', 3380654, 1),
('SB25LIR', '2023-04-06', 3380654, 0),
('TQG5MAI', '2023-02-25', 3380654, 0),
('3EHISJ4', '2023-02-18', 1151033, 1),
('7VEFBOS', '2022-11-17', 1151033, 0),
('GOIERR2', '2022-09-10', 1151033, 0),
('DZCVFGQ', '2023-01-06', 4248727, 0),
('7XI0L4K', '2022-10-30', 4248727, 0),
('H4RE0YY', '2023-04-28', 7178047, 1),
('2ICAOUN', '2022-09-23', 7036840, 1),
('L71KOWD', '2022-10-30', 3608090, 0),
('CSKP0AH', '2022-08-24', 3608090, 0),
('LFF8KTM', '2022-06-28', 3608090, 0),
('MUL70BR', '2023-05-07', 3268785, 1),
('K5LJ9RF', '2022-12-03', 1004521, 1),
('1UNPJDG', '2023-01-25', 8874643, 1),
('I0Y15YE', '2022-11-11', 8874643, 0),
('Z7JX0AL', '2023-02-11', 6440953, 0),
('335YY8A', '2022-11-14', 6440953, 0),
('W108GC2', '2022-11-01', 8450408, 1),
('673Y1EM', '2022-10-01', 8450408, 0),
('99RIS4N', '2022-12-16', 9830640, 1),
('5ISADMC', '2023-04-06', 5945497, 0),
('W6LS8DR', '2023-02-25', 5945497, 0),
('I4L28EP', '2023-05-01', 8125073, 1),
('33VAANY', '2023-03-19', 8125073, 0),
('8LV9P9G', '2022-08-03', 1163929, 0),
('X96UPS6', '2023-02-22', 6059240, 1),
('WRKCYU6', '2022-11-05', 7747731, 1),
('BZ9QBWR', '2022-09-25', 6313226, 0),
('K0J6G96', '2022-06-22', 6313226, 0),
('J8SV7I4', '2023-08-28', 1086479, 0),
('H1XZXKF', '2023-06-24', 1086479, 0),
('YEZM2HD', '2023-03-31', 1086479, 0),
('FJT6COE', '2023-03-06', 3269220, 1),
('7Y7667Q', '2022-12-01', 3269220, 0),
('TQZC8MS', '2022-10-12', 3269220, 0),
('ENY1756', '2022-10-23', 6727881, 1),
('TYO35Y5', '2022-10-24', 9012280, 0),
('ABPZXQ9', '2023-04-27', 4214405, 0),
('09FS9CO', '2023-01-25', 4214405, 0),
('0ZLBGIK', '2022-12-12', 4214405, 0),
('LNVPLBE', '2023-02-05', 201449, 1),
('AU96SQ6', '2022-12-05', 201449, 0),
('1Y1RSUY', '2023-06-13', 3726894, 0),
('J2TWYM9', '2023-03-08', 3726894, 0),
('V9P60LH', '2022-12-02', 3726894, 0),
('2YXUHBL', '2023-02-23', 1918997, 1),
('FPWTN0R', '2023-07-18', 638603, 1),
('0LY5SRL', '2023-05-14', 638603, 0),
('FJM7MKK', '2023-04-09', 638603, 0),
('DYRGMW1', '2023-06-17', 2383813, 1),
('CX12N8R', '2023-04-25', 2383813, 0),
('AILN9VW', '2023-03-24', 2383813, 0),
('6579U1C', '2023-07-01', 1947421, 1),
('IT8NNNZ', '2023-05-12', 1947421, 0),
('ROXRKTD', '2022-11-02', 6544561, 1),
('WCHSVM7', '2023-03-23', 1632374, 1),
('PQZCBU4', '2023-02-12', 1632374, 0),
('P4LMYLI', '2022-09-12', 4201269, 1),
('C6ZZHMC', '2022-07-15', 4201269, 0),
('Y6Q7MSJ', '2023-09-28', 9386363, 0),
('NTR4WV7', '2023-07-19', 9386363, 0),
('EV42A7L', '2023-05-25', 9386363, 0),
('U9IC3LO', '2023-06-19', 8320816, 1),
('CPLXF86', '2023-05-06', 8320816, 0),
('0K12NFE', '2022-12-14', 6758038, 1),
('BJG4Z74', '2023-04-22', 3215533, 1),
('6VILBZU', '2023-01-15', 3215533, 0),
('PPZ1JFR', '2022-10-20', 3215533, 0),
('X1XVQHU', '2023-09-05', 4281302, 1),
('2GGB13O', '2023-07-21', 4281302, 0),
('U7PNV6M', '2023-05-21', 4281302, 0),
('JLAPWZN', '2023-06-25', 7446075, 0),
('6QSNW68', '2023-05-14', 7446075, 0),
('JR44QKZ', '2023-03-25', 7446075, 0),
('OC1677Q', '2022-10-31', 8810966, 1),
('V1WOCE5', '2023-03-18', 2525354, 1),
('2EW2IXT', '2023-01-03', 2525354, 0),
('PJE8AC8', '2022-12-26', 6170938, 1),
('C4V3MCS', '2022-10-28', 6170938, 0),
('COGCFGJ', '2022-07-20', 6170938, 0),
('GUR9FWF', '2023-06-14', 3344501, 1),
('6EB7R3V', '2023-03-19', 3344501, 0),
('XYYK089', '2023-05-03', 9398782, 1),
('USLVWAP', '2023-02-07', 9398782, 0),
('4P9I2VP', '2023-02-12', 2577777, 0),
('MEY61WT', '2022-08-04', 2169962, 1),
('02GU3D2', '2023-09-12', 4601136, 1),
('JVMV0SA', '2023-06-13', 4601136, 0),
('ZRVM5S7', '2023-03-10', 4601136, 0),
('NCRMOVC', '2023-01-26', 8115007, 1),
('DEAX2S8', '2022-11-28', 8115007, 0),
('W2UI7BT', '2022-09-22', 8115007, 0),
('59Z6LZ4', '2023-09-17', 5104021, 1),
('JJ7165L', '2023-07-22', 5104021, 0),
('YTHTZIB', '2023-04-28', 5104021, 0),
('R46K02H', '2023-02-03', 2682643, 1),
('ZVE5WF9', '2022-11-28', 2682643, 0),
('Q21Q47Y', '2022-10-13', 1779464, 1),
('9HV0BX5', '2022-07-22', 1779464, 0),
('NV5OQS8', '2023-01-05', 1820462, 0),
('3IVVVPL', '2022-11-24', 1820462, 0),
('R274RDH', '2023-02-18', 2237906, 1),
('J62V1WA', '2022-12-30', 2237906, 0),
('KH45CQJ', '2023-05-28', 5828543, 1),
('Q358QYL', '2023-04-26', 5828543, 0),
('4IFLH1I', '2023-02-20', 5828543, 0),
('PGBAN5T', '2022-07-06', 6101097, 1),
('TOF7S6M', '2023-06-15', 1763462, 1),
('AH8MUTO', '2023-05-10', 1763462, 0),
('RS0KZJ1', '2023-09-18', 3477763, 0),
('3C8E8IY', '2023-07-08', 3477763, 0),
('IYKYZKR', '2023-04-03', 3477763, 0),
('6BENCKG', '2023-06-16', 6765212, 0),
('C9OJVMT', '2023-04-21', 6765212, 0),
('JP8JXMO', '2022-12-26', 8059565, 1),
('B6Y491B', '2022-09-19', 8059565, 0),
('CZ2KRRL', '2023-07-25', 2085224, 0),
('UMYWMD5', '2023-06-18', 2085224, 0),
('3RCNUDL', '2023-03-23', 2085224, 0),
('MFRA8C1', '2023-03-23', 1376692, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Revisions`
--

CREATE TABLE `Revisions` (
  `id` smallint DEFAULT NULL,
  `plateNumber` varchar(7) DEFAULT NULL,
  `revisionDate` varchar(10) DEFAULT NULL,
  `outcome` varchar(8) DEFAULT NULL,
  `motivation` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Revisions`
--

INSERT INTO `Revisions` (`id`, `plateNumber`, `revisionDate`, `outcome`, `motivation`) VALUES
(1, 'RZW0KWH', '2023-03-27', 'negative', 'Targa danneggiata o manomessa'),
(2, 'RZW0KWH', '2024-01-01', 'positive', ''),
(3, 'X2L9MDP', '2023-07-12', 'positive', ''),
(4, 'MEA0Z7E', '2023-01-15', 'positive', ''),
(5, '5EGBMTZ', '2023-12-05', 'positive', ''),
(6, 'T0SY701', '2023-02-17', 'negative', 'Targa danneggiata o manomessa'),
(7, '58B2119', '2022-11-09', 'negative', 'Registrazione fraudolenta'),
(8, 'LJOPBYD', '2024-03-21', 'positive', ''),
(9, 'LJOPBYD', '2023-04-27', 'negative', 'Veicolo coinvolto in incidente'),
(10, 'LJOPBYD', '2024-04-21', 'positive', ''),
(11, 'C0RTMBQ', '2022-10-28', 'positive', ''),
(12, '357Y10F', '2023-02-15', 'negative', 'Registrazione fraudolenta'),
(13, '357Y10F', '2022-12-29', 'negative', 'Veicolo non superato il test delle emissioni'),
(14, 'Q9PMEO3', '2022-10-07', 'positive', ''),
(15, 'P7L8GZM', '2023-12-27', 'positive', ''),
(16, 'S3DIS6Y', '2023-07-16', 'positive', ''),
(17, 'V2GCLEY', '2023-05-13', 'negative', 'Registrazione fraudolenta'),
(18, 'KCCO5M6', '2023-05-26', 'negative', 'Proprietario precedente non ha rivelato problemi'),
(19, 'PEB8ZHG', '2023-03-31', 'negative', 'Violazione delle normative ambientali'),
(20, 'PEB8ZHG', '2023-03-29', 'positive', ''),
(21, 'M8HRA7V', '2022-10-14', 'positive', ''),
(22, 'TQG5MAI', '2023-03-24', 'negative', 'Non conformità alle normative'),
(23, 'TQG5MAI', '2023-03-25', 'negative', 'Mancato pagamento di imposte'),
(24, '3EHISJ4', '2023-04-04', 'positive', ''),
(25, 'DZCVFGQ', '2023-04-11', 'positive', ''),
(26, '7XI0L4K', '2022-11-22', 'negative', 'Targa danneggiata o manomessa'),
(27, 'H4RE0YY', '2023-06-20', 'positive', ''),
(28, 'H4RE0YY', '2023-12-31', 'positive', ''),
(29, 'H4RE0YY', '2023-12-23', 'negative', 'Mancato pagamento di imposte'),
(30, 'L71KOWD', '2023-02-18', 'positive', ''),
(31, 'CSKP0AH', '2022-09-21', 'positive', ''),
(32, 'LFF8KTM', '2022-07-03', 'positive', ''),
(33, '1UNPJDG', '2023-12-12', 'negative', 'Violazione delle leggi sul traffico'),
(34, '1UNPJDG', '2024-05-05', 'positive', ''),
(35, 'I0Y15YE', '2022-12-27', 'negative', 'Mancato pagamento di imposte'),
(36, 'I0Y15YE', '2022-11-17', 'negative', 'Scoperte problematiche di sicurezza durante l\'ispezione'),
(37, 'Z7JX0AL', '2023-04-09', 'positive', ''),
(38, '335YY8A', '2022-11-22', 'positive', ''),
(39, '99RIS4N', '2024-05-12', 'negative', 'Documentazione errata presentata'),
(40, '5ISADMC', '2023-05-23', 'positive', ''),
(41, 'W6LS8DR', '2023-03-06', 'negative', 'Targa persa o rubata'),
(42, 'I4L28EP', '2023-07-14', 'negative', 'Targa persa o rubata'),
(43, 'I4L28EP', '2024-01-17', 'negative', 'Scoperte problematiche di sicurezza durante l\'ispezione'),
(44, 'I4L28EP', '2023-07-02', 'negative', 'Scoperte problematiche di sicurezza durante l\'ispezione'),
(45, '33VAANY', '2023-03-27', 'positive', ''),
(46, '33VAANY', '2023-04-06', 'negative', 'Registrazione fraudolenta'),
(47, '8LV9P9G', '2023-06-21', 'negative', 'Targa persa o rubata'),
(48, 'WRKCYU6', '2023-06-04', 'positive', ''),
(49, 'BZ9QBWR', '2023-07-11', 'negative', 'Violazione delle normative ambientali'),
(50, 'K0J6G96', '2022-06-25', 'positive', ''),
(51, 'J8SV7I4', '2023-12-02', 'negative', 'Veicolo coinvolto in incidente'),
(52, 'H1XZXKF', '2023-07-17', 'positive', ''),
(53, 'YEZM2HD', '2023-04-12', 'positive', ''),
(54, 'TYO35Y5', '2023-07-24', 'negative', 'Targa associata ad attività criminali'),
(55, 'ABPZXQ9', '2023-05-02', 'positive', ''),
(56, '09FS9CO', '2023-03-31', 'positive', ''),
(57, '0ZLBGIK', '2023-01-06', 'negative', 'Veicolo non superato il test delle emissioni'),
(58, '1Y1RSUY', '2023-11-01', 'negative', 'Violazione delle leggi sul traffico'),
(59, 'J2TWYM9', '2023-03-19', 'positive', ''),
(60, 'V9P60LH', '2022-12-03', 'negative', 'Veicolo coinvolto in incidente'),
(61, '2YXUHBL', '2023-10-31', 'negative', 'Scoperte problematiche di sicurezza durante l\'ispezione'),
(62, '0LY5SRL', '2023-05-26', 'negative', 'Registrazione fraudolenta'),
(63, 'AILN9VW', '2023-03-25', 'positive', ''),
(64, 'IT8NNNZ', '2023-05-17', 'negative', 'Registrazione fraudolenta'),
(65, 'IT8NNNZ', '2023-05-17', 'positive', ''),
(66, 'ROXRKTD', '2023-08-10', 'positive', ''),
(67, 'WCHSVM7', '2023-10-09', 'negative', 'Targa associata ad attività criminali'),
(68, 'C6ZZHMC', '2022-07-29', 'negative', 'Targa persa o rubata'),
(69, 'Y6Q7MSJ', '2023-12-20', 'positive', ''),
(70, 'NTR4WV7', '2023-07-25', 'positive', ''),
(71, 'EV42A7L', '2023-05-30', 'negative', 'Targa associata ad attività criminali'),
(72, 'U9IC3LO', '2023-06-22', 'positive', ''),
(73, 'U9IC3LO', '2024-02-06', 'negative', 'Modifiche improprie apportate al veicolo'),
(74, 'CPLXF86', '2023-05-08', 'positive', ''),
(75, '0K12NFE', '2023-07-26', 'positive', ''),
(76, '0K12NFE', '2023-09-12', 'positive', ''),
(77, 'X1XVQHU', '2024-03-24', 'negative', 'Targa associata ad attività criminali'),
(78, 'U7PNV6M', '2023-06-08', 'negative', 'Targa associata ad attività criminali'),
(79, 'JLAPWZN', '2023-09-23', 'negative', 'Veicolo non superato il test delle emissioni'),
(80, '6QSNW68', '2023-05-30', 'negative', 'Falsificazione o contraffazione di documenti'),
(81, 'JR44QKZ', '2023-04-12', 'positive', ''),
(82, 'OC1677Q', '2023-02-03', 'negative', 'Veicolo segnalato come rubato'),
(83, 'OC1677Q', '2024-03-04', 'positive', ''),
(84, 'V1WOCE5', '2023-10-19', 'negative', 'Targa persa o rubata'),
(85, 'V1WOCE5', '2024-04-18', 'positive', ''),
(86, 'PJE8AC8', '2023-08-20', 'negative', 'Veicolo considerato non sicuro per l\'uso su strada'),
(87, 'C4V3MCS', '2022-11-01', 'negative', 'Modifiche improprie apportate al veicolo'),
(88, 'C4V3MCS', '2022-11-13', 'negative', 'Targa danneggiata o manomessa'),
(89, 'GUR9FWF', '2023-07-08', 'positive', ''),
(90, 'GUR9FWF', '2023-06-25', 'positive', ''),
(91, '6EB7R3V', '2023-04-23', 'negative', 'Violazione delle normative ambientali'),
(92, '6EB7R3V', '2023-04-07', 'positive', ''),
(93, 'XYYK089', '2023-08-03', 'positive', ''),
(94, 'USLVWAP', '2023-03-18', 'positive', ''),
(95, '4P9I2VP', '2023-03-28', 'negative', 'Registrazione fraudolenta'),
(96, 'MEY61WT', '2022-12-02', 'negative', 'Veicolo coinvolto in incidente'),
(97, 'MEY61WT', '2023-09-04', 'positive', ''),
(98, 'JVMV0SA', '2023-08-24', 'positive', ''),
(99, 'ZRVM5S7', '2023-04-08', 'positive', ''),
(100, 'NCRMOVC', '2024-05-05', 'positive', ''),
(101, 'NCRMOVC', '2024-05-14', 'negative', 'Targa danneggiata o manomessa'),
(102, 'NCRMOVC', '2023-08-04', 'positive', ''),
(103, 'W2UI7BT', '2022-11-03', 'negative', 'Proprietario precedente non ha rivelato problemi'),
(104, 'JJ7165L', '2023-07-31', 'positive', ''),
(105, 'JJ7165L', '2023-08-09', 'positive', ''),
(106, 'YTHTZIB', '2023-05-03', 'positive', ''),
(107, '9HV0BX5', '2022-07-29', 'positive', ''),
(108, 'NV5OQS8', '2023-08-02', 'negative', 'Registrazione fraudolenta'),
(109, '3IVVVPL', '2022-11-25', 'positive', ''),
(110, 'R274RDH', '2023-10-12', 'negative', 'Falsificazione o contraffazione di documenti'),
(111, 'J62V1WA', '2023-01-18', 'negative', 'Targa persa o rubata'),
(112, 'KH45CQJ', '2023-06-20', 'positive', ''),
(113, 'Q358QYL', '2023-05-03', 'negative', 'Documentazione errata presentata'),
(114, 'AH8MUTO', '2023-05-23', 'negative', 'Mancato pagamento di imposte'),
(115, 'RS0KZJ1', '2023-11-03', 'positive', ''),
(116, '3C8E8IY', '2023-07-23', 'negative', 'Veicolo considerato non sicuro per l\'uso su strada'),
(117, 'IYKYZKR', '2023-04-10', 'positive', ''),
(118, '6BENCKG', '2023-07-14', 'negative', 'Targa associata ad attività criminali'),
(119, 'C9OJVMT', '2023-05-31', 'positive', ''),
(120, 'B6Y491B', '2022-10-25', 'positive', ''),
(121, 'B6Y491B', '2022-10-20', 'positive', ''),
(122, 'CZ2KRRL', '2024-04-07', 'negative', 'Veicolo coinvolto in incidente'),
(123, 'UMYWMD5', '2023-06-22', 'negative', 'Targa danneggiata o manomessa'),
(124, '3RCNUDL', '2023-04-02', 'positive', ''),
(125, 'MFRA8C1', '2023-04-17', 'positive', '');

-- --------------------------------------------------------

--
-- Table structure for table `Vehicle`
--

CREATE TABLE `Vehicle` (
  `number` int DEFAULT NULL,
  `model` varchar(9) DEFAULT NULL,
  `brand` varchar(9) DEFAULT NULL,
  `prodDate` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Vehicle`
--

INSERT INTO `Vehicle` (`number`, `model`, `brand`, `prodDate`) VALUES
(7497410, 'Hatchback', 'Honda', '2022-12-17'),
(1314411, 'Hatchback', 'Toyota', '2022-11-22'),
(3189096, 'Sedan', 'BMW', '2022-08-16'),
(4990155, 'Hatchback', 'BMW', '2022-05-31'),
(7938176, 'Truck', 'Ford', '2022-06-07'),
(5669853, 'Sedan', 'Ford', '2023-04-04'),
(4984469, 'Sedan', 'Toyota', '2023-03-06'),
(5424455, 'Hatchback', 'BMW', '2023-04-03'),
(8377870, 'SUV', 'BMW', '2022-12-18'),
(5576531, 'Hatchback', 'Chevrolet', '2023-01-19'),
(6242879, 'Truck', 'Ford', '2022-10-04'),
(7976007, 'Sedan', 'Toyota', '2022-09-15'),
(6197793, 'Truck', 'Ford', '2023-02-01'),
(2751226, 'SUV', 'Toyota', '2023-05-15'),
(4099776, 'Hatchback', 'Ford', '2022-10-12'),
(1344793, 'Hatchback', 'Chevrolet', '2023-01-08'),
(6605475, 'Hatchback', 'BMW', '2022-12-08'),
(1975743, 'SUV', 'Ford', '2022-10-12'),
(9609237, 'Truck', 'Toyota', '2022-09-11'),
(2428580, 'Truck', 'Honda', '2023-04-14'),
(7059997, 'Sedan', 'BMW', '2022-12-18'),
(2912699, 'Truck', 'Honda', '2023-01-21'),
(3032184, 'SUV', 'Chevrolet', '2022-08-15'),
(3380654, 'SUV', 'Toyota', '2023-02-06'),
(1151033, 'Hatchback', 'Ford', '2022-08-28'),
(4248727, 'SUV', 'Chevrolet', '2022-10-01'),
(4426007, 'Hatchback', 'Honda', '2022-12-06'),
(4027738, 'Sedan', 'BMW', '2022-10-14'),
(3911909, 'Hatchback', 'BMW', '2022-07-13'),
(7178047, 'SUV', 'Honda', '2023-04-17'),
(5459907, 'Truck', 'Honda', '2023-04-19'),
(7036840, 'SUV', 'Chevrolet', '2022-08-29'),
(3608090, 'Hatchback', 'Toyota', '2022-05-31'),
(3268785, 'Sedan', 'BMW', '2023-04-24'),
(1004521, 'Truck', 'Honda', '2022-11-22'),
(8874643, 'Hatchback', 'Toyota', '2022-10-15'),
(6440953, 'Truck', 'Toyota', '2022-10-30'),
(8450408, 'Hatchback', 'BMW', '2022-09-20'),
(2891861, 'Truck', 'Ford', '2022-11-01'),
(9830640, 'SUV', 'Toyota', '2022-11-21'),
(5945497, 'Hatchback', 'Honda', '2023-02-03'),
(8125073, 'SUV', 'BMW', '2023-03-06'),
(1163929, 'SUV', 'BMW', '2022-07-09'),
(7230533, 'Truck', 'Honda', '2022-07-24'),
(6059240, 'Truck', 'Ford', '2023-02-09'),
(2736778, 'Sedan', 'BMW', '2022-09-20'),
(1777743, 'Truck', 'Chevrolet', '2022-09-21'),
(7747731, 'Truck', 'Ford', '2022-10-18'),
(6313226, 'SUV', 'Toyota', '2022-06-10'),
(1086479, 'Hatchback', 'BMW', '2023-03-10'),
(3269220, 'Sedan', 'BMW', '2022-09-12'),
(6727881, 'Hatchback', 'Honda', '2022-10-12'),
(9012280, 'Hatchback', 'BMW', '2022-10-10'),
(4214405, 'SUV', 'BMW', '2022-11-16'),
(201449, 'Truck', 'BMW', '2022-11-23'),
(3726894, 'SUV', 'Chevrolet', '2022-11-02'),
(1918997, 'Truck', 'Ford', '2023-02-11'),
(638603, 'Truck', 'Ford', '2023-03-20'),
(2383813, 'Hatchback', 'Honda', '2023-02-28'),
(6512281, 'Sedan', 'BMW', '2023-02-17'),
(1947421, 'Truck', 'Honda', '2023-04-23'),
(6544561, 'SUV', 'Honda', '2022-10-12'),
(1632374, 'Truck', 'Ford', '2023-02-01'),
(4201269, 'Sedan', 'BMW', '2022-06-23'),
(9386363, 'Sedan', 'Chevrolet', '2023-05-15'),
(8320816, 'Sedan', 'Ford', '2023-04-25'),
(6758038, 'Truck', 'BMW', '2022-11-24'),
(9500222, 'Truck', 'BMW', '2022-09-15'),
(3215533, 'Truck', 'Toyota', '2022-09-22'),
(4281302, 'SUV', 'Ford', '2023-04-26'),
(7446075, 'Sedan', 'Ford', '2023-02-26'),
(8810966, 'Hatchback', 'Chevrolet', '2022-10-21'),
(2525354, 'SUV', 'Chevrolet', '2022-12-15'),
(6170938, 'Truck', 'BMW', '2022-07-10'),
(4712582, 'Sedan', 'BMW', '2023-04-29'),
(3344501, 'Hatchback', 'Toyota', '2023-02-18'),
(9398782, 'Sedan', 'BMW', '2023-01-09'),
(2577777, 'SUV', 'Ford', '2023-01-20'),
(2169962, 'Hatchback', 'Toyota', '2022-07-10'),
(1896959, 'Sedan', 'Toyota', '2022-08-29'),
(4601136, 'Sedan', 'Chevrolet', '2023-02-16'),
(8115007, 'SUV', 'Chevrolet', '2022-08-25'),
(3028160, 'Truck', 'Chevrolet', '2023-01-09'),
(5104021, 'Truck', 'Chevrolet', '2023-04-12'),
(2682643, 'Truck', 'BMW', '2022-11-17'),
(2290163, 'Hatchback', 'Ford', '2022-06-13'),
(1779464, 'Sedan', 'Honda', '2022-07-11'),
(1820462, 'Hatchback', 'BMW', '2022-11-01'),
(2237906, 'Hatchback', 'Toyota', '2022-12-01'),
(5828543, 'Hatchback', 'Toyota', '2023-01-25'),
(6123564, 'Truck', 'Honda', '2023-02-16'),
(6101097, 'SUV', 'Honda', '2022-06-16'),
(1763462, 'Hatchback', 'Honda', '2023-04-26'),
(3477763, 'Sedan', 'Chevrolet', '2023-03-15'),
(4334132, 'Sedan', 'Chevrolet', '2022-10-05'),
(6765212, 'Sedan', 'Chevrolet', '2023-03-24'),
(8059565, 'Hatchback', 'Chevrolet', '2022-08-20'),
(2085224, 'Sedan', 'Toyota', '2023-02-27'),
(1376692, 'Sedan', 'Ford', '2023-02-26'),
(248150, 'Hatchback', 'Honda', '2022-12-24');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;