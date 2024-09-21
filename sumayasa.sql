-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2023 at 12:59 PM
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
-- Database: `sumayasa`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `Customer` varchar(40) NOT NULL DEFAULT '',
  `Product` varchar(40) NOT NULL DEFAULT '',
  `Quantity` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `PID` varchar(25) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Author` varchar(255) NOT NULL,
  `MRP` float NOT NULL,
  `Price` float NOT NULL,
  `Discount` int(11) DEFAULT NULL,
  `Available` int(11) NOT NULL,
  `Publisher` varchar(255) DEFAULT NULL,
  `Edition` varchar(20) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Language` varchar(255) DEFAULT NULL,
  `page` int(5) DEFAULT NULL,
  `weight` int(4) DEFAULT 500
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`PID`, `Title`, `Author`, `MRP`, `Price`, `Discount`, `Available`, `Publisher`, `Edition`, `Category`, `Description`, `Language`, `page`, `weight`) VALUES
('ROM-1', 'Outlander', 'Diana Gabaldon', 235000, 148000, 37, 5, 'Unique Pubishers', '2', 'Romance', NULL, 'Others', 256, 500),
('ROM-2', 'Red, White & Royal Blue', 'Casey McQuinston', 120000, 68000, 43, 15, 'Goodreads Author', '9', 'Romance', 'First Son Alex Claremont-Diaz is the closest thing to a prince this side of the Atlantic. With his intrepid sister and the Veep’s genius granddaughter, they’re the White House Trio, a beautiful millennial marketing strategy for his mother, President Ellen Claremont. International socialite duties do have downsides—namely, when photos of a confrontation with his longtime nemesis Prince Henry at a royal wedding leak to the tabloids and threaten American/British relations. The plan for damage control: staging a fake friendship between the First Son and the Prince.\n\nAs President Claremont kicks off her reelection bid, Alex finds himself hurtling into a secret relationship with Henry that could derail the campaign and upend two nations. What is worth the sacrifice? How do you do all the good you can do? And, most importantly, how will history remember you?', 'English', 320, 500),
('ROM-3', 'Book Lovers', 'Emily Henry', 475000, 332000, 30, 10, 'Goodreads Author', '2', 'Romance', NULL, 'English', 936, 500),
('ROM-4', 'Cinta Brontosaurus', 'Raditya Dika', 120000, 80000, 25, 15, 'Gagas Media', '4', 'Romance', 'Raditya Dika merupakan seorang penulis, komedian, dan aktor yang berasal dari Indonesia. Ia terkenal sebagai penulis di internet (blog) dan buku-buku komedi. Sosok yang kerap disapa Radit ini menuliskan pengalaman kesehariannya, tulisan-tulisan yang dibuat berasal dari blog pribadinya yang kemudian diangkat menjadi sebuah buku. Salah satu bukunya adalah Cinta Brontosaurus.\n\nCinta Brontosaurus adalah kumpulan cerita pendek pengalaman pribadi Raditya Dika, pengarang buku Kambing jantan yang aneh, ajaib tetapi tetap kontemplatif. 13 kisah di dalamnya adalah pengalaman nyata. Novel ini menggunakan sudut pandang orang pertama dengan alur yang maju mundur. Penulis menceritakan masa-masa ketika berada di bangku SD dan SMP. Selain itu, penulis juga menceritakan masa lalunya ketika beranjak remaja. Rangkaian cerita yang tersaji dalam buku ini sangat menarik. Perjalanan dalam mencari cinta sejati Radit terbilang lucu dan aneh dengan disisipkan bumbu komedi. Namun, Radit tidak menyerah begitu saja. Ia dibantu oleh teman-temannya untuk mencarikan sosok wanita yang sesuai dengan kriteria yang diinginkan.\n', 'English, Indonesia', 590, 500),
('FAN-1', 'The Hobbit and The Lord of The Rings', 'J.R.R. Tolkien', 1040800, 915000, 35, 87, 'Rupa Publication', '1', 'Fantasy', 'This four-volume, boxed set contains J.R.R. Tolkien\'s epic masterworks The Hobbit and the three volumes of The Lord of the Rings (The Fellowship of the Ring, The Two Towers, and The Return of the King).\n\nIn The Hobbit, Bilbo Baggins is whisked away from his comfortable, unambitious life in Hobbiton by the wizard Gandalf and a company of dwarves. He finds himself caught up in a plot to raid the treasure hoard of Smaug the Magnificent, a large and very dangerous dragon.\n\nThe Lord of the Rings tells of the great quest undertaken by Frodo Baggins and the Fellowship of the Ring: Gandalf the wizard; the hobbits Merry, Pippin, and Sam; Gimli the dwarf; Legolas the elf; Boromir of Gondor; and a tall, mysterious stranger called Strider. J.R.R. Tolkien\'s three volume masterpiece is at once a classic myth and a modern fairy tale—a story of high and heroic adventure set in the unforgettable landscape of Middle-earth', 'English', 7890, 500),
('FAN-2', 'A Song of Ice and Fire (Game Of Thrones)', 'George R.R. Martin', 699000, 599000, 20, 67, 'Westland Publisher', '1', 'Fantasy', 'Long ago, in a time forgotten, a preternatural event threw the seasons out of balance. In a land where summers can last decades and winters a lifetime, trouble is brewing. The cold is returning, and in the frozen wastes to the north of Winterfell, sinister forces are massing beyond the kingdom’s protective Wall. To the south, the king’s powers are failing—his most trusted adviser dead under mysterious circumstances and his enemies emerging from the shadows of the throne. At the center of the conflict lie the Starks of Winterfell, a family as harsh and unyielding as the frozen land they were born to. Now Lord Eddard Stark is reluctantly summoned to serve as the king’s new Hand, an appointment that threatens to sunder not only his family but the kingdom itself.\n\nSweeping from a harsh land of cold to a summertime kingdom of epicurean plenty, A Game of Thrones tells a tale of lords and ladies, soldiers and sorcerers, assassins and bastards, who come together in a time of grim omens. Here an enigmatic band of warriors bear swords of no human metal; a tribe of fierce wildlings carry men off into madness; a cruel young dragon prince barters his sister to win back his throne; a child is lost in the twilight between life and death; and a determined woman undertakes a treacherous journey to protect all she holds dear. Amid plots and counter-plots, tragedy and betrayal, victory and terror, allies and enemies, the fate of the Starks hangs perilously in the balance, as each side endeavors to win that deadliest of conflicts: the game of thrones.', 'English', 1020, 500),
('FAN-3', 'The Chronicles of Narnia', 'C.S. Lewis', 799000, 580000, 27, 48, 'Egmont Childrens Books', '1', 'Fantasy', 'Journeys to the end of the world, fantastic creatures, and epic battles between good and evil—what more could any reader ask for in one book? The book that has it all is The Lion, the Witch and the Wardrobe, written in 1949 by Clive Staples Lewis. But Lewis did not stop there. Six more books followed, and together they became known as The Chronicles of Narnia.\n\nFor the past fifty years, The Chronicles of Narnia have transcended the fantasy genre to become part of the canon of classic literature. Each of the seven books is a masterpiece, drawing the reader into a land where magic meets reality, and the result is a fictional world whose scope has fascinated generations.\n\nThis edition presents all seven books—unabridged—in one impressive volume. The books are presented here in chronlogical order, each chapter graced with an illustration by the original artist, Pauline Baynes. Deceptively simple and direct, The Chronicles of Narnia continue to captivate fans with adventures, characters, and truths that speak to readers of all ages, even fifty years after they were first published.', 'English', 1618, 500),
('FAN-4', 'Fifty Shades Trilogy (Set of 3 Books)', 'E. L. James', 1399000, 909000, 35, 78, 'Cornerstone', '1', 'Fantasy', 'Authored ByE.L. James\r\nLanguage English\r\nEdition 1\r\nPublication Year 2012 June\r\nPublisher Name Cornerstone\r\nNo. Of Pages 1296\r\nWeight 45 gm\r\nBinding Paperback\r\nLanguages English', 'English', 1296, 45),
('HIS-1', 'The Guns of August ', 'Barbara W. Tuchman\n', 100000, 89900, 10, 1, 'Little, Brown Book Group', '1', 'History', NULL, 'English', 592, 500),
('HIS-2', 'History of Nazi Germany', 'William L. Shirer', 69900, 59900, 20, 4, 'Hay House', '1', 'History', 'Hitler boasted that The Third Reich would last a thousand years. It lasted only 12. But those 12 years contained some of the most catastrophic events Western civilization has ever known.\n\nNo other powerful empire ever bequeathed such mountains of evidence about its birth and destruction as the Third Reich. When the bitter war was over, and before the Nazis could destroy their files, the Allied demand for unconditional surrender produced an almost hour-by-hour record of the nightmare empire built by Adolph Hitler. This record included the testimony of Nazi leaders and of concentration camp inmates, the diaries of officials, transcripts of secret conferences, army orders, private letters—all the vast paperwork behind Hitler\'s drive to conquer the world.\n\nThe famed foreign correspondent and historian William L. Shirer, who had watched and reported on the Nazis since 1925, spent five and a half years sifting through this massive documentation. The result is a monumental study that has been widely acclaimed as the definitive record of one of the most frightening chapters in the history of mankind.\n\nThis worldwide bestseller has been acclaimed as the definitive book on Nazi Germany; it is a classic work.\n\nThe accounts of how the United States got involved and how Hitler used Mussolini and Japan are astonishing, and the coverage of the war-from Germany\'s early successes to her eventual defeat-is must reading', 'English', 450, 500),
('HIS-3', 'Hiroshima ', 'John Hersey', 59900, 38900, 35, 32, 'Little, Brown Book Group', '1', 'History', 'On August 6, 1945, Hiroshima was destroyed by the first atom bomb ever dropped on a city. This book, John Hersey\'s journalistic masterpiece, tells what happened on that day. Told through the memories of survivors, this timeless, powerful and compassionate document has become a classic \"that stirs the conscience of humanity\" (The New York Times).', 'English', 944, 640),
('HIS-4', 'The Gulag Archipelago', 'Aleksandr Solzhenitsyn', 59500, 38700, 30, 11, 'Aleph Book Company', '1', 'History', 'Drawing on his own incarceration and exile, as well as on evidence from more than 200 fellow prisoners and Soviet archives, Aleksandr I. Solzhenitsyn reveals the entire apparatus of Soviet repression—the state within the state that ruled all-powerfully. Through truly Shakespearean portraits of its victims—men, women, and children—we encounter secret police operations, labor camps and prisons; the uprooting or extermination of whole populations, the welcome that awaited Russian soldiers who had been German prisoners of war. Yet we also witness the astounding moral courage of the incorruptible, who, defenseless, endured great brutality and degradation. The Gulag Archipelago 1918–1956—a grisly indictment of a regime, fashioned here into a veritable literary miracle—has now been updated with a new introduction that includes the fall of the Soviet Union and Solzhenitsyn\'s move back to Russia.', 'English', 396, 500),
('ACA-9', 'Mechanics Of Materials', 'Timothy A. Philpot', 64900, 53200, 18, 12, 'Wiley', '1', 'Academic and Professional', 'It presents the theory and practice of mechanics of materials in a straight-forward, plain-speaking, student-friendly manner that addresses the learning styles of today\'s students without sacrificing rigor or depth in the presentation of topics. Unique to this book is the integration of MecMovies. This award-winning instructional software package created by the author provides extensive hands-on practice and feedback to students as they become familiar with a wide variety of concepts and applications, from stress and strain to bending, torsion, transverse shear and combined loads. \r\n\r\nStress \r\nStrain \r\nMechanical Properties of Materials \r\nDesign Concepts \r\nAxial Deformation \r\nTorsion \r\nEquilibrium of Beams \r\nBending \r\nShear Stress in Beams \r\nBeam Deflections \r\nStatically Indeterminate Beams \r\nStress Transformations \r\nStrain Transformations \r\nThin-Walled Pressure Vessels \r\nCombined Loads \r\nColumns \r\nEnergy Methods ', 'English', 896, 500),
('ACA-10', 'Python For Data Science For Dummies', 'John Paul Mueller;Luca Massaron', 59900, 58900, 2, 13, 'Wiley', '1', 'Academic and Professional', 'This book is designed for beginners to data analysis and covers the basics of Python data analysis programming and statistics. It covers the Python fundamentals that are necessary to data analysis, including objects, functions, modules and libraries. The libraries that are integral to data science are explored and explained, including NumPy, SciPy, BeautifulSoup, Pandas and MatPlobLib. \r\n\r\nTable of Contents\r\n\r\nIntroduction \r\nAbout This Book \r\nFoolish Assumptions \r\nIcons Used in This Book \r\nBeyond the Book \r\nWhere to Go from Here ', 'English', 440, 500),
('ACA-11', 'Data Science And Big Data Analytics', 'Emc Education Services', 199900, 177900, 11, 12, 'Wiley India', '1', 'Academic and Professional', 'Data Science & Big Data Analytics educates readers about what Big Data is and how to extract value from it. The book covers methods and technologies required to analyze structured and unstructured datasets, as more individuals and organizations build out their capabilities to analyze Big Data and draw insights from it. Additional focus areas include machine learning, data visualization and presentation skills. The book provides practical foundation level training that enables immediate and effective participation in big data and other analytics projects. It provides grounding in basic and advanced analytic methods and an introduction to big data analytics technology and tools, including MapReduce and Hadoop.', 'English', 432, 500),
('ACA-12', 'Professional AngularJS', 'Valeri Karpov, Diego Netto', 59900, 53300, 11, 11, 'Wiley India', '1', 'Academic and Professional', 'AngularJS was recently called the \"Super-heroic JavaScript MVW Framework\" by The Code Project. It\'s an open source client side framework maintained by Google that greatly simplifies frontend development, making it easy and fun to write complex web apps. The online documentation and existing books on the subject lack simple explanations of some of the more advanced concepts, and how they work together. As a result, many developers get used to the basic concepts of AngularJS fairly quickly, but struggle when it comes to building more complex (real world) applications. ', 'English', 396, 500),
('CHILD-6', 'Diary of a Wimpy Kid: Rodrick Rules', 'Jeff Kinney', 29900, 19400, 34, 12, 'Penguin Books', '1', 'Children and Teens', '', 'English', 224, 500),
('CHILD-7', 'The Adventures Of Stoob : A Difficult Stage', 'Rupa Books', 19500, 14400, 26, 4, 'Rupa Publication', '1', 'Children and Teens', 'Stoob is headed for an amazing global stardom incident but sinister forces lurk as always between him and ultimate glory.Stoob is in class six and his days of childhood are over. He has discovered his inner star and is all set to take Hollywood by storm-but first he has to audition for a part in the school play based on the hit childrens TV series Teen Rama Adventurezzz. Unfortunately the channel executive a villainous suit casts him as a table. Fortunately there are wheels within wheels and he ends up playing the Rakshas Hero.Super shenanigans occur onstage and off as Stoob finds both his acting and romantic career under siege. Will he be able to save the play from a terrible fate? Will Ishani Radhika Yash and Sid keep their heads and play their parts to perfection? Will momo-sir and the beauteous Ms. Devraj come to the rescue or will Stoob be branded as a future criminal for all time? And what message does Wolverfluff the dog hold for Stoob?Find out as Stoob undertakes a scheme of literally epic proportions in his second hilarious adventure.About the AuthorSamit Basu is a writer of books films and graphic novels. His first novel the Simoqin prophecies (2003) was the first book in the bestselling gameworld trilogy and marked the beginning of Indian English fantasy writing he has also written the international award-winning superhero novel turbulence and the recently published graphic novel Local Monsters. Forthcoming from Red Turtle are books in the adventures of stoob series and the next book in the morningstar agency series.', 'English', 195, 500),
('CHILD-12', 'GERONIMO STILTON #49 THE WAY OF THE SAMURAI', 'Geronimo Stilton', 29500, 18800, 36, 4, 'Scholastic Paperbacks', '1', 'Children and Teens', '', 'English', 106, 500),
('COM-4', 'That Guy', 'Kim Jones', 69900, 67000, 4, 10, 'S.Chand Publisher', '70', 'Romantic Comedy', NULL, 'English', 1068, 500),
('ADV-1', 'Treasure Island: Runaway Gold', 'Jewel Parker Rhodes', 250000, 168000, 33, 4, 'Goodreads', '3', 'Adventure', 'Bestselling and award-winning author Jewell Parker Rhodes reimagines the classic novel Treasure Island  by Robert Louis Stevenson in this thrilling adventure set in modern-day Manhattan, in which three children must navigate the city’s hidden history, dodge a threatening crew of skater kids, and decide who they can really trust in order to hunt down a long-buried treasure.  Three kids. One dog. And the island of Manhattan, laid out in an old treasure map. Zane is itching for an adventure that will take him away from his family’s boarding house in Rockaway, Queens. So when he is entrusted with a real treasure map, leading to a spot somewhere in Manhattan, Zane wastes no time in riding the ferry over to the city to start the search with his friends Kiko and Jack and his dog, Hip-Hop. Through strange coincidence, they meet a man who is eager to help them find the John, a sailor who knows all about the buried history of Black New Yorkers of centuries past—and the gold that is hidden somewhere in those stories. As a vicious rival skateboard crew follows them around the city, Zane and his friends begin to wonder who they can really trust. And soon it becomes clear that treasure hunting is a dangerous business… Jewell Parker Rhodes has written a version of Treasure Island like none you’ve never seen—one that takes the reader through little-known Black history, and under the city of Manhattan itself. ', 'Telugu', 464, 500),
('ADV-2', 'What the River Knows', 'Isabel Ibanez', 250000, 168000, 33, 4, 'Goodreads', '3', 'Adventure', 'Bolivian-Argentinian Inez Olivera belongs to the glittering upper society of nineteenth century Buenos Aires, and like the rest of the world, the town is steeped in old world magic that’s been largely left behind or forgotten. Inez has everything a girl might want, except for the one thing she yearns the most: her globetrotting parents—who frequently leave her behind.\n\nWhen she receives word of their tragic deaths, Inez inherits their massive fortune and a mysterious guardian, an archeologist in partnership with his Egyptian brother-in-law. Yearning for answers, Inez sails to Cairo, bringing her sketch pads and an ancient golden ring her father sent to her for safekeeping before he died. But upon her arrival, the old world magic tethered to the ring pulls her down a path where she soon discovers there’s more to her parent’s disappearance than what her guardian led her to believe.\n\nWith her guardian’s infuriatingly handsome assistant thwarting her at every turn, Inez must rely on ancient magic to uncover the truth about her parent’s disappearance—or risk becoming a pawn in a larger game that will kill her.\n\nThe Mummy meets Death on the Nile in this lush, immersive historical fantasy set in Egypt filled with adventure, a rivals-to-lovers romance, and a dangerous race.', 'Telugu', 464, 500),
('COM-2', 'Tangled', 'Emma Chase', 62500, 50000, 20, 4, 'Azure Publisher', '8', 'Romantic Comedy', NULL, 'English', 744, 500),
('COM-3', 'Wallbanger', 'Alice Clayton', 52000, 43800, 16, 18, 'Azure Publisher', '1', 'Romantic Comedy', NULL, 'English', 488, 500),
('COM-1', 'The Hating Game', 'Sally Thorne', 72500, 59500, 18, 5, 'Azure Publisher', '6', 'Romantic Comedy', 'Debut author Sally Thorne bursts on the scene with a hilarious and sexy workplace comedy all about that thin, fine line between hate and love.\n\nNemesis (n.) 1) An opponent or rival whom a person cannot best or overcome.\n2) A person’s undoing\n3) Joshua Templeman\n\nLucy Hutton has always been certain that the nice girl can get the corner office. She’s charming and accommodating and prides herself on being loved by everyone at Bexley & Gamin. Everyone except for coldly efficient, impeccably attired, physically intimidating Joshua Templeman. And the feeling is mutual.\n\nTrapped in a shared office together 40 (OK, 50 or 60) hours a week, they’ve become entrenched in an addictive, ridiculous never-ending game of one-upmanship. There’s the Staring Game. The Mirror Game. The HR Game. Lucy can’t let Joshua beat her at anything—especially when a huge new promotion goes up for the taking.\n\nIf Lucy wins this game, she’ll be Joshua’s boss. If she loses, she’ll resign. So why is she suddenly having steamy dreams about Joshua, and dressing for work like she’s got a hot date? After a perfectly innocent elevator ride ends with an earth shattering kiss, Lucy starts to wonder whether she’s got Joshua Templeman all wrong.\n\nMaybe Lucy Hutton doesn’t hate Joshua Templeman. And maybe, he doesn’t hate her either. Or maybe this is just another game. ​​', 'English', 961, 500),
('NEW-1', 'Black Night', 'Azure Shin', 175000, 113000, 35, 12, 'Azure Publisher', '1', 'New', NULL, 'English', 280, 500),
('NEW-2', 'About The First Night', 'Azure Shin', 129000, 68000, 43, 6, 'Azure Publisher', '9', 'New', NULL, 'English', 320, 500),
('NEW-3', 'Open The Sky', 'Azure Shin', 59500, 40000, 33, 15, 'Azure Publisher', '1', 'New', NULL, 'English', 280, 500),
('NEW-4', 'The Big Book Of Science', 'Nero 30', 435000, 289000, 34, 22, 'Azure Publisher', '2', 'New', NULL, 'English', 1000, 500),
('MAN-1', 'Omniscient Reader POV', 'Sanjeev Kapoor', 280000, 242000, 18, 12, 'Popular Prakashan', '1', 'Manga and Manhwa', NULL, 'English', 429, 500),
('MAN-2', 'Solo Levelling', 'Nita Mehta', 175000, 162000, 7, 18, 'Snab Publishers', '1', 'Manga and Manhwa', NULL, 'English', 650, 500),
('MAN-3', 'The Beginning After The End', 'Turtle Me', 495000, 371000, 25, 11, 'Yen Press', '1', 'Manga and Manhwa', NULL, 'English', 154, 100),
('MAN-4', 'Tower Of God', 'SIU', 595000, 476000, 20, 10, 'Snab', '1', 'Manga and Manhwa', NULL, 'English', 450, 500),
('FAN-5', 'Torn', 'J K Rowling', 399000, 296000, 26, 31, 'Pan Macmillan', '1', 'Fantasy', 'Acknowledging that she was different from everyone else wasn\'t difficult for Wendy Everly she\'d always felt like an outsider. But a new world and new family is a hard for any girl to accept easily. Leaving behind the mysterious country of her birth, she is determined to fit back into normal life. But the world she\'s left behind won\'t let her go that easily. Kidnapped and imprisoned by her true family\'s enemies, Wendy soon learns that the lines between good and evil aren\'t as defined as she thought. And those things she\'d taken for granted may have been lies all along. With the help of the dangerously attractive Loki, she escapes back to the safety of F rening only to be confronted by a new threat. It\'s time to make a choice can she put aside her personal feelings for the sake of her country? Torn between duty and love she must make a choice that could destroy her one chance at true happiness.Generated an excitement not felt in the industry since Stephenie Meyer or perhaps even J. K. Rowling\' New York Times,A fast paced romance addictive\' Guardian on Switched , \'Drew me in and kept me hooked...cracking pace\' Sunday Express on Switched', 'English', 356, 500),
('FAN-6', 'Harry Potter and the Half-Blood Prince', 'J K Rowling', 699000, 454000, 35, 32, 'Bloomsbury', '1', 'Fantasy', NULL, 'English', 420, 500),
('FAN-7', 'Career Of Evil : A Cormoran Strike', 'J K Rowling', 699000, 365000, 35, 23, 'Little, Brown Book Group', '1', 'Fantasy', 'The third book in the highly acclaimed crime fiction series by J. K. Rowling, writing under the pseudonym Robert Galbraith. When a mysterious package is delivered to Robin Ellacott, she is horrified to discover that it contains a woman\'s severed leg. Her boss, private detective Cormoran Strike, is less surprised but no less alarmed. There are four people from his past who he thinks could be responsible - and Strike knows that any one of them is capable of sustained and unspeakable brutality. With the police focusing on the one suspect Strike is increasingly sure is not the perpetrator, he and Robin take matters into their own hands and delve into the dark and twisted worlds of the other three men. But as more horrendous acts occur, time is running out for the two of them... A fiendishly clever mystery with unexpected twists around every corner, Career of Evil is also a gripping story of a man and a woman at a crossroads in their personal and professional lives. You will not be able to put this book down.\r\n\r\nAbout the Author\r\n\r\nRobert Galbraith is a pseudonym for J. K. Rowling, bestselling author of the Harry Potter series and The Casual Vacancy. Career of Evil is the third book in the highly acclaimed Cormoran Strike crime fiction series. The Cuckoos Calling was published in 2013 and The Silkworm in 2014. Robert Galbraiths Cormoran Strike novels will be adapted for a major new television series for BBC One, produced by Bront Film and Television. Robert Galbraith / J. K. Rowling will not be available for interview or events.', 'English', 512, 500),
('FAN-8', 'Harry Potter And The Goblet Of Fire', 'J k Rowling', 699000, 510000, 27, 13, 'Bloomsbury', '1', 'Fantasy', NULL, 'English', 427, 500);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserName` varchar(40) NOT NULL,
  `Password` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserName`, `Password`) VALUES
('shin', 'shin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`Customer`,`Product`),
  ADD KEY `Product` (`Product`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserName`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
