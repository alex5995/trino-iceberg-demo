--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg110+1)
-- Dumped by pg_dump version 15.3 (Debian 15.3-1.pgdg110+1)

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
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer,
    city character varying(50)
);
ALTER TABLE public.cities OWNER TO postgres;

--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, city) FROM stdin;
1	Milano
2	Sofia
\.

--
-- Name: hive_metastore; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE hive_metastore;
ALTER DATABASE hive_metastore OWNER TO postgres;

--
-- PostgreSQL database dump complete
--
