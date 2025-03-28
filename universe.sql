--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type text,
    distance_from_earth numeric NOT NULL,
    has_black_hole boolean,
    number_of_stars bigint NOT NULL,
    age_in_million_years bigint NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    radius numeric NOT NULL,
    is_spherical boolean,
    has_atmosphere boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    mass numeric NOT NULL,
    radius integer,
    has_life boolean,
    is_habitable boolean,
    distance_from_star integer NOT NULL,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: space_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_station (
    space_station_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    capacity integer NOT NULL,
    is_operational boolean
);


ALTER TABLE public.space_station OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_station_space_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_station_space_station_id_seq OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_station_space_station_id_seq OWNED BY public.space_station.space_station_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    type text NOT NULL,
    age integer NOT NULL,
    mass integer,
    is_visible boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_station space_station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station ALTER COLUMN space_station_id SET DEFAULT nextval('public.space_station_space_station_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 0, true, 100000000000, 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, false, 1000000000000, 10000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000, false, 40000000, 4000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23000000, true, 100000000, 13000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 29000000, true, 80000000, 9000);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 163000, false, 30000000, 14000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737, true, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6, false, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821, true, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560, true, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, true, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, true, false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2575, true, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 252, true, true);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 198, true, false);
INSERT INTO public.moon VALUES (11, 'Oberon', 8, 1523, true, false);
INSERT INTO public.moon VALUES (12, 'Titania', 8, 1577, true, false);
INSERT INTO public.moon VALUES (13, 'Ariel', 8, 1158, true, false);
INSERT INTO public.moon VALUES (14, 'Umbriel', 8, 1169, true, false);
INSERT INTO public.moon VALUES (15, 'Miranda', 8, 471, true, false);
INSERT INTO public.moon VALUES (16, 'Triton', 7, 1353, true, true);
INSERT INTO public.moon VALUES (17, 'Proteus', 7, 210, true, false);
INSERT INTO public.moon VALUES (18, 'Nereid', 7, 170, true, false);
INSERT INTO public.moon VALUES (19, 'Larissa', 7, 97, false, false);
INSERT INTO public.moon VALUES (20, 'Galatea', 7, 88, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 5.972, 6371, true, true, 150, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0.64171, 3389, false, false, 228, 2);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 4.867, 6051, false, false, 108, 0);
INSERT INTO public.planet VALUES (4, 'Mercury', 1, 0.330, 2439, false, false, 58, 0);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 1898, 69911, false, false, 778, 4);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 568, 58232, false, false, 1430, 3);
INSERT INTO public.planet VALUES (7, 'Neptune', 1, 102, 24622, false, false, 4500, 3);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 86, 25362, false, false, 2900, 5);
INSERT INTO public.planet VALUES (9, 'Proxima b', 4, 1.27, 7160, false, true, 4, 0);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 5, 1.1, 6300, false, false, 5, 0);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', 6, 36, 22700, false, true, 600, 0);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 6, 3.1, 18000, false, true, 20, 0);


--
-- Data for Name: space_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_station VALUES (1, 'ISS', 1, 10, true);
INSERT INTO public.space_station VALUES (2, 'Alpha Station', 1, 20, true);
INSERT INTO public.space_station VALUES (3, 'Starbase One', 2, 50, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 4600, 1989, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type', 250, 202, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red Supergiant', 8000, 11600, true);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'Red Dwarf', 4850, 122, true);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1, 'G-type', 5300, 1100, true);
INSERT INTO public.star VALUES (6, 'Vega', 1, 'A-type', 450, 2100, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_station_space_station_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_station space_station_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_name_key UNIQUE (name);


--
-- Name: space_station space_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_pkey PRIMARY KEY (space_station_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: space_station space_station_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

