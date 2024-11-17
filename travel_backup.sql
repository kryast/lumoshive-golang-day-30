--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0 (Ubuntu 17.0-1.pgdg24.04+1)
-- Dumped by pg_dump version 17.0 (Ubuntu 17.0-1.pgdg24.04+1)

-- Started on 2024-11-17 20:28:32 WIB

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 131083)
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    place_id integer NOT NULL,
    date_event timestamp without time zone NOT NULL
);


ALTER TABLE public.events OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 131082)
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.events_id_seq OWNER TO postgres;

--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 219
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- TOC entry 228 (class 1259 OID 147496)
-- Name: galleries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galleries (
    id integer NOT NULL,
    photo_url text NOT NULL,
    description text
);


ALTER TABLE public.galleries OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 147495)
-- Name: galleries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galleries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.galleries_id_seq OWNER TO postgres;

--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 227
-- Name: galleries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galleries_id_seq OWNED BY public.galleries.id;


--
-- TOC entry 233 (class 1259 OID 155687)
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    travel_id integer,
    longitude double precision,
    latitude double precision
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 155686)
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.locations_id_seq OWNER TO postgres;

--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 232
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- TOC entry 218 (class 1259 OID 131074)
-- Name: places; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.places (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    detail text,
    gallery_id integer
);


ALTER TABLE public.places OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 131073)
-- Name: places_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.places_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.places_id_seq OWNER TO postgres;

--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 217
-- Name: places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.places_id_seq OWNED BY public.places.id;


--
-- TOC entry 230 (class 1259 OID 155663)
-- Name: plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plans (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    detail text NOT NULL
);


ALTER TABLE public.plans OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 155662)
-- Name: plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.plans_id_seq OWNER TO postgres;

--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 229
-- Name: plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plans_id_seq OWNED BY public.plans.id;


--
-- TOC entry 222 (class 1259 OID 131107)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    transaction_id integer NOT NULL,
    rating integer NOT NULL,
    CONSTRAINT reviews_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 131106)
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO postgres;

--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 221
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- TOC entry 226 (class 1259 OID 147479)
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    id integer NOT NULL,
    travel_id integer,
    name character varying(255),
    email character varying(255),
    phone integer,
    message text,
    status character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 147478)
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transactions_id_seq OWNER TO postgres;

--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 225
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- TOC entry 231 (class 1259 OID 155671)
-- Name: travel_plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.travel_plans (
    travel_id integer NOT NULL,
    plan_id integer NOT NULL
);


ALTER TABLE public.travel_plans OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 147457)
-- Name: travels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.travels (
    id integer NOT NULL,
    place_id integer,
    event_id integer,
    review_id integer
);


ALTER TABLE public.travels OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 147456)
-- Name: travels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.travels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.travels_id_seq OWNER TO postgres;

--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 223
-- Name: travels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.travels_id_seq OWNED BY public.travels.id;


--
-- TOC entry 3294 (class 2604 OID 131086)
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- TOC entry 3301 (class 2604 OID 147499)
-- Name: galleries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galleries ALTER COLUMN id SET DEFAULT nextval('public.galleries_id_seq'::regclass);


--
-- TOC entry 3303 (class 2604 OID 155690)
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- TOC entry 3293 (class 2604 OID 131077)
-- Name: places id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.places ALTER COLUMN id SET DEFAULT nextval('public.places_id_seq'::regclass);


--
-- TOC entry 3302 (class 2604 OID 155666)
-- Name: plans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plans ALTER COLUMN id SET DEFAULT nextval('public.plans_id_seq'::regclass);


--
-- TOC entry 3295 (class 2604 OID 131110)
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- TOC entry 3297 (class 2604 OID 147482)
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- TOC entry 3296 (class 2604 OID 147460)
-- Name: travels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.travels ALTER COLUMN id SET DEFAULT nextval('public.travels_id_seq'::regclass);


