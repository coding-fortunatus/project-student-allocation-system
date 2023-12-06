-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 31, 2023 at 09:18 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_allocation`
--

-- --------------------------------------------------------

--
-- Table structure for table `hnd_supervisor_allocations`
--

CREATE TABLE `hnd_supervisor_allocations` (
  `id` int(11) NOT NULL,
  `supervisor_id` int(11) NOT NULL,
  `students` varchar(3000) NOT NULL,
  `programme` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hnd_supervisor_allocations`
--

INSERT INTO `hnd_supervisor_allocations` (`id`, `supervisor_id`, `students`, `programme`) VALUES
(19, 1, 'H/CS/21/0933 H/CS/21/0927 H/CS/21/0917 H/CS/21/0892 H/CS/21/0915 H/CS/21/0888 H/CS/21/0893 H/CS/21/0880 H/CS/21/0932 H/CS/21/0898 H/CS/21/0866', 'HND'),
(20, 2, 'H/CS/21/0874 H/CS/21/0869 H/CS/21/0881 H/CS/21/0864 H/CS/21/0904 H/CS/21/0928 H/CS/21/0920 H/CS/21/0899 H/CS/21/0909 H/CS/20/0809 H/CS/21/0862', 'HND'),
(21, 3, 'H/CS/21/0948 H/CS/21/0863 H/CS/21/0884 H/CS/21/0896 H/CS/21/0861 H/CS/21/0877 H/CS/21/0913 H/CS/21/0943 H/CS/21/0875 H/CS/21/0930', 'HND'),
(22, 4, 'H/CS/21/0940 H/CS/21/0905 H/CS/21/0911 H/CS/21/0890 H/CS/21/0929 H/CS/21/0910 H/CS/21/0939 H/CS/21/0934 H/CS/21/0870 H/CS/21/0914', 'HND'),
(23, 5, 'H/CS/21/0895 H/CS/21/0907 H/CS/21/0950 H/CS/21/0923 H/CS/21/0887 H/CS/21/0891 H/CS/21/0879 H/CS/21/0916 H/CS/21/0902 H/CS/21/0886', 'HND'),
(24, 6, 'H/CS/21/0941 H/CS/21/0865 H/CS/21/0925 H/CS/21/0883 H/CS/21/0894 H/CS/21/0872 H/CS/21/0912 H/CS/21/0900 H/CS/21/0921 H/CS/21/0878', 'HND'),
(25, 7, 'H/CS/21/0918 H/CS/21/0922 H/CS/21/0901 H/CS/21/0942 H/CS/21/0871 H/CS/21/0949 H/CS/21/0924 H/CS/21/0945 H/CS/21/0947 H/CS/21/0903', 'HND'),
(26, 8, 'H/CS/21/0935 H/CS/21/0944 H/CS/21/0908 H/CS/21/0876 H/CS/21/0867 H/CS/21/0931 H/CS/21/0936 H/CS/21/0868 H/CS/21/0889 H/CS/21/0926', 'HND'),
(27, 9, 'H/CS/21/0873 H/CS/21/0946 H/CS/21/0919 H/CS/21/0937 H/CS/21/0860 H/CS/21/0938 H/CS/21/0897 H/CS/21/0882 H/CS/21/0906 H/CS/21/0885', 'HND');

-- --------------------------------------------------------

--
-- Table structure for table `lecturers`
--

