-- phpMyAdmin SQL Dump
-- version 3.3.2deb1ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 24, 2013 at 08:13 AM
-- Server version: 5.1.66
-- PHP Version: 5.3.2-1ubuntu4.18

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `etlegacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `map_data`
--

CREATE TABLE IF NOT EXISTS `map_data` (
  `md_region` tinyint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `md_order` tinyint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `md_regionname` varchar(20) NOT NULL DEFAULT 'Unknown',
  `md_compass` varchar(10) NOT NULL DEFAULT 'UNK',
  `md_compcode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `md_night` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `md_time` varchar(10) NOT NULL DEFAULT 'Unknown',
  `md_weather` varchar(20) NOT NULL DEFAULT 'Unknown',
  `md_mapname` varchar(20) NOT NULL DEFAULT 'Unknown',
  `md_longname` varchar(30) NOT NULL DEFAULT 'Unknown',
  `md_filename` varchar(24) NOT NULL DEFAULT 'Unknown.pk3',
  `md_timelimit` tinyint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `md_defending` varchar(8) NOT NULL DEFAULT 'Unknown',
  `md_briefing` text,
  UNIQUE KEY `md_mapname` (`md_mapname`),
  KEY `md_region` (`md_region`,`md_order`),
  KEY `md_filename` (`md_filename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `map_data`
--

INSERT INTO `map_data` (`md_region`, `md_order`, `md_regionname`, `md_compass`, `md_compcode`, `md_night`, `md_time`, `md_weather`, `md_mapname`, `md_longname`, `md_filename`, `md_timelimit`, `md_defending`, `md_briefing`) VALUES
(01, 00, 'North_Africa', 'LOWER', 0, 0, 'DAY', 'CLEAR', 'oasis', 'Siwa_Oasis', 'BUILTIN', 30, 'Axis', 'The Allies must infiltrate the Axis Oasis garrison to destroy two \nanti-tank guns: either through the Old City or a flooded cave system. \nThe Axis must protect their anti-tank guns and repel the Allied \nraiders. '),
(01, 01, 'North_Africa', 'LOWER', 0, 0, 'DAY', 'CLEAR', 'marrakech', 'Operation_Marrakech', 'marrakech.pk3', 30, 'Axis', 'An abandoned area on the outskirts of Marrakech is the location of the \nAxis secret bank. There are holding gold which was lost by Allied \nforces during the battle for Northwest Africa. Both armies need the \ngold to sustain their forces. Only one can have it at the end of this \nfight! '),
(01, 02, 'North_Africa', 'LOWER', 0, 0, 'DAY', 'CLEAR', 'citadel', 'The_Citadel', 'citadel.pk3', 15, 'Axis', 'The fight for control of the desert has been brutal and bloody. The \nAxis forces are cut off from reinforcements and guard their limited \nammunition in a cellar in The Citadel. The Allies have to load the \ncannon with ammo and blast an opening in the ammunition depot, and \ndestroy the Axis ammunition.  The Axis forces must defend it at all \ncosts. '),
(01, 03, 'North_Africa', 'UPPER', 1, 0, 'DAY', 'CLEAR', 'goldrush', 'Gold_Rush', 'BUILTIN', 30, 'Axis', 'The Axis are guarding a hoard of gold in the Tobruk Central Bank. The \nAllies must steal an Axis Jagdpanther to blow the bank open, steal the \ngold bars and drive them to safety in a Truck. '),
(02, 00, 'Central_Europe', 'LOWER', 0, 0, 'DAY', 'CLEAR', 'battery', 'Seawall_Battery', 'BUILTIN', 20, 'Axis', 'The mighty Axis shore battery Siegfried is harassing Allied shipping \nin the Mediterranean. The Axis must protect Siegfried from Allied \nattempts at sabotage. '),
(02, 01, 'Central_Europe', 'LOWER', 0, 0, 'DAY', 'RAINING', 'radar', 'Wurzburg_Radar', 'BUILTIN', 20, 'Axis', 'The Allies are attempting to steal components of the new Axis Wurzburg \n62A radar for technical analysis. The Axis must guard their two \nprototype radars and prevent the Allies from escaping with any stolen \nparts. '),
(02, 02, 'Central_Europe', 'LOWER', 0, 0, 'DAY', 'CLOUDY', 'crevasse', 'Crevasse', 'crevasse.pk3', 15, 'Axis', 'The Underground have discovered the location of an Axis facility built \ninconspicuously into an natural crevasse. Operatives report that there \nis valuable information kept somewhere in the base. The Allies must \nobtain this information and transmit it to Allied Command. The Axis \nmust prevent this, and defend the base. '),
(02, 03, 'Central_Europe', 'LOWER', 0, 1, 'NIGHT', 'FOG', 'navarone', 'Navarone', 'navarone.pk3', 20, 'Axis', 'The Axis are planning to execute over 2000 English soldiers on the \nGreek island of Kheros. The Allied forces plan a rescue by sea, but to \ndo so, must sail past the island of Navarone. On Navarone the Axis \nhave two huge cannons inside a cliffwall with a shooting range of 200 \nkilometers. The Allied mission is to destroy the cannons from inside \nthe fortress in the cliffside. If they fail, many lives will be lost. '),
(02, 04, 'Central_Europe', 'LOWER', 0, 0, 'DAY', 'CLEAR', 'venice', 'Venice', 'venice.pk3', 30, 'Axis', 'Allied Intelligence has intercepted an Axis transmission! Details \noutlined the exchange of an ancient relic between the Germans and \nItalians that will occur today in Venice. An Allied team must drop \ninto Venice accompanied by a Churchill AVRE Demolition Tank, gain \npossession of the relic, and escape by boat from the City of \nVenice! '),
(02, 05, 'Central_Europe', 'UPPER', 1, 0, 'DAY', 'CLEAR', 'caen', 'Caen', 'caen.pk3', 25, 'Allies', 'The Allies have control of Caen and have set up a Battalion \nHeadquarters across the river. The Axis are trying to regain control \nof the town and get to a broken down tank, break into battallion HQ, \nand steal combat intelligence. '),
(02, 06, 'Central_Europe', 'UPPER', 1, 0, 'DAY', 'CLOUDY', 'bremen', 'Bremen', 'bremen.pk3', 15, 'Axis', 'Allied spies have uncovered details of an Axis plan to transport a \nfortune in gold to a more secure location. The Allies have planned \nan attack to intercept the gold during its stopover in Bremen. '),
(02, 07, 'Central_Europe', 'UPPER', 1, 0, 'DAY', 'CLEAR', 'bergen', 'Bergen', 'bergen.pk3', 20, 'Axis', 'Operation Archery: The commando raid in the Bergen area of Norway.  \nThe Unterseebootwaffe of the 11th Flotilla is harassing Allied shipping \nin the North Sea. As Operation Arrow descends on the Bergen area of \nNorway the Axis must protect the base from Allied attempts at sabotage. \nAs part of Operation Archery, the Allies must destroy the Transmitter \nat the submarine base located west of the town.  The Axis forces must \ndefend the Transmitter at all costs until reinforcements arrive. '),
(02, 08, 'Central_Europe', 'UPPER', 1, 1, 'NIGHT', 'RAINING', 'dasboot', 'Das_Boot', 'dasboot.pk3', 18, 'Axis', 'Hidden away in the secret base is an Axis Submarine which the Allies \nmust destroy. The Axis must defend the base and prevent the destruction \nof the Submarine. '),
(02, 09, 'Central_Europe', 'UPPER', 1, 0, 'DAY', 'CLEAR', 'supplydepot', 'Supply_Depot', 'supplydepot.pk3', 15, 'Axis', 'Allied intelligence have discovered that the Axis forces are \ntemporarily storing a large shipment of gold at a supply depot \nnear the German border. The Allies have to drive a truck into \nthe supply depot to steal the crate of gold using a crane. \nThe Axis have to defend the Depot and protect the Gold. '),
(02, 10, 'Central_Europe', 'UPPER', 1, 0, 'DAY', 'CLOUDY', 'radarbase', 'Radar_Base', 'radarbase.pk3', 15, 'Axis', 'The Allies must destroy both the North and South Radar Controls. The \nAxis must defend them until the top secret message is finished \ntransmitting. '),
(02, 11, 'Central_Europe', 'UPPER', 1, 0, 'DAY', 'CLOUDY', 'v2base', 'V2_Base', 'v2base.pk3', 30, 'Axis', 'The Axis have captured an old fortress and built a V2 Base test \nfacility to evaluate the new V2 Rockets, Allied forces have \nintercepted this information and are trying to steal the secret \nV2 Rocket design blueprints. '),
(03, 00, 'Northern_Europe', 'UPPER', 1, 0, 'DAY', 'SNOWING', 'railgun', 'Rail_Gun', 'BUILTIN', 30, 'Axis', 'The Allies must prevent the Axis from loading and firing Dora, a \ncolossal railway gun. The Axis must transport and load the  \nammunition, protect her firing controls and fire her to win. '),
(03, 01, 'Northern_Europe', 'UPPER', 1, 1, 'NIGHT', 'CLOUDY', 'axislab', 'Axis_Lab', 'axislab.pk3', 25, 'Axis', 'The Axis are guarding a top secret chemical weapons laboratory working \non long range missles with deadly poisons, but most importantly it also \nhouses the Germans first prototype of a nuclear bomb. \nThe Allies must infiltrate the facility and remove the Nuke to Allied \nlines.'),
(03, 02, 'Northern_Europe', 'UPPER', 1, 0, 'DAY', 'SNOWING', 'fueldump', 'Fuel_Dump', 'BUILTIN', 30, 'Axis', 'The Allies are attacking an Axis fuel depot and must escort their \nChurchill AVRE Demolition Tank as it blasts through the defences. The \nAxis can disable and delay the Tank with Panzerfausts, grenades, \nmines or explosives. '),
(03, 03, 'Northern_Europe', 'UPPER', 1, 0, 'DAY', 'SNOWING', 'eagles', 'Castle_of_Eagles', 'eagles.pk3', 00, 'Axis', 'The Allies have discovered that a list of Axis agents is being kept at \nSchloss Adler, the Castle of Eagles.  In order to prevent them from \nobtaining it, the Axis must stop the Allied troops from reaching the \ncastle and flying the document out of the country from nearby \nOberhausen airfield. '),
(03, 04, 'Northern_Europe', 'UPPER', 1, 1, 'NIGHT', 'FOG', 'ice', 'Ice', 'ice.pk3', 15, 'Allies', 'The Allies have set up a position close to an Axis Outpost. The Axis \nforces must obtain the Top Secret documents from the Allied \nstronghold. '),
(03, 05, 'Northern_Europe', 'UPPER', 1, 0, 'DAY', 'CLOUDY-SNOW', 'village', 'Village', 'village.pk3', 12, 'Axis', 'Allied forces are attempting to retrieve and escape with gold stolen \nfrom the Axis-occupied village. '),
(03, 06, 'Northern_Europe', 'UPPER', 1, 1, 'NIGHT', 'CLEAR-SNOW', 'frostbite', 'Frostbite', 'frostbite.pk3', 15, 'Axis', 'A convoy is about to make a shipment of supplies that could bolster \nAxis resistance in the region. The Allies must steal the Supply \nDocuments and radio them back to Allied Command so the convoy can be \nintercepted in time. '),
(03, 07, 'Northern_Europe', 'UPPER', 1, 1, 'NIGHT', 'SNOWING', 'missile', 'C2_Missile', 'missile.pk3', 15, 'Axis', 'A C2 Missile is about to be launched by the Axis forces. The Allies \nmust break into their secret base and remove the missile control unit \nfor further analysis. Losing this technology would be a major setback \nfor the Axis, so the Allies should expect aggressive opposition. '),
(03, 08, 'Northern_Europe', 'UPPER', 1, 0, 'DAY', 'CLEAR-SNOW', 'transmitter', 'Transmitter', 'transmitter.pk3', 30, 'Axis', 'Civilians manipulated by the Volksempfanger''s propaganda program are \nresisting the Allied forces. To break the resistance, the Allies have \nto take gain control of the Radio Transmitter, which is amplifying the \nmaster signal from Berlin for local receivers. They must manipulate \nthe transmission-frequency by installing a Radio Modification Kit on \nthe Transmitter. The Allies also have to rotate the Antenna toward \nthe pirate sender to get the signal through. '),
(03, 09, 'Northern_Europe', 'LOWER', 0, 1, 'NIGHT', 'CLEAR', 'bramburg', 'Bramburg_Dam', 'bramburg.pk3', 15, 'Axis', 'Allied forces are attempting to destroy the Bramburg Dam to flood the \nAxis Military Installation in the valley below. The Axis forces will \nfight to the last to prevent this from happening. '),
(03, 10, 'Northern_Europe', 'UPPER', 1, 0, 'DAY', 'SNOWING', 'stalingrad', 'Stalingrad', 'stalingrad.pk3', 20, 'Axis', 'The Axis have taken control over large portions of the Russian city of \nStalingrad. In order to re-take the city, the Allies must gain control \nof a small neighborhood on the southern side of the city.  This area \nis a key strategic position, from which the allies hope to launch \nfurther missions deeper into the city.  Aware of the importance of this \narea, the Axis have placed two tanks within this area, which must be \ndestroyed in order for the allies to secure the area. The Axis must \ndefend these tanks in order to maintain their hold on the city. ');

