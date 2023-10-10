
TRUNCATE TABLE `candidatura_ayuntamiento`;
ALTER TABLE `candidatura_ayuntamiento` AUTO_INCREMENT = 0;
TRUNCATE TABLE `candidatura_comunidad`; 
ALTER TABLE `candidatura_comunidad` AUTO_INCREMENT = 0;
TRUNCATE TABLE `candidatura_diputado`; 
ALTER TABLE `candidatura_diputado` AUTO_INCREMENT = 0;
TRUNCATE TABLE `candidatura_gubernatura`; 
ALTER TABLE `candidatura_gubernatura` AUTO_INCREMENT = 0;
TRUNCATE TABLE `candidatura_regiduria`;
ALTER TABLE `candidatura_regiduria` AUTO_INCREMENT = 0;
TRUNCATE TABLE `candidatura_sindicatura`;  
ALTER TABLE `candidatura_sindicatura` AUTO_INCREMENT = 0;
TRUNCATE TABLE `historial`; 
ALTER TABLE `historial` AUTO_INCREMENT = 0;
TRUNCATE TABLE `registro`;   
ALTER TABLE `registro` AUTO_INCREMENT = 0;
TRUNCATE TABLE `candidatura_renuncia`;
ALTER TABLE `candidatura_renuncia` AUTO_INCREMENT = 0;
DELETE FROM `candidatura_documentado` WHERE `candidatura_documentado`.`id` > 0;
ALTER TABLE `candidatura_documentado` AUTO_INCREMENT = 0;

UPDATE `folios` SET `no_folio` = '000001' WHERE `folios`.`id_folio` = 1;

UPDATE `folios` SET `no_folio` = '000001' WHERE `folios`.`id_folio` = 2;

UPDATE `folios` SET `no_folio` = '000001' WHERE `folios`.`id_folio` = 3;

UPDATE `folios` SET `no_folio` = '000001' WHERE `folios`.`id_folio` = 4;