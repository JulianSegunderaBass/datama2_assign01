--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

-- Started on 2019-11-14 08:48:12

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
-- TOC entry 203 (class 1259 OID 16399)
-- Name: branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branch (
    id integer NOT NULL,
    branch_name character varying(45) NOT NULL,
    branch_address character varying(45) NOT NULL,
    branch_phone integer NOT NULL
);


ALTER TABLE public.branch OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16404)
-- Name: member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member (
    id integer NOT NULL,
    mem_fname character varying(15) NOT NULL,
    mem_lname character varying(15) NOT NULL,
    mem_mi character varying(2) NOT NULL,
    mem_address character varying(45) NOT NULL,
    mem_sex character varying(15) NOT NULL
);


ALTER TABLE public.member OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16394)
-- Name: memberpayment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.memberpayment (
    id integer NOT NULL,
    pay_amount money NOT NULL,
    pay_date date NOT NULL,
    pay_type character varying(10) NOT NULL,
    member_id integer NOT NULL
);


ALTER TABLE public.memberpayment OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16412)
-- Name: memberpayments; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.memberpayments AS
 SELECT member.id,
    member.mem_fname,
    member.mem_lname,
    member.mem_sex,
    memberpayment.pay_amount,
    memberpayment.pay_type,
    memberpayment.pay_date
   FROM (public.member
     JOIN public.memberpayment ON ((member.id = memberpayment.member_id)));


ALTER TABLE public.memberpayments OWNER TO postgres;

--
-- TOC entry 2832 (class 0 OID 16399)
-- Dependencies: 203
-- Data for Name: branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.branch (id, branch_name, branch_address, branch_phone) VALUES (1, 'Anytime Fitness Moonwalk', 'Moonwalk Village', 8759430);
INSERT INTO public.branch (id, branch_name, branch_address, branch_phone) VALUES (2, 'Anytime Fitness Magallanes', 'Magallanes Village', 6830724);
INSERT INTO public.branch (id, branch_name, branch_address, branch_phone) VALUES (3, 'Anytime Fitness BGC', 'BGC', 8859230);


--
-- TOC entry 2833 (class 0 OID 16404)
-- Dependencies: 204
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.member (id, mem_fname, mem_lname, mem_mi, mem_address, mem_sex) VALUES (1, 'Michael', 'Chase', 'H.', 'Moonwalk Village', 'Male');
INSERT INTO public.member (id, mem_fname, mem_lname, mem_mi, mem_address, mem_sex) VALUES (2, 'Emma', 'Griffon', 'J.', 'BGC', 'Female');
INSERT INTO public.member (id, mem_fname, mem_lname, mem_mi, mem_address, mem_sex) VALUES (3, 'Jodie', 'Siegvard', 'L.', 'Magallanes Village', 'Female');


--
-- TOC entry 2831 (class 0 OID 16394)
-- Dependencies: 202
-- Data for Name: memberpayment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.memberpayment (id, pay_amount, pay_date, pay_type, member_id) VALUES (1, '?2,500.50', '2018-06-12', 'Cash', 1);
INSERT INTO public.memberpayment (id, pay_amount, pay_date, pay_type, member_id) VALUES (2, '?25,750.50', '2018-09-24', 'Credit', 2);
INSERT INTO public.memberpayment (id, pay_amount, pay_date, pay_type, member_id) VALUES (3, '?2,500.50', '2019-01-19', 'Cash', 3);


--
-- TOC entry 2701 (class 2606 OID 16403)
-- Name: branch branch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 16411)
-- Name: member member_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 16398)
-- Name: memberpayment memberpayment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memberpayment
    ADD CONSTRAINT memberpayment_pkey PRIMARY KEY (id);


-- Completed on 2019-11-14 08:48:14

--
-- PostgreSQL database dump complete
--

