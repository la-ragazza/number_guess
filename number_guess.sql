--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    total_games integer NOT NULL,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1666640019101', 0, NULL);
INSERT INTO public.users VALUES ('user_1666640019100', 0, NULL);
INSERT INTO public.users VALUES ('Emma', 3, 10);
INSERT INTO public.users VALUES ('user_1666645083984', 2, 196);
INSERT INTO public.users VALUES ('user_1666645083985', 7, 132);
INSERT INTO public.users VALUES ('user_1666645130148', 2, 286);
INSERT INTO public.users VALUES ('user_1666643759021', 2, 299);
INSERT INTO public.users VALUES ('user_1666645130149', 7, 237);
INSERT INTO public.users VALUES ('user_1666643759022', 5, 147);
INSERT INTO public.users VALUES ('user_1666645210875', 2, 220);
INSERT INTO public.users VALUES ('user_1666644065879', 2, 381);
INSERT INTO public.users VALUES ('user_1666644065880', 7, 1001);
INSERT INTO public.users VALUES ('user_1666645210876', 7, 30);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

