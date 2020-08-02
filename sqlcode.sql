--Creation:
CREATE TABLE weapon
(
 weapon_id INT ,
 weapon_name VARCHAR(20) ,
 weapon_category VARCHAR(20) ,
 quantity INT,
 PRIMARY KEY (weapon_id)
);
CREATE TABLE factory
(
 factory_id INT ,
 factory_name VARCHAR(20) ,
 city VARCHAR(20) ,
 state VARCHAR(20) ,
 phone_no VARCHAR(20) ,
 licencestart_date DATE ,
 licenceend_date DATE ,
 PRIMARY KEY (factory_id)
);
CREATE TABLE firearms
(
weapon_id INT ,
 stock_type VARCHAR(20) ,
 grip_type VARCHAR(20) ,
 muzzle VARCHAR(20) ,
 magazine VARCHAR(20) ,
 caliber VARCHAR(20) ,
 PRIMARY KEY (weapon_id),
 FOREIGN KEY (weapon_id) REFERENCES weapon(weapon_id)
);
CREATE TABLE grenade
(
 weapon_id INT ,
 type VARCHAR(20) ,
 ignition_mixture VARCHAR(30) ,
 max_range INT ,
 delay_time INT ,
 PRIMARY KEY (weapon_id),
 FOREIGN KEY (weapon_id) REFERENCES weapon(weapon_id)
);
CREATE TABLE artilery
(
 weapon_id INT ,
 type VARCHAR(20) ,
 ignition_type VARCHAR(20) ,
 propellent VARCHAR(20) ,
 max_range INT ,
 velocity INT ,
 PRIMARY KEY (weapon_id),
 FOREIGN KEY (weapon_id) REFERENCES weapon(weapon_id),
);
CREATE TABLE non_lethal
(
 weapon_id INT ,
 material VARCHAR(20) ,
 purpose VARCHAR(20),
 PRIMARY KEY (weapon_id),
 FOREIGN KEY (weapon_id) REFERENCES weapon(weapon_id)
);
CREATE TABLE customer
(
 cust_id INT ,
 cust_name VARCHAR(20) ,
 cust_type VARCHAR(20) ,
 contact_num VARCHAR(20) ,
 email_id VARCHAR(20) ,
 PRIMARY KEY (cust_id)
);
CREATE TABLE sale
(
 sale_id INT ,
 cust_id INT ,
 date DATE ,
 total_bill FLOAT ,
 PRIMARY KEY (sale_id),
 FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);
