CREATE SCHEMA `gamerlistDB`;

/* PAJ 30/07/2017 - Creada la tabla de usuarios con las credenciales básicas.*/

CREATE TABLE `gamerlistDB`.`users` (
  `user_id_pk` INT         NOT NULL,
  `username`   VARCHAR(30) NOT NULL,
  `password`   VARCHAR(30) NOT NULL,
  PRIMARY KEY (`user_id_pk`)
);

/* PAJ 01/08/2017 - No estaba puesto como incremental la primary key de la tabla users*/

ALTER TABLE `gamerlistDB`.`users`
  CHANGE COLUMN `user_id_pk` `user_id_pk` INT(11) NOT NULL AUTO_INCREMENT;

/* PAJ 05/08/2017 - Modificado el campo username de la tabla user para evitar dos iguales */

ALTER TABLE `gamerlistDB`.`users`
  ADD UNIQUE INDEX `username_UNIQUE` (`username` ASC);

/* PAJ 05/08/2017 - Agregado campo isAdmin para saber si un usuario es administrador, como seguramente solo habrán
2 roles, usuario normal y admin, no encuentro un motivo suficiente para crear una tabla de roles.*/

ALTER TABLE `gamerlistDB`.`users`
  ADD COLUMN `admin` TINYINT NOT NULL DEFAULT 0
  AFTER `password`;

/* PAJ 10/08/2017 - Agregada la tabla videogames, irá creciendo con el tiempo */

CREATE TABLE `gamerlistDB`.`videogames` (
  `videogame_id_pk` INT         NOT NULL AUTO_INCREMENT,
  `name`            VARCHAR(30) NOT NULL,
  `description`     TEXT        NOT NULL,
  PRIMARY KEY (`videogame_id_pk`)
);

/* PAJ 12/08/2017 - Creada la tabla companies, esta tabla contiene las empresas del mundo del videojuego */

CREATE TABLE `gamerlistDB`.`companies` (
  `company_id_pk` INT         NOT NULL AUTO_INCREMENT,
  `name`          VARCHAR(30) NOT NULL,
  `founded`       DATE        NOT NULL,
  PRIMARY KEY (`company_id_pk`)
);

/* PAJ 13/08/2017 - Creada la tabla intermedia developers, relaciona videogames con companies */

