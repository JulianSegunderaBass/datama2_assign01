-- MySQL Script generated by MySQL Workbench
-- Wed Oct 30 20:44:41 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema anytime_fitness
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema anytime_fitness
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `anytime_fitness` DEFAULT CHARACTER SET utf8 ;
USE `anytime_fitness` ;

-- -----------------------------------------------------
-- Table `anytime_fitness`.`branchoffice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anytime_fitness`.`branchoffice` (
  `id` INT NOT NULL,
  `branch_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_branchoffice_branch1_idx` (`branch_id` ASC) ,
  CONSTRAINT `fk_branchoffice_branch1`
    FOREIGN KEY (`branch_id`)
    REFERENCES `anytime_fitness`.`branch` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anytime_fitness`.`manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anytime_fitness`.`manager` (
  `id` INT NOT NULL,
  `man_Fname` VARCHAR(30) NOT NULL,
  `man_Lname` VARCHAR(30) NOT NULL,
  `man_MI` VARCHAR(2) NOT NULL,
  `man_address` VARCHAR(45) NOT NULL,
  `man_sex` VARCHAR(15) NOT NULL,
  `month_salary` FLOAT NOT NULL,
  `branch_id` INT NOT NULL,
  `branchoffice_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_manager_branch1_idx` (`branch_id` ASC) ,
  INDEX `fk_manager_branchoffice1_idx` (`branchoffice_id` ASC) ,
  CONSTRAINT `fk_manager_branch1`
    FOREIGN KEY (`branch_id`)
    REFERENCES `anytime_fitness`.`branch` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_manager_branchoffice1`
    FOREIGN KEY (`branchoffice_id`)
    REFERENCES `anytime_fitness`.`branchoffice` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anytime_fitness`.`trainer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anytime_fitness`.`trainer` (
  `id` INT NOT NULL,
  `train_fname` VARCHAR(15) NULL,
  `train_lname` VARCHAR(15) NULL,
  `train_mi` VARCHAR(15) NULL,
  `train_address` VARCHAR(45) NULL,
  `train_sex` VARCHAR(6) NULL,
  `train_hoursalary` INT NULL,
  `branch_id` INT NOT NULL,
  `manager_id` INT NOT NULL,
  `branchoffice_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_trainer_branch1_idx` (`branch_id` ASC) ,
  INDEX `fk_trainer_manager1_idx` (`manager_id` ASC) ,
  INDEX `fk_trainer_branchoffice1_idx` (`branchoffice_id` ASC) ,
  CONSTRAINT `fk_trainer_branch1`
    FOREIGN KEY (`branch_id`)
    REFERENCES `anytime_fitness`.`branch` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trainer_manager1`
    FOREIGN KEY (`manager_id`)
    REFERENCES `anytime_fitness`.`manager` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trainer_branchoffice1`
    FOREIGN KEY (`branchoffice_id`)
    REFERENCES `anytime_fitness`.`branchoffice` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anytime_fitness`.`batch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anytime_fitness`.`batch` (
  `id` INT NOT NULL,
  `batch_type` VARCHAR(20) NULL,
  `batch_start` DATETIME NULL,
  `batch_end` DATETIME NULL,
  `trainer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_batch_trainer1_idx` (`trainer_id` ASC) ,
  CONSTRAINT `fk_batch_trainer1`
    FOREIGN KEY (`trainer_id`)
    REFERENCES `anytime_fitness`.`trainer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anytime_fitness`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anytime_fitness`.`member` (
  `id` INT NOT NULL,
  `mem_fname` VARCHAR(15) NULL,
  `mem_lname` VARCHAR(15) NULL,
  `mem_mi` VARCHAR(15) NULL,
  `mem_address` VARCHAR(45) NULL,
  `mem_sex` VARCHAR(6) NULL,
  `batch_id` INT NOT NULL,
  `trainer_id` INT NOT NULL,
  `branchoffice_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_member_batch_idx` (`batch_id` ASC) ,
  INDEX `fk_member_trainer1_idx` (`trainer_id` ASC) ,
  INDEX `fk_member_branchoffice1_idx` (`branchoffice_id` ASC) ,
  CONSTRAINT `fk_member_batch`
    FOREIGN KEY (`batch_id`)
    REFERENCES `anytime_fitness`.`batch` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_trainer1`
    FOREIGN KEY (`trainer_id`)
    REFERENCES `anytime_fitness`.`trainer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_branchoffice1`
    FOREIGN KEY (`branchoffice_id`)
    REFERENCES `anytime_fitness`.`branchoffice` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anytime_fitness`.`branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anytime_fitness`.`branch` (
  `id` INT NOT NULL,
  `branch_name` VARCHAR(25) NULL,
  `branch_address` VARCHAR(45) NULL,
  `branch_phone` BIGINT(8) NULL,
  `member_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_branch_member1_idx` (`member_id` ASC) ,
  CONSTRAINT `fk_branch_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `anytime_fitness`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anytime_fitness`.`equipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anytime_fitness`.`equipment` (
  `id` INT NOT NULL,
  `eq_type` VARCHAR(30) NOT NULL,
  `eq_name` VARCHAR(30) NOT NULL,
  `eq_cost` FLOAT NOT NULL,
  `eq_weight` FLOAT NOT NULL,
  `branch_id` INT NOT NULL,
  `member_id` INT NOT NULL,
  `manager_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_equipment_branch1_idx` (`branch_id` ASC) ,
  INDEX `fk_equipment_member1_idx` (`member_id` ASC) ,
  INDEX `fk_equipment_manager1_idx` (`manager_id` ASC) ,
  CONSTRAINT `fk_equipment_branch1`
    FOREIGN KEY (`branch_id`)
    REFERENCES `anytime_fitness`.`branch` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipment_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `anytime_fitness`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipment_manager1`
    FOREIGN KEY (`manager_id`)
    REFERENCES `anytime_fitness`.`manager` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anytime_fitness`.`memberbio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anytime_fitness`.`memberbio` (
  `id` INT NOT NULL,
  `mem_fat` FLOAT NOT NULL,
  `mem_muscle` FLOAT NOT NULL,
  `mem_weight` FLOAT NOT NULL,
  `mem_age` INT NOT NULL,
  `mem_height` FLOAT NOT NULL,
  `record_date` DATE NOT NULL,
  `member_id` INT NOT NULL,
  `trainer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_memberbio_member1_idx` (`member_id` ASC) ,
  INDEX `fk_memberbio_trainer1_idx` (`trainer_id` ASC) ,
  CONSTRAINT `fk_memberbio_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `anytime_fitness`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_memberbio_trainer1`
    FOREIGN KEY (`trainer_id`)
    REFERENCES `anytime_fitness`.`trainer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anytime_fitness`.`memberpayment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anytime_fitness`.`memberpayment` (
  `id` INT NOT NULL,
  `pay_amount` FLOAT NOT NULL,
  `pay_date` DATE NOT NULL,
  `pay_type` VARCHAR(10) NOT NULL,
  `member_id` INT NOT NULL,
  `branch_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_memberpayment_member1_idx` (`member_id` ASC) ,
  INDEX `fk_memberpayment_branch1_idx` (`branch_id` ASC) ,
  CONSTRAINT `fk_memberpayment_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `anytime_fitness`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_memberpayment_branch1`
    FOREIGN KEY (`branch_id`)
    REFERENCES `anytime_fitness`.`branch` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anytime_fitness`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anytime_fitness`.`staff` (
  `id` INT NOT NULL,
  `emp_Fname` VARCHAR(30) NOT NULL,
  `emp_Fname` VARCHAR(30) NOT NULL,
  `emp_MI` VARCHAR(2) NOT NULL,
  `emp_add` VARCHAR(45) NOT NULL,
  `emp_sex` VARCHAR(15) NOT NULL,
  `week_salary` FLOAT NOT NULL,
  `manager_id` INT NOT NULL,
  `branch_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_staff_manager1_idx` (`manager_id` ASC) ,
  INDEX `fk_staff_branch1_idx` (`branch_id` ASC) ,
  CONSTRAINT `fk_staff_manager1`
    FOREIGN KEY (`manager_id`)
    REFERENCES `anytime_fitness`.`manager` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_staff_branch1`
    FOREIGN KEY (`branch_id`)
    REFERENCES `anytime_fitness`.`branch` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;