--
-- TOC entry 3482 (class 0 OID 131083)
-- Dependencies: 220
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, place_id, date_event) FROM stdin;
1	1	2024-11-13 00:00:00
2	2	2024-11-14 00:00:00
3	3	2024-11-15 00:00:00
4	4	2024-11-16 00:00:00
5	5	2024-11-17 00:00:00
6	6	2024-11-18 00:00:00
7	7	2024-11-19 00:00:00
\.


--
-- TOC entry 3490 (class 0 OID 147496)
-- Dependencies: 228
-- Data for Name: galleries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.galleries (id, photo_url, description) FROM stdin;
1	onepiece.jpg	photo 1
2	onepiece.jpg	photo 2
3	onepiece.jpg	photo 3
4	onepiece.jpg	photo 4
5	onepiece.jpg	photo 5
\.


--
-- TOC entry 3495 (class 0 OID 155687)
-- Dependencies: 233
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (id, travel_id, longitude, latitude) FROM stdin;
1	7	123.45	67.89
2	8	98.76	54.32
3	9	45.67	89.01
4	10	150.23	-33.87
5	11	-75.34	40.73
\.


--
-- TOC entry 3480 (class 0 OID 131074)
-- Dependencies: 218
-- Data for Name: places; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.places (id, name, price, detail, gallery_id) FROM stdin;
1	Egghead	100000	Pulau Egghead	1
2	Elbaph	80000	Pulau Elbaph	2
3	Wano Kuni	70000	Pulau Wano Kuni	3
4	Whole Cake	80000	Pulau Whole Cake	4
5	Dressrosa	80000	Pulau Dressrosa	5
6	Punk Hazard	80000	Pulau Punk Hazard	5
7	Fish Man	80000	Pulau Fish Man	5
\.


--
-- TOC entry 3492 (class 0 OID 155663)
-- Dependencies: 230
-- Data for Name: plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plans (id, title, detail) FROM stdin;
1	Day 1	Visit the museum, have lunch at Restaurant A
2	Day 2	Go to the beach and enjoy the sunset
3	Day 3	City tour, visit famous landmarks
4	Day 4	Day trip to nearby mountains, hike
5	Day 5	Shopping and relaxing at the resort
\.


--
-- TOC entry 3484 (class 0 OID 131107)
-- Dependencies: 222
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, transaction_id, rating) FROM stdin;
2	2	5
3	3	5
4	4	5
5	5	5
6	6	5
7	7	5
8	8	5
\.


--
-- TOC entry 3488 (class 0 OID 147479)
-- Dependencies: 226
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (id, travel_id, name, email, phone, message, status, created_at, updated_at, deleted_at) FROM stdin;
1	7	'Luffy'	'luffy@gmail.com'	123456	'tes'	In Process	2024-11-14 14:32:55.121338	2024-11-14 14:32:55.121338	2024-11-14 14:32:55.121338
2	7	'Zoro'	zoro@gmail.com	123456	'tes'	In Process	2024-11-14 19:07:24.259231	2024-11-14 19:07:24.259231	2024-11-14 19:07:24.259231
\.


--
-- TOC entry 3493 (class 0 OID 155671)
-- Dependencies: 231
-- Data for Name: travel_plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.travel_plans (travel_id, plan_id) FROM stdin;
7	1
7	2
7	3
7	4
7	5
8	1
8	2
8	3
8	4
8	5
9	2
9	3
9	4
9	1
9	5
10	1
10	2
10	3
10	4
10	5
11	1
11	2
11	3
11	4
11	5
\.


--
-- TOC entry 3486 (class 0 OID 147457)
-- Dependencies: 224
-- Data for Name: travels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.travels (id, place_id, event_id, review_id) FROM stdin;
7	2	2	2
8	3	3	3
9	4	4	4
10	5	5	5
11	6	6	6
\.


--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 219
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 7, true);


--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 227
-- Name: galleries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galleries_id_seq', 5, true);


--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 232
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 5, true);


