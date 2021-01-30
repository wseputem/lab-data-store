CREATE TABLE public.hab_holder (
  hash_id bytea PRIMARY KEY ,
  load_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_source varchar(255) NOT NULL
);

CREATE TABLE public.hab_place (
  hash_id bytea PRIMARY KEY ,
  load_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_source varchar(255) NOT NULL
);

CREATE TABLE public.hab_realization (
  hash_id bytea PRIMARY KEY,
  load_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_source varchar(255) NOT NULL
);

CREATE TABLE public.hab_category (
  hash_id bytea PRIMARY KEY,
  load_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_source varchar(255) NOT NULL
);

CREATE TABLE public.hab_event (
  hash_id bytea PRIMARY KEY,
  load_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_source varchar(255) NOT NULL
);

CREATE TABLE public.hab_sponsor (
  hash_id bytea PRIMARY KEY,
  load_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_source varchar(255) NOT NULL
);

CREATE TABLE public.hab_member (
  hash_id bytea PRIMARY KEY,
  load_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_source varchar(255) NOT NULL
);

CREATE TABLE public.link_realization (
  hash_id bytea PRIMARY KEY,
  load_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_source varchar(255) NOT NULL,
  hab_realization_hash_id bytea NOT NULL,
  hab_place_hash_id bytea NOT NULL,
  hab_holder_hash_id bytea NOT NULL,
  FOREIGN KEY (hab_realization_hash_id) REFERENCES hab_realization(hash_id),
  FOREIGN KEY (hab_place_hash_id) REFERENCES hab_place(hash_id),
  FOREIGN KEY (hab_holder_hash_id) REFERENCES hab_holder(hash_id)
);

CREATE TABLE public.link_event (
  hash_id bytea PRIMARY KEY,
  load_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_source varchar(255) NOT NULL,
  hab_event_hash_id bytea NOT NULL,
  hab_category_hash_id bytea NOT NULL,
  FOREIGN KEY (hab_event_hash_id) REFERENCES hab_event(hash_id),
  FOREIGN KEY (hab_category_hash_id) REFERENCES hab_category(hash_id)
);

CREATE TABLE public.link_event_realization (
  hash_id bytea PRIMARY KEY,
  load_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_source varchar(255) NOT NULL,
  hab_realization_hash_id bytea NOT NULL,
  hab_event_hash_id bytea NOT NULL,
  FOREIGN KEY (hab_realization_hash_id) REFERENCES hab_realization(hash_id),
  FOREIGN KEY (hab_event_hash_id) REFERENCES hab_event(hash_id)
);

CREATE TABLE public.link_event_sponsor (
  hash_id bytea PRIMARY KEY,
  load_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_source varchar(255) NOT NULL,
  hab_sponsor_hash_id bytea NOT NULL,
  hab_event_hash_id bytea NOT NULL,
  FOREIGN KEY (hab_sponsor_hash_id) REFERENCES hab_sponsor(hash_id),
  FOREIGN KEY (hab_event_hash_id) REFERENCES hab_event(hash_id)
);

CREATE TABLE public.link_event_member (
  hash_id bytea PRIMARY KEY,
  load_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_source varchar(255) NOT NULL,
  hab_event_hash_id bytea NOT NULL,
  hab_member_hash_id bytea NOT NULL,
  FOREIGN KEY (hab_member_hash_id) REFERENCES hab_member(hash_id),
  FOREIGN KEY (hab_event_hash_id) REFERENCES hab_event(hash_id)
);

CREATE TABLE public.sat_holder (
  full_name varchar(255) NOT NULL,
  phone_number varchar(255) NOT NULL,
  address_direction varchar(255) NOT NULL,
  hab_holder_hash_id bytea NOT NULL,
  load_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_source varchar(255) NOT NULL,
  FOREIGN KEY (hab_holder_hash_id) REFERENCES hab_holder(hash_id)
);

CREATE TABLE public.sat_place (
  full_name varchar(255) NOT NULL,
  address_direction varchar(255) NOT NULL,
  hab_place_hash_id bytea NOT NULL,
  load_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_source varchar(255) NOT NULL,
  FOREIGN KEY (hab_place_hash_id) REFERENCES hab_place(hash_id)
);

CREATE TABLE public.sat_category (
  full_name varchar(255) NOT NULL,
  hab_category_hash_id bytea NOT NULL,
  load_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_source varchar(255) NOT NULL,
  FOREIGN KEY (hab_category_hash_id) REFERENCES hab_category(hash_id)
);

CREATE TABLE public.sat_realization (
  date_realisation date NOT NULL,
  Amount integer NOT NULL,
  hab_realization_hash_id bytea NOT NULL,
  load_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_source varchar(255) NOT NULL,
  FOREIGN KEY (hab_realization_hash_id) REFERENCES hab_realization(hash_id)
);

CREATE TABLE public.sat_event (
  full_name varchar(255) NOT NULL,
  hab_event_hash_id bytea NOT NULL,
  load_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_source varchar(255) NOT NULL,
  FOREIGN KEY (hab_event_hash_id) REFERENCES hab_event(hash_id)
);

CREATE TABLE public.sat_sponsor (
  full_name varchar(255) NOT NULL,
  phone_number varchar(255) NOT NULL,
  address_direction varchar(255) NOT NULL,
  hab_sponsor_hash_id bytea NOT NULL,
  load_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_source varchar(255) NOT NULL,
  FOREIGN KEY (hab_sponsor_hash_id) REFERENCES hab_sponsor(hash_id)
);

CREATE TABLE public.sat_member (
  full_name varchar(255) NOT NULL,
  phone_number varchar(255) NOT NULL,
  address_direction varchar(255) NOT NULL,
  hab_member_hash_id bytea NOT NULL,
  load_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_source varchar(255) NOT NULL,
  FOREIGN KEY (hab_member_hash_id) REFERENCES hab_member(hash_id)
);