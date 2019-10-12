-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 12, 2019 at 01:28 PM
-- Server version: 10.3.17-MariaDB-0+deb10u1
-- PHP Version: 7.3.9-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tradeGame`
--

-- --------------------------------------------------------

--
-- Table structure for table `attacklog`
--

CREATE TABLE `attacklog` (
  `id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `attacker` int(11) NOT NULL,
  `defender` int(11) NOT NULL,
  `winner` int(11) NOT NULL,
  `damagetaken` int(11) NOT NULL,
  `damagedone` int(11) NOT NULL,
  `silver` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auctions`
--

CREATE TABLE `auctions` (
  `aid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `iid` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `dur` int(11) NOT NULL,
  `highbidder` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `buyout` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `enemies`
--

CREATE TABLE `enemies` (
  `eid` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `level` int(11) NOT NULL,
  `hp` int(11) NOT NULL,
  `atk` int(11) NOT NULL,
  `def` int(11) NOT NULL,
  `expdrop` int(11) NOT NULL,
  `rarity` int(1) NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enemies`
--

INSERT INTO `enemies` (`eid`, `name`, `level`, `hp`, `atk`, `def`, `expdrop`, `rarity`, `image`) VALUES
(1, 'Rat', 1, 10, 1, 1, 0, 1, NULL),
(2, 'Slime', 2, 15, 1, 2, 0, 1, NULL),
(3, 'King Slime', 3, 20, 2, 2, 0, 5, NULL),
(4, 'Goblin', 4, 30, 3, 2, 0, 2, NULL),
(5, 'Skeleton', 11, 65, 5, 2, 0, 2, NULL),
(8, 'Bear', 6, 30, 3, 3, 0, 2, NULL),
(9, 'Unicorn ', 9, 40, 4, 5, 0, 3, NULL),
(10, 'Peasant', 5, 17, 2, 3, 0, 1, NULL),
(11, 'Giant Frog', 10, 24, 4, 3, 0, 2, NULL),
(12, 'Imp', 4, 25, 1, 4, 0, 3, NULL),
(13, 'Wildcat', 7, 30, 6, 5, 0, 2, NULL),
(14, 'Highwayman', 8, 35, 8, 5, 0, 2, NULL),
(17, 'Barbarian', 7, 40, 10, 6, 0, 1, NULL),
(18, 'Gnome Warlock', 10, 60, 10, 8, 0, 1, NULL),
(19, 'Frog Wizard', 12, 70, 15, 2, 0, 2, NULL),
(20, 'Kobold', 13, 90, 6, 9, 0, 1, NULL),
(21, 'King\'s Regant', 10, 100, 12, 20, 100, 5, NULL),
(22, 'Heratic', 10, 100, 30, 15, 100, 5, NULL),
(23, 'Thug', 9, 40, 10, 9, 0, 1, NULL),
(24, 'Elf Warrior', 12, 130, 17, 14, 20, 2, NULL),
(25, 'Ogre peon', 15, 100, 20, 20, 0, 1, NULL),
(26, 'Ogre Summoner', 16, 150, 30, 10, 0, 2, NULL),
(27, 'Ogre Warlord', 17, 200, 35, 30, 20, 4, NULL),
(28, 'Malevolant Spirit', 20, 10000, 20, 30, 5000, 6, 'includes/imgs/mspirit.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `event` int(11) NOT NULL,
  `logfile` int(11) NOT NULL,
  `starttime` timestamp NOT NULL DEFAULT current_timestamp(),
  `bossid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `rarity` int(11) NOT NULL COMMENT '0 = consumable, 1 = common, 2 = uncommon, 3 = rare, 4 = epic, 5 = legendary, 6 = otherworldly',
  `slot` int(11) NOT NULL COMMENT '1 = weapon, 2 = shield, 3 = armor, 4 = pet, 5 = use',
  `levelreq` int(11) NOT NULL,
  `atkup` int(11) NOT NULL,
  `defup` int(11) NOT NULL,
  `hpup` int(11) NOT NULL,
  `useaction` int(11) NOT NULL COMMENT '1 - wear, 2 - consume',
  `img` varchar(100) DEFAULT NULL COMMENT 'path'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `rarity`, `slot`, `levelreq`, `atkup`, `defup`, `hpup`, `useaction`, `img`) VALUES
