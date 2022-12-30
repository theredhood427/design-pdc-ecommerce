-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2022 at 01:54 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `game_store_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(5, 'PS5', '&lt;p&gt;The PlayStation 5 (PS5) is the latest video game console developed and produced by Sony Interactive Entertainment. It was released in November 2020 and is the successor to the PlayStation 4. The PS5 is powered by a custom AMD Zen 2 processor and AMD Radeon RDNA 2 graphics card, which provide improved performance and graphics capabilities compared to the previous generation. It also features a solid-state drive (SSD) for faster loading times, 3D audio support, and backwards compatibility with a selection of PlayStation 4 games. The PS5 is available in two versions: a standard edition with a disc drive and a digital edition without a disc drive. It competes with the Xbox Series X/S and the Nintendo Switch in the eighth generation of video game consoles.&lt;/p&gt;', 1, '2022-12-30 03:05:05'),
(6, 'PS4', '&lt;p&gt;The PlayStation 4 (PS4) is a video game console developed by Sony Interactive Entertainment. It was released in November 2013 and is the successor to the PlayStation 3. The PS4 is powered by a custom AMD x86-64 processor and AMD Radeon graphics card, which provide improved performance and graphics capabilities compared to the previous generation. It also features a hard drive for storing games and other media, support for online multiplayer gaming, and the ability to stream video and music. The PS4 is available in two versions: a standard edition and a slim edition. It competes with the Xbox One and the Nintendo Switch in the seventh generation of video game consoles.&lt;/p&gt;', 1, '2022-12-30 03:06:35'),
(7, 'NSW', '&lt;p&gt;The Nintendo Switch is a video game console developed and produced by Nintendo. It was released in March 2017 and is a hybrid console that can be used as a home console connected to a television or as a portable console with its own built-in display. The Switch is powered by a custom Nvidia Tegra processor and has a 6.2-inch 720p capacitive touchscreen. It also features detachable controllers called Joy-Cons, which can be used separately or attached to the console for handheld play. The Switch has a wide variety of games available, including first-party titles developed by Nintendo and third-party titles from various other publishers. It competes with the PlayStation 4 and the Xbox One in the seventh and eighth generations of video game consoles.&lt;/p&gt;', 1, '2022-12-30 03:08:40'),
(8, 'XBOX', '&lt;p&gt;The Xbox is a video game console brand created and owned by Microsoft. There have been several versions of the Xbox console, including the original Xbox, the Xbox 360, the Xbox One, and the Xbox Series X/S. These consoles offer a wide variety of games, including first-party titles developed by Microsoft and third-party titles from various other publishers. The Xbox brand competes with the PlayStation and the Nintendo Switch in the video game console market.&lt;/p&gt;', 1, '2022-12-30 03:09:47');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
(1, 'Calvin Kent', 'Pamandanan', 'Male', '09982545122', 'pamandanan.calvinkent@auf.edu.ph', '68cff1f5dabbd64dbc523894541dbfdf', 'Mexico', '2021-07-16 10:34:48'),
(3, 'David Aaron', 'Echon', 'Male', '09982514523', 'echon.davidaaron@auf.edu.ph', 'c3f185515ab658614c4e26b7987ce159', 'Angeles City', '2022-12-30 20:50:07');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
(5, 5, 50, 3.51, '2022-12-30 03:40:53', '2022-12-30 16:59:51'),
(6, 6, 50, 663.48, '2022-12-30 17:03:35', NULL),
(7, 7, 50, 3.51, '2022-12-30 17:10:29', NULL),
(8, 8, 50, 53.79, '2022-12-30 17:12:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(6, 3, 'Angeles City', 'cod', 2, 3.51, 3, 1, '2022-12-30 20:50:33', '2022-12-30 20:52:18');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `quantity`, `price`, `total`) VALUES
(5, 6, 7, 1, 3.51, 3.51);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `company` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `product_name`, `company`, `description`, `status`, `date_created`) VALUES
(5, 6, 8, 'SKULL & CO. NSW THUMB GRIP FOR SWITCH PRO/PS4/PS5 CONTROLLER (BLACK) (SET OF 6)', 'SKULL & CO.', '&lt;p&gt;The Joystick Covers Improve Control&lt;/p&gt;&lt;p&gt;Specifically designed for Nintendo SWITCH Pro Controller (NOT FOR JOY-CONS).&lt;/p&gt;&lt;p&gt;3 pairs of thumb grips with completely different designs to meet gamers&rsquo; needs.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Protect the original joystick from wear and tear.&lt;/li&gt;&lt;li&gt;Increased accuracy through extra height and active radius.&lt;/li&gt;&lt;li&gt;Made from a special \\&quot;grippy\\&quot; material which increases friction and provides more sensitivity to enhance your gaming experience.&lt;/li&gt;&lt;li&gt;Compatible with PS4 DUALSHOCK CONTROLLER and 8BitDo SN30 PRO BLUETOOTH GAMEPAD.&lt;/li&gt;&lt;/ul&gt;', 1, '2022-12-30 03:38:43'),
(6, 5, 15, 'Sony PS5 Console God Of War Ragnarok Bundle + Choice of an Additional PS5 Dualsense Controller', 'PLAYSTATION', '&lt;p&gt;PlayStation&reg;5&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-size: 1rem;\\&quot;&gt;The PS5&trade; console unleashes new gaming possibilities that you never anticipated.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-size: 1rem;\\&quot;&gt;Experience lightning fast loading with an ultra-high speed SSD, deeper immersion with support for haptic feedback, adaptive triggers, and 3D Audio, and a all-new generation of incredible PlayStation&reg; games.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-size: 1rem;\\&quot;&gt;Lightning Speed&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Harness the power of a custom CPU, GPU, and SSD with Integrated I/O that rewrite the rules of what a PlayStation&reg; console can do.&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-size: 1rem;\\&quot;&gt;Stunning Games&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Marvel at incredible graphics and experience new PS5&trade; features.&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-size: 1rem;\\&quot;&gt;Breathtaking Immersion&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Discover a deeper gaming experience with support for haptic feedback, adaptive triggers, and 3D Audio technology.&lt;/p&gt;', 1, '2022-12-30 17:02:32'),
(7, 5, 14, 'DOBE PS5 SILICON CASE FOR PS5 CONTROLLER (BLACK) (TP5-0541)', 'DOBE', '&lt;ul&gt;&lt;li&gt;Silicone Case: Rocker Cap suitable for PS5 controller.&lt;/li&gt;&lt;li&gt;Precise Hole Position: This product fits the controller completely and does not affect the operation.&lt;/li&gt;&lt;li&gt;Silicone Material: Environmentally friendly and soft feel.&lt;/li&gt;&lt;/ul&gt;', 1, '2022-12-30 17:07:58'),
(8, 5, 16, 'PS5 ELDEN RING (ASIAN)', 'PLAYSTATION', '&lt;p&gt;The Golden Order has been broken.&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-size: 1rem;\\&quot;&gt;Rise, Tarnished, and be guided by grace to brandish the power of the Elden Ring and become an Elden Lord in the Lands Between.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-size: 1rem;\\&quot;&gt;In the Lands Between ruled by Queen Marika the Eternal, the Elden Ring, the source of the Erd tree, has been shattered.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-size: 1rem;\\&quot;&gt;Marika&rsquo;s offspring, demigods all, claimed the shards of the Elden Ring known as the Great Runes, and the mad taint of their newfound strength triggered a war: The Shattering. A war that meant abandonment by the Greater Will.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-size: 1rem;\\&quot;&gt;And now the guidance of grace will be brought to the Tarnished who were spurned by the grace of gold and exiled from the Lands Between. Ye dead who yet live, your grace long lost, follow the path to the Lands Between beyond the foggy sea to stand before the Elden Ring.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-size: 1rem;\\&quot;&gt;And become the Elden Lord.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-size: 1rem;\\&quot;&gt;A New Fantasy World &ndash; Journey through the Lands Between, a new fantasy world created by Hidetaka Miyazaki, creator of the influential Dark Souls video game series, and George R. R. Martin, author of The New York Times best-selling fantasy series, A Song of Ice and Fire. Unravel the mysteries of the Elden Ring&rsquo;s power. Encounter adversaries with profound backgrounds, characters with their own unique motivations for helping or hindering your progress, and fearsome creatures&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;World Exploration in the Lands Between &ndash; Elden Ring features vast fantastical landscapes and shadowy, complex dungeons that are connected seamlessly. Traverse the breathtaking world on foot or on horseback, alone or online with other players, and fully immerse yourself in the grassy plains, suffocating swamps, spiraling mountains, foreboding castles and other sites of grandeur on a scale never seen before in a FromSoftware title&lt;/p&gt;&lt;p&gt;Genre-Defining Gameplay &ndash; Create your character in FromSoftware&rsquo;s refined action-RPG and define your playstyle by experimenting with a wide variety of weapons, magical abilities, and skills found throughout the world. Charge into battle, pick off enemies one-by-one using stealth, or even call upon allies for aid. Many options are at your disposal as you decide how to approach exploration and combat&lt;/p&gt;', 1, '2022-12-30 17:12:26');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(4, 6, 3.51, '2022-12-30 20:50:33');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(8, 6, 'PS4 Accessories', '&lt;p&gt;&lt;span style=&quot;color: rgb(209, 213, 219); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; white-space: pre-wrap; background-color: rgb(68, 70, 84);&quot;&gt;PlayStation 4 accessories are items that can be used to enhance or improve the gaming experience on the PS4 console. These accessories include things like controllers, charging docks, and storage solutions.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2022-12-30 03:15:37'),
(9, 6, 'PS4 Consoles', '&lt;p&gt;The PlayStation 4 (PS4) is a video game console developed and produced by Sony Interactive Entertainment. It was released in November 2013 and is the successor to the PlayStation 3. The PS4 is a home console that can be connected to a television, and it is designed to play video games and other media. It is powered by a custom AMD x86-64 processor and AMD Radeon graphics card, which provide improved performance and graphics capabilities compared to the previous generation. The console has a hard drive for storing games and other media, and it also has support for online multiplayer gaming and the ability to stream video and music. The PS4 is available in two versions: a standard edition and a slim edition. It competes with the Xbox One and the Nintendo Switch in the seventh generation of video game consoles.&lt;/p&gt;', 1, '2022-12-30 03:17:20'),
(10, 6, 'PS4 Games', '&lt;p&gt;PlayStation 4 (PS4) games are video games that are played on the PS4 console developed by Sony Interactive Entertainment. The PS4 has a wide variety of games available, including first-party titles developed by Sony and third-party titles from various other publishers. These games are available in physical form on game discs or digitally through the PlayStation Store. PS4 games can be played offline or online, and they can support single player or multiplayer gameplay. The types of games available on the PS4 include action, adventure, role-playing, sports, racing, and more. The PS4 is compatible with a selection of PlayStation 3 and PlayStation 2 games, and it also supports the use of PlayStation VR for virtual reality gaming.&lt;/p&gt;', 1, '2022-12-30 03:18:47'),
(11, 7, 'NSW Accessories', '', 1, '2022-12-30 16:55:40'),
(12, 7, 'NSW Consoles', '', 1, '2022-12-30 16:55:48'),
(13, 7, 'NSW Games', '', 1, '2022-12-30 16:55:57'),
(14, 5, 'PS5 Accessories', '', 1, '2022-12-30 16:56:15'),
(15, 5, 'PS5 Consoles', '', 1, '2022-12-30 16:56:23'),
(16, 5, 'PS5 Games', '', 1, '2022-12-30 16:56:34'),
(17, 8, 'Xbox Accessories', '', 1, '2022-12-30 16:57:37'),
(18, 8, 'Xbox Consoles', '', 1, '2022-12-30 16:57:44'),
(19, 8, 'Xbox Games', '', 1, '2022-12-30 16:58:35');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Ecommerce Game Store'),
(6, 'short_name', 'Gamestar'),
(11, 'logo', 'uploads/1672389420_GAme_Star_O-1__1_-removebg-preview.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1672389360_wall2.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Calvin Kent', 'Pamandanan', 'ckpamandanan', '68cff1f5dabbd64dbc523894541dbfdf', 'uploads/1672404360_323024616_736750314167045_6535974261622998779_n.jpg', NULL, 1, '2021-01-20 14:02:37', '2022-12-30 20:46:25'),
(4, 'Bobby Marcko', 'Cruz', 'bmcruz', 'ca249da45efe39d5748b7177534eaa83', 'uploads/1672404240_307653831_607022657782443_8823773374496124595_n.jpg', NULL, 0, '2021-06-19 08:36:09', '2022-12-30 20:44:21'),
(5, 'Ron Russelle', 'Bangsil', 'rrbangsil', '0e8f28c65802dcae529135e0765cbc75', 'uploads/1672404240_316141365_670040834765843_6765775325755166020_n.jpg', NULL, 0, '2021-06-19 10:01:51', '2022-12-30 20:44:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
