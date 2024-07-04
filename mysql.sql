create table address(
id int not null,
address char(50),
primary key (id)
);

insert into address values(1, '123 Main St-San Francisco-CA 94105'),
(2, '456 Elm St-Los Angeles-CA 90001'),
(3, '789 Oak Ave-Seattle-WA 98101'),
(4, '456 Pine St-Oakland-CA 94607'),
(5, '1600 Pennsylvania Ave NW-Washington-DC 20500'),
(6, '10 Downing St-London-SW1A 2AA' ),
(7, '50 Rockefeller Plaza-New York City-NY 10020'),
(8, '36 Champs-Élysées-Paris 75008'),
(9, '77 Sunset Blvd-Los Angeles-CA 90069'),
(10, '1 Microsoft Way-Redmond-WA 98052'),
(11, '123 Sesame St-New York City-NY 10001') ,
(12, '221B Baker St-London-NW1 6DU'), 
(13, '1600 Amphitheatre Parkway-Mountain View-CA 94043');

select * from address;

drop table address;
select *, 
	substring_index(address, '-',1) street, 
	substring_index(substring_index(address, '-',2), '-',-1) city,
	substring_index(substring_index(address, '-', -1), ' ', 1) state
from address;