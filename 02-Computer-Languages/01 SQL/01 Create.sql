CREATE TABLE customer (
    id					integer,
    k_name				varchar(255),
    strasse				varchar(255),
    pLZ					varchar(255),
    ort					varchar(255),
    typ					varchar(255),
    grp					varchar(255),
    art					varchar(255),
    latitude			numeric(17,10),
    longitude			numeric(17,10),
    PRIMARY KEY         (id)
);


CREATE TABLE plant (
    id					varchar(255),
    strasse				varchar(255),
    plz					varchar(255),
    ort					varchar(255),
    latitude			numeric(17,10),
    longitude			numeric(17,10),
    PRIMARY KEY         (id)
);


CREATE TABLE shipment (
    id					integer,
    delivery_day		varchar(255),
    plant				varchar(255),
    customer			integer,
    pallets				numeric(17,10),
    gw_kg				numeric(17,10),
    tt_1				varchar(255),
    tt_2				varchar(255)
);
