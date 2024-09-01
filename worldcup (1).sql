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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    opponent_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 2018, 'Final', 206, 4, 2, 207);
INSERT INTO public.games VALUES (2, 2018, 'Third Place', 208, 2, 0, 209);
INSERT INTO public.games VALUES (3, 2018, 'Semi-Final', 207, 2, 1, 209);
INSERT INTO public.games VALUES (4, 2018, 'Semi-Final', 206, 1, 0, 208);
INSERT INTO public.games VALUES (5, 2018, 'Quarter-Final', 207, 3, 2, 210);
INSERT INTO public.games VALUES (6, 2018, 'Quarter-Final', 209, 2, 0, 211);
INSERT INTO public.games VALUES (7, 2018, 'Quarter-Final', 208, 2, 1, 212);
INSERT INTO public.games VALUES (8, 2018, 'Quarter-Final', 206, 2, 0, 213);
INSERT INTO public.games VALUES (9, 2018, 'Eighth-Final', 209, 2, 1, 214);
INSERT INTO public.games VALUES (10, 2018, 'Eighth-Final', 211, 1, 0, 215);
INSERT INTO public.games VALUES (11, 2018, 'Eighth-Final', 208, 3, 2, 216);
INSERT INTO public.games VALUES (12, 2018, 'Eighth-Final', 212, 2, 0, 217);
INSERT INTO public.games VALUES (13, 2018, 'Eighth-Final', 207, 2, 1, 218);
INSERT INTO public.games VALUES (14, 2018, 'Eighth-Final', 210, 2, 1, 219);
INSERT INTO public.games VALUES (15, 2018, 'Eighth-Final', 213, 2, 1, 220);
INSERT INTO public.games VALUES (16, 2018, 'Eighth-Final', 206, 4, 3, 221);
INSERT INTO public.games VALUES (17, 2014, 'Final', 222, 1, 0, 221);
INSERT INTO public.games VALUES (18, 2014, 'Third Place', 223, 3, 0, 212);
INSERT INTO public.games VALUES (19, 2014, 'Semi-Final', 221, 1, 0, 223);
INSERT INTO public.games VALUES (20, 2014, 'Semi-Final', 222, 7, 1, 212);
INSERT INTO public.games VALUES (21, 2014, 'Quarter-Final', 223, 1, 0, 224);
INSERT INTO public.games VALUES (22, 2014, 'Quarter-Final', 221, 1, 0, 208);
INSERT INTO public.games VALUES (23, 2014, 'Quarter-Final', 212, 2, 1, 214);
INSERT INTO public.games VALUES (24, 2014, 'Quarter-Final', 222, 1, 0, 206);
INSERT INTO public.games VALUES (25, 2014, 'Eighth-Final', 212, 2, 1, 225);
INSERT INTO public.games VALUES (26, 2014, 'Eighth-Final', 214, 2, 0, 213);
INSERT INTO public.games VALUES (27, 2014, 'Eighth-Final', 206, 2, 0, 226);
INSERT INTO public.games VALUES (28, 2014, 'Eighth-Final', 222, 2, 1, 227);
INSERT INTO public.games VALUES (29, 2014, 'Eighth-Final', 223, 2, 1, 217);
INSERT INTO public.games VALUES (30, 2014, 'Eighth-Final', 224, 2, 1, 228);
INSERT INTO public.games VALUES (31, 2014, 'Eighth-Final', 221, 1, 0, 215);
INSERT INTO public.games VALUES (32, 2014, 'Eighth-Final', 208, 2, 1, 229);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (206, 'France');
INSERT INTO public.teams VALUES (207, 'Croatia');
INSERT INTO public.teams VALUES (208, 'Belgium');
INSERT INTO public.teams VALUES (209, 'England');
INSERT INTO public.teams VALUES (210, 'Russia');
INSERT INTO public.teams VALUES (211, 'Sweden');
INSERT INTO public.teams VALUES (212, 'Brazil');
INSERT INTO public.teams VALUES (213, 'Uruguay');
INSERT INTO public.teams VALUES (214, 'Colombia');
INSERT INTO public.teams VALUES (215, 'Switzerland');
INSERT INTO public.teams VALUES (216, 'Japan');
INSERT INTO public.teams VALUES (217, 'Mexico');
INSERT INTO public.teams VALUES (218, 'Denmark');
INSERT INTO public.teams VALUES (219, 'Spain');
INSERT INTO public.teams VALUES (220, 'Portugal');
INSERT INTO public.teams VALUES (221, 'Argentina');
INSERT INTO public.teams VALUES (222, 'Germany');
INSERT INTO public.teams VALUES (223, 'Netherlands');
INSERT INTO public.teams VALUES (224, 'Costa Rica');
INSERT INTO public.teams VALUES (225, 'Chile');
INSERT INTO public.teams VALUES (226, 'Nigeria');
INSERT INTO public.teams VALUES (227, 'Algeria');
INSERT INTO public.teams VALUES (228, 'Greece');
INSERT INTO public.teams VALUES (229, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 229, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games fk_opponent; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_opponent FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games fk_winner; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_winner FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

