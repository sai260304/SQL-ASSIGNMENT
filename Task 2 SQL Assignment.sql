drop database TicketBookingSystem;
create database TicketBookingSystem;
use TicketBookingSystem;

create table venue
(
venue_id int primary key auto_increment,
venue_name varchar(50) not null,
address varchar(250) not null
);

create table event_s
(
event_id int primary key auto_increment,
event_name varchar(50),
event_date date,
event_time time,
venue_id int,
foreign key(venue_id) references venue(venue_id),
total_seats int,
available_seats int,
ticket_price decimal,
booking_id int,
event_type enum('movie','sports','concert')
);
set foreign_key_checks=0;
create table customer
(
customer_id int primary key,
customer_name varchar(50),
email varchar(20),
phone_number varchar(20),
booking_id int
);

create table booking
(
booking_id int primary key auto_increment,
customer_id int,
event_id int,
num_tickets int,
total_cost int,
booking_date date,
foreign key (customer_id) references customer(customer_id),
foreign key (event_id) references event_s(event_id)
);

alter table event_s add foreign key (booking_id) references booking(booking_id);
alter table customer add foreign key (booking_id) references booking(booking_id);

insert into venue (venue_name, address) values
('Stadium A','Pondicherry'),
('Nehru','Delhi'),
('Gandhi ','Chennai'),
('Arena P','New Delhi'),
('Stadium B','Kerala'),
('Sai','Karnataka'),
('Siddarth','J&K'),
('Kaarthik Stadium','Bihar'),
('Theatre','Patna'),
('Mall','Delhi');

insert into event_s (event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price,booking_id, event_type) values
('Music Concert', '2025-05-15', '18:30:00', 1, 5000, 3000, 1500.00,1, 'Concert'),
('Football Match', '2025-06-01', '20:00:00', 2, 20000, 15000, 1200.00,2, 'Sports'),
('Comedy Show', '2025-05-20', '19:00:00', 3, 1500, 1200, 800.00,3, 'Movie'),
('Dance Festival', '2025-05-25', '17:00:00', 4, 2500, 1800, 1000.00,4, 'Concert'),
('Cricket Cup', '2025-07-05', '15:00:00', 5, 30000, 10000, 2000.00,5, 'Sports'),
('Play', '2025-06-10', '18:00:00', 6, 1000, 900, 700.00,6, 'Movie'),
('Party Night', '2025-05-18', '21:00:00', 7, 1200, 1100, 1100.00,7, 'Concert'),
('Techno Cultural', '2025-06-22', '22:00:00', 8, 6000, 4000, 1300.00,8, 'Concert'),
('Basketball Game', '2025-05-30', '19:30:00', 9, 18000, 17000, 1400.00, 9,'Sports'),
('India Film', '2025-07-01', '16:30:00', 10, 800, 600, 950.00,10, 'Movie');

insert into customer (customer_id, customer_name, email, phone_number,booking_id) values
(1,'Sai', 'sai@gmail.com', '9876543000',1),
(2,'Siddarth', 'siddarth@gmail.com', '9876543001',2),
(3,'Akash', 'akash@gmail.com', '9876543002',3),
(4,'Karthikraja', 'karthi@gmail.com', '9876543003',4),
(5,'Thilak', 'thilak@gmail.com', '9876543004',5),
(6,'Hemanathan', 'hema@gmail.com', '9876543005',6),
(7,'Devanathan', 'deva@gmail.com', '9876543006',7),
(8,'Hari', 'hari@gmail.com', '9876543007',8),
(9,'Rohit', 'rohit@gmail.com', '9876543008',9),
(10,'Henry', 'henry@gmail.com', '9876543009',10);

insert into booking (customer_id, event_id, num_tickets, total_cost, booking_date) values
(1, 1, 2, 3000.00, '2025-04-28'),
(2, 2, 4, 4800.00, '2025-04-28'),
(3, 3, 1, 800.00, '2025-04-28'),
(4, 4, 3, 3000.00, '2025-04-28'),
(5, 5, 5, 10000.00, '2025-04-28'),
(1, 6, 1, 700.00, '2025-04-29'),
(2, 7, 2, 2200.00, '2025-04-29'),
(3, 8, 3, 3900.00, '2025-04-29'),
(4, 9, 2, 2800.00, '2025-04-29'),
(5, 10, 1, 950.00, '2025-04-29');
select * from booking;
desc booking;

select booking_id from customer;
select * from event_s;
select * from event_s where available_seats > 0;
select * from event_s where event_name like 'c%';
select * from event_s where ticket_price between 1000 and 2500;
select * from event_s where event_date between '2025-05-01' and '2025-06-30';
select * from event_s where available_seats >0 and event_type ='concert';
select * from customer limit 5 offset 5;
select * from booking where num_tickets > 4;
select * from customer where phone_number like '%000';
select * from event_s where total_seats > 15000 order by total_seats desc;
select * from event_s where event_name not like 'x%' and event_name not like '%y' and event_name not like 'z%';