CREATE TABLE sales_record
(
 weapon_id INT ,
 sale_id INT ,
 quantity_purchased INT ,
 amount FLOAT ,
 PRIMARY KEY (weapon_id, sale_id),
 FOREIGN KEY (weapon_id) REFERENCES weapon(weapon_id),
 FOREIGN KEY (sale_id) REFERENCES sale(sale_id)
);
CREATE TABLE supply_countries
(
 factory_id INT ,
 country VARCHAR(20) ,
 FOREIGN KEY (factory_id) REFERENCES factory(factory_id)
);
CREATE TABLE import
(
 factory_id INT ,
 weapon_id INT ,
 date DATE,
 quantity_supplied INT,
 Price FLOAT ,
 FOREIGN KEY (weapon_id) REFERENCES weapon(weapon_id),
 FOREIGN KEY (factory_id) REFERENCES factory(factory_id)
);
CREATE TABLE fact_country
(
 factory_id INT ,
 country VARCHAR(20) ,
 PRIMARY KEY (factory_id),
 FOREIGN KEY (factory_id) REFERENCES factory(factory_id)
);
--Insertion:
insert into weapon values(8120001,'AK-107','firearms',103);
insert into weapon values(8120002,'AEK-97','firearms',234);
insert into weapon values(8120003,'BSA28P','firearms',123);
insert into weapon values(8120004,'CETME','firearms',23);
insert into weapon values(8120005,'FBMSBS','firearms',12);
insert into weapon values(8119001,'M26A2','explosive',156);
insert into weapon values(8119002,'M33','explosive',234);
insert into weapon values(8119003,'M57','explosive',123);
insert into weapon values(8119004,'MK2','explosive',56);
insert into weapon values(8119005,'M68','explosive',12);
insert into weapon values(8320001,'M968','artillary',12);
insert into weapon values(8320002,'HEI','artillary',345);
insert into weapon values(8320003,'HE-T','artillary',456);
insert into weapon values(8320004,'TP-T','artillary',345);
insert into weapon values(8320005,'AP-T','artillary',45);
insert into weapon values(8418001,'strike-pen','non-lethal',45);
insert into weapon values(8418002,'strike-light','non-lethal',56);
insert into weapon values(8418003,'monkey-fist','non-lethal',456);
insert into weapon values(8418004,'pepper-spray','non-lethal',432);
insert into weapon values(8418005,'coldsteelbaseballbat','non-lethal',345);
insert into firearms values(8120001,'sidefoldingpolymer','ar15style','900','30','5.45X39');
insert into firearms
values(8120002,'rectractedtype','pistoltype','900','40','5.45X39');
insert into firearms values(8120003,'tacticaltype','lighttype','1200','45','6.23X22');
insert into firearms
values(8120004,'G3stockbolttype','ar15style','1000','42','4.21X44');
insert into firearms
values(8120005,'rectractedtype','thumbgrip','1050','43','5.22X19');
insert into grenade values(82190001,'fragmentation','leadazide_PETN',45,4);
insert into grenade values(82190002,'fragmentation','leadazide_RDX',55,6);
insert into grenade values(82190003,'offensive','leadstyphnate_PETN',50,5);
insert into grenade values(82190004,'incendiary','leadazide_PETN_RDX',52,7);
insert into grenade
values(82190005,'incendiary','leadstyphnate_PETN_RDX',62,6);
insert into artilery values(8320001,'manned','electric','M31A1E1_stick',0.5,328);
insert into artilery values(8320002,'unmanned','heat','singleperforated',10,1100);
insert into artilery values(8320003,'unmanned','electric','MIpropellant',6,950);
insert into artilery values(8320004,'manned','electric','MI0.7216',7,780);
insert into artilery values(8320005,'manned','heat','M31A1stick',11,950);
insert into non_lethal values(8418001,'aluminium','self_defense');
insert into non_lethal values(8418002,'frosted_glass','self_defense');
insert into non_lethal values(8418003,'monkey_fist','self_defense');
insert into non_lethal values(8418004,'pepper_spray','self_defense');
insert into non_lethal values(8418005,'coldsteelbaseballbat','riot_control');
insert into factory
values(448801,'lockhead_martin','betesda','maryland','8219000223','01-jan1949','04-mar-2095');
insert into factory
values(469902,'baesystems','farnborough','moscow','8214000223','01-feb-1989','04-
may-2099');
insert into factory values(499103,'airbus','blangnac','leiden','8268110223','01-mar1849','04-mar-2021');
insert into factory
values(518204,'thalesgroup','marseille','ladefence','9139000223','10-dec-1978','24-
nov-2056');
insert into factory
values(629105,'almaz_antery','novosibirsk','moscow','5671200223','11-feb1989','14-may-2095');
insert into factory
values(712906,'rheimmetall','dussseldorf','northrhine_west','8219000223','21-jan1989','24-dec-2035');
insert into fact_country values(448801,'US');
insert into fact_country values(469902,'germany');
insert into fact_country values(499103,'UK');
insert into fact_country values(518204,'netherlands');
insert into fact_country values(629105,'france');
insert into fact_country values(712906,'Russia');
insert into supply_countries values(448801,'germany');
insert into supply_countries values(448801,'US');
insert into supply_countries values(448801,'france');
insert into supply_countries values(448801,'india');
insert into supply_countries values(469902,'germany');
insert into supply_countries values(469902,'US');
insert into supply_countries values(499103,'france');
insert into supply_countries values(499103,'Russia');
insert into supply_countries values(518204,'US');
insert into supply_countries values(518204,'germany');
insert into supply_countries values(629105,'france');
insert into supply_countries values(629105,'Russia');
insert into supply_countries values(712906,'germany');
insert into supply_countries values(712906,'US');
insert into import values(448801,8120001,'01-jan-1949',40,57);
insert into import values(469902,8120002,'03-jan-1919',240,20);
insert into import values(469902,8120001,'01-feb-1969',103,50);
insert into import values(499103,8120003,'01-jan-1999',150,57);
insert into import values(518204,8120003,'01-mar-1979',3,47);
insert into import values(448801,8120004,'01-jan-1949',43,5);
insert into import values(629105,8120005,'09-feb-1990',22,8);
insert into import values(712906,8120005,'01-jan-1949',10,97);
insert into import values(448801,82190001,'23-may-1969',256,97);
insert into import values(499103,82190002,'01-oct-1949',344,57);
insert into import values(518204,82190002,'01-jan-1979',9,51);
insert into import values(712906,82190003,'11-mar-1989',197,90);
insert into import values(448801,82190004,'21-nov-1949',22,57);
insert into import values(629105,82190004,'16-jan-1949',12,12);
insert into import values(518204,82190005,'15-oct-1999',99,7);
insert into import values(499103,8320001,'23-mar-2009',45,57);
insert into import values(448801,8320001,'01-jan-1949',4,57);
insert into import values(448801,8320002,'14-may-1979',450,77);
insert into import values(448801,8320003,'01-jan-1949',40,7);
insert into import values(712906,8320003,'17-apr-1989',490,71);
insert into import values(518204,8320004,'27-feb-2011',450,57);
insert into import values(448801,8320005,'01-may-1989',400,32);
insert into import values(629105,8320005,'01-dec-1949',4,23);
insert into import values(518204,8418001,'29-jun-2010',59,18);
insert into import values(518204,8418002,'27-jul-2009',59,18);
insert into import values(469902,8418002,'29-dec-2008',19,18);
insert into import values(518204,8418003,'29-nov-2007',590,1);
insert into import values(629105,8418004,'17-jul-2000',59,18);
insert into import values(518204,8418005,'29-jun-2010',119,28);
insert into customer
values(12001,'krishnasai','navy','9192392345','ksgay31@gmail.com');
insert into customer
values(12002,'raghunagam','airforce','9197398345','nrloda@gmail.com');
insert into customer
values(12003,'abhi','industrialsecurity','678123478','abhi@gmail.com');
insert into customer
values(12004,'hrishiT','navy','678123478','spardhak12@gmail.com');
insert into customer
values(12005,'diwakar','airforce','9081237567','dondiwa12@gmail.com');
insert into customer
values(12006,'kshithija','army','3451238902','tirumija@gmail.com');
insert into customer
values(12007,'joshna','banksecurity','9081234567','bonu12@gmail.com');
insert into sale values(1001,12001,'01-mar-1979',1234);
insert into sale values(1002,12002,'11-may-1979',1734);
insert into sale values(1003,12003,'21-feb-1989',1937);
insert into sale values(1004,12003,'01-mar-1979',1230);
insert into sale values(1005,12004,'17-may-1999',2345);
insert into sale values(1006,12005,'01-dec-2001',1890);
insert into sale values(1007,12006,'17-nov-2002',1789);
insert into sale values(1008,12006,'19-oct-1983',1789);
insert into sale values(1009,12007,'30-aug-2009',1871);
insert into sales_record values(82190005,1001,5,234);
insert into sales_record values(82190004,1004,6,6782);
insert into sales_record values(8120005,1009,4,3456);
insert into sales_record values(82190002,1003,7,7865);
insert into sales_record values(8320005,1007,1,3456);
insert into sales_record values(8120003,1002,3,7685);
insert into sales_record values(82190001,1006,4,8765);
insert into sales_record values(8418005,1001,5,1234);
insert into sales_record values(8418004,1003,1,3421);
insert into sales_record values(8418002,1005,3,2345);
insert into sales_record values(82190005,1007,5,2897);
insert into sales_record values(82190005,1008,7,9866);
insert into sales_record values(8120004,1003,9,3457);
insert into sales_record values(8120001,1009,2,2387);
insert into sales_record values(8120004,1005,6,4562);
insert into sales_record values(8418005,1008,7,9872);