CREATE TABLE `gamerlistDB`.`developers` (
  `developer_id_pk` INT NOT NULL AUTO_INCREMENT,
  `company_id_fk`   INT NOT NULL,
  `videogame_id_fk` INT NOT NULL,
  PRIMARY KEY (`developer_id_pk`),
  UNIQUE INDEX `SECONDARY` (`company_id_fk` ASC, `videogame_id_fk` ASC),
  INDEX `videogame_id_fk_idx` (`videogame_id_fk` ASC),
  CONSTRAINT `company_id_fk`
  FOREIGN KEY (`company_id_fk`)
  REFERENCES `gamerlistDB`.`companies` (`company_id_pk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `videogame_id_fk`
  FOREIGN KEY (`videogame_id_fk`)
  REFERENCES `gamerlistDB`.`videogames` (`videogame_id_pk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

/* PAJ 17/08/2017 - Creada la tabla intermedia publishers, que relaciona videogames y companies */

CREATE TABLE `gamerlistDB`.`publishers` (
  `publisher_id_pk` INT NOT NULL AUTO_INCREMENT,
  `videogame_id_fk` INT NOT NULL,
  `company_id_fk`   INT NOT NULL,
  PRIMARY KEY (`publisher_id_pk`),
  INDEX `videogame_idx` (`videogame_id_fk` ASC),
  INDEX `company_idx` (`company_id_fk` ASC),
  UNIQUE INDEX `videogameCompany` (`videogame_id_fk` ASC, `company_id_fk` ASC),
  CONSTRAINT `videogame`
  FOREIGN KEY (`videogame_id_fk`)
  REFERENCES `gamerlistDB`.`videogames` (`videogame_id_pk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `company`
  FOREIGN KEY (`company_id_fk`)
  REFERENCES `gamerlistDB`.`companies` (`company_id_pk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

/* PAJ 20/08/2017 - Agregados campos a la tabla del usuario */

ALTER TABLE `gamerlistDB`.`users`
  ADD COLUMN `name` VARCHAR(20) NULL
  AFTER `admin`,
  ADD COLUMN `surname` VARCHAR(20) NULL
  AFTER `name`,
  ADD COLUMN `gender` VARCHAR(15) NULL
  AFTER `surname`,
  ADD COLUMN `country` VARCHAR(30) NULL
  AFTER `gender`,
  ADD COLUMN `email` VARCHAR(30) NULL
  AFTER `country`,
  ADD COLUMN `birthday` DATE NULL
  AFTER `email`,
  ADD COLUMN `biography` MEDIUMTEXT NULL
  AFTER `birthday`,
  ADD COLUMN `registration` DATE NULL
  AFTER `biography`;

/* PAJ 21/08/2017 - Agregada la tabla de relaciones para que el usuario pueda tener amigos junto con un trigger para evitar
 que si ya hay una relación entre dos usuarios, no pueda haber otra más */

CREATE TABLE `gamerlistDB`.`relationships` (
  `relationship_id_pk`  INT         NOT NULL AUTO_INCREMENT,
  `sender_user_id_fk`   INT         NOT NULL,
  `receiver_user_id_fk` INT         NOT NULL,
  `status`              VARCHAR(15) NOT NULL
  COMMENT 'State 1: pending\nState 2: accepted',
  PRIMARY KEY (`relationship_id_pk`),
  INDEX `sender_idx` (`sender_user_id_fk` ASC),
  INDEX `receiver_user_idx` (`receiver_user_id_fk` ASC),
  UNIQUE INDEX `relationship` (`sender_user_id_fk` ASC, `receiver_user_id_fk` ASC),
  CONSTRAINT `sender_user`
  FOREIGN KEY (`sender_user_id_fk`)
  REFERENCES `gamerlistDB`.`users` (`user_id_pk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `receiver_user`
  FOREIGN KEY (`receiver_user_id_fk`)
  REFERENCES `gamerlistDB`.`users` (`user_id_pk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
DROP TRIGGER IF EXISTS `gamerlistDB`.`relationships_BEFORE_INSERT`;

DELIMITER $$
USE `gamerlistDB`$$
CREATE DEFINER = CURRENT_USER TRIGGER `gamerlistDB`.`relationships_BEFORE_INSERT`
BEFORE INSERT ON `relationships`
FOR EACH ROW
  BEGIN
    DECLARE rowCount INT;

    SELECT COUNT(*)
    INTO rowCount
    FROM `relationships`
    WHERE sender_user_id_fk = NEW.receiver_user_id_fk;

    IF (NEW.sender_user_id_fk = NEW.receiver_user_id_fk)
    THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Same user error. Insertion cancelled';
    END IF;

    IF rowCount > 0
    THEN
      SET rowCount = NEW.sender_user_id_fk, NEW.sender_user_id_fk = NEW.receiver_user_id_fk, NEW.receiver_user_id_fk = rowCount;
    END IF;
  END$$
DELIMITER ;

/* PAJ 24/08/2017 - Creada la tabla de los mensajes privados */

CREATE TABLE `gamerlistDB`.`privateMessages` (
  `privateMessage_id_pk` INT         NOT NULL AUTO_INCREMENT,
  `owner_user_id_fk`     INT         NOT NULL,
  `sender_user_id_fk`    INT         NOT NULL,
  `receiver_user_id_fk`  INT         NOT NULL,
  `subject`              VARCHAR(30) NULL,
  `content`              MEDIUMTEXT  NULL,
  `sended`               TIMESTAMP   NULL,
  `readed`               TINYINT     NULL,
  PRIMARY KEY (`privateMessage_id_pk`),
  INDEX `owner_idx` (`owner_user_id_fk` ASC),
  INDEX `sender_idx` (`sender_user_id_fk` ASC),
  INDEX `receiver_idx` (`receiver_user_id_fk` ASC),
  CONSTRAINT `owner`
  FOREIGN KEY (`owner_user_id_fk`)
  REFERENCES `gamerlistDB`.`users` (`user_id_pk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `sender`
  FOREIGN KEY (`sender_user_id_fk`)
  REFERENCES `gamerlistDB`.`users` (`user_id_pk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `receiver`
  FOREIGN KEY (`receiver_user_id_fk`)
  REFERENCES `gamerlistDB`.`users` (`user_id_pk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);