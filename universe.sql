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
    galaxy_type character varying(30) NOT NULL,
    galaxy_age integer,
    distance numeric,
    name character varying(60) NOT NULL
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
    planet_id integer,
    is_spherical boolean,
    moon_age numeric,
    name character varying(60) NOT NULL
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
    planet_distance integer NOT NULL,
    star_id integer,
    has_life boolean,
    is_spherical boolean,
    name character varying(60) NOT NULL
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
-- Name: relation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.relation (
    name character varying(60) NOT NULL,
    relation_id integer NOT NULL,
    idk text
);


ALTER TABLE public.relation OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    star_age integer NOT NULL,
    star_type text NOT NULL,
    galaxy_id integer,
    name character varying(60) NOT NULL
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Barred Spiral Galaxy', 14, 26000, 'Milky Way');
INSERT INTO public.galaxy VALUES (2, 'Spiral Galaxy', 10, 2.5, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'Spiral Galaxy', 13, 3, 'Triangulum');
INSERT INTO public.galaxy VALUES (4, 'Lenticular Galaxy', 13, 31, 'Sombrero');
INSERT INTO public.galaxy VALUES (5, 'Spiral Galaxy', 10, 31, 'Whirlpool');
INSERT INTO public.galaxy VALUES (6, 'Irregular Galaxy', 13, 163000, 'Large Magellanic');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, false, 500, 'MOON1');
INSERT INTO public.moon VALUES (2, 1, false, 500, 'MOON2');
INSERT INTO public.moon VALUES (3, 1, false, 500, 'MOON3');
INSERT INTO public.moon VALUES (4, 2, false, 500, 'MOON4');
INSERT INTO public.moon VALUES (6, 2, false, 500, 'MOON5');
INSERT INTO public.moon VALUES (7, 2, false, 500, 'MOON6');
INSERT INTO public.moon VALUES (8, 2, false, 500, 'MOON7');
INSERT INTO public.moon VALUES (9, 3, false, 500, 'MOON8');
INSERT INTO public.moon VALUES (10, 4, false, 500, 'MOON9');
INSERT INTO public.moon VALUES (11, 4, false, 500, 'MOON10');
INSERT INTO public.moon VALUES (12, 4, false, 500, 'MOON11');
INSERT INTO public.moon VALUES (13, 4, false, 500, 'MOON12');
INSERT INTO public.moon VALUES (14, 8, false, 500, 'MOON14');
INSERT INTO public.moon VALUES (15, 8, false, 500, 'MOON15');
INSERT INTO public.moon VALUES (16, 8, false, 500, 'MOON16');
INSERT INTO public.moon VALUES (17, 12, false, 500, 'MOON19');
INSERT INTO public.moon VALUES (18, 12, false, 500, 'MOON17');
INSERT INTO public.moon VALUES (19, 12, false, 500, 'MOON18');
INSERT INTO public.moon VALUES (20, 10, false, 500, 'MOON20');
INSERT INTO public.moon VALUES (21, 10, false, 500, 'MOON21');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 5000, 1, false, true, 'none');
INSERT INTO public.planet VALUES (2, 3000, 1, false, true, 'none1');
INSERT INTO public.planet VALUES (3, 30, 1, false, true, 'none2');
INSERT INTO public.planet VALUES (4, 30, 2, false, true, 'none4');
INSERT INTO public.planet VALUES (5, 660, 2, false, true, 'none5');
INSERT INTO public.planet VALUES (6, 660, 3, false, true, 'none7');
INSERT INTO public.planet VALUES (8, 660, 3, false, true, 'none8');
INSERT INTO public.planet VALUES (9, 660, 3, false, true, 'none9');
INSERT INTO public.planet VALUES (10, 660, 3, false, true, 'none10');
INSERT INTO public.planet VALUES (11, 660, 2, false, true, 'none11');
INSERT INTO public.planet VALUES (12, 660, 5, false, true, 'none12');
INSERT INTO public.planet VALUES (13, 660, 6, false, true, 'none15');


--
-- Data for Name: relation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.relation VALUES ('ABC', 1, NULL);
INSERT INTO public.relation VALUES ('DEF', 2, NULL);
INSERT INTO public.relation VALUES ('GHI', 3, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 8, 'M1-2 la-ab', 1, 'Betelguese');
INSERT INTO public.star VALUES (2, 14, 'Supermassive BlackHole', 1, 'Sagittarius A*');
INSERT INTO public.star VALUES (3, 100, 'Cepheid Variable Star', 2, 'M31-V1');
INSERT INTO public.star VALUES (4, 10, 'Red Variable', 2, 'M31-RV');
INSERT INTO public.star VALUES (5, 100, 'Blue Giant', 3, 'M33-X7');
INSERT INTO public.star VALUES (6, 100, 'Variable Star', 3, 'UBV-76');
INSERT INTO public.star VALUES (7, 100, 'Blue Giant', 4, 'M104-UVIT-BG');
INSERT INTO public.star VALUES (8, 200, 'Red Giant', 4, 'M104-Redgiant-1');
INSERT INTO public.star VALUES (9, 200, 'Neutron Star', 5, 'M51-ULX-7');
INSERT INTO public.star VALUES (10, 10, 'Supernova', 5, 'SN-2005cs');
INSERT INTO public.star VALUES (11, 2, 'Wolf-Rayet', 6, 'R135a1');
INSERT INTO public.star VALUES (12, 5, 'SUPERNOVA', 6, 'SN 1987A');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


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
-- Name: relation relation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relation
    ADD CONSTRAINT relation_name_key UNIQUE (name);


--
-- Name: relation relation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relation
    ADD CONSTRAINT relation_pkey PRIMARY KEY (relation_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