(1, 'Bronze Sword', 1, 1, 1, 1, 0, 0, 1, NULL),
(2, 'Bronze Shield', 1, 2, 1, 0, 1, 1, 1, NULL),
(3, 'Bronze Armour', 1, 3, 1, 0, 2, 2, 1, NULL),
(6, 'Blade of Malice', 4, 1, 10, 15, 3, 7, 1, NULL),
(7, 'Pet Rat', 3, 4, 1, 0, 0, 5, 1, NULL),
(8, 'Health Potion', 0, 5, 1, 0, 0, 0, 2, NULL),
(9, 'Steel Sword', 2, 1, 7, 5, 1, 2, 1, NULL),
(10, 'Steel Shield', 2, 2, 7, 1, 5, 2, 1, NULL),
(11, 'Steel Armour', 2, 3, 7, 1, 5, 5, 1, NULL),
(12, 'Energy Restore ', 3, 5, 10, 0, 0, 0, 2, NULL),
(13, 'Excelsior\'s Shield', 5, 2, 30, 30, 100, 50, 1, NULL),
(14, 'Mithril Sword', 3, 1, 12, 10, 2, 5, 1, NULL),
(15, 'Mithril Shield', 3, 2, 12, 1, 7, 5, 1, NULL),
(16, 'Mithril Armor', 3, 3, 12, 5, 11, 8, 1, NULL),
(17, 'Whelpling', 4, 4, 5, 5, 1, 2, 1, NULL),
(18, 'Dirk', 3, 1, 2, 7, 0, 0, 1, NULL),
(19, 'Azloth\'s Staff', 5, 1, 30, 100, 20, 70, 1, NULL),
(20, 'Heavenly King\'s Armour', 5, 3, 30, 20, 250, 100, 1, NULL),
(21, 'Iron Sword', 1, 1, 5, 3, 1, 2, 1, NULL),
(22, 'Iron Shield', 1, 2, 5, 1, 3, 2, 1, NULL),
(23, 'Iron Armor', 1, 3, 5, 1, 3, 2, 1, NULL),
(24, 'Blunt Steel Sword', 1, 1, 7, 4, 0, 0, 1, NULL),
(25, 'Fine Steel Sword', 2, 1, 7, 7, 4, 4, 1, NULL),
(26, 'Leather Shield', 1, 2, 2, 0, 2, 1, 1, NULL),
(27, 'Mailbreaker', 3, 2, 5, 5, 1, 2, 1, NULL),
(28, 'Rusty Katana', 1, 1, 10, 8, 3, 2, 1, NULL),
(29, 'Toga', 1, 3, 4, 2, 1, 1, 1, NULL),
(30, 'Steel Axe', 3, 1, 7, 12, 3, 4, 1, NULL),
(31, 'Bonestorm', 5, 1, 10, 20, 10, 10, 1, NULL),
(32, 'Tower Shield', 4, 2, 5, 0, 8, 5, 1, NULL),
(33, 'Bullwhip', 2, 1, 5, 7, 2, 2, 1, NULL),
(34, 'Shadowbreaker', 6, 1, 15, 30, 30, 30, 1, NULL),
(35, 'Void Wall', 6, 2, 15, 30, 30, 30, 1, NULL),
(36, 'Abyssal Armor', 6, 3, 15, 30, 30, 30, 1, NULL),
(37, 'LaBellona\'s Flaming Sword', 6, 1, 15, 40, 20, 30, 1, NULL),
(38, 'Crown of the Queen', 6, 3, 20, 20, 100, 50, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `pid` int(11) NOT NULL,
  `joindate` varchar(15) NOT NULL,
  `email` varchar(22) NOT NULL,
  `name` varchar(10) NOT NULL,
  `pass` varchar(32) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `exp` int(11) NOT NULL DEFAULT 0,
  `reqxp` int(11) NOT NULL DEFAULT 11,
  `rating` int(11) NOT NULL DEFAULT 500,
  `maxhp` int(11) NOT NULL DEFAULT 100,
  `hp` int(11) NOT NULL DEFAULT 100,
  `maxenergy` int(11) NOT NULL DEFAULT 100,
  `energy` int(11) NOT NULL DEFAULT 100,
  `atk` int(11) NOT NULL DEFAULT 1,
  `def` int(11) NOT NULL DEFAULT 1,
  `silver` int(11) NOT NULL DEFAULT 0,
  `gold` int(11) NOT NULL DEFAULT 0,
  `shield_expires` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `players-equipped`
--

CREATE TABLE `players-equipped` (
  `id` int(11) NOT NULL COMMENT 'same as players(pid)',
  `weaponslot` int(11) DEFAULT NULL,
  `shieldslot` int(11) DEFAULT NULL,
  `armorslot` int(11) DEFAULT NULL,
  `petslot` int(11) DEFAULT NULL,
  `effectslot` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `players-inventory`
--

CREATE TABLE `players-inventory` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attacklog`
--
ALTER TABLE `attacklog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auctions`
--
ALTER TABLE `auctions`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `enemies`
--
ALTER TABLE `enemies`
  ADD PRIMARY KEY (`eid`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `pid` (`pid`);

--
-- Indexes for table `players-equipped`
--
ALTER TABLE `players-equipped`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players-inventory`
--
ALTER TABLE `players-inventory`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attacklog`
--
ALTER TABLE `attacklog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16065;
--
-- AUTO_INCREMENT for table `auctions`
--
ALTER TABLE `auctions`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT for table `enemies`
--
ALTER TABLE `enemies`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=308;
--
-- AUTO_INCREMENT for table `players-equipped`
--
ALTER TABLE `players-equipped`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'same as players(pid)', AUTO_INCREMENT=308;
--
-- AUTO_INCREMENT for table `players-inventory`
--
ALTER TABLE `players-inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=555;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
