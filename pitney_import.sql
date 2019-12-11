DROP TABLE IF EXISTS public.pitney_bowes_pois CASCADE;
DROP TABLE IF EXISTS public.pitney_tmp CASCADE;

CREATE TABLE public.pitney_bowes_pois (
    name character varying,
    brandname character varying,
    pb_id bigint,
    trade_name character varying,
    franchise_name character varying,
    iso3 character varying,
    areaname4 character varying,
    areaname3 character varying,
    areaname2 character varying,
    areaname1 character varying,
    stabb character varying,
    postcode double precision,
    formattedaddress character varying,
    mainaddressline character varying,
    addresslastline character varying,
    longitude double precision,
    latitude double precision,
    georesult character varying,
    confidence_code character varying,
    country_access_code double precision,
    tel_num character varying,
    faxnum character varying,
    email character varying,
    http character varying,
    open_24h double precision,
    business_line character varying,
    sic1 double precision,
    sic2 double precision,
    sic8 double precision,
    sic8_description character varying,
    alt_industry_code double precision,
    micode integer,
    trade_division character varying,
    "group" character varying,
    class character varying,
    sub_class character varying,
    employee_here double precision,
    employee_count double precision,
    year_start double precision,
    sales_volume_local double precision,
    sales_volume_us_dollars double precision,
    currency_code double precision,
    agent_code character varying,
    legal_status_code double precision,
    status_code double precision,
    subsidiary_indicator double precision,
    parent_business_name character varying,
    parent_address character varying,
    parent_street_address character varying,
    parent_areaname3 character varying,
    parent_areaname1 character varying,
    parent_country character varying,
    parent_postcode character varying,
    domestic_ultimate_business_name character varying,
    domestic_ultimate_address character varying,
    domestic_ultimate_street_address character varying,
    domestic_ultimate_areaname3 character varying,
    domestic_ultimate_areaname1 character varying,
    domestic_ultimate_postcode character varying,
    global_ultimate_indicator character varying,
    global_ultimate_business_name character varying,
    global_ultimate_address character varying,
    global_ultimate_street_address character varying,
    global_ultimate_areaname3 character varying,
    global_ultimate_areaname1 character varying,
    global_ultimate_country character varying,
    global_ultimate_postcode character varying,
    family_members double precision,
    hierarchy_code double precision,
    ticker_symbol character varying,
    exchange_name character varying
);

-- Before perfoming next stop, login to postgis docker and download the csv file to below location

COPY public.pitney_bowes_pois FROM '/home/WPPOI_AUS.csv' CSV HEADER;

CREATE TABLE public.pitney_tmp as (SELECT * FROM public.pitney_bowes_pois);

DELETE FROM public.pitney_tmp 
WHERE CLASS IN ('PUBLIC AMENITY', 'PUBLIC TRANSPORT STOP', 'EATING PLACES/RESTAURANTS', 'PUBLIC UTILITIES', 'ACCESS GATEWAY',
               'SWIMMING POOL', 'TIMBER TRACTS', 'IMPORTANT TOURIST ATTRACTION', 'TENNIS COURT', 'RAILWAY STATION', 'BEACH',
               'GOLF COURSE', 'ROAD AND RAIL', 'PARK, AND RECREATION AREA', 'FRUIT AND VEGETABLE MARKETS', 'PARK AND RECREATION AREA',
               'RIFLE RANGE', 'TERMINAL AND SERVICE FACILITIES FOR MOTOR VEHICLE PASSENGER', 'WOOD CONTAINERS', 'ZOO, ARBORETA, AND BOTANICAL GARDEN',
               'BARBER SHOPS', 'LEISURE CENTER', 'THEATER', 'DAIRY FARMS', 'CINEMA', 'WATER WELL DRILLING', 'WINERY', 
               'HUNTING AND TRAPPING, AND GAME PROPAGATION', 'BEAUTY SHOPS', 'WATER SPORT', 'GENERAL FARMS, PRIMARILY CROP',
               'HORTICULTURAL SPECIALTIES', 'HOCKEY', 'SPORTS CENTER', 'NIGHTLIFE', 'LOGGING', 'WATER SUPPLY', 'PRIVATE HOUSEHOLDS',
               'LANDSCAPE AND HORTICULTURAL SERVICES', 'LAWN BOWLING GREEN', 'MOTION PICTURE THEATERS', 'BOWLING CENTERS', 
               'LIBRARIES', 'CYCLING/BMX', 'HORTICULTURAL SPECIALTIES', '');

ALTER TABLE public.pitney_tmp ADD COLUMN wkb_geometry geometry(Point, 4326);
UPDATE public.pitney_tmp SET wkb_geometry = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326);

ALTER TABLE public.pitney_tmp ADD COLUMN fid SERIAL PRIMARY KEY;

DROP TABLE IF EXISTS public.customers1905 CASCADE;

CREATE TABLE public.customers1905 as (SELECT * FROM public.pitney_tmp);

CREATE INDEX customers1905_gix ON public.customers1905 USING gist (wkb_geometry);
CREATE INDEX customers1905_idx ON public.customers1905 USING btree (name, stabb, postcode, formattedaddress, trade_division, employee_count, year_start, sales_volume_us_dollars, ticker_symbol);

DROP TABLE IF EXISTS public.pitney_tmp CASCADE;
CREATE INDEX customers1905_addr_idx ON public.customers1905 (formattedaddress);
CREATE INDEX customers1905_lat_idx ON public.customers1905 (latitude);
CREATE INDEX customers1905_lng_idx ON public.customers1905 (longitude);
CREATE INDEX customers1905_name_idx ON public.customers1905 (name);
CREATE INDEX customers1905_rev_idx ON public.customers1905 (sales_volume_us_dollars);
CREATE INDEX customers1905_employee_idx ON public.customers1905 (employee_count);
CREATE INDEX customers1905_ste_idx ON public.customers1905 (stabb);

VACUUM FULL public.customers1905;
ANALYZE public.customers1905;
