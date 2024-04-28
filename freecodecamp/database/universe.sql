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
    description text,
    has_life boolean,
    distance_from_earth numeric,
    galaxy_type character varying(50)
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
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    moon_type character varying(50),
    distance_from_earth numeric,
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
    name character varying(100) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_type character varying(50),
    distance_from_earth numeric,
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    moon_id integer
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    star_type character varying(50),
    distance_from_earth numeric,
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', false, 0, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy to Milky Way', false, 0, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest galaxy in Local Group', false, 0, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Giant elliptical galaxy in Virgo Cluster', false, 0, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Active galaxy in Centaurus constellation', false, 0, 'Elliptical');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral galaxy in Virgo constellation', false, 0, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (39, 'Moon', 'Natural satellite of Earth', false, true, 4500, 'Terrestrial', 384400, 1);
INSERT INTO public.moon VALUES (40, 'Phobos', 'Largest moon of Mars', false, true, 4500, 'Irregular', 9377, 2);
INSERT INTO public.moon VALUES (41, 'Deimos', 'Smaller moon of Mars', false, true, 4500, 'Irregular', 23460, 2);
INSERT INTO public.moon VALUES (42, 'Ganymede', 'Largest moon of Jupiter', false, true, 4500, 'Galilean', 1070400, 3);
INSERT INTO public.moon VALUES (43, 'Callisto', 'Second largest moon of Jupiter', false, true, 4500, 'Galilean', 1882700, 3);
INSERT INTO public.moon VALUES (44, 'Io', 'Innermost of the four Galilean moons of Jupiter', false, true, 4500, 'Galilean', 421700, 3);
INSERT INTO public.moon VALUES (45, 'Europa', 'Second smallest of the four Galilean moons of Jupiter', false, true, 4500, 'Galilean', 670900, 3);
INSERT INTO public.moon VALUES (46, 'Titan', 'Largest moon of Saturn', false, true, 4500, 'Regular', 1221870, 4);
INSERT INTO public.moon VALUES (47, 'Enceladus', 'Sixth-largest moon of Saturn', false, true, 4500, 'Regular', 238040, 4);
INSERT INTO public.moon VALUES (48, 'Rhea', 'Second-largest moon of Saturn', false, true, 4500, 'Regular', 527040, 4);
INSERT INTO public.moon VALUES (49, 'Mimas', 'Smallest and innermost of Saturn larger moons', false, true, 4500, 'Regular', 185540, 4);
INSERT INTO public.moon VALUES (50, 'Titania', 'Largest moon of Uranus', false, true, 4500, 'Regular', 435910, 5);
INSERT INTO public.moon VALUES (51, 'Oberon', 'Second-largest moon of Uranus', false, true, 4500, 'Regular', 582600, 5);
INSERT INTO public.moon VALUES (52, 'Umbriel', 'Dark moon of Uranus', false, true, 4500, 'Regular', 266300, 5);
INSERT INTO public.moon VALUES (53, 'Ariel', 'Moon of Uranus', false, true, 4500, 'Regular', 191020, 5);
INSERT INTO public.moon VALUES (54, 'Triton', 'Largest natural satellite of Neptune', false, true, 4500, 'Regular', 354760, 6);
INSERT INTO public.moon VALUES (55, 'Proteus', 'Second-largest moon of Neptune', false, true, 4500, 'Regular', 117647, 6);
INSERT INTO public.moon VALUES (56, 'Nereid', 'Third-largest moon of Neptune', false, true, 4500, 'Irregular', 5513824, 6);
INSERT INTO public.moon VALUES (57, 'Charon', 'Largest of the five known natural satellites of Pluto', false, true, 4500, 'Regular', 19571, 7);
INSERT INTO public.moon VALUES (65, 'Hippocamp', 'Neptunian moon', false, true, 4500, 'Irregular', 105283, 6);
INSERT INTO public.moon VALUES (66, 'S2004 N 1', 'Neptunian moon', false, true, 4500, 'Irregular', 105283, 6);
INSERT INTO public.moon VALUES (67, 'S2015 136472 1', 'Plutonian moon', false, true, 4500, 'Irregular', 60000, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Third planet from the Sun and the only astronomical object known to harbor life', true, true, 4500, 'Terrestrial', 0.0, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Fourth planet from the Sun and the second smallest planet in the Solar System', false, true, 4500, 'Terrestrial', 0.0, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Fifth planet from the Sun and the largest in the Solar System', false, true, 4500, 'Gas giant', 0.0, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Sixth planet from the Sun and the second-largest in the Solar System', false, true, 4500, 'Gas giant', 0.0, 1);
INSERT INTO public.planet VALUES (5, 'Uranus', 'Seventh planet from the Sun and the third-largest in the Solar System', false, true, 4500, 'Ice giant', 0.0, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Eighth planet from the Sun and the smallest of the Solar System four gas giants', false, true, 4500, 'Ice giant', 0.0, 1);
INSERT INTO public.planet VALUES (7, 'Mercury', 'Smallest planet in the Solar System and the closest to the Sun', false, true, 4500, 'Terrestrial', 0.0, 2);
INSERT INTO public.planet VALUES (8, 'Venus', 'Second planet from the Sun and the hottest in the Solar System', false, true, 4500, 'Terrestrial', 0.0, 2);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf planet in the Kuiper belt', false, true, 4500, 'Dwarf', 0.0, 2);
INSERT INTO public.planet VALUES (10, 'Eris', 'Dwarf planet in the scattered disc', false, true, 4500, 'Dwarf', 0.0, 2);
INSERT INTO public.planet VALUES (11, 'Haumea', 'Dwarf planet in the Kuiper belt', false, true, 4500, 'Dwarf', 0.0, 2);
INSERT INTO public.planet VALUES (12, 'Makemake', 'Dwarf planet and likely the second largest Kuiper belt object', false, true, 4500, 'Dwarf', 0.0, 2);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Moon', 'Natural satellite of Earth', false, true, 4500, NULL);
INSERT INTO public.satellite VALUES (2, 'Phobos', 'Largest moon of Mars', false, true, 4500, NULL);
INSERT INTO public.satellite VALUES (3, 'Deimos', 'Smaller moon of Mars', false, true, 4500, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our solar system star', false, true, 4500, 'G-type main-sequence', 0, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in the night sky', false, true, 250, 'A-type main-sequence', 8.6, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'Closest star system to the Solar System', false, true, 6000, 'G-type main-sequence', 4.37, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 'Closest star system to the Solar System', false, true, 6000, 'K-type main-sequence', 4.37, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'Closest known star to the Sun', false, true, 6000, 'Red dwarf', 4.24, 1);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'Red supergiant in the Orion constellation', false, true, 8000, 'M-type supergiant', 643.1, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 67, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_name_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name_galaxy UNIQUE (name);


--
-- Name: moon unique_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_moon UNIQUE (name);


--
-- Name: planet unique_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_planet UNIQUE (name);


--
-- Name: satellite unique_name_satellite; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT unique_name_satellite UNIQUE (name);


--
-- Name: star unique_name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name_star UNIQUE (name);


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
-- Name: satellite satellite_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

