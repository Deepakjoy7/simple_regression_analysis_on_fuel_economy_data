create database fuel_economy; # Creating DB fuel economy
use fuel_economy;

CREATE TABLE `fuel_economy`.`fe2010` ( #Creating table fe2010
	id int auto_increment primary key,
  `EngDispl` DECIMAL(2,1) NOT NULL,
  `NumCyl` INT NOT NULL,
  `FE` DECIMAL(6,4) NOT NULL,
  `NumGears` INT NOT NULL,
  `TransLockup` INT NOT NULL,
  `TransCreeperGear` INT NOT NULL,
  `IntakeValvePerCyl` INT NOT NULL,
  `ExhaustValvesPerCyl` INT NOT NULL,
  `VarValveTiming` INT NOT NULL,
  `VarValveLift` INT NOT NULL);
ALTER TABLE fe2010 ADD        #Adding the Xvariable value to the table fe2010
Xvariable decimal(4,3) DEFAULT -4.518 NOT NULL;
ALTER TABLE fe2010 ADD        #Adding the Intercept value to the table fe2010
Intercept decimal(4,2) DEFAULT 50.55 NOT NULL;
 
CREATE TABLE `fuel_economy`.`fe2011` ( #Creating table fe2011
	id int auto_increment primary key,
  `EngDispl` DECIMAL(2,1) NOT NULL,
  `NumCyl` INT NOT NULL,
  `FE` DECIMAL(6,4) NOT NULL,
  `NumGears` INT NOT NULL,
  `TransLockup` INT NOT NULL,
  `TransCreeperGear` INT NOT NULL,
  `IntakeValvePerCyl` INT NOT NULL,
  `ExhaustValvesPerCyl` INT NOT NULL,
  `VarValveTiming` INT NOT NULL,
  `VarValveLift` INT NOT NULL); 
# Table Data import wizard is used to import the csv files of fe2010 & fe2011 to the tables  
alter table fe2010 add Predictedvalues double;   # Adding new column in fe2010 for 2011's prediction
SET SQL_SAFE_UPDATES = 0;

update fe2010,fe2011   #Predicting fe2011's FE using the xvariable and intercept from fe2010 table
set fe2010.Predictedvalues=fe2010.Intercept+ (fe2010.Xvariable*fe2011.EngDispl) 
where fe2010.id=fe2011.id;                                          #Prediction column is added to fe2010

select * from fe2010; #to view the updated table fe2010 
select * from fe2011; #to view table fe2011
