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
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    galaxy_type character varying(20)
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth_in_ly numeric(6,1),
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth_in_ly numeric(6,1),
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_orbited_by_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_orbited_by_moon (
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    description text,
    planet_orbited_by_moon_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.planet_orbited_by_moon OWNER TO freecodecamp;

--
-- Name: planet_orbited_by_moon_planet_orbited_by_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_orbited_by_moon_planet_orbited_by_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_orbited_by_moon_planet_orbited_by_moon_id_seq OWNER TO freecodecamp;

--
-- Name: planet_orbited_by_moon_planet_orbited_by_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_orbited_by_moon_planet_orbited_by_moon_id_seq OWNED BY public.planet_orbited_by_moon.planet_orbited_by_moon_id;


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
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth_in_ly numeric(6,1),
    galaxy_id integer NOT NULL
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
-- Name: planet_orbited_by_moon planet_orbited_by_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_orbited_by_moon ALTER COLUMN planet_orbited_by_moon_id SET DEFAULT nextval('public.planet_orbited_by_moon_planet_orbited_by_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a typical spiral galaxy.', 9500, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest spiral galaxy to the Milky Way.', 9400, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A smaller spiral galaxy in the Local Group.', 9300, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way, irregular in shape.', 9200, 'Irregular');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'A smaller satellite galaxy.', 9100, 'Irregular');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Notable for its bright nucleus and prominent dust lane.', 9000, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4500, 0.0, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 4000, 0.0, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 4000, 0.0, 4);
INSERT INTO public.moon VALUES (4, 'Io', 4600, 0.0, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 4600, 0.0, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4600, 0.0, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4600, 0.0, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 4600, 0.0, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4600, 0.0, 6);
INSERT INTO public.moon VALUES (10, 'Rhea', 4600, 0.0, 6);
INSERT INTO public.moon VALUES (11, 'Titania', 4600, 0.0, 7);
INSERT INTO public.moon VALUES (12, 'Oberon', 4600, 0.0, 7);
INSERT INTO public.moon VALUES (13, 'Triton', 4600, 0.0, 8);
INSERT INTO public.moon VALUES (14, 'Charon', 4600, 0.0, 9);
INSERT INTO public.moon VALUES (15, 'Proxima b Moon', 4850, 4.2, 10);
INSERT INTO public.moon VALUES (16, 'Proxima c Moon', 4850, 4.2, 11);
INSERT INTO public.moon VALUES (17, 'Sirius b Moon', 242, 8.6, 12);
INSERT INTO public.moon VALUES (18, 'Betelgeuse I Moon', 10, 642.5, 13);
INSERT INTO public.moon VALUES (19, 'Rigel I Moon', 8, 860.0, 14);
INSERT INTO public.moon VALUES (20, 'Alpha Centauri Ab Moon', 5000, 4.3, 15);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, true, 4600, 0.0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, true, 4600, 0.0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, true, 4600, 0.0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, true, 4600, 0.0, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, true, 4600, 0.0, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, true, 4600, 0.0, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, true, 4600, 0.0, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, true, 4600, 0.0, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', false, true, 4600, 0.0, 1);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', false, true, 4850, 4.2, 5);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri c', false, true, 4850, 4.2, 5);
INSERT INTO public.planet VALUES (12, 'Sirius b', false, true, 242, 8.6, 2);
INSERT INTO public.planet VALUES (13, 'Betelgeuse I', false, true, 10, 642.5, 3);
INSERT INTO public.planet VALUES (14, 'Rigel I', false, true, 8, 860.0, 4);
INSERT INTO public.planet VALUES (15, 'Alpha Centauri Ab', false, true, 5000, 4.3, 6);
INSERT INTO public.planet VALUES (16, 'Alpha Centauri Ac', false, true, 5000, 4.3, 6);


--
-- Data for Name: planet_orbited_by_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_orbited_by_moon VALUES (3, 1, 'Moon orbits Earth', 1, NULL);
INSERT INTO public.planet_orbited_by_moon VALUES (4, 2, 'Phobos orbits Mars', 2, NULL);
INSERT INTO public.planet_orbited_by_moon VALUES (4, 3, 'Deimos orbits Mars', 3, NULL);
INSERT INTO public.planet_orbited_by_moon VALUES (5, 4, 'Io orbits Jupiter', 4, NULL);
INSERT INTO public.planet_orbited_by_moon VALUES (5, 5, 'Europa orbits Jupiter', 5, NULL);
INSERT INTO public.planet_orbited_by_moon VALUES (5, 6, 'Ganymede orbits Jupiter', 6, NULL);
INSERT INTO public.planet_orbited_by_moon VALUES (5, 7, 'Callisto orbits Jupiter', 7, NULL);
INSERT INTO public.planet_orbited_by_moon VALUES (6, 8, 'Titan orbits Saturn', 8, NULL);
INSERT INTO public.planet_orbited_by_moon VALUES (6, 9, 'Enceladus orbits Saturn', 9, NULL);
INSERT INTO public.planet_orbited_by_moon VALUES (6, 10, 'Rhea orbits Saturn', 10, NULL);
INSERT INTO public.planet_orbited_by_moon VALUES (7, 11, 'Titania orbits Uranus', 11, NULL);
INSERT INTO public.planet_orbited_by_moon VALUES (7, 12, 'Oberon orbits Uranus', 12, NULL);
INSERT INTO public.planet_orbited_by_moon VALUES (8, 13, 'Triton orbits Neptune', 13, NULL);
INSERT INTO public.planet_orbited_by_moon VALUES (9, 14, 'Charon orbits Pluto', 14, NULL);
INSERT INTO public.planet_orbited_by_moon VALUES (10, 15, 'Moon of Proxima Centauri b', 15, NULL);
INSERT INTO public.planet_orbited_by_moon VALUES (11, 16, 'Moon of Proxima Centauri c', 16, NULL);
INSERT INTO public.planet_orbited_by_moon VALUES (12, 17, 'Moon of Sirius b', 17, NULL);
INSERT INTO public.planet_orbited_by_moon VALUES (13, 18, 'Moon of Betelgeuse I', 18, NULL);
INSERT INTO public.planet_orbited_by_moon VALUES (14, 19, 'Moon of Rigel I', 19, NULL);
INSERT INTO public.planet_orbited_by_moon VALUES (15, 20, 'Moon of Alpha Centauri Ab', 20, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our solar system.', 4600, 0.0, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'The brightest star in the Earth''s night sky.', 242, 8.6, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A red supergiant in the Orion constellation.', 10, 642.5, 1);
INSERT INTO public.star VALUES (4, 'Rigel', 'A blue supergiant in the Orion constellation.', 8, 860.0, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'The closest star to the Sun, part of the Alpha Centauri system.', 4850, 4.2, 1);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 'A component of the nearest star system to the Sun.', 5000, 4.3, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_orbited_by_moon_planet_orbited_by_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_orbited_by_moon_planet_orbited_by_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


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
-- Name: planet_orbited_by_moon planet_orbited_by_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_orbited_by_moon
    ADD CONSTRAINT planet_orbited_by_moon_name_key UNIQUE (name);


--
-- Name: planet_orbited_by_moon planet_orbited_by_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_orbited_by_moon
    ADD CONSTRAINT planet_orbited_by_moon_pkey PRIMARY KEY (planet_orbited_by_moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


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
-- Name: planet_orbited_by_moon planet_orbited_by_moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_orbited_by_moon
    ADD CONSTRAINT planet_orbited_by_moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: planet_orbited_by_moon planet_orbited_by_moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_orbited_by_moon
    ADD CONSTRAINT planet_orbited_by_moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

