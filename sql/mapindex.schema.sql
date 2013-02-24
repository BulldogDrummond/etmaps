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
  KEY `md_filename` (`md_filename`),
  KEY `md_region` (`md_region`,`md_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