CREATE TABLE `lecturers` (
  `id` int(11) NOT NULL,
  `lecturer_name` varchar(200) NOT NULL,
  `lecturer_code` varchar(10) NOT NULL,
  `lec_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lecturers`
--

INSERT INTO `lecturers` (`id`, `lecturer_name`, `lecturer_code`, `lec_status`) VALUES
(1, 'MR OLORUNTOBA S.A', 'CS001', 'Chief Lecturer'),
(2, 'DR.(MRS) SOYEMI, J.', 'CS002', 'Chief Lecturer'),
(3, 'DR. (MRS) ODUNTAN, O.E', 'CS003', 'Chief Lecturer'),
(4, 'MR ALAWODE, A.J.', 'CS004', 'Senior Lecturer'),
(5, 'MR. OJUAWO, O.O.', 'CS005', 'Lecturer 1'),
(6, 'MR AKINODE, J.L.', 'CS006', 'Lecturer 1'),
(7, 'MR HAMMED, M.', 'CS007', 'Lecturer 2'),
(8, 'MR. BUOYE, P.A.', 'CS008', 'Lecturer 2'),
(9, 'MR. ADEGBOYE, O.J.', 'CS009', 'Lecturer 2'),
(10, 'MR. OGUNSEYE, J.O.', 'CS010', 'Lecturer 3'),
(11, 'MISS ADEBOWALE, O.A.', 'CS011', 'lecturer 3'),
(12, 'MR. AYODELE, EMMANUEL', 'CS012', 'Assistant Lecturer'),
(13, 'MR. JIBOKU, FOLAHAN J.', 'CS013', 'Assistant Lecturer'),
(14, 'MR. SODEINDE, VICTOR O.', 'CS014', 'Assistant Lecturer'),
(15, 'MR. AROWOLO, P.', 'CS015', 'Senior Instructor'),
(16, 'MRS BELLO, Z.O', 'CS016', 'Technologist 2'),
(17, 'MR. ADIO ABIODUN', 'CS017', ''),
(18, 'MRS AKINBOLA', 'CS018', ''),
(19, 'MR AWOSANYA', 'CS019', ''),
(20, 'MRS GANIYU SUKURAT', 'CS020', ''),
(21, 'MRS ADEYEMI A.B', 'CS021', ''),
(22, 'MISS ADEBOWALE O.A', 'CS022', ''),
(23, 'AROWOLO AHMED', 'CS023', '');

-- --------------------------------------------------------

--
-- Table structure for table `nd_supervisor_allocations`
--

CREATE TABLE `nd_supervisor_allocations` (
  `id` int(11) NOT NULL,
  `supervisor_id` int(11) NOT NULL,
  `students` varchar(3000) NOT NULL,
  `programme` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nd_supervisor_allocations`
--

INSERT INTO `nd_supervisor_allocations` (`id`, `supervisor_id`, `students`, `programme`) VALUES
(70, 1, 'N/CS/21/2976 N/CS/21/3037 N/CS/21/3017 N/CS/21/3047', 'ND'),
(71, 2, 'N/CS/21/3045 N/CS/21/3024 N/CS/21/3018 N/CS/21/3025', 'ND'),
(72, 3, 'N/CS/21/2970 N/CS/21/3033 N/CS/21/2986 N/CS/21/3014', 'ND'),
(73, 4, 'N/CS/21/2969 N/CS/21/3020 N/CS/21/3021 N/CS/21/3029', 'ND'),
(74, 5, 'N/CS/21/2991 N/CS/21/3031 N/CS/21/2992 N/CS/21/3030', 'ND'),
(75, 6, 'N/CS/21/3032 N/CS/21/3011 N/CS/21/2971 N/CS/21/2993', 'ND'),
(76, 7, 'N/CS/21/3043 N/CS/21/3041 N/CS/21/2994 N/CS/21/3009', 'ND'),
(77, 8, 'N/CS/21/2973 N/CS/21/3001 N/CS/21/2975 N/CS/21/3008', 'ND'),
(78, 9, 'N/CS/21/2987 N/CS/21/2984 N/CS/21/3046 N/CS/21/3002', 'ND'),
(79, 10, 'N/CS/21/2985 N/CS/21/3015 N/CS/21/3012 N/CS/21/2974', 'ND'),
(80, 11, 'N/CS/21/3026 N/CS/21/3013 N/CS/21/2983 N/CS/21/2996', 'ND'),
(81, 12, 'N/CS/21/2982 N/CS/21/3007 N/CS/21/3042 N/CS/21/2997', 'ND'),
(82, 13, 'N/CS/21/2980 N/CS/21/2990 N/CS/21/3016 N/CS/21/2999', 'ND'),
(83, 14, 'N/CS/21/3019 N/CS/21/3028 N/CS/21/3023', 'ND'),
(84, 15, 'N/CS/21/3048 N/CS/21/3039 N/CS/21/2981', 'ND'),
(85, 16, 'N/CS/21/2998 N/CS/21/3027 N/CS/21/3036', 'ND'),
(86, 17, 'N/CS/21/3034 N/CS/21/3010 N/CS/21/2978', 'ND'),
(87, 18, 'N/CS/21/3006 N/CS/21/2988 N/CS/21/3050', 'ND'),
(88, 19, 'N/CS/21/3004 N/CS/21/3044 N/CS/21/3003', 'ND'),
(89, 20, 'N/CS/21/3000 N/CS/21/3040 N/CS/21/3005', 'ND'),
(90, 21, 'N/CS/21/2989 N/CS/21/3022 N/CS/21/3049', 'ND'),
(91, 22, 'N/CS/21/3038 N/CS/21/2972 N/CS/21/2977', 'ND'),
(92, 23, 'N/CS/21/2995 N/CS/21/3035 N/CS/21/2979', 'ND');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `matric_number` varchar(100) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `email` varchar(256) NOT NULL,
  `programme` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `matric_number`, `fullname`, `email`, `programme`) VALUES
(1, 'N/CS/21/2969', 'IJACHI EMMANUEL', 'tobiijachi@gmail.com', 'ND'),
(2, 'N/CS/21/2970', 'AKINDE SAMUEL', '123samuelakinde@gmail.com', 'ND'),
(3, 'N/CS/21/2971', 'ALUKU FAVOUR', 'alukufavouraniel@gmail.com', 'ND'),
(4, 'N/CS/21/2972', 'OPALEYE TEMINIOLUWA', 'teminioluwaopaleye@gmail.com', 'ND'),
(5, 'N/CS/21/2973', 'ADEKOYA SARAH', 'sarahadekoya083@gmail.com', 'ND'),
(6, 'N/CS/21/2974', 'ABDULWAHAB MALIK', 'abdulwahabmalikfowu@gmail.com', 'ND'),
(7, 'N/CS/21/2975', 'BIOBAKU TESLIM', '', 'ND'),
(8, 'N/CS/21/2976', 'ADEJOBI TEMITOPE', 'adejobitemiboy@gmail.com', 'ND'),
(9, 'N/CS/21/2977', 'AKINDE IBRAHIM', 'akindeibrahim319@gmail.com', 'ND'),
(10, 'N/CS/21/2978', 'JIDONU BOLUWATIFE', 'jidosboluwatife2002@gmail.com', 'ND'),
(11, 'N/CS/21/2979', 'OLAGUNJU SAMUEL', 'olagunjusamuel47@gmail.com', 'ND'),
(12, 'N/CS/21/2980', 'ANIMASHAUN ABDULBAI', 'animashaunabdulba@gmail.com', 'ND'),
(13, 'N/CS/21/2981', 'ALAYANDE ABDULBASIT', 'alayandeabdulbasit@gmail.com', 'ND'),
(14, 'N/CS/21/2982', 'RICHARD BUSOLAMI', 'tofunmirichard@gmail.com', 'ND'),
(15, 'N/CS/21/2983', 'AKINLOYE AYOMIDE', 'clintonayomide838@gmail.com', 'ND'),
(16, 'N/CS/21/2984', 'LADEGA DANIEL', 'danielladega01@gmail.com', 'ND'),
(17, 'N/CS/21/2985', 'ABDULAZEEZ KHADIJAH', '', 'ND'),
(18, 'N/CS/21/2986', 'OHIREIMEN CONFIDENCE', 'confidenceohireimen75@gmail.com', 'ND'),
(19, 'N/CS/21/2987', 'OSOKO EXCEL', '', 'ND'),
(20, 'N/CS/21/2988', 'ADELEKE AYOMIDE', 'ayomideadeleke989@gmail.com', 'ND'),
(21, 'N/CS/21/2989', 'BADEJO OYEBANJI', 'oyebanjir5@gmail.com', 'ND'),
(22, 'N/CS/21/2990', 'OYENEKAN ISRAEL', 'oyenekanisreal2021@gmail.com', 'ND'),
(23, 'N/CS/21/2991', 'AMAHALU UGOCHUKWU', 'ugochukwuamahalu@gmail.com', 'ND'),
(24, 'N/CS/21/2992', 'ADEYEMI EMMANUEL', 'adeyemie125@gmail.com', 'ND'),
(25, 'N/CS/21/2993', 'ISMAILA AZEEZ', 'azeezabiodun012@gmail.com', 'ND'),
(26, 'N/CS/21/2994', 'ONYEACHONAM MERVYN', 'adedayodesmomd@gmail.com', 'ND'),
(27, 'N/CS/21/2995', 'BAKARA MARYAM', 'bakaramaryam@gmail.com', 'ND'),
(28, 'N/CS/21/2996', 'OLALEYE VICTORIA', 'victoriaolaleye8@gmail.com', 'ND'),
(29, 'N/CS/21/2997', 'ADEBAYO MICHAEL', 'adebayomichael2203@gmail.com', 'ND'),
(30, 'N/CS/21/2998', 'ADERIBIGBE OLUWAPELUMI', 'Aderibigbefeyisetan2005@gmail.com', 'ND'),
(31, 'N/CS/21/2999', 'OLAWALE AYOMIDE', 'olawaleayomide970@gmail.com', 'ND'),
(32, 'N/CS/21/3000', 'ADELEKE MOHAMMED', 'adelekemohammed356@gmail.com', 'ND'),
(33, 'N/CS/21/3001', 'JEGEDE SIMEON', 'Adejuwonsimeon73@gmail.com', 'ND'),
(34, 'N/CS/21/3002', 'OLADEJO DOMINION', 'dominionoladejo1@gmail.com', 'ND'),
(35, 'N/CS/21/3003', 'OGUNBIYI RICHARD', '', 'ND'),
(36, 'N/CS/21/3004', 'OGUNDELE FAVOUR', '', 'ND'),
(37, 'N/CS/21/3005', 'OMOGOR EMMANUEL', 'omogoremmanuel24@gmail.com', 'ND'),
(38, 'N/CS/21/3006', 'DIBANI VICTORY', 'dibaniprince4@gmail.com', 'ND'),
(39, 'N/CS/21/3007', 'ADARAMOLA SAMUEL', 'samueladaramola31@gmail.com', 'ND'),
(40, 'N/CS/21/3008', 'RASHEED SAUDAH', 'saudahanuoluwapo@gmail.com', 'ND'),
(41, 'N/CS/21/3009', 'KUFORIJI SAMUEL', 'Kuforijisamuel1@gmail.com', 'ND'),
(42, 'N/CS/21/3010', 'FATOKI UDUS', 'olamilekan1811@gmail.com', 'ND'),
(43, 'N/CS/21/3011', 'OLAYINKA SAMUEL', '', 'ND'),
(44, 'N/CS/21/3012', 'AJALA ABDULBASIT', 'ajala.ba2014@gmail.com', 'ND'),
(45, 'N/CS/21/3013', 'OBAYEJU OMOLOLA', 'lhorlarwhaysapphire@gmail.com', 'ND'),
(46, 'N/CS/21/3014', 'ADEYEMI MUBARAK', 'adeyemiadigun12@gmail.com', 'ND'),
(47, 'N/CS/21/3015', 'OGUNTOLA OLUWADAMILOLA', 'damisco005@gmail.com', 'ND'),
(48, 'N/CS/21/3016', 'ADEDAYO EMMANUEL', 'adedayoemmy2004@gmail.com', 'ND'),
(49, 'N/CS/21/3017', 'ABDULAREEM ABIMBOLA', '', 'ND'),
(50, 'N/CS/21/3018', 'ISHOLA OLUWATOFUNMI', 'isholaoluwatofunmi97@gmail.com', 'ND'),
(51, 'N/CS/21/3019', 'OLUMIDE PAUL', 'olumidepaul864@gmail.com', 'ND'),
(52, 'N/CS/21/3020', 'AYENI MOYINOLUWA', 'ayenimoyinoluwa2005@gmail.com', 'ND'),
(53, 'N/CS/21/3021', 'KINGSTON ANWARSADAT', '', 'ND'),
(54, 'N/CS/21/3022', 'SOGUNLE BANJI', '', 'ND'),
(55, 'N/CS/21/3023', 'OLAYINKA OLATOYE', 'olayinkaq2@gmail.com', 'ND'),
(56, 'N/CS/21/3024', 'ADENLE OLUWATOSIN', '', 'ND'),
(57, 'N/CS/21/3025', 'OGUNMILUYI BOLUWATIFE', 'ogunmiluyiboluwatife@gmail.com', 'ND'),
(58, 'N/CS/21/3026', 'SAMUEL CALEB', '', 'ND'),
(59, 'N/CS/21/3027', 'AKANDE BOLUWATIFE', '', 'ND'),
(60, 'N/CS/21/3028', 'SALAUDEEN RIDWAN', 'horlahmii4250@gmail.com', 'ND'),
(61, 'N/CS/21/3029', 'FOLASHELE OLANREWAJU', 'larryfola@gmail.com', 'ND'),
(62, 'N/CS/21/3030', 'ALATISE RACHAEL', 'rachaeltemitopealatise@gmail.com', 'ND'),
(63, 'N/CS/21/3031', 'ADEBOWALE SAMUEL', '', 'ND'),
(64, 'N/CS/21/3032', 'OSANYIBI TAOFEE', '', 'ND'),
(65, 'N/CS/21/3033', 'LAMEED AZEEZAT', 'Lameedazeezat01@gmail.com', 'ND'),
(66, 'N/CS/21/3034', 'POPOOLA EMMANUEL', 'Popoolae90@gmail.com', 'ND'),
(67, 'N/CS/21/3035', 'KUDORO TITILAYO', '', 'ND'),
(68, 'N/CS/21/3036', 'AYANDELE AYOMIDE', 'ayandeleayomide1@gmail.com', 'ND'),
(69, 'N/CS/21/3037', 'ADEKOYA DAVID', 'adekoyadavidadeboye@gmail.com', 'ND'),
(70, 'N/CS/21/3038', 'KUKOYI ANTHONY', 'anthonydamilola24@gmail.com', 'ND'),
(71, 'N/CS/21/3039', 'AKINOLA SAMUEL', 'akinolasam904@gmail.com', 'ND'),
(72, 'N/CS/21/3040', 'ADESHINA JOHN', 'tblizz2004@gmail.com', 'ND'),
(73, 'N/CS/21/3041', 'ALIU MARY', 'aliumary49@gmail.com', 'ND'),
(74, 'N/CS/21/3042', 'EGBETOKUN', '', 'ND'),
(75, 'N/CS/21/3043', 'KIMEKU DAVID', 'Isiomadavid239@gmail.com', 'ND'),
(76, 'N/CS/21/3044', 'BAMIDELE OPEYEMI', 'bamideleopeyemi2003@gmailcom', 'ND'),
(77, 'N/CS/21/3045', 'AGBOOLA IBRAHIM', '', 'ND'),
(78, 'N/CS/21/3046', 'OGNDARE JAMIU', 'ogundaredamilare52@gmail.com', 'ND'),
(79, 'N/CS/21/3047', 'OFINNI JOSHUA', 'ofinnijoshua2021@gmail.com', 'ND'),
(80, 'N/CS/21/3048', '', '', 'ND'),
(81, 'N/CS/21/3049', 'JIMOR UMAR', 'jimohumar283@gmail.com', 'ND'),
(82, 'N/CS/21/3050', 'OLASUNKANMI AYOBAMI', '', 'ND'),
(83, 'H/CS/21/0860', 'RIDWAN ADEMOLA', 'Nil', 'HND'),
(84, 'H/CS/21/0861', 'MUSTAPHA Aisha Abisola', 'Nil', 'HND'),
(85, 'H/CS/21/0862', 'ADEBISI EMMANUEL OLUWASEUN', 'Nil', 'HND'),
(86, 'H/CS/21/0863', 'Oladipo Temitope Goodness', 'Nil', 'HND'),
(87, 'H/CS/21/0864', 'HASSAN ABDUL-AZEEZ', 'Nil', 'HND'),
(88, 'H/CS/21/0865', 'MACLEAN MAYOWA OLUWATIMILEYIN', 'Nil', 'HND'),
(89, 'H/CS/21/0866', 'HAMZAT MUDASIR ', 'Nil', 'HND'),
(90, 'H/CS/21/0867', 'Marvellous Oguntola', 'Nil', 'HND'),
(91, 'H/CS/21/0868', 'MAKINDE OPEYEMI DAVID', 'Nil', 'HND'),
(92, 'H/CS/21/0869', 'OPARINDE JULIANAH OLUWASEYI ', 'Nil', 'HND'),
(93, 'H/CS/21/0870', 'Olusegun Oluwatomiwa Blessing', 'Nil', 'HND'),
(94, 'H/CS/21/0871', '', 'Nil', 'HND'),
(95, 'H/CS/21/0872', 'ADEDEJI SAMUEL ', 'Nil', 'HND'),
(96, 'H/CS/21/0873', 'ADENIYI EUNICE DEMILADE', 'Nil', 'HND'),
(97, 'H/CS/21/0874', 'OLUWATOBI ODEDE', 'Nil', 'HND'),
(98, 'H/CS/21/0875', 'FORTUNATUS ADEGOKE', 'Nil', 'HND'),
(99, 'H/CS/21/0876', 'Oluwagbohunmi Orekoya', 'Nil', 'HND'),
(100, 'H/CS/21/0877', 'IJEOMA EMMANUEL CHUKUNOSO ', 'Nil', 'HND'),
(101, 'H/CS/21/0878', 'ASABA SAMUEL', 'Nil', 'HND'),
(102, 'H/CS/21/0879', 'AZEEZAT BADMUS', 'Nil', 'HND'),
(103, 'H/CS/21/0880', 'ABEJIDE PLEASANT', 'Nil', 'HND'),
(104, 'H/CS/21/0881', 'OLOYEDE IDRIS KOLAWOLE ', 'Nil', 'HND'),
(105, 'H/CS/21/0882', 'ISA OLAMILEKAN ', 'Nil', 'HND'),
(106, 'H/CS/21/0883', 'OPEYEMI ARETOLA', 'Nil', 'HND'),
(107, 'H/CS/21/0884', 'ABDULMUJEEB OSENI', 'Nil', 'HND'),
(108, 'H/CS/21/0885', 'UWEH ABUH', 'Nil', 'HND'),
(109, 'H/CS/21/0886', 'OGUNBAYO KEHINDE ORIYOMI', 'Nil', 'HND'),
(110, 'H/CS/21/0887', 'ADEMOLA AYENI', 'Nil', 'HND'),
(111, 'H/CS/21/0888', 'IFEANYI EZENWANI ', 'Nil', 'HND'),
(112, 'H/CS/21/0889', 'AKINYEMI Olamilekan Ayodele', 'Nil', 'HND'),
(113, 'H/CS/21/0890', 'AKINWOLE TOLULOPE ', 'Nil', 'HND'),
(114, 'H/CS/21/0891', 'SODIYA OLUWATOYIN ', 'Nil', 'HND'),
(115, 'H/CS/21/0892', 'ADEBANJO ESTHER ', 'Nil', 'HND'),
(116, 'H/CS/21/0893', 'SALAMI MUTIU', 'Nil', 'HND'),
(117, 'H/CS/21/0894', 'RAIMOT  ABIDEMI ADEBOWALE', 'Nil', 'HND'),
(118, 'H/CS/21/0895', 'OLAMILEKAN SOYELE', 'Nil', 'HND'),
(119, 'H/CS/21/0896', 'Omoshilade Oluwafemi ', 'Nil', 'HND'),
(120, 'H/CS/21/0897', 'SOKUNTADE OLUWATOBI MICHEAL', 'Nil', 'HND'),
(121, 'H/CS/21/0898', 'Bamigboye Adeolu Ademola ', 'Nil', 'HND'),
(122, 'H/CS/21/0899', 'ADEMOLA OKUNOLA', 'Nil', 'HND'),
(123, 'H/CS/21/0900', 'ODUROYE OLUWADAMILOLA ODUNAYO', 'Nil', 'HND'),
(124, 'H/CS/21/0901', 'AGUNBIADE TEMITOPE OLUWASEUN', 'Nil', 'HND'),
(125, 'H/CS/21/0902', 'ADESANYA ESTHER ITUNUOLUWA', 'Nil', 'HND'),
(126, 'H/CS/21/0903', 'AGBOOLA RUTH TEMITOPE', 'Nil', 'HND'),
(127, 'H/CS/21/0904', 'ADEYEMO SOFIAT DASOLA', 'Nil', 'HND'),
(128, 'H/CS/21/0905', 'OLAWOYIN ADEOLA', 'Nil', 'HND'),
(129, 'H/CS/21/0906', 'Salaudeen Fatai  olamilekan', 'Nil', 'HND'),
(130, 'H/CS/21/0907', 'SIYANBADE WALIU OLAWALE', 'Nil', 'HND'),
(131, 'H/CS/21/0908', 'OKPALA NKECHI JESSICA', 'Nil', 'HND'),
(132, 'H/CS/21/0909', 'ABIOLA OPEYEMI ', 'Nil', 'HND'),
(133, 'H/CS/21/0910', 'OLORUNSOLA YEMISI DORCAS ', 'Nil', 'HND'),
(134, 'H/CS/21/0911', 'STELLA BASSEY', 'Nil', 'HND'),
(135, 'H/CS/21/0912', 'ADELEKE SAMUEL OLUWAGBEMILEKE ', 'Nil', 'HND'),
(136, 'H/CS/21/0913', 'SULAIMAN MICHEAL OLOWOSALE', 'Nil', 'HND'),
(137, 'H/CS/21/0914', 'KOSOKO TOHEEB OLADIMEJI', 'Nil', 'HND'),
(138, 'H/CS/21/0915', 'ODEYEMI OLUWADAMILARE  BABATUNDE ', 'Nil', 'HND'),
(139, 'H/CS/21/0916', 'OGUNJIMI MARVELLOUS', 'Nil', 'HND'),
(140, 'H/CS/21/0917', 'RASHEED RAMON', 'Nil', 'HND'),
(141, 'H/CS/21/0918', 'SALAKO BABATUNDE BOLUWATIFE ', 'Nil', 'HND'),
(142, 'H/CS/21/0919', 'SAMUEL ODUWOLE', 'Nil', 'HND'),
(143, 'H/CS/21/0921', 'AFOLABI HABEEB. A', 'Nil', 'HND'),
(144, 'H/CS/21/0922', 'OYEWOLE ODUNAYO OYINDAMOLA ', 'Nil', 'HND'),
(145, 'H/CS/21/0923', 'ELIZABETH KUYEBI', 'Nil', 'HND'),
(146, 'H/CS/21/0924', 'SHUAIB SEKINAT OMEYIMI', 'Nil', 'HND'),
(147, 'H/CS/21/0925', 'OYEKOLA BUKOLA VICTORIA ', 'Nil', 'HND'),
(148, 'H/CS/21/0926', 'GEORGE ESTHER IYANUOLUWA ', 'Nil', 'HND'),
(149, 'H/CS/21/0927', 'ADESANYA OMOLARA NOIMOT', 'Nil', 'HND'),
(150, 'H/CS/21/0928', 'Bashiru Ganiyat  Abeke', 'Nil', 'HND'),
(151, 'H/CS/21/0929', 'FATUNBI LAWRENCE O.', 'Nil', 'HND'),
(152, 'H/CS/21/0930', 'ADENLE ANIYAT AYINKE', 'Nil', 'HND'),
(153, 'H/CS/21/0931', 'QUADRI OLAMILEKAN T.', 'Nil', 'HND'),
(154, 'H/CS/21/0932', 'AJILOGBA ANUOLUWAPO D.', 'Nil', 'HND'),
(155, 'H/CS/21/0933', 'CHIKA NNANNA', 'Nil', 'HND'),
(156, 'H/CS/21/0934', 'Mubaraq Ilesanmi ', 'Nil', 'HND'),
(157, 'H/CS/21/0935', 'OLADELE ITUNU ABIGAEL ', 'Nil', 'HND'),
(158, 'H/CS/21/0936', 'ISLAMIYAT MAYOWA ABDULRAHMAN', 'Nil', 'HND'),
(159, 'H/CS/21/0937', 'OGUNLESI CHRISTIANAH OMOLOLA', 'Nil', 'HND'),
(160, 'H/CS/21/0938', 'SAMUEL OLUWAFEMI', 'Nil', 'HND'),
(161, 'H/CS/21/0939', 'OLAJUWON OLAMILEKAN YUSHAU', 'Nil', 'HND'),
(162, 'H/CS/21/0940', 'Samuel Eriwayo', 'Nil', 'HND'),
(163, 'H/CS/21/0941', 'PELUMI ADEBIYI', 'Nil', 'HND'),
(164, 'H/CS/21/0942', 'MARY OLAWORE ', 'Nil', 'HND'),
(165, 'H/CS/21/0943', 'Sonola Oluwademilade ', 'Nil', 'HND'),
(166, 'H/CS/21/0944', 'Azeez Habeeb', 'Nil', 'HND'),
(167, 'H/CS/21/0945', 'MOSUNMOLA SOWUNMI ', 'Nil', 'HND'),
(168, 'H/CS/21/0946', 'IBUKUNOLUWA SMITH', 'Nil', 'HND'),
(169, 'H/CS/21/0947', 'Bello Muhammedulawwal Opeyemi', 'Nil', 'HND'),
(170, 'H/CS/21/0948', 'ESTHER HUNGE ', 'Nil', 'HND'),
(171, 'H/CS/21/0949', 'BALOGUN QASIM', 'Nil', 'HND'),
(172, 'H/CS/21/0950', 'ADENEKAN SEUN', 'Nil', 'HND'),
(173, 'H/CS/21/0920', 'OLUWATOSIN ADENIKE ADEGBOLA', 'Nil', 'HND'),
(174, 'H/CS/20/0809', 'Deborah Popoola', 'Nil', 'HND');

-- --------------------------------------------------------

--
-- Table structure for table `supervisor_allocation`
--

CREATE TABLE `supervisor_allocation` (
  `id` int(11) NOT NULL,
  `supervisor_id` int(11) NOT NULL,
  `students` varchar(3000) DEFAULT NULL,
  `programme` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supervisor_allocation`
--

INSERT INTO `supervisor_allocation` (`id`, `supervisor_id`, `students`, `programme`) VALUES
(1, 1, 'N/CS/21/3003 N/CS/21/3027 N/CS/21/2974 N/CS/21/2984', 'ND'),
(2, 2, 'N/CS/21/3029 N/CS/21/2990 N/CS/21/3006 N/CS/21/2975', 'ND'),
(3, 3, 'N/CS/21/3033 N/CS/21/3047 N/CS/21/3035 N/CS/21/3016', 'ND'),
(4, 4, 'N/CS/21/2991 N/CS/21/2970 N/CS/21/2972 N/CS/21/2997', 'ND'),
(5, 5, 'N/CS/21/3020 N/CS/21/3049 N/CS/21/3004 N/CS/21/2999', 'ND'),
(6, 6, 'N/CS/21/2989 N/CS/21/2992 N/CS/21/3026 N/CS/21/3032', 'ND'),
(7, 7, 'N/CS/21/3045 N/CS/21/3021 N/CS/21/3043 N/CS/21/3042', 'ND'),
(8, 8, 'N/CS/21/2995 N/CS/21/2983 N/CS/21/3002 N/CS/21/3028', 'ND'),
(9, 9, 'N/CS/21/2977 N/CS/21/3039 N/CS/21/3044 N/CS/21/3031', 'ND'),
(10, 10, 'N/CS/21/2994 N/CS/21/3007 N/CS/21/2973 N/CS/21/3005', 'ND'),
(11, 11, 'N/CS/21/3015 N/CS/21/2988 N/CS/21/3012 N/CS/21/3048', 'ND'),
(12, 12, 'N/CS/21/2969 N/CS/21/2978 N/CS/21/3009 N/CS/21/3036', 'ND'),
(13, 13, 'N/CS/21/2986 N/CS/21/3034 N/CS/21/3023 N/CS/21/3017', 'ND'),
(14, 14, 'N/CS/21/3041 N/CS/21/3013 N/CS/21/3022', 'ND'),
(15, 15, 'N/CS/21/3030 N/CS/21/2979 N/CS/21/2980', 'ND'),
(16, 16, 'N/CS/21/2987 N/CS/21/3040 N/CS/21/2996', 'ND'),
(17, 17, 'N/CS/21/3019 N/CS/21/3014 N/CS/21/3001', 'ND'),
(18, 18, 'N/CS/21/3008 N/CS/21/3010 N/CS/21/3038', 'ND'),
(19, 19, 'N/CS/21/2993 N/CS/21/2985 N/CS/21/3011', 'ND'),
(20, 20, 'N/CS/21/2971 N/CS/21/3025 N/CS/21/3046', 'ND'),
(21, 21, 'N/CS/21/2976 N/CS/21/3018 N/CS/21/3050', 'ND'),
(22, 22, 'N/CS/21/3024 N/CS/21/2981 N/CS/21/3000', 'ND'),
(23, 23, 'N/CS/21/2998 N/CS/21/2982 N/CS/21/3037', 'ND');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(3000) NOT NULL,
  `user_role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `user_role`) VALUES
(1, 'Admin', '$2y$10$sfELj.W.gSShnfOTtJZxge4g3rboyq9N.mOpOB/d1IA5Lv5cXblHC', NULL),
(2, 'Akinode', '$2y$10$sfELj.W.gSShnfOTtJZxge4g3rboyq9N.mOpOB/d1IA5Lv5cXblHC', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hnd_supervisor_allocations`
--
ALTER TABLE `hnd_supervisor_allocations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supervisor_id` (`supervisor_id`);

--
-- Indexes for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nd_supervisor_allocations`
--
ALTER TABLE `nd_supervisor_allocations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supervisor_id` (`supervisor_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matric_number` (`matric_number`);

--
-- Indexes for table `supervisor_allocation`
--
ALTER TABLE `supervisor_allocation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supervisor_id` (`supervisor_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hnd_supervisor_allocations`
--
ALTER TABLE `hnd_supervisor_allocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `nd_supervisor_allocations`
--
ALTER TABLE `nd_supervisor_allocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `supervisor_allocation`
--
ALTER TABLE `supervisor_allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hnd_supervisor_allocations`
--
ALTER TABLE `hnd_supervisor_allocations`
  ADD CONSTRAINT `hnd_supervisor_allocations_ibfk_1` FOREIGN KEY (`supervisor_id`) REFERENCES `lecturers` (`id`);

--
-- Constraints for table `nd_supervisor_allocations`
--
ALTER TABLE `nd_supervisor_allocations`
  ADD CONSTRAINT `nd_supervisor_allocations_ibfk_1` FOREIGN KEY (`supervisor_id`) REFERENCES `lecturers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `supervisor_allocation`
--
ALTER TABLE `supervisor_allocation`
  ADD CONSTRAINT `supervisor_allocation_ibfk_1` FOREIGN KEY (`supervisor_id`) REFERENCES `lecturers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
