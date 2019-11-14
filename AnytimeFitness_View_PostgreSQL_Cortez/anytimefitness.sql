--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10
-- Dumped by pg_dump version 10.10

-- Started on 2019-11-14 08:43:10

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

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2819 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 33016)
-- Name: batch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.batch (
    id integer NOT NULL,
    batch_start time without time zone NOT NULL,
    batch_end time without time zone NOT NULL,
    trainer_id integer NOT NULL,
    batch_type character varying(20) NOT NULL
);


ALTER TABLE public.batch OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 33014)
-- Name: batch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.batch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.batch_id_seq OWNER TO postgres;

--
-- TOC entry 2820 (class 0 OID 0)
-- Dependencies: 198
-- Name: batch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.batch_id_seq OWNED BY public.batch.id;


--
-- TOC entry 197 (class 1259 OID 33005)
-- Name: trainer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trainer (
    id integer NOT NULL,
    train_hoursalary smallint,
    train_address character varying(60) NOT NULL,
    train_fname character varying(15) NOT NULL,
    train_lname character varying(15) NOT NULL,
    train_mi character varying(6),
    train_sex character varying(6) NOT NULL
);


ALTER TABLE public.trainer OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 33032)
-- Name: batch_trainer; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.batch_trainer AS
 SELECT trainer.id,
    trainer.train_lname,
    trainer.train_fname,
    batch.batch_type,
    batch.batch_start,
    batch.batch_end
   FROM (public.trainer
     JOIN public.batch ON ((trainer.id = batch.trainer_id)));


ALTER TABLE public.batch_trainer OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 33003)
-- Name: trainer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trainer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trainer_id_seq OWNER TO postgres;

--
-- TOC entry 2821 (class 0 OID 0)
-- Dependencies: 196
-- Name: trainer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trainer_id_seq OWNED BY public.trainer.id;


--
-- TOC entry 2683 (class 2604 OID 33019)
-- Name: batch id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.batch ALTER COLUMN id SET DEFAULT nextval('public.batch_id_seq'::regclass);


--
-- TOC entry 2682 (class 2604 OID 33008)
-- Name: trainer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainer ALTER COLUMN id SET DEFAULT nextval('public.trainer_id_seq'::regclass);


--
-- TOC entry 2811 (class 0 OID 33016)
-- Dependencies: 199
-- Data for Name: batch; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.batch (id, batch_start, batch_end, trainer_id, batch_type) VALUES (1, '11:45:00', '13:45:00', 3, 'Zumba');
INSERT INTO public.batch (id, batch_start, batch_end, trainer_id, batch_type) VALUES (2, '14:45:00', '16:45:00', 1, 'Crossfit');
INSERT INTO public.batch (id, batch_start, batch_end, trainer_id, batch_type) VALUES (3, '17:45:00', '19:45:00', 3, 'Zumba');


--
-- TOC entry 2809 (class 0 OID 33005)
-- Dependencies: 197
-- Data for Name: trainer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.trainer (id, train_hoursalary, train_address, train_fname, train_lname, train_mi, train_sex) VALUES (1, 800, 'Los Angeles, US', 'Mylene', 'Sal', 'S.', 'Female');
INSERT INTO public.trainer (id, train_hoursalary, train_address, train_fname, train_lname, train_mi, train_sex) VALUES (2, 650, 'California, US', 'Angel', 'Bruce', 'O.', 'Male');
INSERT INTO public.trainer (id, train_hoursalary, train_address, train_fname, train_lname, train_mi, train_sex) VALUES (3, 780, 'Texas, US', 'Isaac', 'Clarke', 'K.', 'Male');


--
-- TOC entry 2822 (class 0 OID 0)
-- Dependencies: 198
-- Name: batch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.batch_id_seq', 3, true);


--
-- TOC entry 2823 (class 0 OID 0)
-- Dependencies: 196
-- Name: trainer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trainer_id_seq', 3, true);


--
-- TOC entry 2685 (class 2606 OID 33013)
-- Name: trainer trainer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainer
    ADD CONSTRAINT trainer_pkey PRIMARY KEY (id);


-- Completed on 2019-11-14 08:43:10

--
-- PostgreSQL database dump complete
--

