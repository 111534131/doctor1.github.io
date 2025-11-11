-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2025-11-11 08:45:14
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `doctor_db_v2`
--

-- --------------------------------------------------------

--
-- 資料表結構 `acupuncturepoints`
--

CREATE TABLE `acupuncturepoints` (
  `Id` int(11) NOT NULL,
  `Name` longtext DEFAULT NULL,
  `BodyPart` longtext DEFAULT NULL,
  `Function` longtext DEFAULT NULL,
  `Harm` longtext DEFAULT NULL,
  `CoordX` float NOT NULL,
  `CoordY` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `appointments`
--

CREATE TABLE `appointments` (
  `Id` int(11) NOT NULL,
  `PatientId` int(11) NOT NULL,
  `DoctorId` int(11) NOT NULL,
  `AppointmentTime` datetime(6) NOT NULL,
  `Status` longtext DEFAULT NULL,
  `Notes` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `appointments`
--

INSERT INTO `appointments` (`Id`, `PatientId`, `DoctorId`, `AppointmentTime`, `Status`, `Notes`) VALUES
(1, 3, 4, '2025-11-12 05:00:00.000000', NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `doctoravailabilities`
--

CREATE TABLE `doctoravailabilities` (
  `Id` int(11) NOT NULL,
  `DoctorId` int(11) NOT NULL,
  `StartTime` datetime(6) NOT NULL,
  `EndTime` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `doctors`
--

CREATE TABLE `doctors` (
  `Id` int(11) NOT NULL,
  `Name` longtext DEFAULT NULL,
  `Specialty` longtext DEFAULT NULL,
  `ContactInfo` longtext DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `CancellationPolicyHours` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `doctors`
--

INSERT INTO `doctors` (`Id`, `Name`, `Specialty`, `ContactInfo`, `UserId`, `CancellationPolicyHours`) VALUES
(3, 'Doctor User', 'General Physiotherapy', 'doctor@example.com', 2, 0),
(4, '陳博源', '治療', NULL, 5, 48);

-- --------------------------------------------------------

--
-- 資料表結構 `medicalrecords`
--

CREATE TABLE `medicalrecords` (
  `Id` int(11) NOT NULL,
  `PatientId` int(11) NOT NULL,
  `DoctorId` int(11) NOT NULL,
  `RecordDate` datetime(6) NOT NULL,
  `Diagnosis` longtext DEFAULT NULL,
  `Treatment` longtext DEFAULT NULL,
  `Notes` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `patients`
--

CREATE TABLE `patients` (
  `Id` int(11) NOT NULL,
  `Name` longtext DEFAULT NULL,
  `ContactInfo` longtext DEFAULT NULL,
  `DateOfBirth` datetime(6) NOT NULL,
  `UserId` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `patients`
--

INSERT INTO `patients` (`Id`, `Name`, `ContactInfo`, `DateOfBirth`, `UserId`) VALUES
(1, 'Test User', 'user@example.com', '1995-11-11 05:43:35.741921', 3),
(2, 'Doctor User', 'doctor@example.com', '1995-11-11 05:44:09.673363', 2),
(3, '張益誠111534131', '111534131@stu.ukn.edu.tw', '1995-11-11 06:10:13.310790', 4),
(4, '陳博源111534106', '111534106@stu.ukn.edu.tw', '1995-11-11 06:11:45.612065', 5),
(5, 'Admin User', 'admin@example.com', '1995-11-11 06:21:24.981420', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `Username` longtext NOT NULL,
  `PasswordHash` longtext DEFAULT NULL,
  `Role` longtext NOT NULL,
  `Email` longtext DEFAULT NULL,
  `GoogleId` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`Id`, `Username`, `PasswordHash`, `Role`, `Email`, `GoogleId`) VALUES
(1, 'Admin User', '$2a$11$u2A8KptzlEbaTO/YYlEmLO9NVloTyi8pEsPDzDASoQk1hTDCCru4m', 'Admin', 'admin@example.com', NULL),
(2, 'Doctor User', '$2a$11$sefcCCwxDFJkhXdsdFTqUuzeFHQDdNeg9YXG2C8ctdqIbOiLR7.Qy', 'Doctor', 'doctor@example.com', NULL),
(3, 'Test User', '$2a$11$AOXCf./106bDAvh4N6T40.nRUkujIRm3/EzgGMORNj/OOyT34Fbki', 'User', 'user@example.com', NULL),
(4, '張益誠111534131', NULL, 'User', '111534131@stu.ukn.edu.tw', '105712737249491088866'),
(5, '陳博源111534106', NULL, 'Doctor', '111534106@stu.ukn.edu.tw', '100813922327970142971');

-- --------------------------------------------------------

--
-- 資料表結構 `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20251103041258_InitialCreate', '8.0.8'),
('20251103064314_AddAuthToUser', '8.0.8'),
('20251103113009_AddDoctorSchedule', '8.0.8'),
('20251103121316_AddDoctorAvailability', '8.0.8'),
('20251104162216_AddDoctorAvailabilityRelationshipFinal', '8.0.8'),
('20251111022444_AddUserToPatient', '8.0.8'),
('20251111063142_AddCancellationPolicyToDoctor', '8.0.8');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `acupuncturepoints`
--
ALTER TABLE `acupuncturepoints`
  ADD PRIMARY KEY (`Id`);

--
-- 資料表索引 `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Appointments_DoctorId` (`DoctorId`),
  ADD KEY `IX_Appointments_PatientId` (`PatientId`);

--
-- 資料表索引 `doctoravailabilities`
--
ALTER TABLE `doctoravailabilities`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_DoctorAvailabilities_DoctorId` (`DoctorId`);

--
-- 資料表索引 `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Doctors_UserId` (`UserId`);

--
-- 資料表索引 `medicalrecords`
--
ALTER TABLE `medicalrecords`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_MedicalRecords_DoctorId` (`DoctorId`),
  ADD KEY `IX_MedicalRecords_PatientId` (`PatientId`);

--
-- 資料表索引 `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Patients_UserId` (`UserId`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- 資料表索引 `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `acupuncturepoints`
--
ALTER TABLE `acupuncturepoints`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `appointments`
--
ALTER TABLE `appointments`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `doctoravailabilities`
--
ALTER TABLE `doctoravailabilities`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `doctors`
--
ALTER TABLE `doctors`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `medicalrecords`
--
ALTER TABLE `medicalrecords`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `patients`
--
ALTER TABLE `patients`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `FK_Appointments_Doctors_DoctorId` FOREIGN KEY (`DoctorId`) REFERENCES `doctors` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Appointments_Patients_PatientId` FOREIGN KEY (`PatientId`) REFERENCES `patients` (`Id`) ON DELETE CASCADE;

--
-- 資料表的限制式 `doctoravailabilities`
--
ALTER TABLE `doctoravailabilities`
  ADD CONSTRAINT `FK_DoctorAvailabilities_Doctors_DoctorId` FOREIGN KEY (`DoctorId`) REFERENCES `doctors` (`Id`) ON DELETE CASCADE;

--
-- 資料表的限制式 `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `FK_Doctors_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE;

--
-- 資料表的限制式 `medicalrecords`
--
ALTER TABLE `medicalrecords`
  ADD CONSTRAINT `FK_MedicalRecords_Doctors_DoctorId` FOREIGN KEY (`DoctorId`) REFERENCES `doctors` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_MedicalRecords_Patients_PatientId` FOREIGN KEY (`PatientId`) REFERENCES `patients` (`Id`) ON DELETE CASCADE;

--
-- 資料表的限制式 `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `FK_Patients_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
