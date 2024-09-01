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
-- Name: earthlings; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.earthlings (
    earthlings_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age integer
);


ALTER TABLE public.earthlings OWNER TO freecodecamp;

--
-- Name: earthlings_e_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.earthlings_e_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.earthlings_e_id_seq OWNER TO freecodecamp;

--
-- Name: earthlings_e_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.earthlings_e_id_seq OWNED BY public.earthlings.earthlings_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    distance_from_earth integer,
    no_of_columns integer,
    age integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_g_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_g_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_g_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_g_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_g_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    area numeric(8,2),
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_m_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_m_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_m_id_seq OWNER TO freecodecamp;

--
-- Name: moon_m_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_m_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    distance_from_earth integer,
    area integer,
    is_spherical boolean DEFAULT true,
    has_life boolean DEFAULT false,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_p_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_p_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_p_id_seq OWNER TO freecodecamp;

--
-- Name: planet_p_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_p_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    distance_from_earth integer,
    area integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_s_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_s_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_s_id_seq OWNER TO freecodecamp;

--
-- Name: star_s_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_s_id_seq OWNED BY public.star.star_id;


--
-- Name: earthlings earthlings_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earthlings ALTER COLUMN earthlings_id SET DEFAULT nextval('public.earthlings_e_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_g_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_m_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_p_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_s_id_seq'::regclass);


--
-- Data for Name: earthlings; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.earthlings VALUES (1, 'abs', 44);
INSERT INTO public.earthlings VALUES (2, 'gaj', 73);
INSERT INTO public.earthlings VALUES (3, 'jsy', 34);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 125675, 2889, NULL);
INSERT INTO public.galaxy VALUES (2, 'milky way', 15675, 2889, NULL);
INSERT INTO public.galaxy VALUES (3, 'milky way', 15675, 2889, NULL);
INSERT INTO public.galaxy VALUES (4, 'milky way', 15675, 2889, NULL);
INSERT INTO public.galaxy VALUES (5, 'milky way', 15675, 2889, NULL);
INSERT INTO public.galaxy VALUES (6, 'milky way', 15675, 2889, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 628464.00, 'beautiful', 1);
INSERT INTO public.moon VALUES (2, 'moon', 628464.00, 'beautiful', 1);
INSERT INTO public.moon VALUES (3, 'moon', 628464.00, 'beautiful', 1);
INSERT INTO public.moon VALUES (4, 'moon', 628464.00, 'beautiful', 1);
INSERT INTO public.moon VALUES (5, 'moon', 628464.00, 'beautiful', 1);
INSERT INTO public.moon VALUES (6, 'moon', 628464.00, 'beautiful', 1);
INSERT INTO public.moon VALUES (7, 'moon', 628464.00, 'beautiful', 1);
INSERT INTO public.moon VALUES (8, 'moon', 628464.00, 'beautiful', 1);
INSERT INTO public.moon VALUES (9, 'moon', 628464.00, 'beautiful', 1);
INSERT INTO public.moon VALUES (10, 'moon', 628464.00, 'beautiful', 1);
INSERT INTO public.moon VALUES (11, 'moon', 628464.00, 'beautiful', 1);
INSERT INTO public.moon VALUES (12, 'moon', 628464.00, 'beautiful', 1);
INSERT INTO public.moon VALUES (13, 'moon', 628464.00, 'beautiful', 1);
INSERT INTO public.moon VALUES (14, 'moon', 628464.00, 'beautiful', 1);
INSERT INTO public.moon VALUES (15, 'moon', 628464.00, 'beautiful', 1);
INSERT INTO public.moon VALUES (16, 'moon', 628464.00, 'beautiful', 1);
INSERT INTO public.moon VALUES (17, 'moon', 628464.00, 'beautiful', 1);
INSERT INTO public.moon VALUES (18, 'moon', 628464.00, 'beautiful', 1);
INSERT INTO public.moon VALUES (19, 'moon', 628464.00, 'beautiful', 1);
INSERT INTO public.moon VALUES (20, 'moon', 628464.00, 'beautiful', 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', 0, 3628464, true, true, 1);
INSERT INTO public.planet VALUES (2, 'earth', 0, 3628464, true, true, 1);
INSERT INTO public.planet VALUES (3, 'earth', 0, 3628464, true, true, 1);
INSERT INTO public.planet VALUES (4, 'earth', 0, 3628464, true, true, 1);
INSERT INTO public.planet VALUES (5, 'earth', 0, 3628464, true, true, 1);
INSERT INTO public.planet VALUES (6, 'earth', 0, 3628464, true, true, 1);
INSERT INTO public.planet VALUES (7, 'earth', 0, 3628464, true, true, 1);
INSERT INTO public.planet VALUES (8, 'earth', 0, 3628464, true, true, 1);
INSERT INTO public.planet VALUES (9, 'earth', 0, 3628464, true, true, 1);
INSERT INTO public.planet VALUES (10, 'earth', 0, 3628464, true, true, 1);
INSERT INTO public.planet VALUES (11, 'earth', 0, 3628464, true, true, 1);
INSERT INTO public.planet VALUES (12, 'earth', 0, 3628464, true, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 185675, 288656, 1);
INSERT INTO public.star VALUES (2, 'sun', 185675, 288656, 2);
INSERT INTO public.star VALUES (3, 'sun', 185675, 288656, 3);
INSERT INTO public.star VALUES (4, 'sun', 185675, 288656, 4);
INSERT INTO public.star VALUES (5, 'sun', 185675, 288656, 5);
INSERT INTO public.star VALUES (6, 'sun', 185675, 288656, 6);


--
-- Name: earthlings_e_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.earthlings_e_id_seq', 1, false);


--
-- Name: galaxy_g_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_g_id_seq', 1, false);


--
-- Name: moon_m_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_m_id_seq', 1, false);


--
-- Name: planet_p_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_p_id_seq', 1, false);


--
-- Name: star_s_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_s_id_seq', 1, false);


--
-- Name: earthlings earthlings_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earthlings
    ADD CONSTRAINT earthlings_pkey PRIMARY KEY (earthlings_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique1 UNIQUE (galaxy_id);


--
-- Name: planet unique2; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique2 UNIQUE (planet_id);


--
-- Name: star unique3; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique3 UNIQUE (star_id);


--
-- Name: moon unique4; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique4 UNIQUE (moon_id);


--
-- Name: earthlings unique5; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earthlings
    ADD CONSTRAINT unique5 UNIQUE (earthlings_id);


--
-- Name: moon f_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT f_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet f_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT f_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

