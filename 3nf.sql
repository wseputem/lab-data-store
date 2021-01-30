CREATE TABLE public.holder (
  id integer PRIMARY KEY ,
  full_name char(50),
  phone char(50),
  address_direction char(50)
) ;

CREATE TABLE public.place (
  id integer PRIMARY KEY,
  full_name char(50),
  address_direction char(50)
) ;

CREATE TABLE public.realization (
  id integer PRIMARY KEY,
  date date,
  amount integer,
  address_direction char(50),
  place_id integer DEFAULT NULL,
  holder_id integer DEFAULT NULL,
  FOREIGN KEY (place_id) REFERENCES place(id),
  FOREIGN KEY (holder_id) REFERENCES holder(id)
) ;

CREATE TABLE public.category (
  id integer PRIMARY KEY,
  full_name char(50)
) ;

CREATE TABLE public.event (
  id integer PRIMARY KEY,
  full_name char(50),
  category_id integer DEFAULT NULL,
  FOREIGN KEY (category_id) REFERENCES category(id)
) ;

CREATE TABLE public.event_realization (
  event_id integer DEFAULT NULL,
  realization_id integer DEFAULT NULL,
  FOREIGN KEY (event_id) REFERENCES event(id),
  FOREIGN KEY (realization_id) REFERENCES realization(id)
) ;

CREATE TABLE public.member (
  id integer PRIMARY KEY,
  full_name char(50),
  phone char(50),
  address_direction char(50)
) ;

CREATE TABLE public.event_member (
  event_id integer DEFAULT NULL,
  member_id integer DEFAULT NULL,
  FOREIGN KEY (event_id) REFERENCES event(id),
  FOREIGN KEY (member_id) REFERENCES member(id)
) ;

CREATE TABLE public.sponsor (
  id integer PRIMARY KEY,
  full_name char(50),
  phone char(50),
  address_direction char(50)
) ;

CREATE TABLE public.event_sponsor (
  event_id integer DEFAULT NULL,
  sponsor_id integer DEFAULT NULL,
  FOREIGN KEY (event_id) REFERENCES event(id),
  FOREIGN KEY (sponsor_id) REFERENCES sponsor(id)
) ;
