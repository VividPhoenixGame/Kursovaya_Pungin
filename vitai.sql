--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.2)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.2)

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
-- Name: status; Type: TYPE; Schema: public; Owner: vitai
--

CREATE TYPE public.status AS ENUM (
    'keeping',
    'reading',
    'receiving',
    'giveaway'
);


ALTER TYPE public.status OWNER TO vitai;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: events; Type: TABLE; Schema: public; Owner: vitai
--

CREATE TABLE public.events (
    id_book integer NOT NULL,
    status public.status,
    date date,
    who character varying(50)
);


ALTER TABLE public.events OWNER TO vitai;

--
-- Name: events_id_book_seq; Type: SEQUENCE; Schema: public; Owner: vitai
--

CREATE SEQUENCE public.events_id_book_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_book_seq OWNER TO vitai;

--
-- Name: events_id_book_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vitai
--

ALTER SEQUENCE public.events_id_book_seq OWNED BY public.events.id_book;


--
-- Name: propbook; Type: TABLE; Schema: public; Owner: vitai
--

CREATE TABLE public.propbook (
    id_book integer NOT NULL,
    name character varying(100),
    author character varying(100),
    year integer,
    publisher character varying(80),
    pages integer,
    genre character varying(50),
    isbn character varying(20)
);


ALTER TABLE public.propbook OWNER TO vitai;

--
-- Name: propbook_id_book_seq; Type: SEQUENCE; Schema: public; Owner: vitai
--

CREATE SEQUENCE public.propbook_id_book_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.propbook_id_book_seq OWNER TO vitai;

--
-- Name: propbook_id_book_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vitai
--

ALTER SEQUENCE public.propbook_id_book_seq OWNED BY public.propbook.id_book;


--
-- Name: source; Type: TABLE; Schema: public; Owner: vitai
--

CREATE TABLE public.source (
    id_book integer NOT NULL,
    library character varying(80),
    bookloan character varying(80),
    gifted character varying(80),
    buyed character varying(80),
    found character varying(80)
);


ALTER TABLE public.source OWNER TO vitai;

--
-- Name: source_id_book_seq; Type: SEQUENCE; Schema: public; Owner: vitai
--

CREATE SEQUENCE public.source_id_book_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.source_id_book_seq OWNER TO vitai;

--
-- Name: source_id_book_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vitai
--

ALTER SEQUENCE public.source_id_book_seq OWNED BY public.source.id_book;


--
-- Name: typebook; Type: TABLE; Schema: public; Owner: vitai
--

CREATE TABLE public.typebook (
    id_book integer NOT NULL,
    book boolean,
    magazine boolean,
    audio boolean,
    ebook boolean
);


ALTER TABLE public.typebook OWNER TO vitai;

--
-- Name: typebook_id_book_seq; Type: SEQUENCE; Schema: public; Owner: vitai
--

CREATE SEQUENCE public.typebook_id_book_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.typebook_id_book_seq OWNER TO vitai;

--
-- Name: typebook_id_book_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vitai
--

ALTER SEQUENCE public.typebook_id_book_seq OWNED BY public.typebook.id_book;


--
-- Name: events id_book; Type: DEFAULT; Schema: public; Owner: vitai
--

ALTER TABLE ONLY public.events ALTER COLUMN id_book SET DEFAULT nextval('public.events_id_book_seq'::regclass);


--
-- Name: propbook id_book; Type: DEFAULT; Schema: public; Owner: vitai
--

ALTER TABLE ONLY public.propbook ALTER COLUMN id_book SET DEFAULT nextval('public.propbook_id_book_seq'::regclass);


--
-- Name: source id_book; Type: DEFAULT; Schema: public; Owner: vitai
--

ALTER TABLE ONLY public.source ALTER COLUMN id_book SET DEFAULT nextval('public.source_id_book_seq'::regclass);


--
-- Name: typebook id_book; Type: DEFAULT; Schema: public; Owner: vitai
--

ALTER TABLE ONLY public.typebook ALTER COLUMN id_book SET DEFAULT nextval('public.typebook_id_book_seq'::regclass);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: vitai
--

COPY public.events (id_book, status, date, who) FROM stdin;
\.


--
-- Data for Name: propbook; Type: TABLE DATA; Schema: public; Owner: vitai
--

COPY public.propbook (id_book, name, author, year, publisher, pages, genre, isbn) FROM stdin;
1	100 способов изменить жизнь. Часть первая	Лариса Парфентьева	2016	Манн, Иванов, Фербер	191	Саморазвитие	978-5-0016-9701-5
2	Чистая архитектура. Искусство разработки программного обеспечения	Роберт Мартин	2022	Прогресс книга	352	Компьютерная литература	978-5-4461-0772-8
3	Цифровая гигиена	Игорь Ашманов, Наталья Касперская	2022	Питер	508	Безопасность в интернете	978-5-4461-1938-7
4	Memo: Секреты создания структуры и персонажей в сценарии	Кристофер Воглер, Дэвид Маккенна	2018	Альпина нон-фикшн	296	Писательское мастерство	978-5-91671-851-5
\.


--
-- Data for Name: source; Type: TABLE DATA; Schema: public; Owner: vitai
--

COPY public.source (id_book, library, bookloan, gifted, buyed, found) FROM stdin;
\.


--
-- Data for Name: typebook; Type: TABLE DATA; Schema: public; Owner: vitai
--

COPY public.typebook (id_book, book, magazine, audio, ebook) FROM stdin;
\.


--
-- Name: events_id_book_seq; Type: SEQUENCE SET; Schema: public; Owner: vitai
--

SELECT pg_catalog.setval('public.events_id_book_seq', 1, false);


--
-- Name: propbook_id_book_seq; Type: SEQUENCE SET; Schema: public; Owner: vitai
--

SELECT pg_catalog.setval('public.propbook_id_book_seq', 4, true);


--
-- Name: source_id_book_seq; Type: SEQUENCE SET; Schema: public; Owner: vitai
--

SELECT pg_catalog.setval('public.source_id_book_seq', 1, false);


--
-- Name: typebook_id_book_seq; Type: SEQUENCE SET; Schema: public; Owner: vitai
--

SELECT pg_catalog.setval('public.typebook_id_book_seq', 1, false);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: vitai
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id_book);


--
-- Name: propbook propbook_pkey; Type: CONSTRAINT; Schema: public; Owner: vitai
--

ALTER TABLE ONLY public.propbook
    ADD CONSTRAINT propbook_pkey PRIMARY KEY (id_book);


--
-- Name: source source_pkey; Type: CONSTRAINT; Schema: public; Owner: vitai
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT source_pkey PRIMARY KEY (id_book);


--
-- Name: typebook typebook_pkey; Type: CONSTRAINT; Schema: public; Owner: vitai
--

ALTER TABLE ONLY public.typebook
    ADD CONSTRAINT typebook_pkey PRIMARY KEY (id_book);


--
-- Name: typebook typebook_id_book_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vitai
--

ALTER TABLE ONLY public.typebook
    ADD CONSTRAINT typebook_id_book_fkey FOREIGN KEY (id_book) REFERENCES public.propbook(id_book);


--
-- Name: typebook typebook_id_book_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: vitai
--

ALTER TABLE ONLY public.typebook
    ADD CONSTRAINT typebook_id_book_fkey1 FOREIGN KEY (id_book) REFERENCES public.propbook(id_book) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

