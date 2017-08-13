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
