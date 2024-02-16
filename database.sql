
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `day_events` (
  `date` date NOT NULL,
  `title` varchar(24) NOT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `participants` (
  `user_id` int NOT NULL,
  `event_date` date DEFAULT NULL,
  `event_title` varchar(24) NOT NULL,
  `message` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `login` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` char(128) DEFAULT NULL,
  `can_participate_in_events` tinyint UNSIGNED DEFAULT '0',
  `can_manage_events` tinyint UNSIGNED DEFAULT '0',
  `can_manage_users` tinyint UNSIGNED DEFAULT '0',
  `super_user` tinyint UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`user_id`, `login`, `password`, `can_participate_in_events`, `can_manage_events`, `can_manage_users`, `super_user`) VALUES
(1, 'admin', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', 0, 0, 0, 1);

ALTER TABLE `day_events`
  ADD PRIMARY KEY (`date`,`title`);

ALTER TABLE `participants`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `event_date` (`event_date`,`event_title`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `participants`
  ADD CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `participants_ibfk_2` FOREIGN KEY (`event_date`,`event_title`) REFERENCES `day_events` (`date`, `title`);
COMMIT;