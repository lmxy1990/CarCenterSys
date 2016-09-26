-- MySQL Script generated by MySQL Workbench
-- 09/24/16 18:03:52
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema car_center_sys
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `car_center_sys` ;

-- -----------------------------------------------------
-- Schema car_center_sys
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `car_center_sys` DEFAULT CHARACTER SET utf8 ;
USE `car_center_sys` ;

-- -----------------------------------------------------
-- Table `car_center_sys`.`manage_info_tab`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `car_center_sys`.`manage_info_tab` ;

CREATE TABLE IF NOT EXISTS `car_center_sys`.`manage_info_tab` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `adminName` VARCHAR(45) NOT NULL,
  `adminPassword` VARCHAR(45) NOT NULL,
  `adminPower` TINYINT(1) NOT NULL,
  `adminRealName` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `adminName_UNIQUE` (`adminName` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_center_sys`.`user_info_tab`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `car_center_sys`.`user_info_tab` ;

CREATE TABLE IF NOT EXISTS `car_center_sys`.`user_info_tab` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(45) NOT NULL,
  `userPassword` VARCHAR(45) NOT NULL,
  `userUnit` VARCHAR(45) NULL,
  `userTel` VARCHAR(15) NULL,
  `userMile` INT NOT NULL,
  `userNo` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `userName_UNIQUE` (`userName` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `userNo_UNIQUE` (`userNo` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_center_sys`.`service_info_tab`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `car_center_sys`.`service_info_tab` ;

CREATE TABLE IF NOT EXISTS `car_center_sys`.`service_info_tab` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `serviceName` VARCHAR(100) NOT NULL,
  `servicePrice` DECIMAL(10,2) NOT NULL,
  `canReserve` TINYINT(1) NOT NULL,
  `serviceDescribe` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `serviceName_UNIQUE` (`serviceName` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_center_sys`.`service_state_tab`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `car_center_sys`.`service_state_tab` ;

CREATE TABLE IF NOT EXISTS `car_center_sys`.`service_state_tab` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `stateName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_center_sys`.`consume_info_tab`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `car_center_sys`.`consume_info_tab` ;

CREATE TABLE IF NOT EXISTS `car_center_sys`.`consume_info_tab` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userId` BIGINT NOT NULL,
  `serviceId` INT NOT NULL,
  `remarks` VARCHAR(100) NULL,
  `stateId` INT NOT NULL,
  `consumeTime` VARCHAR(45) NOT NULL,
  `realPrice` DECIMAL(10,2) NOT NULL,
  `adminId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `serviceKey_idx` (`serviceId` ASC),
  INDEX `stateKey_idx` (`stateId` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `userKey_idx` (`userId` ASC),
  INDEX `adminKey_idx` (`adminId` ASC),
  CONSTRAINT `serviceKey`
    FOREIGN KEY (`serviceId`)
    REFERENCES `car_center_sys`.`service_info_tab` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `stateKey`
    FOREIGN KEY (`stateId`)
    REFERENCES `car_center_sys`.`service_state_tab` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `userKey`
    FOREIGN KEY (`userId`)
    REFERENCES `car_center_sys`.`user_info_tab` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `adminKey`
    FOREIGN KEY (`adminId`)
    REFERENCES `car_center_sys`.`manage_info_tab` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `car_center_sys`.`manage_info_tab`
-- -----------------------------------------------------
START TRANSACTION;
USE `car_center_sys`;
INSERT INTO `car_center_sys`.`manage_info_tab` (`id`, `adminName`, `adminPassword`, `adminPower`, `adminRealName`) VALUES (1, 'admin', '123456', 1, '超级管理员');

COMMIT;


-- -----------------------------------------------------
-- Data for table `car_center_sys`.`service_info_tab`
-- -----------------------------------------------------
START TRANSACTION;
USE `car_center_sys`;
INSERT INTO `car_center_sys`.`service_info_tab` (`id`, `serviceName`, `servicePrice`, `canReserve`, `serviceDescribe`) VALUES (1, '洗车', 20, true, '洗车服务');
INSERT INTO `car_center_sys`.`service_info_tab` (`id`, `serviceName`, `servicePrice`, `canReserve`, `serviceDescribe`) VALUES (2, '车辆检查', 30, true, '车辆基故障检查(不包括处理)');

COMMIT;


-- -----------------------------------------------------
-- Data for table `car_center_sys`.`service_state_tab`
-- -----------------------------------------------------
START TRANSACTION;
USE `car_center_sys`;
INSERT INTO `car_center_sys`.`service_state_tab` (`id`, `stateName`) VALUES (1, '预约成功');
INSERT INTO `car_center_sys`.`service_state_tab` (`id`, `stateName`) VALUES (2, '在修');
INSERT INTO `car_center_sys`.`service_state_tab` (`id`, `stateName`) VALUES (3, '完工');
INSERT INTO `car_center_sys`.`service_state_tab` (`id`, `stateName`) VALUES (4, '已取消');

COMMIT;

