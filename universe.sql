--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    star_id integer NOT NULL,
    name text NOT NULL,
    description character varying(100),
    age_in_millions_of_years integer,
    stimated_parts integer DEFAULT 0 NOT NULL,
    distance_from_star_in_au numeric(10,2),
    type character varying(100),
    visible_by_human_eye boolean NOT NULL,
    beautiful_to_watch boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.asteroid ALTER COLUMN asteroid_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.asteroid_asteroid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    amount_stimated_stars integer,
    distance_from_earth_in_light_years numeric(10,5),
    type character varying(100),
    visible_by_human_eye boolean NOT NULL,
    beautiful_to_watch boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    stimated_size integer,
    distance_from_planet_in_km numeric(10,2),
    type character varying(100),
    visible_by_human_eye boolean NOT NULL,
    beautiful_to_watch boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    amount_stimated_moons integer DEFAULT 0 NOT NULL,
    distance_from_star_in_au numeric(10,2),
    type character varying(100),
    visible_by_human_eye boolean NOT NULL,
    beautiful_to_watch boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    amount_stimated_planets integer,
    distance_from_galaxy_center_in_light_years numeric(10,5),
    type character varying(100),
    visible_by_human_eye boolean NOT NULL,
    beautiful_to_watch boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid OVERRIDING SYSTEM VALUE VALUES (1, 4, 'PostgreSQL', 'Not Linux, but open source', 43, 111, 74334.51, 'DB', false, true);
INSERT INTO public.asteroid OVERRIDING SYSTEM VALUE VALUES (2, 4, 'Kubernetes', 'Conteiners everywhere', 13, 11, 744334.54, 'CONTEINER', false, true);
INSERT INTO public.asteroid OVERRIDING SYSTEM VALUE VALUES (3, 4, 'WordPress', 'For web and blogs', 4, 0, 71234.52, 'CMS', false, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Vegetal galaxium', 'A Galaxy only made by vegetables, not animals in there', 23, 10, 23425.24342, 'VEGGIE', true, true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, 'Mineral Galaximininus', 'A galaxy full of rich minerals only', 50, 40, 90867.52623, 'DEAD', false, NULL);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'IT CEOS galactic', 'Where suddenly appears tech CEOs', 40, 6, 1234.56789, 'SMART', true, false);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, 'Hippies Maximus', 'Full of flowers and veggie food', 100, 1000, 7777.77700, 'VEGGIE', true, true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'Gas and more gas', 'Everything looks solid, but isn''t', NULL, 10, 4234.54300, 'DEAD', true, true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (7, 'Disneyland', 'A galaxy of fairytales', 100, 1000, 7777.70000, 'SMART', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 3, 'Ubuntu', 'Big Comunity', 15, 123, 233443.42, 'EASYTOUSE', true, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 3, 'Mint', 'Elegant', 8, 42, 43342.42, 'EASYTOUSE', true, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 3, 'PureOS', 'Made for privacy', 2, 442, 433421.40, 'SECURITY', false, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 3, 'Peppermint OS', 'Changed to debian on 2022', 3, 42, 4334211.40, 'LIGHT', false, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 3, 'Knoppix', 'Light to use in a USB', 6, 412, 4331.40, 'LIGHT', false, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 3, 'Vanilla OS', 'Always the same', 7, 51, 43333.40, 'SECURITY', false, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 16, 'CentOS', 'Open RHEL', 1, 43, 443333.42, 'OPENSOURCE', true, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 16, 'Scientific Linux', 'For scientific prouposes', 3, 42, 78233.58, 'CIENTIFIC', false, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 16, 'EulerOS', 'Made by Huawei', 46, 32, 7824.50, 'SECURITY', false, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 16, 'AlmaLinux', 'To reemplace CentOS', 43, 22, 71824.50, 'OPENSOURCE', false, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 16, 'Navy Linux', 'Minimal hardware', 13, 2, 741824.50, 'CIENTIFIC', false, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 3, 'Serviclub', 'Mostly a card with points so you keep buying', 113, 32, 7414.51, 'COMMERCIAL', false, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 3, 'Infinia', 'Worst of the naftas', 13, 322, 73414.51, 'NAFTA', false, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 3, 'Super', 'Best of the naftas', 131, 32, 7344.51, 'NAFTA', false, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 3, 'Infinia Diesel', 'Worst of the diesels', 131, 32, 7344.51, 'DIESEL', false, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 3, 'UltraDiesel', 'Best of the diesels', 161, 92, 731434.51, 'DIESEL', false, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 3, 'YPF Agro', 'For the gauchos', 41, 91, 733434.51, 'COOMERCIAL', false, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 3, 'Y-TEC', 'Technology and innovation in third world', 46, 41, 73934.51, 'COMMERCIAL', false, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 14, 'Colorado Chaqueño', 'Schinopsis balansae', 6, 1, 7934.51, 'PACHAMAMA', true, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 14, 'Colorado Santiagueño', 'Schinopsis lorentzii', 36, 6, 79234.51, 'PACHAMAMA', true, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (21, 14, 'Colorado del cerro', 'Horco-quebracho', 6, 15, 721934.51, 'PACHAMAMA', true, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (22, 14, 'Abuelo', 'Located in Villa Allende', 63, 11, 79334.51, 'PACHAMAMA', true, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 3, 'Debian', 'Made to be more intuitive', 16, 5, 3443.42, 'OPENSOURCE', true, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 4, 'YPF', 'Maybe I will buy some shares', 4, 50, 12898.12, 'NATIONAL', true, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 5, 'Loto', 'A simbol of enlightment', 2, 5, 4445.42, 'LIGHT', false, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 3, 'Solaris', 'I have not idea', 2, 3, 3443.42, 'OPENSOURCE', false, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 5, 'Ceibo', 'A national symbol', 1000, 1, 31443.42, 'NATIONAL', true, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 2, 'Jacaranda', 'Awesome color', 5, 15, 32443.43, 'NATIONAL', true, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 3, 'Slackware', 'Old planet', 16, 5, 13443.42, 'OPENSOURCE', false, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 3, 'Arch', 'For nerds only', 13, 0, 4325.42, 'OPENSOURCE', false, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 4, 'SHELL', 'Why shell, nobody knows', 2, 1000, 1234.99, 'PRIVATE', true, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (13, 2, 'Aloe Vera', 'Great as a medicine and food', 5, 150, 2234.34, 'HEALER', true, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (14, 2, 'Quebracho', 'Its roots goes to the planet core', NULL, 2, 42223.13, 'PACHAMAMA', true, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (16, 3, 'RHEL', 'Linux Enterprise', NULL, 1, 3443.42, NULL, true, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Aromatic Star', 'This star emanates a beatufil smell', 20, 10, 3123.23000, 'AROMA', true, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 1, 'Leaf star', 'Gives energy to the planets by flying leafs', 19, 8, 3923.23300, 'TREE', true, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 4, 'Linus Tovalds', 'Technically its not a CEO, but is an STAR', 17, 35, 123.23400, 'OPENSOURCE', true, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 6, 'Heater star', 'Provides energy to planets with a stream of gas', NULL, 35, 123.23400, 'CHEVRON', true, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 1, 'Flower Star', 'Looks awesome and smell awesome', 17, 10, 3032.24300, 'AROMA', false, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 5, 'San Francisco', 'This star does not emanates a beatufil smell', 15, 13, 34234.54600, 'AROMA', true, true);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

