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
-- Name: info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.info (
    name character varying(50),
    gamesplayed integer,
    bestgame integer
);


ALTER TABLE public.info OWNER TO freecodecamp;

--
-- Data for Name: info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.info VALUES ('user_1679475040114', NULL, NULL);
INSERT INTO public.info VALUES ('user_1679475040113', NULL, NULL);
INSERT INTO public.info VALUES ('user_1679475328004', NULL, NULL);
INSERT INTO public.info VALUES ('user_1679475328003', NULL, NULL);
INSERT INTO public.info VALUES ('user_1679475483735', NULL, NULL);
INSERT INTO public.info VALUES ('user_1679475483734', NULL, NULL);
INSERT INTO public.info VALUES ('user_1679475771423', NULL, NULL);
INSERT INTO public.info VALUES ('user_1679475771422', NULL, NULL);
INSERT INTO public.info VALUES ('user_1679475809579', NULL, NULL);
INSERT INTO public.info VALUES ('user_1679475809578', NULL, NULL);
INSERT INTO public.info VALUES ('user_1679475833510', NULL, NULL);
INSERT INTO public.info VALUES ('user_1679475833509', NULL, NULL);
INSERT INTO public.info VALUES ('user_1679476855208', NULL, NULL);
INSERT INTO public.info VALUES ('user_1679476855207', NULL, NULL);
INSERT INTO public.info VALUES ('user_1679477381187', 2, 659);
INSERT INTO public.info VALUES ('user_1679478760000', 2, 109);
INSERT INTO public.info VALUES ('user_1679477381188', 4, 341);
INSERT INTO public.info VALUES ('user_1679478760001', 4, 6);
INSERT INTO public.info VALUES ('t', 1, 15);
INSERT INTO public.info VALUES ('Fabi', 1, 2);
INSERT INTO public.info VALUES ('Fabi', 1, 2);
INSERT INTO public.info VALUES ('user_1679478947696', 2, 236);
INSERT INTO public.info VALUES ('user_1679478947697', 5, 101);
INSERT INTO public.info VALUES ('Gabi', 14, 1);
INSERT INTO public.info VALUES ('user_1679478469248', 2, NULL);
INSERT INTO public.info VALUES ('user_1679478469249', 4, NULL);
INSERT INTO public.info VALUES ('all', 2, 1);
INSERT INTO public.info VALUES ('user_1679479011937', 2, 26);
INSERT INTO public.info VALUES ('test1', 2, 1);
INSERT INTO public.info VALUES ('test2', 1, 1);
INSERT INTO public.info VALUES ('user_1679479011938', 5, 333);
INSERT INTO public.info VALUES ('user_1679478665645', 2, 293);
INSERT INTO public.info VALUES ('user_1679478665646', 4, 140);
INSERT INTO public.info VALUES ('user_1679479033031', 2, 373);
INSERT INTO public.info VALUES ('user_1679478713396', 2, 188);
INSERT INTO public.info VALUES ('user_1679479033032', 5, 275);
INSERT INTO public.info VALUES ('user_1679478713397', 5, 40);


--
-- PostgreSQL database dump complete
--