--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 217
-- Name: places_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.places_id_seq', 7, true);


--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 229
-- Name: plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plans_id_seq', 5, true);


--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 221
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 8, true);


--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 225
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_id_seq', 7, true);


--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 223
-- Name: travels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.travels_id_seq', 11, true);


--
-- TOC entry 3308 (class 2606 OID 131088)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 3316 (class 2606 OID 147503)
-- Name: galleries galleries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galleries
    ADD CONSTRAINT galleries_pkey PRIMARY KEY (id);


--
-- TOC entry 3322 (class 2606 OID 155692)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- TOC entry 3324 (class 2606 OID 155694)
-- Name: locations locations_travel_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_travel_id_key UNIQUE (travel_id);


--
-- TOC entry 3306 (class 2606 OID 131081)
-- Name: places places_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- TOC entry 3318 (class 2606 OID 155670)
-- Name: plans plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);


--
-- TOC entry 3310 (class 2606 OID 131113)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 3314 (class 2606 OID 147489)
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 3320 (class 2606 OID 155675)
-- Name: travel_plans travel_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.travel_plans
    ADD CONSTRAINT travel_plans_pkey PRIMARY KEY (travel_id, plan_id);


--
-- TOC entry 3312 (class 2606 OID 147462)
-- Name: travels travels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.travels
    ADD CONSTRAINT travels_pkey PRIMARY KEY (id);


--
-- TOC entry 3326 (class 2606 OID 131089)
-- Name: events events_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.places(id) ON DELETE CASCADE;


--
-- TOC entry 3325 (class 2606 OID 147504)
-- Name: places fk_gallery_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT fk_gallery_id FOREIGN KEY (gallery_id) REFERENCES public.galleries(id);


--
-- TOC entry 3333 (class 2606 OID 155695)
-- Name: locations locations_travel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_travel_id_fkey FOREIGN KEY (travel_id) REFERENCES public.travels(id) ON DELETE CASCADE;


--
-- TOC entry 3330 (class 2606 OID 147490)
-- Name: transactions transactions_travel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_travel_id_fkey FOREIGN KEY (travel_id) REFERENCES public.travels(id);


--
-- TOC entry 3331 (class 2606 OID 155681)
-- Name: travel_plans travel_plans_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.travel_plans
    ADD CONSTRAINT travel_plans_plan_id_fkey FOREIGN KEY (plan_id) REFERENCES public.plans(id) ON DELETE CASCADE;


--
-- TOC entry 3332 (class 2606 OID 155676)
-- Name: travel_plans travel_plans_travel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.travel_plans
    ADD CONSTRAINT travel_plans_travel_id_fkey FOREIGN KEY (travel_id) REFERENCES public.travels(id) ON DELETE CASCADE;


--
-- TOC entry 3327 (class 2606 OID 147468)
-- Name: travels travels_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.travels
    ADD CONSTRAINT travels_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- TOC entry 3328 (class 2606 OID 147463)
-- Name: travels travels_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.travels
    ADD CONSTRAINT travels_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.places(id);


--
-- TOC entry 3329 (class 2606 OID 147473)
-- Name: travels travels_review_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.travels
    ADD CONSTRAINT travels_review_id_fkey FOREIGN KEY (review_id) REFERENCES public.reviews(id);


--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO kryast;


--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE events; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.events TO kryast;


--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 219
-- Name: SEQUENCE events_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.events_id_seq TO kryast;


--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE galleries; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.galleries TO kryast;


--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE places; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.places TO kryast;


--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 217
-- Name: SEQUENCE places_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.places_id_seq TO kryast;


--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE reviews; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.reviews TO kryast;


--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 221
-- Name: SEQUENCE reviews_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.reviews_id_seq TO kryast;


--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE transactions; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.transactions TO kryast;


--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE travels; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.travels TO kryast;


-- Completed on 2024-11-17 20:28:33 WIB

--
-- PostgreSQL database dump complete
--

