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
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    name character varying(256) NOT NULL,
    weight numeric NOT NULL,
    diameter integer,
    description text,
    distance integer,
    isgigantic boolean,
    isgoable boolean,
    unique_blackhole_name character varying(256)
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_blackhole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(64),
    weight numeric NOT NULL,
    diameter integer NOT NULL,
    description text,
    distance integer,
    isgigantic boolean,
    isgoable boolean,
    unique_name character varying(256)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(256) NOT NULL,
    weight numeric NOT NULL,
    diameter integer,
    description text,
    distance integer,
    isgigantic boolean,
    isgoable boolean,
    unique_moon_name character varying(256),
    planet_id integer
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
    name character varying(256) NOT NULL,
    weight numeric NOT NULL,
    diameter integer,
    description text,
    distance integer,
    isgigantic boolean,
    isgoable boolean,
    unique_planet_name character varying(256),
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(256) NOT NULL,
    weight numeric NOT NULL,
    diameter integer,
    description text,
    distance integer,
    isgigantic boolean,
    isgoable boolean,
    unique_galaxy_name character varying(256),
    galaxy_id integer
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
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_blackhole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, 'blackhole_1', 1, 1, 'blackhole_1', 1, false, true, 'blackhole_unique_1');
INSERT INTO public.blackhole VALUES (2, 'blackhole_2', 2, 2, 'blackhole_2', 2, false, true, 'blackhole_unique_2');
INSERT INTO public.blackhole VALUES (3, 'blackhole_3', 3, 3, 'blackhole_3', 3, false, true, 'blackhole_unique_3');
INSERT INTO public.blackhole VALUES (4, 'blackhole_4', 4, 4, 'blackhole_4', 4, false, true, 'blackhole_unique_4');
INSERT INTO public.blackhole VALUES (5, 'blackhole_5', 5, 5, 'blackhole_5', 5, false, true, 'blackhole_unique_5');
INSERT INTO public.blackhole VALUES (6, 'blackhole_6', 6, 6, 'blackhole_6', 6, false, true, 'blackhole_unique_6');
INSERT INTO public.blackhole VALUES (7, 'blackhole_7', 7, 7, 'blackhole_7', 7, false, true, 'blackhole_unique_7');
INSERT INTO public.blackhole VALUES (8, 'blackhole_8', 8, 8, 'blackhole_8', 8, false, true, 'blackhole_unique_8');
INSERT INTO public.blackhole VALUES (9, 'blackhole_9', 9, 9, 'blackhole_9', 9, false, true, 'blackhole_unique_9');
INSERT INTO public.blackhole VALUES (10, 'blackhole_10', 10, 10, 'blackhole_10', 10, false, true, 'blackhole_unique_10');
INSERT INTO public.blackhole VALUES (11, 'blackhole_11', 11, 11, 'blackhole_11', 11, false, true, 'blackhole_unique_11');
INSERT INTO public.blackhole VALUES (12, 'blackhole_12', 12, 12, 'blackhole_12', 12, false, true, 'blackhole_unique_12');
INSERT INTO public.blackhole VALUES (13, 'blackhole_13', 13, 13, 'blackhole_13', 13, false, true, 'blackhole_unique_13');
INSERT INTO public.blackhole VALUES (14, 'blackhole_14', 14, 14, 'blackhole_14', 14, false, true, 'blackhole_unique_14');
INSERT INTO public.blackhole VALUES (15, 'blackhole_15', 15, 15, 'blackhole_15', 15, false, true, 'blackhole_unique_15');
INSERT INTO public.blackhole VALUES (16, 'blackhole_16', 16, 16, 'blackhole_16', 16, false, true, 'blackhole_unique_16');
INSERT INTO public.blackhole VALUES (17, 'blackhole_17', 17, 17, 'blackhole_17', 17, false, true, 'blackhole_unique_17');
INSERT INTO public.blackhole VALUES (18, 'blackhole_18', 18, 18, 'blackhole_18', 18, false, true, 'blackhole_unique_18');
INSERT INTO public.blackhole VALUES (19, 'blackhole_19', 19, 19, 'blackhole_19', 19, false, true, 'blackhole_unique_19');
INSERT INTO public.blackhole VALUES (20, 'blackhole_20', 20, 20, 'blackhole_20', 20, false, true, 'blackhole_unique_20');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy_1', 1, 1, 'galaxy_1', 1, true, true, 'galaxy_unique_1');
INSERT INTO public.galaxy VALUES (2, 'galaxy_2', 2, 2, 'galaxy_2', 2, false, true, 'galaxy_unique_2');
INSERT INTO public.galaxy VALUES (3, 'galaxy_3', 3, 3, 'galaxy_3', 3, false, true, 'galaxy_unique_3');
INSERT INTO public.galaxy VALUES (4, 'galaxy_4', 4, 4, 'galaxy_4', 4, false, true, 'galaxy_unique_4');
INSERT INTO public.galaxy VALUES (5, 'galaxy_5', 5, 5, 'galaxy_5', 5, false, true, 'galaxy_unique_5');
INSERT INTO public.galaxy VALUES (6, 'galaxy_6', 6, 6, 'galaxy_6', 6, false, true, 'galaxy_unique_6');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon_1', 1, 1, 'moon_1', 1, false, true, 'moon_unique_1', 1);
INSERT INTO public.moon VALUES (2, 'moon_2', 2, 2, 'moon_2', 2, false, true, 'moon_unique_2', 2);
INSERT INTO public.moon VALUES (3, 'moon_3', 3, 3, 'moon_3', 3, false, true, 'moon_unique_3', 3);
INSERT INTO public.moon VALUES (4, 'moon_4', 4, 4, 'moon_4', 4, false, true, 'moon_unique_4', 4);
INSERT INTO public.moon VALUES (5, 'moon_5', 5, 5, 'moon_5', 5, false, true, 'moon_unique_5', 5);
INSERT INTO public.moon VALUES (6, 'moon_6', 6, 6, 'moon_6', 6, false, true, 'moon_unique_6', 6);
INSERT INTO public.moon VALUES (7, 'moon_7', 7, 7, 'moon_7', 7, false, true, 'moon_unique_7', 1);
INSERT INTO public.moon VALUES (8, 'moon_8', 8, 8, 'moon_8', 8, false, true, 'moon_unique_8', 2);
INSERT INTO public.moon VALUES (9, 'moon_9', 9, 9, 'moon_9', 9, false, true, 'moon_unique_9', 3);
INSERT INTO public.moon VALUES (10, 'moon_10', 10, 10, 'moon_10', 10, false, true, 'moon_unique_10', 4);
INSERT INTO public.moon VALUES (11, 'moon_11', 11, 11, 'moon_11', 11, false, true, 'moon_unique_11', 5);
INSERT INTO public.moon VALUES (12, 'moon_12', 12, 12, 'moon_12', 12, false, true, 'moon_unique_12', 12);
INSERT INTO public.moon VALUES (13, 'moon_13', 13, 13, 'moon_13', 13, false, true, 'moon_unique_13', 6);
INSERT INTO public.moon VALUES (14, 'moon_14', 14, 14, 'moon_14', 14, false, true, 'moon_unique_14', 7);
INSERT INTO public.moon VALUES (15, 'moon_15', 15, 15, 'moon_15', 15, false, true, 'moon_unique_15', 8);
INSERT INTO public.moon VALUES (16, 'moon_16', 16, 16, 'moon_16', 16, false, true, 'moon_unique_16', 9);
INSERT INTO public.moon VALUES (17, 'moon_17', 17, 17, 'moon_17', 17, false, true, 'moon_unique_17', 10);
INSERT INTO public.moon VALUES (18, 'moon_18', 18, 18, 'moon_18', 18, false, true, 'moon_unique_18', 11);
INSERT INTO public.moon VALUES (19, 'moon_19', 19, 19, 'moon_19', 19, false, true, 'moon_unique_19', 12);
INSERT INTO public.moon VALUES (20, 'moon_20', 20, 20, 'moon_20', 20, false, true, 'moon_unique_20', 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet_1', 1, 1, 'planet_1', 1, false, true, 'planet_unique_1', 1);
INSERT INTO public.planet VALUES (2, 'planet_2', 2, 2, 'planet_2', 2, false, true, 'planet_unique_2', 2);
INSERT INTO public.planet VALUES (3, 'planet_3', 3, 3, 'planet_3', 3, false, true, 'planet_unique_3', 3);
INSERT INTO public.planet VALUES (4, 'planet_4', 4, 4, 'planet_4', 4, false, true, 'planet_unique_4', 4);
INSERT INTO public.planet VALUES (5, 'planet_5', 5, 5, 'planet_5', 5, false, true, 'planet_unique_5', 5);
INSERT INTO public.planet VALUES (6, 'planet_6', 6, 6, 'planet_6', 6, false, true, 'planet_unique_6', 6);
INSERT INTO public.planet VALUES (7, 'planet_7', 7, 7, 'planet_7', 7, false, true, 'planet_unique_7', 1);
INSERT INTO public.planet VALUES (8, 'planet_8', 8, 8, 'planet_8', 8, false, true, 'planet_unique_8', 2);
INSERT INTO public.planet VALUES (9, 'planet_9', 9, 9, 'planet_9', 9, false, true, 'planet_unique_9', 3);
INSERT INTO public.planet VALUES (10, 'planet_10', 10, 10, 'planet_10', 10, false, true, 'planet_unique_10', 4);
INSERT INTO public.planet VALUES (11, 'planet_11', 11, 11, 'planet_11', 11, false, true, 'planet_unique_11', 5);
INSERT INTO public.planet VALUES (12, 'planet_12', 12, 12, 'planet_12', 12, false, true, 'planet_unique_12', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star_1', 1, 1, 'star_1', 1, false, true, 'star_unique_1', 1);
INSERT INTO public.star VALUES (2, 'star_2', 2, 2, 'star_2', 2, false, true, 'star_unique_2', 2);
INSERT INTO public.star VALUES (3, 'star_3', 3, 3, 'star_3', 3, false, true, 'star_unique_3', 3);
INSERT INTO public.star VALUES (4, 'star_4', 4, 4, 'star_4', 4, false, true, 'star_unique_4', 4);
INSERT INTO public.star VALUES (5, 'star_5', 5, 5, 'star_5', 5, false, true, 'star_unique_5', 5);
INSERT INTO public.star VALUES (6, 'star_6', 6, 6, 'star_6', 6, false, true, 'star_unique_6', 6);


--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_blackhole_id_seq', 20, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


--
-- Name: blackhole blackhole_unique_blackhole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_unique_blackhole_name_key UNIQUE (unique_blackhole_name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique_name_key UNIQUE (unique_name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_moon_name_key UNIQUE (unique_moon_name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_planet_name_key UNIQUE (unique_planet_name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique_galaxy_name_key UNIQUE (unique_galaxy_name);


--
-- Name: star galaxy_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_foreign_key FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_foreign_key FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_foreign_key FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

