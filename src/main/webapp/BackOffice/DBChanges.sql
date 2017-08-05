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