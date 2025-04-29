create database TicketBookingSystem;
use TicketBookingSystem;

create table venu
(
venue_id int primary key,
venue_name varchar(50) not null,
address varchar(250) not null
);

create table event
(
event_id int primary key,
event_name varchar(50),
event_date date,
event_time time,
venue_id int,
foreign key(venue_id) references venue(venue_id),
total_seats int,
available_seats int,
ticket_price decimal,
event_type enum('movie','sports','concert'),
foreign key(booking_id) references booking (booking_id)
);

create table customer
(
customer_id int primary key,
customer_name varchar(50),
email varchar(20),
phone_number int,
foreign key (booking_id) references booking(booking_id)
);

create table booking
(
booking_id int primary key,
customer_id int,
event_id int,
num_tickets int,
total_cost int,
booking_date date,
foreign key (customer_id) references customer(customer_id),
foreign key (event_id) references event(event_id)
);

