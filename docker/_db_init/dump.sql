--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Debian 12.2-1.pgdg100+1)
-- Dumped by pg_dump version 12.2 (Debian 12.2-1.pgdg100+1)

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
-- Name: year; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.year AS integer
	CONSTRAINT year_check CHECK (((VALUE >= 1901) AND (VALUE <= 2155)));


ALTER DOMAIN public.year OWNER TO postgres;

--
-- Name: last_updated(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.last_updated() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN

    NEW.last_update = CURRENT_TIMESTAMP;

    RETURN NEW;

END $$;


ALTER FUNCTION public.last_updated() OWNER TO postgres;

--
-- Name: actor_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actor_actor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actor_actor_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actor (
    actor_id integer DEFAULT nextval('public.actor_actor_id_seq'::regclass) NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.actor OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_category_id_seq OWNER TO postgres;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    category_id integer DEFAULT nextval('public.category_category_id_seq'::regclass) NOT NULL,
    name character varying(25) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: film_film_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.film_film_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.film_film_id_seq OWNER TO postgres;

--
-- Name: film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film (
    film_id integer DEFAULT nextval('public.film_film_id_seq'::regclass) NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    release_year public.year,
    language_id smallint NOT NULL,
    original_language_id smallint,
    rental_duration smallint DEFAULT 3 NOT NULL,
    rental_rate numeric(4,2) DEFAULT 4.99 NOT NULL,
    length smallint,
    replacement_cost numeric(5,2) DEFAULT 19.99 NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    fulltext tsvector NOT NULL
);


ALTER TABLE public.film OWNER TO postgres;

--
-- Name: language_language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.language_language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.language_language_id_seq OWNER TO postgres;

--
-- Name: language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.language (
    language_id integer DEFAULT nextval('public.language_language_id_seq'::regclass) NOT NULL,
    name character(20) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.language OWNER TO postgres;

--
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actor (actor_id, first_name, last_name, last_update) FROM stdin;
1	PENELOPE	GUINESS	2006-02-15 04:34:33
2	NICK	WAHLBERG	2006-02-15 04:34:33
3	ED	CHASE	2006-02-15 04:34:33
4	JENNIFER	DAVIS	2006-02-15 04:34:33
5	JOHNNY	LOLLOBRIGIDA	2006-02-15 04:34:33
6	BETTE	NICHOLSON	2006-02-15 04:34:33
7	GRACE	MOSTEL	2006-02-15 04:34:33
8	MATTHEW	JOHANSSON	2006-02-15 04:34:33
9	JOE	SWANK	2006-02-15 04:34:33
10	CHRISTIAN	GABLE	2006-02-15 04:34:33
11	ZERO	CAGE	2006-02-15 04:34:33
12	KARL	BERRY	2006-02-15 04:34:33
13	UMA	WOOD	2006-02-15 04:34:33
14	VIVIEN	BERGEN	2006-02-15 04:34:33
15	CUBA	OLIVIER	2006-02-15 04:34:33
16	FRED	COSTNER	2006-02-15 04:34:33
17	HELEN	VOIGHT	2006-02-15 04:34:33
18	DAN	TORN	2006-02-15 04:34:33
19	BOB	FAWCETT	2006-02-15 04:34:33
20	LUCILLE	TRACY	2006-02-15 04:34:33
21	KIRSTEN	PALTROW	2006-02-15 04:34:33
22	ELVIS	MARX	2006-02-15 04:34:33
23	SANDRA	KILMER	2006-02-15 04:34:33
24	CAMERON	STREEP	2006-02-15 04:34:33
25	KEVIN	BLOOM	2006-02-15 04:34:33
26	RIP	CRAWFORD	2006-02-15 04:34:33
27	JULIA	MCQUEEN	2006-02-15 04:34:33
28	WOODY	HOFFMAN	2006-02-15 04:34:33
29	ALEC	WAYNE	2006-02-15 04:34:33
30	SANDRA	PECK	2006-02-15 04:34:33
31	SISSY	SOBIESKI	2006-02-15 04:34:33
32	TIM	HACKMAN	2006-02-15 04:34:33
33	MILLA	PECK	2006-02-15 04:34:33
34	AUDREY	OLIVIER	2006-02-15 04:34:33
35	JUDY	DEAN	2006-02-15 04:34:33
36	BURT	DUKAKIS	2006-02-15 04:34:33
37	VAL	BOLGER	2006-02-15 04:34:33
38	TOM	MCKELLEN	2006-02-15 04:34:33
39	GOLDIE	BRODY	2006-02-15 04:34:33
40	JOHNNY	CAGE	2006-02-15 04:34:33
41	JODIE	DEGENERES	2006-02-15 04:34:33
42	TOM	MIRANDA	2006-02-15 04:34:33
43	KIRK	JOVOVICH	2006-02-15 04:34:33
44	NICK	STALLONE	2006-02-15 04:34:33
45	REESE	KILMER	2006-02-15 04:34:33
46	PARKER	GOLDBERG	2006-02-15 04:34:33
47	JULIA	BARRYMORE	2006-02-15 04:34:33
48	FRANCES	DAY-LEWIS	2006-02-15 04:34:33
49	ANNE	CRONYN	2006-02-15 04:34:33
50	NATALIE	HOPKINS	2006-02-15 04:34:33
51	GARY	PHOENIX	2006-02-15 04:34:33
52	CARMEN	HUNT	2006-02-15 04:34:33
53	MENA	TEMPLE	2006-02-15 04:34:33
54	PENELOPE	PINKETT	2006-02-15 04:34:33
55	FAY	KILMER	2006-02-15 04:34:33
56	DAN	HARRIS	2006-02-15 04:34:33
57	JUDE	CRUISE	2006-02-15 04:34:33
58	CHRISTIAN	AKROYD	2006-02-15 04:34:33
59	DUSTIN	TAUTOU	2006-02-15 04:34:33
60	HENRY	BERRY	2006-02-15 04:34:33
61	CHRISTIAN	NEESON	2006-02-15 04:34:33
62	JAYNE	NEESON	2006-02-15 04:34:33
63	CAMERON	WRAY	2006-02-15 04:34:33
64	RAY	JOHANSSON	2006-02-15 04:34:33
65	ANGELA	HUDSON	2006-02-15 04:34:33
66	MARY	TANDY	2006-02-15 04:34:33
67	JESSICA	BAILEY	2006-02-15 04:34:33
68	RIP	WINSLET	2006-02-15 04:34:33
69	KENNETH	PALTROW	2006-02-15 04:34:33
70	MICHELLE	MCCONAUGHEY	2006-02-15 04:34:33
71	ADAM	GRANT	2006-02-15 04:34:33
72	SEAN	WILLIAMS	2006-02-15 04:34:33
73	GARY	PENN	2006-02-15 04:34:33
74	MILLA	KEITEL	2006-02-15 04:34:33
75	BURT	POSEY	2006-02-15 04:34:33
76	ANGELINA	ASTAIRE	2006-02-15 04:34:33
77	CARY	MCCONAUGHEY	2006-02-15 04:34:33
78	GROUCHO	SINATRA	2006-02-15 04:34:33
79	MAE	HOFFMAN	2006-02-15 04:34:33
80	RALPH	CRUZ	2006-02-15 04:34:33
81	SCARLETT	DAMON	2006-02-15 04:34:33
82	WOODY	JOLIE	2006-02-15 04:34:33
83	BEN	WILLIS	2006-02-15 04:34:33
84	JAMES	PITT	2006-02-15 04:34:33
85	MINNIE	ZELLWEGER	2006-02-15 04:34:33
86	GREG	CHAPLIN	2006-02-15 04:34:33
87	SPENCER	PECK	2006-02-15 04:34:33
88	KENNETH	PESCI	2006-02-15 04:34:33
89	CHARLIZE	DENCH	2006-02-15 04:34:33
90	SEAN	GUINESS	2006-02-15 04:34:33
91	CHRISTOPHER	BERRY	2006-02-15 04:34:33
92	KIRSTEN	AKROYD	2006-02-15 04:34:33
93	ELLEN	PRESLEY	2006-02-15 04:34:33
94	KENNETH	TORN	2006-02-15 04:34:33
95	DARYL	WAHLBERG	2006-02-15 04:34:33
96	GENE	WILLIS	2006-02-15 04:34:33
97	MEG	HAWKE	2006-02-15 04:34:33
98	CHRIS	BRIDGES	2006-02-15 04:34:33
99	JIM	MOSTEL	2006-02-15 04:34:33
100	SPENCER	DEPP	2006-02-15 04:34:33
101	SUSAN	DAVIS	2006-02-15 04:34:33
102	WALTER	TORN	2006-02-15 04:34:33
103	MATTHEW	LEIGH	2006-02-15 04:34:33
104	PENELOPE	CRONYN	2006-02-15 04:34:33
105	SIDNEY	CROWE	2006-02-15 04:34:33
106	GROUCHO	DUNST	2006-02-15 04:34:33
107	GINA	DEGENERES	2006-02-15 04:34:33
108	WARREN	NOLTE	2006-02-15 04:34:33
109	SYLVESTER	DERN	2006-02-15 04:34:33
110	SUSAN	DAVIS	2006-02-15 04:34:33
111	CAMERON	ZELLWEGER	2006-02-15 04:34:33
112	RUSSELL	BACALL	2006-02-15 04:34:33
113	MORGAN	HOPKINS	2006-02-15 04:34:33
114	MORGAN	MCDORMAND	2006-02-15 04:34:33
115	HARRISON	BALE	2006-02-15 04:34:33
116	DAN	STREEP	2006-02-15 04:34:33
117	RENEE	TRACY	2006-02-15 04:34:33
118	CUBA	ALLEN	2006-02-15 04:34:33
119	WARREN	JACKMAN	2006-02-15 04:34:33
120	PENELOPE	MONROE	2006-02-15 04:34:33
121	LIZA	BERGMAN	2006-02-15 04:34:33
122	SALMA	NOLTE	2006-02-15 04:34:33
123	JULIANNE	DENCH	2006-02-15 04:34:33
124	SCARLETT	BENING	2006-02-15 04:34:33
125	ALBERT	NOLTE	2006-02-15 04:34:33
126	FRANCES	TOMEI	2006-02-15 04:34:33
127	KEVIN	GARLAND	2006-02-15 04:34:33
128	CATE	MCQUEEN	2006-02-15 04:34:33
129	DARYL	CRAWFORD	2006-02-15 04:34:33
130	GRETA	KEITEL	2006-02-15 04:34:33
131	JANE	JACKMAN	2006-02-15 04:34:33
132	ADAM	HOPPER	2006-02-15 04:34:33
133	RICHARD	PENN	2006-02-15 04:34:33
134	GENE	HOPKINS	2006-02-15 04:34:33
135	RITA	REYNOLDS	2006-02-15 04:34:33
136	ED	MANSFIELD	2006-02-15 04:34:33
137	MORGAN	WILLIAMS	2006-02-15 04:34:33
138	LUCILLE	DEE	2006-02-15 04:34:33
139	EWAN	GOODING	2006-02-15 04:34:33
140	WHOOPI	HURT	2006-02-15 04:34:33
141	CATE	HARRIS	2006-02-15 04:34:33
142	JADA	RYDER	2006-02-15 04:34:33
143	RIVER	DEAN	2006-02-15 04:34:33
144	ANGELA	WITHERSPOON	2006-02-15 04:34:33
145	KIM	ALLEN	2006-02-15 04:34:33
146	ALBERT	JOHANSSON	2006-02-15 04:34:33
147	FAY	WINSLET	2006-02-15 04:34:33
148	EMILY	DEE	2006-02-15 04:34:33
149	RUSSELL	TEMPLE	2006-02-15 04:34:33
150	JAYNE	NOLTE	2006-02-15 04:34:33
151	GEOFFREY	HESTON	2006-02-15 04:34:33
152	BEN	HARRIS	2006-02-15 04:34:33
153	MINNIE	KILMER	2006-02-15 04:34:33
154	MERYL	GIBSON	2006-02-15 04:34:33
155	IAN	TANDY	2006-02-15 04:34:33
156	FAY	WOOD	2006-02-15 04:34:33
157	GRETA	MALDEN	2006-02-15 04:34:33
158	VIVIEN	BASINGER	2006-02-15 04:34:33
159	LAURA	BRODY	2006-02-15 04:34:33
160	CHRIS	DEPP	2006-02-15 04:34:33
161	HARVEY	HOPE	2006-02-15 04:34:33
162	OPRAH	KILMER	2006-02-15 04:34:33
163	CHRISTOPHER	WEST	2006-02-15 04:34:33
164	HUMPHREY	WILLIS	2006-02-15 04:34:33
165	AL	GARLAND	2006-02-15 04:34:33
166	NICK	DEGENERES	2006-02-15 04:34:33
167	LAURENCE	BULLOCK	2006-02-15 04:34:33
168	WILL	WILSON	2006-02-15 04:34:33
169	KENNETH	HOFFMAN	2006-02-15 04:34:33
170	MENA	HOPPER	2006-02-15 04:34:33
171	OLYMPIA	PFEIFFER	2006-02-15 04:34:33
172	GROUCHO	WILLIAMS	2006-02-15 04:34:33
173	ALAN	DREYFUSS	2006-02-15 04:34:33
174	MICHAEL	BENING	2006-02-15 04:34:33
175	WILLIAM	HACKMAN	2006-02-15 04:34:33
176	JON	CHASE	2006-02-15 04:34:33
177	GENE	MCKELLEN	2006-02-15 04:34:33
178	LISA	MONROE	2006-02-15 04:34:33
179	ED	GUINESS	2006-02-15 04:34:33
180	JEFF	SILVERSTONE	2006-02-15 04:34:33
181	MATTHEW	CARREY	2006-02-15 04:34:33
182	DEBBIE	AKROYD	2006-02-15 04:34:33
183	RUSSELL	CLOSE	2006-02-15 04:34:33
184	HUMPHREY	GARLAND	2006-02-15 04:34:33
185	MICHAEL	BOLGER	2006-02-15 04:34:33
186	JULIA	ZELLWEGER	2006-02-15 04:34:33
187	RENEE	BALL	2006-02-15 04:34:33
188	ROCK	DUKAKIS	2006-02-15 04:34:33
189	CUBA	BIRCH	2006-02-15 04:34:33
190	AUDREY	BAILEY	2006-02-15 04:34:33
191	GREGORY	GOODING	2006-02-15 04:34:33
192	JOHN	SUVARI	2006-02-15 04:34:33
193	BURT	TEMPLE	2006-02-15 04:34:33
194	MERYL	ALLEN	2006-02-15 04:34:33
195	JAYNE	SILVERSTONE	2006-02-15 04:34:33
196	BELA	WALKEN	2006-02-15 04:34:33
197	REESE	WEST	2006-02-15 04:34:33
198	MARY	KEITEL	2006-02-15 04:34:33
199	JULIA	FAWCETT	2006-02-15 04:34:33
200	THORA	TEMPLE	2006-02-15 04:34:33
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (category_id, name, last_update) FROM stdin;
1	Action	2006-02-15 04:46:27
2	Animation	2006-02-15 04:46:27
3	Children	2006-02-15 04:46:27
4	Classics	2006-02-15 04:46:27
5	Comedy	2006-02-15 04:46:27
6	Documentary	2006-02-15 04:46:27
7	Drama	2006-02-15 04:46:27
8	Family	2006-02-15 04:46:27
9	Foreign	2006-02-15 04:46:27
10	Games	2006-02-15 04:46:27
11	Horror	2006-02-15 04:46:27
12	Music	2006-02-15 04:46:27
13	New	2006-02-15 04:46:27
14	Sci-Fi	2006-02-15 04:46:27
15	Sports	2006-02-15 04:46:27
16	Travel	2006-02-15 04:46:27
\.


--
-- Data for Name: film; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.film (film_id, title, description, release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, last_update, fulltext) FROM stdin;
1	ACADEMY DINOSAUR	A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies	2006	1	\N	6	0.99	86	20.99	2006-02-15 05:03:42	'academi':1 'battl':15 'canadian':20 'dinosaur':2 'drama':5 'epic':4 'feminist':8 'mad':11 'must':14 'rocki':21 'scientist':12 'teacher':17
2	ACE GOLDFINGER	A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China	2006	1	\N	3	4.99	48	12.99	2006-02-15 05:03:42	'ace':1 'administr':9 'ancient':19 'astound':4 'car':17 'china':20 'databas':8 'epistl':5 'explor':12 'find':15 'goldfing':2 'must':14
3	ADAPTATION HOLES	A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory	2006	1	\N	7	2.99	50	18.99	2006-02-15 05:03:42	'adapt':1 'astound':4 'baloon':19 'car':11 'factori':20 'hole':2 'lumberjack':8,16 'must':13 'reflect':5 'sink':14
4	AFFAIR PREJUDICE	A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank	2006	1	\N	5	2.99	117	26.99	2006-02-15 05:03:42	'affair':1 'chase':14 'documentari':5 'fanci':4 'frisbe':8 'lumberjack':11 'monkey':16 'must':13 'prejudic':2 'shark':19 'tank':20
5	AFRICAN EGG	A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico	2006	1	\N	6	2.99	130	22.99	2006-02-15 05:03:42	'african':1 'chef':11 'dentist':14 'documentari':7 'egg':2 'fast':5 'fast-pac':4 'forens':19 'gulf':23 'mexico':25 'must':16 'pace':6 'pastri':10 'psychologist':20 'pursu':17
6	AGENT TRUMAN	A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China	2006	1	\N	3	2.99	169	17.99	2006-02-15 05:03:42	'agent':1 'ancient':19 'boy':11 'china':20 'escap':14 'intrepid':4 'must':13 'panorama':5 'robot':8 'sumo':16 'truman':2 'wrestler':17
7	AIRPLANE SIERRA	A Touching Saga of a Hunter And a Butler who must Discover a Butler in A Jet Boat	2006	1	\N	6	4.99	62	28.99	2006-02-15 05:03:42	'airplan':1 'boat':20 'butler':11,16 'discov':14 'hunter':8 'jet':19 'must':13 'saga':5 'sierra':2 'touch':4
8	AIRPORT POLLOCK	A Epic Tale of a Moose And a Girl who must Confront a Monkey in Ancient India	2006	1	\N	6	4.99	54	15.99	2006-02-15 05:03:42	'airport':1 'ancient':18 'confront':14 'epic':4 'girl':11 'india':19 'monkey':16 'moos':8 'must':13 'pollock':2 'tale':5
9	ALABAMA DEVIL	A Thoughtful Panorama of a Database Administrator And a Mad Scientist who must Outgun a Mad Scientist in A Jet Boat	2006	1	\N	3	2.99	114	21.99	2006-02-15 05:03:42	'administr':9 'alabama':1 'boat':23 'databas':8 'devil':2 'jet':22 'mad':12,18 'must':15 'outgun':16 'panorama':5 'scientist':13,19 'thought':4
10	ALADDIN CALENDAR	A Action-Packed Tale of a Man And a Lumberjack who must Reach a Feminist in Ancient China	2006	1	\N	6	4.99	63	24.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'aladdin':1 'ancient':20 'calendar':2 'china':21 'feminist':18 'lumberjack':13 'man':10 'must':15 'pack':6 'reach':16 'tale':7
11	ALAMO VIDEOTAPE	A Boring Epistle of a Butler And a Cat who must Fight a Pastry Chef in A MySQL Convention	2006	1	\N	6	0.99	126	16.99	2006-02-15 05:03:42	'alamo':1 'bore':4 'butler':8 'cat':11 'chef':17 'convent':21 'epistl':5 'fight':14 'must':13 'mysql':20 'pastri':16 'videotap':2
12	ALASKA PHANTOM	A Fanciful Saga of a Hunter And a Pastry Chef who must Vanquish a Boy in Australia	2006	1	\N	6	0.99	136	22.99	2006-02-15 05:03:42	'alaska':1 'australia':19 'boy':17 'chef':12 'fanci':4 'hunter':8 'must':14 'pastri':11 'phantom':2 'saga':5 'vanquish':15
13	ALI FOREVER	A Action-Packed Drama of a Dentist And a Crocodile who must Battle a Feminist in The Canadian Rockies	2006	1	\N	4	4.99	150	21.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'ali':1 'battl':16 'canadian':21 'crocodil':13 'dentist':10 'drama':7 'feminist':18 'forev':2 'must':15 'pack':6 'rocki':22
14	ALICE FANTASIA	A Emotional Drama of a A Shark And a Database Administrator who must Vanquish a Pioneer in Soviet Georgia	2006	1	\N	6	0.99	94	23.99	2006-02-15 05:03:42	'administr':13 'alic':1 'databas':12 'drama':5 'emot':4 'fantasia':2 'georgia':21 'must':15 'pioneer':18 'shark':9 'soviet':20 'vanquish':16
15	ALIEN CENTER	A Brilliant Drama of a Cat And a Mad Scientist who must Battle a Feminist in A MySQL Convention	2006	1	\N	5	2.99	46	10.99	2006-02-15 05:03:42	'alien':1 'battl':15 'brilliant':4 'cat':8 'center':2 'convent':21 'drama':5 'feminist':17 'mad':11 'must':14 'mysql':20 'scientist':12
16	ALLEY EVOLUTION	A Fast-Paced Drama of a Robot And a Composer who must Battle a Astronaut in New Orleans	2006	1	\N	6	2.99	180	23.99	2006-02-15 05:03:42	'alley':1 'astronaut':18 'battl':16 'compos':13 'drama':7 'evolut':2 'fast':5 'fast-pac':4 'must':15 'new':20 'orlean':21 'pace':6 'robot':10
17	ALONE TRIP	A Fast-Paced Character Study of a Composer And a Dog who must Outgun a Boat in An Abandoned Fun House	2006	1	\N	3	0.99	82	14.99	2006-02-15 05:03:42	'abandon':22 'alon':1 'boat':19 'charact':7 'compos':11 'dog':14 'fast':5 'fast-pac':4 'fun':23 'hous':24 'must':16 'outgun':17 'pace':6 'studi':8 'trip':2
18	ALTER VICTORY	A Thoughtful Drama of a Composer And a Feminist who must Meet a Secret Agent in The Canadian Rockies	2006	1	\N	6	0.99	57	27.99	2006-02-15 05:03:42	'agent':17 'alter':1 'canadian':20 'compos':8 'drama':5 'feminist':11 'meet':14 'must':13 'rocki':21 'secret':16 'thought':4 'victori':2
73	BINGO TALENTED	A Touching Tale of a Girl And a Crocodile who must Discover a Waitress in Nigeria	2006	1	\N	5	2.99	150	22.99	2006-02-15 05:03:42	'bingo':1 'crocodil':11 'discov':14 'girl':8 'must':13 'nigeria':18 'tale':5 'talent':2 'touch':4 'waitress':16
19	AMADEUS HOLY	A Emotional Display of a Pioneer And a Technical Writer who must Battle a Man in A Baloon	2006	1	\N	6	0.99	113	20.99	2006-02-15 05:03:42	'amadeus':1 'baloon':20 'battl':15 'display':5 'emot':4 'holi':2 'man':17 'must':14 'pioneer':8 'technic':11 'writer':12
20	AMELIE HELLFIGHTERS	A Boring Drama of a Woman And a Squirrel who must Conquer a Student in A Baloon	2006	1	\N	4	4.99	79	23.99	2006-02-15 05:03:42	'ameli':1 'baloon':19 'bore':4 'conquer':14 'drama':5 'hellfight':2 'must':13 'squirrel':11 'student':16 'woman':8
21	AMERICAN CIRCUS	A Insightful Drama of a Girl And a Astronaut who must Face a Database Administrator in A Shark Tank	2006	1	\N	3	4.99	129	17.99	2006-02-15 05:03:42	'administr':17 'american':1 'astronaut':11 'circus':2 'databas':16 'drama':5 'face':14 'girl':8 'insight':4 'must':13 'shark':20 'tank':21
22	AMISTAD MIDSUMMER	A Emotional Character Study of a Dentist And a Crocodile who must Meet a Sumo Wrestler in California	2006	1	\N	6	2.99	85	10.99	2006-02-15 05:03:42	'amistad':1 'california':20 'charact':5 'crocodil':12 'dentist':9 'emot':4 'meet':15 'midsumm':2 'must':14 'studi':6 'sumo':17 'wrestler':18
23	ANACONDA CONFESSIONS	A Lacklusture Display of a Dentist And a Dentist who must Fight a Girl in Australia	2006	1	\N	3	0.99	92	9.99	2006-02-15 05:03:42	'anaconda':1 'australia':18 'confess':2 'dentist':8,11 'display':5 'fight':14 'girl':16 'lacklustur':4 'must':13
24	ANALYZE HOOSIERS	A Thoughtful Display of a Explorer And a Pastry Chef who must Overcome a Feminist in The Sahara Desert	2006	1	\N	6	2.99	181	19.99	2006-02-15 05:03:42	'analyz':1 'chef':12 'desert':21 'display':5 'explor':8 'feminist':17 'hoosier':2 'must':14 'overcom':15 'pastri':11 'sahara':20 'thought':4
25	ANGELS LIFE	A Thoughtful Display of a Woman And a Astronaut who must Battle a Robot in Berlin	2006	1	\N	3	2.99	74	15.99	2006-02-15 05:03:42	'angel':1 'astronaut':11 'battl':14 'berlin':18 'display':5 'life':2 'must':13 'robot':16 'thought':4 'woman':8
26	ANNIE IDENTITY	A Amazing Panorama of a Pastry Chef And a Boat who must Escape a Woman in An Abandoned Amusement Park	2006	1	\N	3	0.99	86	15.99	2006-02-15 05:03:42	'abandon':20 'amaz':4 'amus':21 'anni':1 'boat':12 'chef':9 'escap':15 'ident':2 'must':14 'panorama':5 'park':22 'pastri':8 'woman':17
27	ANONYMOUS HUMAN	A Amazing Reflection of a Database Administrator And a Astronaut who must Outrace a Database Administrator in A Shark Tank	2006	1	\N	7	0.99	179	12.99	2006-02-15 05:03:42	'administr':9,18 'amaz':4 'anonym':1 'astronaut':12 'databas':8,17 'human':2 'must':14 'outrac':15 'reflect':5 'shark':21 'tank':22
28	ANTHEM LUKE	A Touching Panorama of a Waitress And a Woman who must Outrace a Dog in An Abandoned Amusement Park	2006	1	\N	5	4.99	91	16.99	2006-02-15 05:03:42	'abandon':19 'amus':20 'anthem':1 'dog':16 'luke':2 'must':13 'outrac':14 'panorama':5 'park':21 'touch':4 'waitress':8 'woman':11
29	ANTITRUST TOMATOES	A Fateful Yarn of a Womanizer And a Feminist who must Succumb a Database Administrator in Ancient India	2006	1	\N	5	2.99	168	11.99	2006-02-15 05:03:42	'administr':17 'ancient':19 'antitrust':1 'databas':16 'fate':4 'feminist':11 'india':20 'must':13 'succumb':14 'tomato':2 'woman':8 'yarn':5
30	ANYTHING SAVANNAH	A Epic Story of a Pastry Chef And a Woman who must Chase a Feminist in An Abandoned Fun House	2006	1	\N	4	2.99	82	27.99	2006-02-15 05:03:42	'abandon':20 'anyth':1 'chase':15 'chef':9 'epic':4 'feminist':17 'fun':21 'hous':22 'must':14 'pastri':8 'savannah':2 'stori':5 'woman':12
31	APACHE DIVINE	A Awe-Inspiring Reflection of a Pastry Chef And a Teacher who must Overcome a Sumo Wrestler in A U-Boat	2006	1	\N	5	4.99	92	16.99	2006-02-15 05:03:42	'apach':1 'awe':5 'awe-inspir':4 'boat':25 'chef':11 'divin':2 'inspir':6 'must':16 'overcom':17 'pastri':10 'reflect':7 'sumo':19 'teacher':14 'u':24 'u-boat':23 'wrestler':20
32	APOCALYPSE FLAMINGOS	A Astounding Story of a Dog And a Squirrel who must Defeat a Woman in An Abandoned Amusement Park	2006	1	\N	6	4.99	119	11.99	2006-02-15 05:03:42	'abandon':19 'amus':20 'apocalyps':1 'astound':4 'defeat':14 'dog':8 'flamingo':2 'must':13 'park':21 'squirrel':11 'stori':5 'woman':16
33	APOLLO TEEN	A Action-Packed Reflection of a Crocodile And a Explorer who must Find a Sumo Wrestler in An Abandoned Mine Shaft	2006	1	\N	5	2.99	153	15.99	2006-02-15 05:03:42	'abandon':22 'action':5 'action-pack':4 'apollo':1 'crocodil':10 'explor':13 'find':16 'mine':23 'must':15 'pack':6 'reflect':7 'shaft':24 'sumo':18 'teen':2 'wrestler':19
34	ARABIA DOGMA	A Touching Epistle of a Madman And a Mad Cow who must Defeat a Student in Nigeria	2006	1	\N	6	0.99	62	29.99	2006-02-15 05:03:42	'arabia':1 'cow':12 'defeat':15 'dogma':2 'epistl':5 'mad':11 'madman':8 'must':14 'nigeria':19 'student':17 'touch':4
35	ARACHNOPHOBIA ROLLERCOASTER	A Action-Packed Reflection of a Pastry Chef And a Composer who must Discover a Mad Scientist in The First Manned Space Station	2006	1	\N	4	2.99	147	24.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'arachnophobia':1 'chef':11 'compos':14 'discov':17 'first':23 'mad':19 'man':24 'must':16 'pack':6 'pastri':10 'reflect':7 'rollercoast':2 'scientist':20 'space':25 'station':26
36	ARGONAUTS TOWN	A Emotional Epistle of a Forensic Psychologist And a Butler who must Challenge a Waitress in An Abandoned Mine Shaft	2006	1	\N	7	0.99	127	12.99	2006-02-15 05:03:42	'abandon':20 'argonaut':1 'butler':12 'challeng':15 'emot':4 'epistl':5 'forens':8 'mine':21 'must':14 'psychologist':9 'shaft':22 'town':2 'waitress':17
37	ARIZONA BANG	A Brilliant Panorama of a Mad Scientist And a Mad Cow who must Meet a Pioneer in A Monastery	2006	1	\N	3	2.99	121	28.99	2006-02-15 05:03:42	'arizona':1 'bang':2 'brilliant':4 'cow':13 'mad':8,12 'meet':16 'monasteri':21 'must':15 'panorama':5 'pioneer':18 'scientist':9
38	ARK RIDGEMONT	A Beautiful Yarn of a Pioneer And a Monkey who must Pursue a Explorer in The Sahara Desert	2006	1	\N	6	0.99	68	25.99	2006-02-15 05:03:42	'ark':1 'beauti':4 'desert':20 'explor':16 'monkey':11 'must':13 'pioneer':8 'pursu':14 'ridgemont':2 'sahara':19 'yarn':5
39	ARMAGEDDON LOST	A Fast-Paced Tale of a Boat And a Teacher who must Succumb a Composer in An Abandoned Mine Shaft	2006	1	\N	5	0.99	99	10.99	2006-02-15 05:03:42	'abandon':21 'armageddon':1 'boat':10 'compos':18 'fast':5 'fast-pac':4 'lost':2 'mine':22 'must':15 'pace':6 'shaft':23 'succumb':16 'tale':7 'teacher':13
40	ARMY FLINTSTONES	A Boring Saga of a Database Administrator And a Womanizer who must Battle a Waitress in Nigeria	2006	1	\N	4	0.99	148	22.99	2006-02-15 05:03:42	'administr':9 'armi':1 'battl':15 'bore':4 'databas':8 'flintston':2 'must':14 'nigeria':19 'saga':5 'waitress':17 'woman':12
41	ARSENIC INDEPENDENCE	A Fanciful Documentary of a Mad Cow And a Womanizer who must Find a Dentist in Berlin	2006	1	\N	4	0.99	137	17.99	2006-02-15 05:03:42	'arsenic':1 'berlin':19 'cow':9 'dentist':17 'documentari':5 'fanci':4 'find':15 'independ':2 'mad':8 'must':14 'woman':12
42	ARTIST COLDBLOODED	A Stunning Reflection of a Robot And a Moose who must Challenge a Woman in California	2006	1	\N	5	2.99	170	10.99	2006-02-15 05:03:42	'artist':1 'california':18 'challeng':14 'coldblood':2 'moos':11 'must':13 'reflect':5 'robot':8 'stun':4 'woman':16
43	ATLANTIS CAUSE	A Thrilling Yarn of a Feminist And a Hunter who must Fight a Technical Writer in A Shark Tank	2006	1	\N	6	2.99	170	15.99	2006-02-15 05:03:42	'atlanti':1 'caus':2 'feminist':8 'fight':14 'hunter':11 'must':13 'shark':20 'tank':21 'technic':16 'thrill':4 'writer':17 'yarn':5
44	ATTACKS HATE	A Fast-Paced Panorama of a Technical Writer And a Mad Scientist who must Find a Feminist in An Abandoned Mine Shaft	2006	1	\N	5	4.99	113	21.99	2006-02-15 05:03:42	'abandon':23 'attack':1 'fast':5 'fast-pac':4 'feminist':20 'find':18 'hate':2 'mad':14 'mine':24 'must':17 'pace':6 'panorama':7 'scientist':15 'shaft':25 'technic':10 'writer':11
45	ATTRACTION NEWTON	A Astounding Panorama of a Composer And a Frisbee who must Reach a Husband in Ancient Japan	2006	1	\N	5	4.99	83	14.99	2006-02-15 05:03:42	'ancient':18 'astound':4 'attract':1 'compos':8 'frisbe':11 'husband':16 'japan':19 'must':13 'newton':2 'panorama':5 'reach':14
46	AUTUMN CROW	A Beautiful Tale of a Dentist And a Mad Cow who must Battle a Moose in The Sahara Desert	2006	1	\N	3	4.99	108	13.99	2006-02-15 05:03:42	'autumn':1 'battl':15 'beauti':4 'cow':12 'crow':2 'dentist':8 'desert':21 'mad':11 'moos':17 'must':14 'sahara':20 'tale':5
47	BABY HALL	A Boring Character Study of a A Shark And a Girl who must Outrace a Feminist in An Abandoned Mine Shaft	2006	1	\N	5	4.99	153	23.99	2006-02-15 05:03:42	'abandon':21 'babi':1 'bore':4 'charact':5 'feminist':18 'girl':13 'hall':2 'mine':22 'must':15 'outrac':16 'shaft':23 'shark':10 'studi':6
48	BACKLASH UNDEFEATED	A Stunning Character Study of a Mad Scientist And a Mad Cow who must Kill a Car in A Monastery	2006	1	\N	3	4.99	118	24.99	2006-02-15 05:03:42	'backlash':1 'car':19 'charact':5 'cow':14 'kill':17 'mad':9,13 'monasteri':22 'must':16 'scientist':10 'studi':6 'stun':4 'undef':2
49	BADMAN DAWN	A Emotional Panorama of a Pioneer And a Composer who must Escape a Mad Scientist in A Jet Boat	2006	1	\N	6	2.99	162	22.99	2006-02-15 05:03:42	'badman':1 'boat':21 'compos':11 'dawn':2 'emot':4 'escap':14 'jet':20 'mad':16 'must':13 'panorama':5 'pioneer':8 'scientist':17
50	BAKED CLEOPATRA	A Stunning Drama of a Forensic Psychologist And a Husband who must Overcome a Waitress in A Monastery	2006	1	\N	3	2.99	182	20.99	2006-02-15 05:03:42	'bake':1 'cleopatra':2 'drama':5 'forens':8 'husband':12 'monasteri':20 'must':14 'overcom':15 'psychologist':9 'stun':4 'waitress':17
51	BALLOON HOMEWARD	A Insightful Panorama of a Forensic Psychologist And a Mad Cow who must Build a Mad Scientist in The First Manned Space Station	2006	1	\N	5	2.99	75	10.99	2006-02-15 05:03:42	'balloon':1 'build':16 'cow':13 'first':22 'forens':8 'homeward':2 'insight':4 'mad':12,18 'man':23 'must':15 'panorama':5 'psychologist':9 'scientist':19 'space':24 'station':25
52	BALLROOM MOCKINGBIRD	A Thrilling Documentary of a Composer And a Monkey who must Find a Feminist in California	2006	1	\N	6	0.99	173	29.99	2006-02-15 05:03:42	'ballroom':1 'california':18 'compos':8 'documentari':5 'feminist':16 'find':14 'mockingbird':2 'monkey':11 'must':13 'thrill':4
53	BANG KWAI	A Epic Drama of a Madman And a Cat who must Face a A Shark in An Abandoned Amusement Park	2006	1	\N	5	2.99	87	25.99	2006-02-15 05:03:42	'abandon':20 'amus':21 'bang':1 'cat':11 'drama':5 'epic':4 'face':14 'kwai':2 'madman':8 'must':13 'park':22 'shark':17
54	BANGER PINOCCHIO	A Awe-Inspiring Drama of a Car And a Pastry Chef who must Chase a Crocodile in The First Manned Space Station	2006	1	\N	5	0.99	113	15.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'banger':1 'car':10 'chase':17 'chef':14 'crocodil':19 'drama':7 'first':22 'inspir':6 'man':23 'must':16 'pastri':13 'pinocchio':2 'space':24 'station':25
55	BARBARELLA STREETCAR	A Awe-Inspiring Story of a Feminist And a Cat who must Conquer a Dog in A Monastery	2006	1	\N	6	2.99	65	27.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'barbarella':1 'cat':13 'conquer':16 'dog':18 'feminist':10 'inspir':6 'monasteri':21 'must':15 'stori':7 'streetcar':2
56	BAREFOOT MANCHURIAN	A Intrepid Story of a Cat And a Student who must Vanquish a Girl in An Abandoned Amusement Park	2006	1	\N	6	2.99	129	15.99	2006-02-15 05:03:42	'abandon':19 'amus':20 'barefoot':1 'cat':8 'girl':16 'intrepid':4 'manchurian':2 'must':13 'park':21 'stori':5 'student':11 'vanquish':14
57	BASIC EASY	A Stunning Epistle of a Man And a Husband who must Reach a Mad Scientist in A Jet Boat	2006	1	\N	4	2.99	90	18.99	2006-02-15 05:03:42	'basic':1 'boat':21 'easi':2 'epistl':5 'husband':11 'jet':20 'mad':16 'man':8 'must':13 'reach':14 'scientist':17 'stun':4
58	BEACH HEARTBREAKERS	A Fateful Display of a Womanizer And a Mad Scientist who must Outgun a A Shark in Soviet Georgia	2006	1	\N	6	2.99	122	16.99	2006-02-15 05:03:42	'beach':1 'display':5 'fate':4 'georgia':21 'heartbreak':2 'mad':11 'must':14 'outgun':15 'scientist':12 'shark':18 'soviet':20 'woman':8
59	BEAR GRACELAND	A Astounding Saga of a Dog And a Boy who must Kill a Teacher in The First Manned Space Station	2006	1	\N	4	2.99	160	20.99	2006-02-15 05:03:42	'astound':4 'bear':1 'boy':11 'dog':8 'first':19 'graceland':2 'kill':14 'man':20 'must':13 'saga':5 'space':21 'station':22 'teacher':16
60	BEAST HUNCHBACK	A Awe-Inspiring Epistle of a Student And a Squirrel who must Defeat a Boy in Ancient China	2006	1	\N	3	4.99	89	22.99	2006-02-15 05:03:42	'ancient':20 'awe':5 'awe-inspir':4 'beast':1 'boy':18 'china':21 'defeat':16 'epistl':7 'hunchback':2 'inspir':6 'must':15 'squirrel':13 'student':10
61	BEAUTY GREASE	A Fast-Paced Display of a Composer And a Moose who must Sink a Robot in An Abandoned Mine Shaft	2006	1	\N	5	4.99	175	28.99	2006-02-15 05:03:42	'abandon':21 'beauti':1 'compos':10 'display':7 'fast':5 'fast-pac':4 'greas':2 'mine':22 'moos':13 'must':15 'pace':6 'robot':18 'shaft':23 'sink':16
62	BED HIGHBALL	A Astounding Panorama of a Lumberjack And a Dog who must Redeem a Woman in An Abandoned Fun House	2006	1	\N	5	2.99	106	23.99	2006-02-15 05:03:42	'abandon':19 'astound':4 'bed':1 'dog':11 'fun':20 'highbal':2 'hous':21 'lumberjack':8 'must':13 'panorama':5 'redeem':14 'woman':16
63	BEDAZZLED MARRIED	A Astounding Character Study of a Madman And a Robot who must Meet a Mad Scientist in An Abandoned Fun House	2006	1	\N	6	0.99	73	21.99	2006-02-15 05:03:42	'abandon':21 'astound':4 'bedazzl':1 'charact':5 'fun':22 'hous':23 'mad':17 'madman':9 'marri':2 'meet':15 'must':14 'robot':12 'scientist':18 'studi':6
64	BEETHOVEN EXORCIST	A Epic Display of a Pioneer And a Student who must Challenge a Butler in The Gulf of Mexico	2006	1	\N	6	0.99	151	26.99	2006-02-15 05:03:42	'beethoven':1 'butler':16 'challeng':14 'display':5 'epic':4 'exorcist':2 'gulf':19 'mexico':21 'must':13 'pioneer':8 'student':11
65	BEHAVIOR RUNAWAY	A Unbelieveable Drama of a Student And a Husband who must Outrace a Sumo Wrestler in Berlin	2006	1	\N	3	4.99	100	20.99	2006-02-15 05:03:42	'behavior':1 'berlin':19 'drama':5 'husband':11 'must':13 'outrac':14 'runaway':2 'student':8 'sumo':16 'unbeliev':4 'wrestler':17
66	BENEATH RUSH	A Astounding Panorama of a Man And a Monkey who must Discover a Man in The First Manned Space Station	2006	1	\N	6	0.99	53	27.99	2006-02-15 05:03:42	'astound':4 'beneath':1 'discov':14 'first':19 'man':8,16,20 'monkey':11 'must':13 'panorama':5 'rush':2 'space':21 'station':22
67	BERETS AGENT	A Taut Saga of a Crocodile And a Boy who must Overcome a Technical Writer in Ancient China	2006	1	\N	5	2.99	77	24.99	2006-02-15 05:03:42	'agent':2 'ancient':19 'beret':1 'boy':11 'china':20 'crocodil':8 'must':13 'overcom':14 'saga':5 'taut':4 'technic':16 'writer':17
68	BETRAYED REAR	A Emotional Character Study of a Boat And a Pioneer who must Find a Explorer in A Shark Tank	2006	1	\N	5	4.99	122	26.99	2006-02-15 05:03:42	'betray':1 'boat':9 'charact':5 'emot':4 'explor':17 'find':15 'must':14 'pioneer':12 'rear':2 'shark':20 'studi':6 'tank':21
69	BEVERLY OUTLAW	A Fanciful Documentary of a Womanizer And a Boat who must Defeat a Madman in The First Manned Space Station	2006	1	\N	3	2.99	85	21.99	2006-02-15 05:03:42	'bever':1 'boat':11 'defeat':14 'documentari':5 'fanci':4 'first':19 'madman':16 'man':20 'must':13 'outlaw':2 'space':21 'station':22 'woman':8
70	BIKINI BORROWERS	A Astounding Drama of a Astronaut And a Cat who must Discover a Woman in The First Manned Space Station	2006	1	\N	7	4.99	142	26.99	2006-02-15 05:03:42	'astound':4 'astronaut':8 'bikini':1 'borrow':2 'cat':11 'discov':14 'drama':5 'first':19 'man':20 'must':13 'space':21 'station':22 'woman':16
71	BILKO ANONYMOUS	A Emotional Reflection of a Teacher And a Man who must Meet a Cat in The First Manned Space Station	2006	1	\N	3	4.99	100	25.99	2006-02-15 05:03:42	'anonym':2 'bilko':1 'cat':16 'emot':4 'first':19 'man':11,20 'meet':14 'must':13 'reflect':5 'space':21 'station':22 'teacher':8
72	BILL OTHERS	A Stunning Saga of a Mad Scientist And a Forensic Psychologist who must Challenge a Squirrel in A MySQL Convention	2006	1	\N	6	2.99	93	12.99	2006-02-15 05:03:42	'bill':1 'challeng':16 'convent':22 'forens':12 'mad':8 'must':15 'mysql':21 'other':2 'psychologist':13 'saga':5 'scientist':9 'squirrel':18 'stun':4
74	BIRCH ANTITRUST	A Fanciful Panorama of a Husband And a Pioneer who must Outgun a Dog in A Baloon	2006	1	\N	4	4.99	162	18.99	2006-02-15 05:03:42	'antitrust':2 'baloon':19 'birch':1 'dog':16 'fanci':4 'husband':8 'must':13 'outgun':14 'panorama':5 'pioneer':11
75	BIRD INDEPENDENCE	A Thrilling Documentary of a Car And a Student who must Sink a Hunter in The Canadian Rockies	2006	1	\N	6	4.99	163	14.99	2006-02-15 05:03:42	'bird':1 'canadian':19 'car':8 'documentari':5 'hunter':16 'independ':2 'must':13 'rocki':20 'sink':14 'student':11 'thrill':4
76	BIRDCAGE CASPER	A Fast-Paced Saga of a Frisbee And a Astronaut who must Overcome a Feminist in Ancient India	2006	1	\N	4	0.99	103	23.99	2006-02-15 05:03:42	'ancient':20 'astronaut':13 'birdcag':1 'casper':2 'fast':5 'fast-pac':4 'feminist':18 'frisbe':10 'india':21 'must':15 'overcom':16 'pace':6 'saga':7
77	BIRDS PERDITION	A Boring Story of a Womanizer And a Pioneer who must Face a Dog in California	2006	1	\N	5	4.99	61	15.99	2006-02-15 05:03:42	'bird':1 'bore':4 'california':18 'dog':16 'face':14 'must':13 'perdit':2 'pioneer':11 'stori':5 'woman':8
78	BLACKOUT PRIVATE	A Intrepid Yarn of a Pastry Chef And a Mad Scientist who must Challenge a Secret Agent in Ancient Japan	2006	1	\N	7	2.99	85	12.99	2006-02-15 05:03:42	'agent':19 'ancient':21 'blackout':1 'challeng':16 'chef':9 'intrepid':4 'japan':22 'mad':12 'must':15 'pastri':8 'privat':2 'scientist':13 'secret':18 'yarn':5
79	BLADE POLISH	A Thoughtful Character Study of a Frisbee And a Pastry Chef who must Fight a Dentist in The First Manned Space Station	2006	1	\N	5	0.99	114	10.99	2006-02-15 05:03:42	'blade':1 'charact':5 'chef':13 'dentist':18 'fight':16 'first':21 'frisbe':9 'man':22 'must':15 'pastri':12 'polish':2 'space':23 'station':24 'studi':6 'thought':4
80	BLANKET BEVERLY	A Emotional Documentary of a Student And a Girl who must Build a Boat in Nigeria	2006	1	\N	7	2.99	148	21.99	2006-02-15 05:03:42	'bever':2 'blanket':1 'boat':16 'build':14 'documentari':5 'emot':4 'girl':11 'must':13 'nigeria':18 'student':8
81	BLINDNESS GUN	A Touching Drama of a Robot And a Dentist who must Meet a Hunter in A Jet Boat	2006	1	\N	6	4.99	103	29.99	2006-02-15 05:03:42	'blind':1 'boat':20 'dentist':11 'drama':5 'gun':2 'hunter':16 'jet':19 'meet':14 'must':13 'robot':8 'touch':4
82	BLOOD ARGONAUTS	A Boring Drama of a Explorer And a Man who must Kill a Lumberjack in A Manhattan Penthouse	2006	1	\N	3	0.99	71	13.99	2006-02-15 05:03:42	'argonaut':2 'blood':1 'bore':4 'drama':5 'explor':8 'kill':14 'lumberjack':16 'man':11 'manhattan':19 'must':13 'penthous':20
83	BLUES INSTINCT	A Insightful Documentary of a Boat And a Composer who must Meet a Forensic Psychologist in An Abandoned Fun House	2006	1	\N	5	2.99	50	18.99	2006-02-15 05:03:42	'abandon':20 'blue':1 'boat':8 'compos':11 'documentari':5 'forens':16 'fun':21 'hous':22 'insight':4 'instinct':2 'meet':14 'must':13 'psychologist':17
84	BOILED DARES	A Awe-Inspiring Story of a Waitress And a Dog who must Discover a Dentist in Ancient Japan	2006	1	\N	7	4.99	102	13.99	2006-02-15 05:03:42	'ancient':20 'awe':5 'awe-inspir':4 'boil':1 'dare':2 'dentist':18 'discov':16 'dog':13 'inspir':6 'japan':21 'must':15 'stori':7 'waitress':10
85	BONNIE HOLOCAUST	A Fast-Paced Story of a Crocodile And a Robot who must Find a Moose in Ancient Japan	2006	1	\N	4	0.99	63	29.99	2006-02-15 05:03:42	'ancient':20 'bonni':1 'crocodil':10 'fast':5 'fast-pac':4 'find':16 'holocaust':2 'japan':21 'moos':18 'must':15 'pace':6 'robot':13 'stori':7
107	BUNCH MINDS	A Emotional Story of a Feminist And a Feminist who must Escape a Pastry Chef in A MySQL Convention	2006	1	\N	4	2.99	63	13.99	2006-02-15 05:03:42	'bunch':1 'chef':17 'convent':21 'emot':4 'escap':14 'feminist':8,11 'mind':2 'must':13 'mysql':20 'pastri':16 'stori':5
86	BOOGIE AMELIE	A Lacklusture Character Study of a Husband And a Sumo Wrestler who must Succumb a Technical Writer in The Gulf of Mexico	2006	1	\N	6	4.99	121	11.99	2006-02-15 05:03:42	'ameli':2 'boogi':1 'charact':5 'gulf':22 'husband':9 'lacklustur':4 'mexico':24 'must':15 'studi':6 'succumb':16 'sumo':12 'technic':18 'wrestler':13 'writer':19
87	BOONDOCK BALLROOM	A Fateful Panorama of a Crocodile And a Boy who must Defeat a Monkey in The Gulf of Mexico	2006	1	\N	7	0.99	76	14.99	2006-02-15 05:03:42	'ballroom':2 'boondock':1 'boy':11 'crocodil':8 'defeat':14 'fate':4 'gulf':19 'mexico':21 'monkey':16 'must':13 'panorama':5
88	BORN SPINAL	A Touching Epistle of a Frisbee And a Husband who must Pursue a Student in Nigeria	2006	1	\N	7	4.99	179	17.99	2006-02-15 05:03:42	'born':1 'epistl':5 'frisbe':8 'husband':11 'must':13 'nigeria':18 'pursu':14 'spinal':2 'student':16 'touch':4
89	BORROWERS BEDAZZLED	A Brilliant Epistle of a Teacher And a Sumo Wrestler who must Defeat a Man in An Abandoned Fun House	2006	1	\N	7	0.99	63	22.99	2006-02-15 05:03:42	'abandon':20 'bedazzl':2 'borrow':1 'brilliant':4 'defeat':15 'epistl':5 'fun':21 'hous':22 'man':17 'must':14 'sumo':11 'teacher':8 'wrestler':12
90	BOULEVARD MOB	A Fateful Epistle of a Moose And a Monkey who must Confront a Lumberjack in Ancient China	2006	1	\N	3	0.99	63	11.99	2006-02-15 05:03:42	'ancient':18 'boulevard':1 'china':19 'confront':14 'epistl':5 'fate':4 'lumberjack':16 'mob':2 'monkey':11 'moos':8 'must':13
182	CONTROL ANTHEM	A Fateful Documentary of a Robot And a Student who must Battle a Cat in A Monastery	2006	1	\N	7	4.99	185	9.99	2006-02-15 05:03:42	'anthem':2 'battl':14 'cat':16 'control':1 'documentari':5 'fate':4 'monasteri':19 'must':13 'robot':8 'student':11
91	BOUND CHEAPER	A Thrilling Panorama of a Database Administrator And a Astronaut who must Challenge a Lumberjack in A Baloon	2006	1	\N	5	0.99	98	17.99	2006-02-15 05:03:42	'administr':9 'astronaut':12 'baloon':20 'bound':1 'challeng':15 'cheaper':2 'databas':8 'lumberjack':17 'must':14 'panorama':5 'thrill':4
92	BOWFINGER GABLES	A Fast-Paced Yarn of a Waitress And a Composer who must Outgun a Dentist in California	2006	1	\N	7	4.99	72	19.99	2006-02-15 05:03:42	'bowfing':1 'california':20 'compos':13 'dentist':18 'fast':5 'fast-pac':4 'gabl':2 'must':15 'outgun':16 'pace':6 'waitress':10 'yarn':7
93	BRANNIGAN SUNRISE	A Amazing Epistle of a Moose And a Crocodile who must Outrace a Dog in Berlin	2006	1	\N	4	4.99	121	27.99	2006-02-15 05:03:42	'amaz':4 'berlin':18 'brannigan':1 'crocodil':11 'dog':16 'epistl':5 'moos':8 'must':13 'outrac':14 'sunris':2
94	BRAVEHEART HUMAN	A Insightful Story of a Dog And a Pastry Chef who must Battle a Girl in Berlin	2006	1	\N	7	2.99	176	14.99	2006-02-15 05:03:42	'battl':15 'berlin':19 'braveheart':1 'chef':12 'dog':8 'girl':17 'human':2 'insight':4 'must':14 'pastri':11 'stori':5
95	BREAKFAST GOLDFINGER	A Beautiful Reflection of a Student And a Student who must Fight a Moose in Berlin	2006	1	\N	5	4.99	123	18.99	2006-02-15 05:03:42	'beauti':4 'berlin':18 'breakfast':1 'fight':14 'goldfing':2 'moos':16 'must':13 'reflect':5 'student':8,11
96	BREAKING HOME	A Beautiful Display of a Secret Agent And a Monkey who must Battle a Sumo Wrestler in An Abandoned Mine Shaft	2006	1	\N	4	2.99	169	21.99	2006-02-15 05:03:42	'abandon':21 'agent':9 'battl':15 'beauti':4 'break':1 'display':5 'home':2 'mine':22 'monkey':12 'must':14 'secret':8 'shaft':23 'sumo':17 'wrestler':18
97	BRIDE INTRIGUE	A Epic Tale of a Robot And a Monkey who must Vanquish a Man in New Orleans	2006	1	\N	7	0.99	56	24.99	2006-02-15 05:03:42	'bride':1 'epic':4 'intrigu':2 'man':16 'monkey':11 'must':13 'new':18 'orlean':19 'robot':8 'tale':5 'vanquish':14
98	BRIGHT ENCOUNTERS	A Fateful Yarn of a Lumberjack And a Feminist who must Conquer a Student in A Jet Boat	2006	1	\N	4	4.99	73	12.99	2006-02-15 05:03:42	'boat':20 'bright':1 'conquer':14 'encount':2 'fate':4 'feminist':11 'jet':19 'lumberjack':8 'must':13 'student':16 'yarn':5
99	BRINGING HYSTERICAL	A Fateful Saga of a A Shark And a Technical Writer who must Find a Woman in A Jet Boat	2006	1	\N	7	2.99	136	14.99	2006-02-15 05:03:42	'boat':22 'bring':1 'fate':4 'find':16 'hyster':2 'jet':21 'must':15 'saga':5 'shark':9 'technic':12 'woman':18 'writer':13
100	BROOKLYN DESERT	A Beautiful Drama of a Dentist And a Composer who must Battle a Sumo Wrestler in The First Manned Space Station	2006	1	\N	7	4.99	161	21.99	2006-02-15 05:03:42	'battl':14 'beauti':4 'brooklyn':1 'compos':11 'dentist':8 'desert':2 'drama':5 'first':20 'man':21 'must':13 'space':22 'station':23 'sumo':16 'wrestler':17
101	BROTHERHOOD BLANKET	A Fateful Character Study of a Butler And a Technical Writer who must Sink a Astronaut in Ancient Japan	2006	1	\N	3	0.99	73	26.99	2006-02-15 05:03:42	'ancient':20 'astronaut':18 'blanket':2 'brotherhood':1 'butler':9 'charact':5 'fate':4 'japan':21 'must':15 'sink':16 'studi':6 'technic':12 'writer':13
102	BUBBLE GROSSE	A Awe-Inspiring Panorama of a Crocodile And a Moose who must Confront a Girl in A Baloon	2006	1	\N	4	4.99	60	20.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'baloon':21 'bubbl':1 'confront':16 'crocodil':10 'girl':18 'gross':2 'inspir':6 'moos':13 'must':15 'panorama':7
103	BUCKET BROTHERHOOD	A Amazing Display of a Girl And a Womanizer who must Succumb a Lumberjack in A Baloon Factory	2006	1	\N	7	4.99	133	27.99	2006-02-15 05:03:42	'amaz':4 'baloon':19 'brotherhood':2 'bucket':1 'display':5 'factori':20 'girl':8 'lumberjack':16 'must':13 'succumb':14 'woman':11
104	BUGSY SONG	A Awe-Inspiring Character Study of a Secret Agent And a Boat who must Find a Squirrel in The First Manned Space Station	2006	1	\N	4	2.99	119	17.99	2006-02-15 05:03:42	'agent':12 'awe':5 'awe-inspir':4 'boat':15 'bugsi':1 'charact':7 'find':18 'first':23 'inspir':6 'man':24 'must':17 'secret':11 'song':2 'space':25 'squirrel':20 'station':26 'studi':8
105	BULL SHAWSHANK	A Fanciful Drama of a Moose And a Squirrel who must Conquer a Pioneer in The Canadian Rockies	2006	1	\N	6	0.99	125	21.99	2006-02-15 05:03:42	'bull':1 'canadian':19 'conquer':14 'drama':5 'fanci':4 'moos':8 'must':13 'pioneer':16 'rocki':20 'shawshank':2 'squirrel':11
106	BULWORTH COMMANDMENTS	A Amazing Display of a Mad Cow And a Pioneer who must Redeem a Sumo Wrestler in The Outback	2006	1	\N	4	2.99	61	14.99	2006-02-15 05:03:42	'amaz':4 'bulworth':1 'command':2 'cow':9 'display':5 'mad':8 'must':14 'outback':21 'pioneer':12 'redeem':15 'sumo':17 'wrestler':18
108	BUTCH PANTHER	A Lacklusture Yarn of a Feminist And a Database Administrator who must Face a Hunter in New Orleans	2006	1	\N	6	0.99	67	19.99	2006-02-15 05:03:42	'administr':12 'butch':1 'databas':11 'face':15 'feminist':8 'hunter':17 'lacklustur':4 'must':14 'new':19 'orlean':20 'panther':2 'yarn':5
109	BUTTERFLY CHOCOLAT	A Fateful Story of a Girl And a Composer who must Conquer a Husband in A Shark Tank	2006	1	\N	3	0.99	89	17.99	2006-02-15 05:03:42	'butterfli':1 'chocolat':2 'compos':11 'conquer':14 'fate':4 'girl':8 'husband':16 'must':13 'shark':19 'stori':5 'tank':20
110	CABIN FLASH	A Stunning Epistle of a Boat And a Man who must Challenge a A Shark in A Baloon Factory	2006	1	\N	4	0.99	53	25.99	2006-02-15 05:03:42	'baloon':20 'boat':8 'cabin':1 'challeng':14 'epistl':5 'factori':21 'flash':2 'man':11 'must':13 'shark':17 'stun':4
111	CADDYSHACK JEDI	A Awe-Inspiring Epistle of a Woman And a Madman who must Fight a Robot in Soviet Georgia	2006	1	\N	3	0.99	52	17.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'caddyshack':1 'epistl':7 'fight':16 'georgia':21 'inspir':6 'jedi':2 'madman':13 'must':15 'robot':18 'soviet':20 'woman':10
112	CALENDAR GUNFIGHT	A Thrilling Drama of a Frisbee And a Lumberjack who must Sink a Man in Nigeria	2006	1	\N	4	4.99	120	22.99	2006-02-15 05:03:42	'calendar':1 'drama':5 'frisbe':8 'gunfight':2 'lumberjack':11 'man':16 'must':13 'nigeria':18 'sink':14 'thrill':4
113	CALIFORNIA BIRDS	A Thrilling Yarn of a Database Administrator And a Robot who must Battle a Database Administrator in Ancient India	2006	1	\N	4	4.99	75	19.99	2006-02-15 05:03:42	'administr':9,18 'ancient':20 'battl':15 'bird':2 'california':1 'databas':8,17 'india':21 'must':14 'robot':12 'thrill':4 'yarn':5
114	CAMELOT VACATION	A Touching Character Study of a Woman And a Waitress who must Battle a Pastry Chef in A MySQL Convention	2006	1	\N	3	0.99	61	26.99	2006-02-15 05:03:42	'battl':15 'camelot':1 'charact':5 'chef':18 'convent':22 'must':14 'mysql':21 'pastri':17 'studi':6 'touch':4 'vacat':2 'waitress':12 'woman':9
115	CAMPUS REMEMBER	A Astounding Drama of a Crocodile And a Mad Cow who must Build a Robot in A Jet Boat	2006	1	\N	5	2.99	167	27.99	2006-02-15 05:03:42	'astound':4 'boat':21 'build':15 'campus':1 'cow':12 'crocodil':8 'drama':5 'jet':20 'mad':11 'must':14 'rememb':2 'robot':17
116	CANDIDATE PERDITION	A Brilliant Epistle of a Composer And a Database Administrator who must Vanquish a Mad Scientist in The First Manned Space Station	2006	1	\N	4	2.99	70	10.99	2006-02-15 05:03:42	'administr':12 'brilliant':4 'candid':1 'compos':8 'databas':11 'epistl':5 'first':21 'mad':17 'man':22 'must':14 'perdit':2 'scientist':18 'space':23 'station':24 'vanquish':15
117	CANDLES GRAPES	A Fanciful Character Study of a Monkey And a Explorer who must Build a Astronaut in An Abandoned Fun House	2006	1	\N	6	4.99	135	15.99	2006-02-15 05:03:42	'abandon':20 'astronaut':17 'build':15 'candl':1 'charact':5 'explor':12 'fanci':4 'fun':21 'grape':2 'hous':22 'monkey':9 'must':14 'studi':6
118	CANYON STOCK	A Thoughtful Reflection of a Waitress And a Feminist who must Escape a Squirrel in A Manhattan Penthouse	2006	1	\N	7	0.99	85	26.99	2006-02-15 05:03:42	'canyon':1 'escap':14 'feminist':11 'manhattan':19 'must':13 'penthous':20 'reflect':5 'squirrel':16 'stock':2 'thought':4 'waitress':8
119	CAPER MOTIONS	A Fateful Saga of a Moose And a Car who must Pursue a Woman in A MySQL Convention	2006	1	\N	6	0.99	176	22.99	2006-02-15 05:03:42	'caper':1 'car':11 'convent':20 'fate':4 'moos':8 'motion':2 'must':13 'mysql':19 'pursu':14 'saga':5 'woman':16
120	CARIBBEAN LIBERTY	A Fanciful Tale of a Pioneer And a Technical Writer who must Outgun a Pioneer in A Shark Tank	2006	1	\N	3	4.99	92	16.99	2006-02-15 05:03:42	'caribbean':1 'fanci':4 'liberti':2 'must':14 'outgun':15 'pioneer':8,17 'shark':20 'tale':5 'tank':21 'technic':11 'writer':12
121	CAROL TEXAS	A Astounding Character Study of a Composer And a Student who must Overcome a Composer in A Monastery	2006	1	\N	4	2.99	151	15.99	2006-02-15 05:03:42	'astound':4 'carol':1 'charact':5 'compos':9,17 'monasteri':20 'must':14 'overcom':15 'student':12 'studi':6 'texa':2
122	CARRIE BUNCH	A Amazing Epistle of a Student And a Astronaut who must Discover a Frisbee in The Canadian Rockies	2006	1	\N	7	0.99	114	11.99	2006-02-15 05:03:42	'amaz':4 'astronaut':11 'bunch':2 'canadian':19 'carri':1 'discov':14 'epistl':5 'frisbe':16 'must':13 'rocki':20 'student':8
123	CASABLANCA SUPER	A Amazing Panorama of a Crocodile And a Forensic Psychologist who must Pursue a Secret Agent in The First Manned Space Station	2006	1	\N	6	4.99	85	22.99	2006-02-15 05:03:42	'agent':18 'amaz':4 'casablanca':1 'crocodil':8 'first':21 'forens':11 'man':22 'must':14 'panorama':5 'psychologist':12 'pursu':15 'secret':17 'space':23 'station':24 'super':2
124	CASPER DRAGONFLY	A Intrepid Documentary of a Boat And a Crocodile who must Chase a Robot in The Sahara Desert	2006	1	\N	3	4.99	163	16.99	2006-02-15 05:03:42	'boat':8 'casper':1 'chase':14 'crocodil':11 'desert':20 'documentari':5 'dragonfli':2 'intrepid':4 'must':13 'robot':16 'sahara':19
125	CASSIDY WYOMING	A Intrepid Drama of a Frisbee And a Hunter who must Kill a Secret Agent in New Orleans	2006	1	\N	5	2.99	61	19.99	2006-02-15 05:03:42	'agent':17 'cassidi':1 'drama':5 'frisbe':8 'hunter':11 'intrepid':4 'kill':14 'must':13 'new':19 'orlean':20 'secret':16 'wyom':2
126	CASUALTIES ENCINO	A Insightful Yarn of a A Shark And a Pastry Chef who must Face a Boy in A Monastery	2006	1	\N	3	4.99	179	16.99	2006-02-15 05:03:42	'boy':18 'casualti':1 'chef':13 'encino':2 'face':16 'insight':4 'monasteri':21 'must':15 'pastri':12 'shark':9 'yarn':5
127	CAT CONEHEADS	A Fast-Paced Panorama of a Girl And a A Shark who must Confront a Boy in Ancient India	2006	1	\N	5	4.99	112	14.99	2006-02-15 05:03:42	'ancient':21 'boy':19 'cat':1 'conehead':2 'confront':17 'fast':5 'fast-pac':4 'girl':10 'india':22 'must':16 'pace':6 'panorama':7 'shark':14
128	CATCH AMISTAD	A Boring Reflection of a Lumberjack And a Feminist who must Discover a Woman in Nigeria	2006	1	\N	7	0.99	183	10.99	2006-02-15 05:03:42	'amistad':2 'bore':4 'catch':1 'discov':14 'feminist':11 'lumberjack':8 'must':13 'nigeria':18 'reflect':5 'woman':16
129	CAUSE DATE	A Taut Tale of a Explorer And a Pastry Chef who must Conquer a Hunter in A MySQL Convention	2006	1	\N	3	2.99	179	16.99	2006-02-15 05:03:42	'caus':1 'chef':12 'conquer':15 'convent':21 'date':2 'explor':8 'hunter':17 'must':14 'mysql':20 'pastri':11 'tale':5 'taut':4
130	CELEBRITY HORN	A Amazing Documentary of a Secret Agent And a Astronaut who must Vanquish a Hunter in A Shark Tank	2006	1	\N	7	0.99	110	24.99	2006-02-15 05:03:42	'agent':9 'amaz':4 'astronaut':12 'celebr':1 'documentari':5 'horn':2 'hunter':17 'must':14 'secret':8 'shark':20 'tank':21 'vanquish':15
131	CENTER DINOSAUR	A Beautiful Character Study of a Sumo Wrestler And a Dentist who must Find a Dog in California	2006	1	\N	5	4.99	152	12.99	2006-02-15 05:03:42	'beauti':4 'california':20 'center':1 'charact':5 'dentist':13 'dinosaur':2 'dog':18 'find':16 'must':15 'studi':6 'sumo':9 'wrestler':10
132	CHAINSAW UPTOWN	A Beautiful Documentary of a Boy And a Robot who must Discover a Squirrel in Australia	2006	1	\N	6	0.99	114	25.99	2006-02-15 05:03:42	'australia':18 'beauti':4 'boy':8 'chainsaw':1 'discov':14 'documentari':5 'must':13 'robot':11 'squirrel':16 'uptown':2
133	CHAMBER ITALIAN	A Fateful Reflection of a Moose And a Husband who must Overcome a Monkey in Nigeria	2006	1	\N	7	4.99	117	14.99	2006-02-15 05:03:42	'chamber':1 'fate':4 'husband':11 'italian':2 'monkey':16 'moos':8 'must':13 'nigeria':18 'overcom':14 'reflect':5
134	CHAMPION FLATLINERS	A Amazing Story of a Mad Cow And a Dog who must Kill a Husband in A Monastery	2006	1	\N	4	4.99	51	21.99	2006-02-15 05:03:42	'amaz':4 'champion':1 'cow':9 'dog':12 'flatlin':2 'husband':17 'kill':15 'mad':8 'monasteri':20 'must':14 'stori':5
135	CHANCE RESURRECTION	A Astounding Story of a Forensic Psychologist And a Forensic Psychologist who must Overcome a Moose in Ancient China	2006	1	\N	3	2.99	70	22.99	2006-02-15 05:03:42	'ancient':20 'astound':4 'chanc':1 'china':21 'forens':8,12 'moos':18 'must':15 'overcom':16 'psychologist':9,13 'resurrect':2 'stori':5
136	CHAPLIN LICENSE	A Boring Drama of a Dog And a Forensic Psychologist who must Outrace a Explorer in Ancient India	2006	1	\N	7	2.99	146	26.99	2006-02-15 05:03:42	'ancient':19 'bore':4 'chaplin':1 'dog':8 'drama':5 'explor':17 'forens':11 'india':20 'licens':2 'must':14 'outrac':15 'psychologist':12
137	CHARADE DUFFEL	A Action-Packed Display of a Man And a Waitress who must Build a Dog in A MySQL Convention	2006	1	\N	3	2.99	66	21.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'build':16 'charad':1 'convent':22 'display':7 'dog':18 'duffel':2 'man':10 'must':15 'mysql':21 'pack':6 'waitress':13
138	CHARIOTS CONSPIRACY	A Unbelieveable Epistle of a Robot And a Husband who must Chase a Robot in The First Manned Space Station	2006	1	\N	5	2.99	71	29.99	2006-02-15 05:03:42	'chariot':1 'chase':14 'conspiraci':2 'epistl':5 'first':19 'husband':11 'man':20 'must':13 'robot':8,16 'space':21 'station':22 'unbeliev':4
139	CHASING FIGHT	A Astounding Saga of a Technical Writer And a Butler who must Battle a Butler in A Shark Tank	2006	1	\N	7	4.99	114	21.99	2006-02-15 05:03:42	'astound':4 'battl':15 'butler':12,17 'chase':1 'fight':2 'must':14 'saga':5 'shark':20 'tank':21 'technic':8 'writer':9
140	CHEAPER CLYDE	A Emotional Character Study of a Pioneer And a Girl who must Discover a Dog in Ancient Japan	2006	1	\N	6	0.99	87	23.99	2006-02-15 05:03:42	'ancient':19 'charact':5 'cheaper':1 'clyde':2 'discov':15 'dog':17 'emot':4 'girl':12 'japan':20 'must':14 'pioneer':9 'studi':6
141	CHICAGO NORTH	A Fateful Yarn of a Mad Cow And a Waitress who must Battle a Student in California	2006	1	\N	6	4.99	185	11.99	2006-02-15 05:03:42	'battl':15 'california':19 'chicago':1 'cow':9 'fate':4 'mad':8 'must':14 'north':2 'student':17 'waitress':12 'yarn':5
142	CHICKEN HELLFIGHTERS	A Emotional Drama of a Dog And a Explorer who must Outrace a Technical Writer in Australia	2006	1	\N	3	0.99	122	24.99	2006-02-15 05:03:42	'australia':19 'chicken':1 'dog':8 'drama':5 'emot':4 'explor':11 'hellfight':2 'must':13 'outrac':14 'technic':16 'writer':17
143	CHILL LUCK	A Lacklusture Epistle of a Boat And a Technical Writer who must Fight a A Shark in The Canadian Rockies	2006	1	\N	6	0.99	142	17.99	2006-02-15 05:03:42	'boat':8 'canadian':21 'chill':1 'epistl':5 'fight':15 'lacklustur':4 'luck':2 'must':14 'rocki':22 'shark':18 'technic':11 'writer':12
144	CHINATOWN GLADIATOR	A Brilliant Panorama of a Technical Writer And a Lumberjack who must Escape a Butler in Ancient India	2006	1	\N	7	4.99	61	24.99	2006-02-15 05:03:42	'ancient':19 'brilliant':4 'butler':17 'chinatown':1 'escap':15 'gladiat':2 'india':20 'lumberjack':12 'must':14 'panorama':5 'technic':8 'writer':9
145	CHISUM BEHAVIOR	A Epic Documentary of a Sumo Wrestler And a Butler who must Kill a Car in Ancient India	2006	1	\N	5	4.99	124	25.99	2006-02-15 05:03:42	'ancient':19 'behavior':2 'butler':12 'car':17 'chisum':1 'documentari':5 'epic':4 'india':20 'kill':15 'must':14 'sumo':8 'wrestler':9
146	CHITTY LOCK	A Boring Epistle of a Boat And a Database Administrator who must Kill a Sumo Wrestler in The First Manned Space Station	2006	1	\N	6	2.99	107	24.99	2006-02-15 05:03:42	'administr':12 'boat':8 'bore':4 'chitti':1 'databas':11 'epistl':5 'first':21 'kill':15 'lock':2 'man':22 'must':14 'space':23 'station':24 'sumo':17 'wrestler':18
147	CHOCOLAT HARRY	A Action-Packed Epistle of a Dentist And a Moose who must Meet a Mad Cow in Ancient Japan	2006	1	\N	5	0.99	101	16.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'ancient':21 'chocolat':1 'cow':19 'dentist':10 'epistl':7 'harri':2 'japan':22 'mad':18 'meet':16 'moos':13 'must':15 'pack':6
148	CHOCOLATE DUCK	A Unbelieveable Story of a Mad Scientist And a Technical Writer who must Discover a Composer in Ancient China	2006	1	\N	3	2.99	132	13.99	2006-02-15 05:03:42	'ancient':20 'china':21 'chocol':1 'compos':18 'discov':16 'duck':2 'mad':8 'must':15 'scientist':9 'stori':5 'technic':12 'unbeliev':4 'writer':13
149	CHRISTMAS MOONSHINE	A Action-Packed Epistle of a Feminist And a Astronaut who must Conquer a Boat in A Manhattan Penthouse	2006	1	\N	7	0.99	150	21.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'astronaut':13 'boat':18 'christma':1 'conquer':16 'epistl':7 'feminist':10 'manhattan':21 'moonshin':2 'must':15 'pack':6 'penthous':22
150	CIDER DESIRE	A Stunning Character Study of a Composer And a Mad Cow who must Succumb a Cat in Soviet Georgia	2006	1	\N	7	2.99	101	9.99	2006-02-15 05:03:42	'cat':18 'charact':5 'cider':1 'compos':9 'cow':13 'desir':2 'georgia':21 'mad':12 'must':15 'soviet':20 'studi':6 'stun':4 'succumb':16
151	CINCINATTI WHISPERER	A Brilliant Saga of a Pastry Chef And a Hunter who must Confront a Butler in Berlin	2006	1	\N	5	4.99	143	26.99	2006-02-15 05:03:42	'berlin':19 'brilliant':4 'butler':17 'chef':9 'cincinatti':1 'confront':15 'hunter':12 'must':14 'pastri':8 'saga':5 'whisper':2
152	CIRCUS YOUTH	A Thoughtful Drama of a Pastry Chef And a Dentist who must Pursue a Girl in A Baloon	2006	1	\N	5	2.99	90	13.99	2006-02-15 05:03:42	'baloon':20 'chef':9 'circus':1 'dentist':12 'drama':5 'girl':17 'must':14 'pastri':8 'pursu':15 'thought':4 'youth':2
153	CITIZEN SHREK	A Fanciful Character Study of a Technical Writer And a Husband who must Redeem a Robot in The Outback	2006	1	\N	7	0.99	165	18.99	2006-02-15 05:03:42	'charact':5 'citizen':1 'fanci':4 'husband':13 'must':15 'outback':21 'redeem':16 'robot':18 'shrek':2 'studi':6 'technic':9 'writer':10
154	CLASH FREDDY	A Amazing Yarn of a Composer And a Squirrel who must Escape a Astronaut in Australia	2006	1	\N	6	2.99	81	12.99	2006-02-15 05:03:42	'amaz':4 'astronaut':16 'australia':18 'clash':1 'compos':8 'escap':14 'freddi':2 'must':13 'squirrel':11 'yarn':5
155	CLEOPATRA DEVIL	A Fanciful Documentary of a Crocodile And a Technical Writer who must Fight a A Shark in A Baloon	2006	1	\N	6	0.99	150	26.99	2006-02-15 05:03:42	'baloon':21 'cleopatra':1 'crocodil':8 'devil':2 'documentari':5 'fanci':4 'fight':15 'must':14 'shark':18 'technic':11 'writer':12
156	CLERKS ANGELS	A Thrilling Display of a Sumo Wrestler And a Girl who must Confront a Man in A Baloon	2006	1	\N	3	4.99	164	15.99	2006-02-15 05:03:42	'angel':2 'baloon':20 'clerk':1 'confront':15 'display':5 'girl':12 'man':17 'must':14 'sumo':8 'thrill':4 'wrestler':9
157	CLOCKWORK PARADISE	A Insightful Documentary of a Technical Writer And a Feminist who must Challenge a Cat in A Baloon	2006	1	\N	7	0.99	143	29.99	2006-02-15 05:03:42	'baloon':20 'cat':17 'challeng':15 'clockwork':1 'documentari':5 'feminist':12 'insight':4 'must':14 'paradis':2 'technic':8 'writer':9
158	CLONES PINOCCHIO	A Amazing Drama of a Car And a Robot who must Pursue a Dentist in New Orleans	2006	1	\N	6	2.99	124	16.99	2006-02-15 05:03:42	'amaz':4 'car':8 'clone':1 'dentist':16 'drama':5 'must':13 'new':18 'orlean':19 'pinocchio':2 'pursu':14 'robot':11
159	CLOSER BANG	A Unbelieveable Panorama of a Frisbee And a Hunter who must Vanquish a Monkey in Ancient India	2006	1	\N	5	4.99	58	12.99	2006-02-15 05:03:42	'ancient':18 'bang':2 'closer':1 'frisbe':8 'hunter':11 'india':19 'monkey':16 'must':13 'panorama':5 'unbeliev':4 'vanquish':14
160	CLUB GRAFFITI	A Epic Tale of a Pioneer And a Hunter who must Escape a Girl in A U-Boat	2006	1	\N	4	0.99	65	12.99	2006-02-15 05:03:42	'boat':21 'club':1 'epic':4 'escap':14 'girl':16 'graffiti':2 'hunter':11 'must':13 'pioneer':8 'tale':5 'u':20 'u-boat':19
161	CLUE GRAIL	A Taut Tale of a Butler And a Mad Scientist who must Build a Crocodile in Ancient China	2006	1	\N	6	4.99	70	27.99	2006-02-15 05:03:42	'ancient':19 'build':15 'butler':8 'china':20 'clue':1 'crocodil':17 'grail':2 'mad':11 'must':14 'scientist':12 'tale':5 'taut':4
162	CLUELESS BUCKET	A Taut Tale of a Car And a Pioneer who must Conquer a Sumo Wrestler in An Abandoned Fun House	2006	1	\N	4	2.99	95	13.99	2006-02-15 05:03:42	'abandon':20 'bucket':2 'car':8 'clueless':1 'conquer':14 'fun':21 'hous':22 'must':13 'pioneer':11 'sumo':16 'tale':5 'taut':4 'wrestler':17
163	CLYDE THEORY	A Beautiful Yarn of a Astronaut And a Frisbee who must Overcome a Explorer in A Jet Boat	2006	1	\N	4	0.99	139	29.99	2006-02-15 05:03:42	'astronaut':8 'beauti':4 'boat':20 'clyde':1 'explor':16 'frisbe':11 'jet':19 'must':13 'overcom':14 'theori':2 'yarn':5
164	COAST RAINBOW	A Astounding Documentary of a Mad Cow And a Pioneer who must Challenge a Butler in The Sahara Desert	2006	1	\N	4	0.99	55	20.99	2006-02-15 05:03:42	'astound':4 'butler':17 'challeng':15 'coast':1 'cow':9 'desert':21 'documentari':5 'mad':8 'must':14 'pioneer':12 'rainbow':2 'sahara':20
742	ROOF CHAMPION	A Lacklusture Reflection of a Car And a Explorer who must Find a Monkey in A Baloon	2006	1	\N	7	0.99	101	25.99	2006-02-15 05:03:42	'baloon':19 'car':8 'champion':2 'explor':11 'find':14 'lacklustur':4 'monkey':16 'must':13 'reflect':5 'roof':1
165	COLDBLOODED DARLING	A Brilliant Panorama of a Dentist And a Moose who must Find a Student in The Gulf of Mexico	2006	1	\N	7	4.99	70	27.99	2006-02-15 05:03:42	'brilliant':4 'coldblood':1 'darl':2 'dentist':8 'find':14 'gulf':19 'mexico':21 'moos':11 'must':13 'panorama':5 'student':16
166	COLOR PHILADELPHIA	A Thoughtful Panorama of a Car And a Crocodile who must Sink a Monkey in The Sahara Desert	2006	1	\N	6	2.99	149	19.99	2006-02-15 05:03:42	'car':8 'color':1 'crocodil':11 'desert':20 'monkey':16 'must':13 'panorama':5 'philadelphia':2 'sahara':19 'sink':14 'thought':4
167	COMA HEAD	A Awe-Inspiring Drama of a Boy And a Frisbee who must Escape a Pastry Chef in California	2006	1	\N	6	4.99	109	10.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'boy':10 'california':21 'chef':19 'coma':1 'drama':7 'escap':16 'frisbe':13 'head':2 'inspir':6 'must':15 'pastri':18
168	COMANCHEROS ENEMY	A Boring Saga of a Lumberjack And a Monkey who must Find a Monkey in The Gulf of Mexico	2006	1	\N	5	0.99	67	23.99	2006-02-15 05:03:42	'bore':4 'comanchero':1 'enemi':2 'find':14 'gulf':19 'lumberjack':8 'mexico':21 'monkey':11,16 'must':13 'saga':5
169	COMFORTS RUSH	A Unbelieveable Panorama of a Pioneer And a Husband who must Meet a Mad Cow in An Abandoned Mine Shaft	2006	1	\N	3	2.99	76	19.99	2006-02-15 05:03:42	'abandon':20 'comfort':1 'cow':17 'husband':11 'mad':16 'meet':14 'mine':21 'must':13 'panorama':5 'pioneer':8 'rush':2 'shaft':22 'unbeliev':4
170	COMMAND DARLING	A Awe-Inspiring Tale of a Forensic Psychologist And a Woman who must Challenge a Database Administrator in Ancient Japan	2006	1	\N	5	4.99	120	28.99	2006-02-15 05:03:42	'administr':20 'ancient':22 'awe':5 'awe-inspir':4 'challeng':17 'command':1 'darl':2 'databas':19 'forens':10 'inspir':6 'japan':23 'must':16 'psychologist':11 'tale':7 'woman':14
171	COMMANDMENTS EXPRESS	A Fanciful Saga of a Student And a Mad Scientist who must Battle a Hunter in An Abandoned Mine Shaft	2006	1	\N	6	4.99	59	13.99	2006-02-15 05:03:42	'abandon':20 'battl':15 'command':1 'express':2 'fanci':4 'hunter':17 'mad':11 'mine':21 'must':14 'saga':5 'scientist':12 'shaft':22 'student':8
172	CONEHEADS SMOOCHY	A Touching Story of a Womanizer And a Composer who must Pursue a Husband in Nigeria	2006	1	\N	7	4.99	112	12.99	2006-02-15 05:03:42	'compos':11 'conehead':1 'husband':16 'must':13 'nigeria':18 'pursu':14 'smoochi':2 'stori':5 'touch':4 'woman':8
173	CONFESSIONS MAGUIRE	A Insightful Story of a Car And a Boy who must Battle a Technical Writer in A Baloon	2006	1	\N	7	4.99	65	25.99	2006-02-15 05:03:42	'baloon':20 'battl':14 'boy':11 'car':8 'confess':1 'insight':4 'maguir':2 'must':13 'stori':5 'technic':16 'writer':17
174	CONFIDENTIAL INTERVIEW	A Stunning Reflection of a Cat And a Woman who must Find a Astronaut in Ancient Japan	2006	1	\N	6	4.99	180	13.99	2006-02-15 05:03:42	'ancient':18 'astronaut':16 'cat':8 'confidenti':1 'find':14 'interview':2 'japan':19 'must':13 'reflect':5 'stun':4 'woman':11
175	CONFUSED CANDLES	A Stunning Epistle of a Cat And a Forensic Psychologist who must Confront a Pioneer in A Baloon	2006	1	\N	3	2.99	122	27.99	2006-02-15 05:03:42	'baloon':20 'candl':2 'cat':8 'confront':15 'confus':1 'epistl':5 'forens':11 'must':14 'pioneer':17 'psychologist':12 'stun':4
176	CONGENIALITY QUEST	A Touching Documentary of a Cat And a Pastry Chef who must Find a Lumberjack in A Baloon	2006	1	\N	6	0.99	87	21.99	2006-02-15 05:03:42	'baloon':20 'cat':8 'chef':12 'congeni':1 'documentari':5 'find':15 'lumberjack':17 'must':14 'pastri':11 'quest':2 'touch':4
177	CONNECTICUT TRAMP	A Unbelieveable Drama of a Crocodile And a Mad Cow who must Reach a Dentist in A Shark Tank	2006	1	\N	4	4.99	172	20.99	2006-02-15 05:03:42	'connecticut':1 'cow':12 'crocodil':8 'dentist':17 'drama':5 'mad':11 'must':14 'reach':15 'shark':20 'tank':21 'tramp':2 'unbeliev':4
178	CONNECTION MICROCOSMOS	A Fateful Documentary of a Crocodile And a Husband who must Face a Husband in The First Manned Space Station	2006	1	\N	6	0.99	115	25.99	2006-02-15 05:03:42	'connect':1 'crocodil':8 'documentari':5 'face':14 'fate':4 'first':19 'husband':11,16 'man':20 'microcosmo':2 'must':13 'space':21 'station':22
179	CONQUERER NUTS	A Taut Drama of a Mad Scientist And a Man who must Escape a Pioneer in An Abandoned Mine Shaft	2006	1	\N	4	4.99	173	14.99	2006-02-15 05:03:42	'abandon':20 'conquer':1 'drama':5 'escap':15 'mad':8 'man':12 'mine':21 'must':14 'nut':2 'pioneer':17 'scientist':9 'shaft':22 'taut':4
180	CONSPIRACY SPIRIT	A Awe-Inspiring Story of a Student And a Frisbee who must Conquer a Crocodile in An Abandoned Mine Shaft	2006	1	\N	4	2.99	184	27.99	2006-02-15 05:03:42	'abandon':21 'awe':5 'awe-inspir':4 'conquer':16 'conspiraci':1 'crocodil':18 'frisbe':13 'inspir':6 'mine':22 'must':15 'shaft':23 'spirit':2 'stori':7 'student':10
181	CONTACT ANONYMOUS	A Insightful Display of a A Shark And a Monkey who must Face a Database Administrator in Ancient India	2006	1	\N	7	2.99	166	10.99	2006-02-15 05:03:42	'administr':18 'ancient':20 'anonym':2 'contact':1 'databas':17 'display':5 'face':15 'india':21 'insight':4 'monkey':12 'must':14 'shark':9
183	CONVERSATION DOWNHILL	A Taut Character Study of a Husband And a Waitress who must Sink a Squirrel in A MySQL Convention	2006	1	\N	4	4.99	112	14.99	2006-02-15 05:03:42	'charact':5 'convent':21 'convers':1 'downhil':2 'husband':9 'must':14 'mysql':20 'sink':15 'squirrel':17 'studi':6 'taut':4 'waitress':12
184	CORE SUIT	A Unbelieveable Tale of a Car And a Explorer who must Confront a Boat in A Manhattan Penthouse	2006	1	\N	3	2.99	92	24.99	2006-02-15 05:03:42	'boat':16 'car':8 'confront':14 'core':1 'explor':11 'manhattan':19 'must':13 'penthous':20 'suit':2 'tale':5 'unbeliev':4
185	COWBOY DOOM	A Astounding Drama of a Boy And a Lumberjack who must Fight a Butler in A Baloon	2006	1	\N	3	2.99	146	10.99	2006-02-15 05:03:42	'astound':4 'baloon':19 'boy':8 'butler':16 'cowboy':1 'doom':2 'drama':5 'fight':14 'lumberjack':11 'must':13
186	CRAFT OUTFIELD	A Lacklusture Display of a Explorer And a Hunter who must Succumb a Database Administrator in A Baloon Factory	2006	1	\N	6	0.99	64	17.99	2006-02-15 05:03:42	'administr':17 'baloon':20 'craft':1 'databas':16 'display':5 'explor':8 'factori':21 'hunter':11 'lacklustur':4 'must':13 'outfield':2 'succumb':14
187	CRANES RESERVOIR	A Fanciful Documentary of a Teacher And a Dog who must Outgun a Forensic Psychologist in A Baloon Factory	2006	1	\N	5	2.99	57	12.99	2006-02-15 05:03:42	'baloon':20 'crane':1 'documentari':5 'dog':11 'factori':21 'fanci':4 'forens':16 'must':13 'outgun':14 'psychologist':17 'reservoir':2 'teacher':8
188	CRAZY HOME	A Fanciful Panorama of a Boy And a Woman who must Vanquish a Database Administrator in The Outback	2006	1	\N	7	2.99	136	24.99	2006-02-15 05:03:42	'administr':17 'boy':8 'crazi':1 'databas':16 'fanci':4 'home':2 'must':13 'outback':20 'panorama':5 'vanquish':14 'woman':11
189	CREATURES SHAKESPEARE	A Emotional Drama of a Womanizer And a Squirrel who must Vanquish a Crocodile in Ancient India	2006	1	\N	3	0.99	139	23.99	2006-02-15 05:03:42	'ancient':18 'creatur':1 'crocodil':16 'drama':5 'emot':4 'india':19 'must':13 'shakespear':2 'squirrel':11 'vanquish':14 'woman':8
190	CREEPERS KANE	A Awe-Inspiring Reflection of a Squirrel And a Boat who must Outrace a Car in A Jet Boat	2006	1	\N	5	4.99	172	23.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'boat':13,22 'car':18 'creeper':1 'inspir':6 'jet':21 'kane':2 'must':15 'outrac':16 'reflect':7 'squirrel':10
191	CROOKED FROGMEN	A Unbelieveable Drama of a Hunter And a Database Administrator who must Battle a Crocodile in An Abandoned Amusement Park	2006	1	\N	6	0.99	143	27.99	2006-02-15 05:03:42	'abandon':20 'administr':12 'amus':21 'battl':15 'crocodil':17 'crook':1 'databas':11 'drama':5 'frogmen':2 'hunter':8 'must':14 'park':22 'unbeliev':4
192	CROSSING DIVORCE	A Beautiful Documentary of a Dog And a Robot who must Redeem a Womanizer in Berlin	2006	1	\N	4	4.99	50	19.99	2006-02-15 05:03:42	'beauti':4 'berlin':18 'cross':1 'divorc':2 'documentari':5 'dog':8 'must':13 'redeem':14 'robot':11 'woman':16
193	CROSSROADS CASUALTIES	A Intrepid Documentary of a Sumo Wrestler And a Astronaut who must Battle a Composer in The Outback	2006	1	\N	5	2.99	153	20.99	2006-02-15 05:03:42	'astronaut':12 'battl':15 'casualti':2 'compos':17 'crossroad':1 'documentari':5 'intrepid':4 'must':14 'outback':20 'sumo':8 'wrestler':9
280	EMPIRE MALKOVICH	A Amazing Story of a Feminist And a Cat who must Face a Car in An Abandoned Fun House	2006	1	\N	7	0.99	177	26.99	2006-02-15 05:03:42	'abandon':19 'amaz':4 'car':16 'cat':11 'empir':1 'face':14 'feminist':8 'fun':20 'hous':21 'malkovich':2 'must':13 'stori':5
194	CROW GREASE	A Awe-Inspiring Documentary of a Woman And a Husband who must Sink a Database Administrator in The First Manned Space Station	2006	1	\N	6	0.99	104	22.99	2006-02-15 05:03:42	'administr':19 'awe':5 'awe-inspir':4 'crow':1 'databas':18 'documentari':7 'first':22 'greas':2 'husband':13 'inspir':6 'man':23 'must':15 'sink':16 'space':24 'station':25 'woman':10
195	CROWDS TELEMARK	A Intrepid Documentary of a Astronaut And a Forensic Psychologist who must Find a Frisbee in An Abandoned Fun House	2006	1	\N	3	4.99	112	16.99	2006-02-15 05:03:42	'abandon':20 'astronaut':8 'crowd':1 'documentari':5 'find':15 'forens':11 'frisbe':17 'fun':21 'hous':22 'intrepid':4 'must':14 'psychologist':12 'telemark':2
196	CRUELTY UNFORGIVEN	A Brilliant Tale of a Car And a Moose who must Battle a Dentist in Nigeria	2006	1	\N	7	0.99	69	29.99	2006-02-15 05:03:42	'battl':14 'brilliant':4 'car':8 'cruelti':1 'dentist':16 'moos':11 'must':13 'nigeria':18 'tale':5 'unforgiven':2
197	CRUSADE HONEY	A Fast-Paced Reflection of a Explorer And a Butler who must Battle a Madman in An Abandoned Amusement Park	2006	1	\N	4	2.99	112	27.99	2006-02-15 05:03:42	'abandon':21 'amus':22 'battl':16 'butler':13 'crusad':1 'explor':10 'fast':5 'fast-pac':4 'honey':2 'madman':18 'must':15 'pace':6 'park':23 'reflect':7
198	CRYSTAL BREAKING	A Fast-Paced Character Study of a Feminist And a Explorer who must Face a Pastry Chef in Ancient Japan	2006	1	\N	6	2.99	184	22.99	2006-02-15 05:03:42	'ancient':22 'break':2 'charact':7 'chef':20 'crystal':1 'explor':14 'face':17 'fast':5 'fast-pac':4 'feminist':11 'japan':23 'must':16 'pace':6 'pastri':19 'studi':8
199	CUPBOARD SINNERS	A Emotional Reflection of a Frisbee And a Boat who must Reach a Pastry Chef in An Abandoned Amusement Park	2006	1	\N	4	2.99	56	29.99	2006-02-15 05:03:42	'abandon':20 'amus':21 'boat':11 'chef':17 'cupboard':1 'emot':4 'frisbe':8 'must':13 'park':22 'pastri':16 'reach':14 'reflect':5 'sinner':2
200	CURTAIN VIDEOTAPE	A Boring Reflection of a Dentist And a Mad Cow who must Chase a Secret Agent in A Shark Tank	2006	1	\N	7	0.99	133	27.99	2006-02-15 05:03:42	'agent':18 'bore':4 'chase':15 'cow':12 'curtain':1 'dentist':8 'mad':11 'must':14 'reflect':5 'secret':17 'shark':21 'tank':22 'videotap':2
201	CYCLONE FAMILY	A Lacklusture Drama of a Student And a Monkey who must Sink a Womanizer in A MySQL Convention	2006	1	\N	7	2.99	176	18.99	2006-02-15 05:03:42	'convent':20 'cyclon':1 'drama':5 'famili':2 'lacklustur':4 'monkey':11 'must':13 'mysql':19 'sink':14 'student':8 'woman':16
202	DADDY PITTSBURGH	A Epic Story of a A Shark And a Student who must Confront a Explorer in The Gulf of Mexico	2006	1	\N	5	4.99	161	26.99	2006-02-15 05:03:42	'confront':15 'daddi':1 'epic':4 'explor':17 'gulf':20 'mexico':22 'must':14 'pittsburgh':2 'shark':9 'stori':5 'student':12
203	DAISY MENAGERIE	A Fast-Paced Saga of a Pastry Chef And a Monkey who must Sink a Composer in Ancient India	2006	1	\N	5	4.99	84	9.99	2006-02-15 05:03:42	'ancient':21 'chef':11 'compos':19 'daisi':1 'fast':5 'fast-pac':4 'india':22 'menageri':2 'monkey':14 'must':16 'pace':6 'pastri':10 'saga':7 'sink':17
204	DALMATIONS SWEDEN	A Emotional Epistle of a Moose And a Hunter who must Overcome a Robot in A Manhattan Penthouse	2006	1	\N	4	0.99	106	25.99	2006-02-15 05:03:42	'dalmat':1 'emot':4 'epistl':5 'hunter':11 'manhattan':19 'moos':8 'must':13 'overcom':14 'penthous':20 'robot':16 'sweden':2
205	DANCES NONE	A Insightful Reflection of a A Shark And a Dog who must Kill a Butler in An Abandoned Amusement Park	2006	1	\N	3	0.99	58	22.99	2006-02-15 05:03:42	'abandon':20 'amus':21 'butler':17 'danc':1 'dog':12 'insight':4 'kill':15 'must':14 'none':2 'park':22 'reflect':5 'shark':9
206	DANCING FEVER	A Stunning Story of a Explorer And a Forensic Psychologist who must Face a Crocodile in A Shark Tank	2006	1	\N	6	0.99	144	25.99	2006-02-15 05:03:42	'crocodil':17 'danc':1 'explor':8 'face':15 'fever':2 'forens':11 'must':14 'psychologist':12 'shark':20 'stori':5 'stun':4 'tank':21
207	DANGEROUS UPTOWN	A Unbelieveable Story of a Mad Scientist And a Woman who must Overcome a Dog in California	2006	1	\N	7	4.99	121	26.99	2006-02-15 05:03:42	'california':19 'danger':1 'dog':17 'mad':8 'must':14 'overcom':15 'scientist':9 'stori':5 'unbeliev':4 'uptown':2 'woman':12
208	DARES PLUTO	A Fateful Story of a Robot And a Dentist who must Defeat a Astronaut in New Orleans	2006	1	\N	7	2.99	89	16.99	2006-02-15 05:03:42	'astronaut':16 'dare':1 'defeat':14 'dentist':11 'fate':4 'must':13 'new':18 'orlean':19 'pluto':2 'robot':8 'stori':5
209	DARKNESS WAR	A Touching Documentary of a Husband And a Hunter who must Escape a Boy in The Sahara Desert	2006	1	\N	6	2.99	99	24.99	2006-02-15 05:03:42	'boy':16 'dark':1 'desert':20 'documentari':5 'escap':14 'hunter':11 'husband':8 'must':13 'sahara':19 'touch':4 'war':2
210	DARKO DORADO	A Stunning Reflection of a Frisbee And a Husband who must Redeem a Dog in New Orleans	2006	1	\N	3	4.99	130	13.99	2006-02-15 05:03:42	'darko':1 'dog':16 'dorado':2 'frisbe':8 'husband':11 'must':13 'new':18 'orlean':19 'redeem':14 'reflect':5 'stun':4
211	DARLING BREAKING	A Brilliant Documentary of a Astronaut And a Squirrel who must Succumb a Student in The Gulf of Mexico	2006	1	\N	7	4.99	165	20.99	2006-02-15 05:03:42	'astronaut':8 'break':2 'brilliant':4 'darl':1 'documentari':5 'gulf':19 'mexico':21 'must':13 'squirrel':11 'student':16 'succumb':14
212	DARN FORRESTER	A Fateful Story of a A Shark And a Explorer who must Succumb a Technical Writer in A Jet Boat	2006	1	\N	7	4.99	185	14.99	2006-02-15 05:03:42	'boat':22 'darn':1 'explor':12 'fate':4 'forrest':2 'jet':21 'must':14 'shark':9 'stori':5 'succumb':15 'technic':17 'writer':18
213	DATE SPEED	A Touching Saga of a Composer And a Moose who must Discover a Dentist in A MySQL Convention	2006	1	\N	4	0.99	104	19.99	2006-02-15 05:03:42	'compos':8 'convent':20 'date':1 'dentist':16 'discov':14 'moos':11 'must':13 'mysql':19 'saga':5 'speed':2 'touch':4
214	DAUGHTER MADIGAN	A Beautiful Tale of a Hunter And a Mad Scientist who must Confront a Squirrel in The First Manned Space Station	2006	1	\N	3	4.99	59	13.99	2006-02-15 05:03:42	'beauti':4 'confront':15 'daughter':1 'first':20 'hunter':8 'mad':11 'madigan':2 'man':21 'must':14 'scientist':12 'space':22 'squirrel':17 'station':23 'tale':5
215	DAWN POND	A Thoughtful Documentary of a Dentist And a Forensic Psychologist who must Defeat a Waitress in Berlin	2006	1	\N	4	4.99	57	27.99	2006-02-15 05:03:42	'berlin':19 'dawn':1 'defeat':15 'dentist':8 'documentari':5 'forens':11 'must':14 'pond':2 'psychologist':12 'thought':4 'waitress':17
216	DAY UNFAITHFUL	A Stunning Documentary of a Composer And a Mad Scientist who must Find a Technical Writer in A U-Boat	2006	1	\N	3	4.99	113	16.99	2006-02-15 05:03:42	'boat':23 'compos':8 'day':1 'documentari':5 'find':15 'mad':11 'must':14 'scientist':12 'stun':4 'technic':17 'u':22 'u-boat':21 'unfaith':2 'writer':18
217	DAZED PUNK	A Action-Packed Story of a Pioneer And a Technical Writer who must Discover a Forensic Psychologist in An Abandoned Amusement Park	2006	1	\N	6	4.99	120	20.99	2006-02-15 05:03:42	'abandon':23 'action':5 'action-pack':4 'amus':24 'daze':1 'discov':17 'forens':19 'must':16 'pack':6 'park':25 'pioneer':10 'psychologist':20 'punk':2 'stori':7 'technic':13 'writer':14
218	DECEIVER BETRAYED	A Taut Story of a Moose And a Squirrel who must Build a Husband in Ancient India	2006	1	\N	7	0.99	122	22.99	2006-02-15 05:03:42	'ancient':18 'betray':2 'build':14 'deceiv':1 'husband':16 'india':19 'moos':8 'must':13 'squirrel':11 'stori':5 'taut':4
219	DEEP CRUSADE	A Amazing Tale of a Crocodile And a Squirrel who must Discover a Composer in Australia	2006	1	\N	6	4.99	51	20.99	2006-02-15 05:03:42	'amaz':4 'australia':18 'compos':16 'crocodil':8 'crusad':2 'deep':1 'discov':14 'must':13 'squirrel':11 'tale':5
220	DEER VIRGINIAN	A Thoughtful Story of a Mad Cow And a Womanizer who must Overcome a Mad Scientist in Soviet Georgia	2006	1	\N	7	2.99	106	13.99	2006-02-15 05:03:42	'cow':9 'deer':1 'georgia':21 'mad':8,17 'must':14 'overcom':15 'scientist':18 'soviet':20 'stori':5 'thought':4 'virginian':2 'woman':12
221	DELIVERANCE MULHOLLAND	A Astounding Saga of a Monkey And a Moose who must Conquer a Butler in A Shark Tank	2006	1	\N	4	0.99	100	9.99	2006-02-15 05:03:42	'astound':4 'butler':16 'conquer':14 'deliver':1 'monkey':8 'moos':11 'mulholland':2 'must':13 'saga':5 'shark':19 'tank':20
222	DESERT POSEIDON	A Brilliant Documentary of a Butler And a Frisbee who must Build a Astronaut in New Orleans	2006	1	\N	4	4.99	64	27.99	2006-02-15 05:03:42	'astronaut':16 'brilliant':4 'build':14 'butler':8 'desert':1 'documentari':5 'frisbe':11 'must':13 'new':18 'orlean':19 'poseidon':2
223	DESIRE ALIEN	A Fast-Paced Tale of a Dog And a Forensic Psychologist who must Meet a Astronaut in The First Manned Space Station	2006	1	\N	7	2.99	76	24.99	2006-02-15 05:03:42	'alien':2 'astronaut':19 'desir':1 'dog':10 'fast':5 'fast-pac':4 'first':22 'forens':13 'man':23 'meet':17 'must':16 'pace':6 'psychologist':14 'space':24 'station':25 'tale':7
224	DESPERATE TRAINSPOTTING	A Epic Yarn of a Forensic Psychologist And a Teacher who must Face a Lumberjack in California	2006	1	\N	7	4.99	81	29.99	2006-02-15 05:03:42	'california':19 'desper':1 'epic':4 'face':15 'forens':8 'lumberjack':17 'must':14 'psychologist':9 'teacher':12 'trainspot':2 'yarn':5
225	DESTINATION JERK	A Beautiful Yarn of a Teacher And a Cat who must Build a Car in A U-Boat	2006	1	\N	3	0.99	76	19.99	2006-02-15 05:03:42	'beauti':4 'boat':21 'build':14 'car':16 'cat':11 'destin':1 'jerk':2 'must':13 'teacher':8 'u':20 'u-boat':19 'yarn':5
226	DESTINY SATURDAY	A Touching Drama of a Crocodile And a Crocodile who must Conquer a Explorer in Soviet Georgia	2006	1	\N	4	4.99	56	20.99	2006-02-15 05:03:42	'conquer':14 'crocodil':8,11 'destini':1 'drama':5 'explor':16 'georgia':19 'must':13 'saturday':2 'soviet':18 'touch':4
227	DETAILS PACKER	A Epic Saga of a Waitress And a Composer who must Face a Boat in A U-Boat	2006	1	\N	4	4.99	88	17.99	2006-02-15 05:03:42	'boat':16,21 'compos':11 'detail':1 'epic':4 'face':14 'must':13 'packer':2 'saga':5 'u':20 'u-boat':19 'waitress':8
228	DETECTIVE VISION	A Fanciful Documentary of a Pioneer And a Woman who must Redeem a Hunter in Ancient Japan	2006	1	\N	4	0.99	143	16.99	2006-02-15 05:03:42	'ancient':18 'detect':1 'documentari':5 'fanci':4 'hunter':16 'japan':19 'must':13 'pioneer':8 'redeem':14 'vision':2 'woman':11
229	DEVIL DESIRE	A Beautiful Reflection of a Monkey And a Dentist who must Face a Database Administrator in Ancient Japan	2006	1	\N	6	4.99	87	12.99	2006-02-15 05:03:42	'administr':17 'ancient':19 'beauti':4 'databas':16 'dentist':11 'desir':2 'devil':1 'face':14 'japan':20 'monkey':8 'must':13 'reflect':5
230	DIARY PANIC	A Thoughtful Character Study of a Frisbee And a Mad Cow who must Outgun a Man in Ancient India	2006	1	\N	7	2.99	107	20.99	2006-02-15 05:03:42	'ancient':20 'charact':5 'cow':13 'diari':1 'frisbe':9 'india':21 'mad':12 'man':18 'must':15 'outgun':16 'panic':2 'studi':6 'thought':4
231	DINOSAUR SECRETARY	A Action-Packed Drama of a Feminist And a Girl who must Reach a Robot in The Canadian Rockies	2006	1	\N	7	2.99	63	27.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'canadian':21 'dinosaur':1 'drama':7 'feminist':10 'girl':13 'must':15 'pack':6 'reach':16 'robot':18 'rocki':22 'secretari':2
232	DIRTY ACE	A Action-Packed Character Study of a Forensic Psychologist And a Girl who must Build a Dentist in The Outback	2006	1	\N	7	2.99	147	29.99	2006-02-15 05:03:42	'ace':2 'action':5 'action-pack':4 'build':18 'charact':7 'dentist':20 'dirti':1 'forens':11 'girl':15 'must':17 'outback':23 'pack':6 'psychologist':12 'studi':8
233	DISCIPLE MOTHER	A Touching Reflection of a Mad Scientist And a Boat who must Face a Moose in A Shark Tank	2006	1	\N	3	0.99	141	17.99	2006-02-15 05:03:42	'boat':12 'discipl':1 'face':15 'mad':8 'moos':17 'mother':2 'must':14 'reflect':5 'scientist':9 'shark':20 'tank':21 'touch':4
234	DISTURBING SCARFACE	A Lacklusture Display of a Crocodile And a Butler who must Overcome a Monkey in A U-Boat	2006	1	\N	6	2.99	94	27.99	2006-02-15 05:03:42	'boat':21 'butler':11 'crocodil':8 'display':5 'disturb':1 'lacklustur':4 'monkey':16 'must':13 'overcom':14 'scarfac':2 'u':20 'u-boat':19
235	DIVIDE MONSTER	A Intrepid Saga of a Man And a Forensic Psychologist who must Reach a Squirrel in A Monastery	2006	1	\N	6	2.99	68	13.99	2006-02-15 05:03:42	'divid':1 'forens':11 'intrepid':4 'man':8 'monasteri':20 'monster':2 'must':14 'psychologist':12 'reach':15 'saga':5 'squirrel':17
456	INCH JET	A Fateful Saga of a Womanizer And a Student who must Defeat a Butler in A Monastery	2006	1	\N	6	4.99	167	18.99	2006-02-15 05:03:42	'butler':16 'defeat':14 'fate':4 'inch':1 'jet':2 'monasteri':19 'must':13 'saga':5 'student':11 'woman':8
236	DIVINE RESURRECTION	A Boring Character Study of a Man And a Womanizer who must Succumb a Teacher in An Abandoned Amusement Park	2006	1	\N	4	2.99	100	19.99	2006-02-15 05:03:42	'abandon':20 'amus':21 'bore':4 'charact':5 'divin':1 'man':9 'must':14 'park':22 'resurrect':2 'studi':6 'succumb':15 'teacher':17 'woman':12
237	DIVORCE SHINING	A Unbelieveable Saga of a Crocodile And a Student who must Discover a Cat in Ancient India	2006	1	\N	3	2.99	47	21.99	2006-02-15 05:03:42	'ancient':18 'cat':16 'crocodil':8 'discov':14 'divorc':1 'india':19 'must':13 'saga':5 'shine':2 'student':11 'unbeliev':4
238	DOCTOR GRAIL	A Insightful Drama of a Womanizer And a Waitress who must Reach a Forensic Psychologist in The Outback	2006	1	\N	4	2.99	57	29.99	2006-02-15 05:03:42	'doctor':1 'drama':5 'forens':16 'grail':2 'insight':4 'must':13 'outback':20 'psychologist':17 'reach':14 'waitress':11 'woman':8
239	DOGMA FAMILY	A Brilliant Character Study of a Database Administrator And a Monkey who must Succumb a Astronaut in New Orleans	2006	1	\N	5	4.99	122	16.99	2006-02-15 05:03:42	'administr':10 'astronaut':18 'brilliant':4 'charact':5 'databas':9 'dogma':1 'famili':2 'monkey':13 'must':15 'new':20 'orlean':21 'studi':6 'succumb':16
240	DOLLS RAGE	A Thrilling Display of a Pioneer And a Frisbee who must Escape a Teacher in The Outback	2006	1	\N	7	2.99	120	10.99	2006-02-15 05:03:42	'display':5 'doll':1 'escap':14 'frisbe':11 'must':13 'outback':19 'pioneer':8 'rage':2 'teacher':16 'thrill':4
241	DONNIE ALLEY	A Awe-Inspiring Tale of a Butler And a Frisbee who must Vanquish a Teacher in Ancient Japan	2006	1	\N	4	0.99	125	20.99	2006-02-15 05:03:42	'alley':2 'ancient':20 'awe':5 'awe-inspir':4 'butler':10 'donni':1 'frisbe':13 'inspir':6 'japan':21 'must':15 'tale':7 'teacher':18 'vanquish':16
242	DOOM DANCING	A Astounding Panorama of a Car And a Mad Scientist who must Battle a Lumberjack in A MySQL Convention	2006	1	\N	4	0.99	68	13.99	2006-02-15 05:03:42	'astound':4 'battl':15 'car':8 'convent':21 'danc':2 'doom':1 'lumberjack':17 'mad':11 'must':14 'mysql':20 'panorama':5 'scientist':12
243	DOORS PRESIDENT	A Awe-Inspiring Display of a Squirrel And a Woman who must Overcome a Boy in The Gulf of Mexico	2006	1	\N	3	4.99	49	22.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'boy':18 'display':7 'door':1 'gulf':21 'inspir':6 'mexico':23 'must':15 'overcom':16 'presid':2 'squirrel':10 'woman':13
244	DORADO NOTTING	A Action-Packed Tale of a Sumo Wrestler And a A Shark who must Meet a Frisbee in California	2006	1	\N	5	4.99	139	26.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'california':22 'dorado':1 'frisbe':20 'meet':18 'must':17 'not':2 'pack':6 'shark':15 'sumo':10 'tale':7 'wrestler':11
245	DOUBLE WRATH	A Thoughtful Yarn of a Womanizer And a Dog who must Challenge a Madman in The Gulf of Mexico	2006	1	\N	4	0.99	177	28.99	2006-02-15 05:03:42	'challeng':14 'dog':11 'doubl':1 'gulf':19 'madman':16 'mexico':21 'must':13 'thought':4 'woman':8 'wrath':2 'yarn':5
246	DOUBTFIRE LABYRINTH	A Intrepid Panorama of a Butler And a Composer who must Meet a Mad Cow in The Sahara Desert	2006	1	\N	5	4.99	154	16.99	2006-02-15 05:03:42	'butler':8 'compos':11 'cow':17 'desert':21 'doubtfir':1 'intrepid':4 'labyrinth':2 'mad':16 'meet':14 'must':13 'panorama':5 'sahara':20
247	DOWNHILL ENOUGH	A Emotional Tale of a Pastry Chef And a Forensic Psychologist who must Succumb a Monkey in The Sahara Desert	2006	1	\N	3	0.99	47	19.99	2006-02-15 05:03:42	'chef':9 'desert':22 'downhil':1 'emot':4 'enough':2 'forens':12 'monkey':18 'must':15 'pastri':8 'psychologist':13 'sahara':21 'succumb':16 'tale':5
248	DOZEN LION	A Taut Drama of a Cat And a Girl who must Defeat a Frisbee in The Canadian Rockies	2006	1	\N	6	4.99	177	20.99	2006-02-15 05:03:42	'canadian':19 'cat':8 'defeat':14 'dozen':1 'drama':5 'frisbe':16 'girl':11 'lion':2 'must':13 'rocki':20 'taut':4
249	DRACULA CRYSTAL	A Thrilling Reflection of a Feminist And a Cat who must Find a Frisbee in An Abandoned Fun House	2006	1	\N	7	0.99	176	26.99	2006-02-15 05:03:42	'abandon':19 'cat':11 'crystal':2 'dracula':1 'feminist':8 'find':14 'frisbe':16 'fun':20 'hous':21 'must':13 'reflect':5 'thrill':4
250	DRAGON SQUAD	A Taut Reflection of a Boy And a Waitress who must Outgun a Teacher in Ancient China	2006	1	\N	4	0.99	170	26.99	2006-02-15 05:03:42	'ancient':18 'boy':8 'china':19 'dragon':1 'must':13 'outgun':14 'reflect':5 'squad':2 'taut':4 'teacher':16 'waitress':11
251	DRAGONFLY STRANGERS	A Boring Documentary of a Pioneer And a Man who must Vanquish a Man in Nigeria	2006	1	\N	6	4.99	133	19.99	2006-02-15 05:03:42	'bore':4 'documentari':5 'dragonfli':1 'man':11,16 'must':13 'nigeria':18 'pioneer':8 'stranger':2 'vanquish':14
252	DREAM PICKUP	A Epic Display of a Car And a Composer who must Overcome a Forensic Psychologist in The Gulf of Mexico	2006	1	\N	6	2.99	135	18.99	2006-02-15 05:03:42	'car':8 'compos':11 'display':5 'dream':1 'epic':4 'forens':16 'gulf':20 'mexico':22 'must':13 'overcom':14 'pickup':2 'psychologist':17
253	DRIFTER COMMANDMENTS	A Epic Reflection of a Womanizer And a Squirrel who must Discover a Husband in A Jet Boat	2006	1	\N	5	4.99	61	18.99	2006-02-15 05:03:42	'boat':20 'command':2 'discov':14 'drifter':1 'epic':4 'husband':16 'jet':19 'must':13 'reflect':5 'squirrel':11 'woman':8
254	DRIVER ANNIE	A Lacklusture Character Study of a Butler And a Car who must Redeem a Boat in An Abandoned Fun House	2006	1	\N	4	2.99	159	11.99	2006-02-15 05:03:42	'abandon':20 'anni':2 'boat':17 'butler':9 'car':12 'charact':5 'driver':1 'fun':21 'hous':22 'lacklustur':4 'must':14 'redeem':15 'studi':6
255	DRIVING POLISH	A Action-Packed Yarn of a Feminist And a Technical Writer who must Sink a Boat in An Abandoned Mine Shaft	2006	1	\N	6	4.99	175	21.99	2006-02-15 05:03:42	'abandon':22 'action':5 'action-pack':4 'boat':19 'drive':1 'feminist':10 'mine':23 'must':16 'pack':6 'polish':2 'shaft':24 'sink':17 'technic':13 'writer':14 'yarn':7
256	DROP WATERFRONT	A Fanciful Documentary of a Husband And a Explorer who must Reach a Madman in Ancient China	2006	1	\N	6	4.99	178	20.99	2006-02-15 05:03:42	'ancient':18 'china':19 'documentari':5 'drop':1 'explor':11 'fanci':4 'husband':8 'madman':16 'must':13 'reach':14 'waterfront':2
279	ELIZABETH SHANE	A Lacklusture Display of a Womanizer And a Dog who must Face a Sumo Wrestler in Ancient Japan	2006	1	\N	7	4.99	152	11.99	2006-02-15 05:03:42	'ancient':19 'display':5 'dog':11 'elizabeth':1 'face':14 'japan':20 'lacklustur':4 'must':13 'shane':2 'sumo':16 'woman':8 'wrestler':17
257	DRUMLINE CYCLONE	A Insightful Panorama of a Monkey And a Sumo Wrestler who must Outrace a Mad Scientist in The Canadian Rockies	2006	1	\N	3	0.99	110	14.99	2006-02-15 05:03:42	'canadian':21 'cyclon':2 'drumlin':1 'insight':4 'mad':17 'monkey':8 'must':14 'outrac':15 'panorama':5 'rocki':22 'scientist':18 'sumo':11 'wrestler':12
258	DRUMS DYNAMITE	A Epic Display of a Crocodile And a Crocodile who must Confront a Dog in An Abandoned Amusement Park	2006	1	\N	6	0.99	96	11.99	2006-02-15 05:03:42	'abandon':19 'amus':20 'confront':14 'crocodil':8,11 'display':5 'dog':16 'drum':1 'dynamit':2 'epic':4 'must':13 'park':21
259	DUCK RACER	A Lacklusture Yarn of a Teacher And a Squirrel who must Overcome a Dog in A Shark Tank	2006	1	\N	4	2.99	116	15.99	2006-02-15 05:03:42	'dog':16 'duck':1 'lacklustur':4 'must':13 'overcom':14 'racer':2 'shark':19 'squirrel':11 'tank':20 'teacher':8 'yarn':5
260	DUDE BLINDNESS	A Stunning Reflection of a Husband And a Lumberjack who must Face a Frisbee in An Abandoned Fun House	2006	1	\N	3	4.99	132	9.99	2006-02-15 05:03:42	'abandon':19 'blind':2 'dude':1 'face':14 'frisbe':16 'fun':20 'hous':21 'husband':8 'lumberjack':11 'must':13 'reflect':5 'stun':4
261	DUFFEL APOCALYPSE	A Emotional Display of a Boat And a Explorer who must Challenge a Madman in A MySQL Convention	2006	1	\N	5	0.99	171	13.99	2006-02-15 05:03:42	'apocalyps':2 'boat':8 'challeng':14 'convent':20 'display':5 'duffel':1 'emot':4 'explor':11 'madman':16 'must':13 'mysql':19
262	DUMBO LUST	A Touching Display of a Feminist And a Dentist who must Conquer a Husband in The Gulf of Mexico	2006	1	\N	5	0.99	119	17.99	2006-02-15 05:03:42	'conquer':14 'dentist':11 'display':5 'dumbo':1 'feminist':8 'gulf':19 'husband':16 'lust':2 'mexico':21 'must':13 'touch':4
263	DURHAM PANKY	A Brilliant Panorama of a Girl And a Boy who must Face a Mad Scientist in An Abandoned Mine Shaft	2006	1	\N	6	4.99	154	14.99	2006-02-15 05:03:42	'abandon':20 'boy':11 'brilliant':4 'durham':1 'face':14 'girl':8 'mad':16 'mine':21 'must':13 'panki':2 'panorama':5 'scientist':17 'shaft':22
264	DWARFS ALTER	A Emotional Yarn of a Girl And a Dog who must Challenge a Composer in Ancient Japan	2006	1	\N	6	2.99	101	13.99	2006-02-15 05:03:42	'alter':2 'ancient':18 'challeng':14 'compos':16 'dog':11 'dwarf':1 'emot':4 'girl':8 'japan':19 'must':13 'yarn':5
265	DYING MAKER	A Intrepid Tale of a Boat And a Monkey who must Kill a Cat in California	2006	1	\N	5	4.99	168	28.99	2006-02-15 05:03:42	'boat':8 'california':18 'cat':16 'die':1 'intrepid':4 'kill':14 'maker':2 'monkey':11 'must':13 'tale':5
266	DYNAMITE TARZAN	A Intrepid Documentary of a Forensic Psychologist And a Mad Scientist who must Face a Explorer in A U-Boat	2006	1	\N	4	0.99	141	27.99	2006-02-15 05:03:42	'boat':23 'documentari':5 'dynamit':1 'explor':18 'face':16 'forens':8 'intrepid':4 'mad':12 'must':15 'psychologist':9 'scientist':13 'tarzan':2 'u':22 'u-boat':21
267	EAGLES PANKY	A Thoughtful Story of a Car And a Boy who must Find a A Shark in The Sahara Desert	2006	1	\N	4	4.99	140	14.99	2006-02-15 05:03:42	'boy':11 'car':8 'desert':21 'eagl':1 'find':14 'must':13 'panki':2 'sahara':20 'shark':17 'stori':5 'thought':4
268	EARLY HOME	A Amazing Panorama of a Mad Scientist And a Husband who must Meet a Woman in The Outback	2006	1	\N	6	4.99	96	27.99	2006-02-15 05:03:42	'amaz':4 'earli':1 'home':2 'husband':12 'mad':8 'meet':15 'must':14 'outback':20 'panorama':5 'scientist':9 'woman':17
269	EARRING INSTINCT	A Stunning Character Study of a Dentist And a Mad Cow who must Find a Teacher in Nigeria	2006	1	\N	3	0.99	98	22.99	2006-02-15 05:03:42	'charact':5 'cow':13 'dentist':9 'earring':1 'find':16 'instinct':2 'mad':12 'must':15 'nigeria':20 'studi':6 'stun':4 'teacher':18
270	EARTH VISION	A Stunning Drama of a Butler And a Madman who must Outrace a Womanizer in Ancient India	2006	1	\N	7	0.99	85	29.99	2006-02-15 05:03:42	'ancient':18 'butler':8 'drama':5 'earth':1 'india':19 'madman':11 'must':13 'outrac':14 'stun':4 'vision':2 'woman':16
271	EASY GLADIATOR	A Fateful Story of a Monkey And a Girl who must Overcome a Pastry Chef in Ancient India	2006	1	\N	5	4.99	148	12.99	2006-02-15 05:03:42	'ancient':19 'chef':17 'easi':1 'fate':4 'girl':11 'gladiat':2 'india':20 'monkey':8 'must':13 'overcom':14 'pastri':16 'stori':5
272	EDGE KISSING	A Beautiful Yarn of a Composer And a Mad Cow who must Redeem a Mad Scientist in A Jet Boat	2006	1	\N	5	4.99	153	9.99	2006-02-15 05:03:42	'beauti':4 'boat':22 'compos':8 'cow':12 'edg':1 'jet':21 'kiss':2 'mad':11,17 'must':14 'redeem':15 'scientist':18 'yarn':5
273	EFFECT GLADIATOR	A Beautiful Display of a Pastry Chef And a Pastry Chef who must Outgun a Forensic Psychologist in A Manhattan Penthouse	2006	1	\N	6	0.99	107	14.99	2006-02-15 05:03:42	'beauti':4 'chef':9,13 'display':5 'effect':1 'forens':18 'gladiat':2 'manhattan':22 'must':15 'outgun':16 'pastri':8,12 'penthous':23 'psychologist':19
274	EGG IGBY	A Beautiful Documentary of a Boat And a Sumo Wrestler who must Succumb a Database Administrator in The First Manned Space Station	2006	1	\N	4	2.99	67	20.99	2006-02-15 05:03:42	'administr':18 'beauti':4 'boat':8 'databas':17 'documentari':5 'egg':1 'first':21 'igbi':2 'man':22 'must':14 'space':23 'station':24 'succumb':15 'sumo':11 'wrestler':12
275	EGYPT TENENBAUMS	A Intrepid Story of a Madman And a Secret Agent who must Outrace a Astronaut in An Abandoned Amusement Park	2006	1	\N	3	0.99	85	11.99	2006-02-15 05:03:42	'abandon':20 'agent':12 'amus':21 'astronaut':17 'egypt':1 'intrepid':4 'madman':8 'must':14 'outrac':15 'park':22 'secret':11 'stori':5 'tenenbaum':2
276	ELEMENT FREDDY	A Awe-Inspiring Reflection of a Waitress And a Squirrel who must Kill a Mad Cow in A Jet Boat	2006	1	\N	6	4.99	115	28.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'boat':23 'cow':19 'element':1 'freddi':2 'inspir':6 'jet':22 'kill':16 'mad':18 'must':15 'reflect':7 'squirrel':13 'waitress':10
277	ELEPHANT TROJAN	A Beautiful Panorama of a Lumberjack And a Forensic Psychologist who must Overcome a Frisbee in A Baloon	2006	1	\N	4	4.99	126	24.99	2006-02-15 05:03:42	'baloon':20 'beauti':4 'eleph':1 'forens':11 'frisbe':17 'lumberjack':8 'must':14 'overcom':15 'panorama':5 'psychologist':12 'trojan':2
278	ELF MURDER	A Action-Packed Story of a Frisbee And a Woman who must Reach a Girl in An Abandoned Mine Shaft	2006	1	\N	4	4.99	155	19.99	2006-02-15 05:03:42	'abandon':21 'action':5 'action-pack':4 'elf':1 'frisbe':10 'girl':18 'mine':22 'murder':2 'must':15 'pack':6 'reach':16 'shaft':23 'stori':7 'woman':13
281	ENCINO ELF	A Astounding Drama of a Feminist And a Teacher who must Confront a Husband in A Baloon	2006	1	\N	6	0.99	143	9.99	2006-02-15 05:03:42	'astound':4 'baloon':19 'confront':14 'drama':5 'elf':2 'encino':1 'feminist':8 'husband':16 'must':13 'teacher':11
282	ENCOUNTERS CURTAIN	A Insightful Epistle of a Pastry Chef And a Womanizer who must Build a Boat in New Orleans	2006	1	\N	5	0.99	92	20.99	2006-02-15 05:03:42	'boat':17 'build':15 'chef':9 'curtain':2 'encount':1 'epistl':5 'insight':4 'must':14 'new':19 'orlean':20 'pastri':8 'woman':12
283	ENDING CROWDS	A Unbelieveable Display of a Dentist And a Madman who must Vanquish a Squirrel in Berlin	2006	1	\N	6	0.99	85	10.99	2006-02-15 05:03:42	'berlin':18 'crowd':2 'dentist':8 'display':5 'end':1 'madman':11 'must':13 'squirrel':16 'unbeliev':4 'vanquish':14
284	ENEMY ODDS	A Fanciful Panorama of a Mad Scientist And a Woman who must Pursue a Astronaut in Ancient India	2006	1	\N	5	4.99	77	23.99	2006-02-15 05:03:42	'ancient':19 'astronaut':17 'enemi':1 'fanci':4 'india':20 'mad':8 'must':14 'odd':2 'panorama':5 'pursu':15 'scientist':9 'woman':12
285	ENGLISH BULWORTH	A Intrepid Epistle of a Pastry Chef And a Pastry Chef who must Pursue a Crocodile in Ancient China	2006	1	\N	3	0.99	51	18.99	2006-02-15 05:03:42	'ancient':20 'bulworth':2 'chef':9,13 'china':21 'crocodil':18 'english':1 'epistl':5 'intrepid':4 'must':15 'pastri':8,12 'pursu':16
286	ENOUGH RAGING	A Astounding Character Study of a Boat And a Secret Agent who must Find a Mad Cow in The Sahara Desert	2006	1	\N	7	2.99	158	16.99	2006-02-15 05:03:42	'agent':13 'astound':4 'boat':9 'charact':5 'cow':19 'desert':23 'enough':1 'find':16 'mad':18 'must':15 'rage':2 'sahara':22 'secret':12 'studi':6
287	ENTRAPMENT SATISFACTION	A Thoughtful Panorama of a Hunter And a Teacher who must Reach a Mad Cow in A U-Boat	2006	1	\N	5	0.99	176	19.99	2006-02-15 05:03:42	'boat':22 'cow':17 'entrap':1 'hunter':8 'mad':16 'must':13 'panorama':5 'reach':14 'satisfact':2 'teacher':11 'thought':4 'u':21 'u-boat':20
288	ESCAPE METROPOLIS	A Taut Yarn of a Astronaut And a Technical Writer who must Outgun a Boat in New Orleans	2006	1	\N	7	2.99	167	20.99	2006-02-15 05:03:42	'astronaut':8 'boat':17 'escap':1 'metropoli':2 'must':14 'new':19 'orlean':20 'outgun':15 'taut':4 'technic':11 'writer':12 'yarn':5
289	EVE RESURRECTION	A Awe-Inspiring Yarn of a Pastry Chef And a Database Administrator who must Challenge a Teacher in A Baloon	2006	1	\N	5	4.99	66	25.99	2006-02-15 05:03:42	'administr':15 'awe':5 'awe-inspir':4 'baloon':23 'challeng':18 'chef':11 'databas':14 'eve':1 'inspir':6 'must':17 'pastri':10 'resurrect':2 'teacher':20 'yarn':7
290	EVERYONE CRAFT	A Fateful Display of a Waitress And a Dentist who must Reach a Butler in Nigeria	2006	1	\N	4	0.99	163	29.99	2006-02-15 05:03:42	'butler':16 'craft':2 'dentist':11 'display':5 'everyon':1 'fate':4 'must':13 'nigeria':18 'reach':14 'waitress':8
291	EVOLUTION ALTER	A Fanciful Character Study of a Feminist And a Madman who must Find a Explorer in A Baloon Factory	2006	1	\N	5	0.99	174	10.99	2006-02-15 05:03:42	'alter':2 'baloon':20 'charact':5 'evolut':1 'explor':17 'factori':21 'fanci':4 'feminist':9 'find':15 'madman':12 'must':14 'studi':6
292	EXCITEMENT EVE	A Brilliant Documentary of a Monkey And a Car who must Conquer a Crocodile in A Shark Tank	2006	1	\N	3	0.99	51	20.99	2006-02-15 05:03:42	'brilliant':4 'car':11 'conquer':14 'crocodil':16 'documentari':5 'eve':2 'excit':1 'monkey':8 'must':13 'shark':19 'tank':20
293	EXORCIST STING	A Touching Drama of a Dog And a Sumo Wrestler who must Conquer a Mad Scientist in Berlin	2006	1	\N	6	2.99	167	17.99	2006-02-15 05:03:42	'berlin':20 'conquer':15 'dog':8 'drama':5 'exorcist':1 'mad':17 'must':14 'scientist':18 'sting':2 'sumo':11 'touch':4 'wrestler':12
294	EXPECATIONS NATURAL	A Amazing Drama of a Butler And a Husband who must Reach a A Shark in A U-Boat	2006	1	\N	5	4.99	138	26.99	2006-02-15 05:03:42	'amaz':4 'boat':22 'butler':8 'drama':5 'expec':1 'husband':11 'must':13 'natur':2 'reach':14 'shark':17 'u':21 'u-boat':20
295	EXPENDABLE STALLION	A Amazing Character Study of a Mad Cow And a Squirrel who must Discover a Hunter in A U-Boat	2006	1	\N	3	0.99	97	14.99	2006-02-15 05:03:42	'amaz':4 'boat':23 'charact':5 'cow':10 'discov':16 'expend':1 'hunter':18 'mad':9 'must':15 'squirrel':13 'stallion':2 'studi':6 'u':22 'u-boat':21
296	EXPRESS LONELY	A Boring Drama of a Astronaut And a Boat who must Face a Boat in California	2006	1	\N	5	2.99	178	23.99	2006-02-15 05:03:42	'astronaut':8 'boat':11,16 'bore':4 'california':18 'drama':5 'express':1 'face':14 'lone':2 'must':13
297	EXTRAORDINARY CONQUERER	A Stunning Story of a Dog And a Feminist who must Face a Forensic Psychologist in Berlin	2006	1	\N	6	2.99	122	29.99	2006-02-15 05:03:42	'berlin':19 'conquer':2 'dog':8 'extraordinari':1 'face':14 'feminist':11 'forens':16 'must':13 'psychologist':17 'stori':5 'stun':4
298	EYES DRIVING	A Thrilling Story of a Cat And a Waitress who must Fight a Explorer in The Outback	2006	1	\N	4	2.99	172	13.99	2006-02-15 05:03:42	'cat':8 'drive':2 'explor':16 'eye':1 'fight':14 'must':13 'outback':19 'stori':5 'thrill':4 'waitress':11
299	FACTORY DRAGON	A Action-Packed Saga of a Teacher And a Frisbee who must Escape a Lumberjack in The Sahara Desert	2006	1	\N	4	0.99	144	9.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'desert':22 'dragon':2 'escap':16 'factori':1 'frisbe':13 'lumberjack':18 'must':15 'pack':6 'saga':7 'sahara':21 'teacher':10
300	FALCON VOLUME	A Fateful Saga of a Sumo Wrestler And a Hunter who must Redeem a A Shark in New Orleans	2006	1	\N	5	4.99	102	21.99	2006-02-15 05:03:42	'falcon':1 'fate':4 'hunter':12 'must':14 'new':20 'orlean':21 'redeem':15 'saga':5 'shark':18 'sumo':8 'volum':2 'wrestler':9
301	FAMILY SWEET	A Epic Documentary of a Teacher And a Boy who must Escape a Woman in Berlin	2006	1	\N	4	0.99	155	24.99	2006-02-15 05:03:42	'berlin':18 'boy':11 'documentari':5 'epic':4 'escap':14 'famili':1 'must':13 'sweet':2 'teacher':8 'woman':16
302	FANTASIA PARK	A Thoughtful Documentary of a Mad Scientist And a A Shark who must Outrace a Feminist in Australia	2006	1	\N	5	2.99	131	29.99	2006-02-15 05:03:42	'australia':20 'documentari':5 'fantasia':1 'feminist':18 'mad':8 'must':15 'outrac':16 'park':2 'scientist':9 'shark':13 'thought':4
303	FANTASY TROOPERS	A Touching Saga of a Teacher And a Monkey who must Overcome a Secret Agent in A MySQL Convention	2006	1	\N	6	0.99	58	27.99	2006-02-15 05:03:42	'agent':17 'convent':21 'fantasi':1 'monkey':11 'must':13 'mysql':20 'overcom':14 'saga':5 'secret':16 'teacher':8 'touch':4 'trooper':2
304	FARGO GANDHI	A Thrilling Reflection of a Pastry Chef And a Crocodile who must Reach a Teacher in The Outback	2006	1	\N	3	2.99	130	28.99	2006-02-15 05:03:42	'chef':9 'crocodil':12 'fargo':1 'gandhi':2 'must':14 'outback':20 'pastri':8 'reach':15 'reflect':5 'teacher':17 'thrill':4
305	FATAL HAUNTED	A Beautiful Drama of a Student And a Secret Agent who must Confront a Dentist in Ancient Japan	2006	1	\N	6	2.99	91	24.99	2006-02-15 05:03:42	'agent':12 'ancient':19 'beauti':4 'confront':15 'dentist':17 'drama':5 'fatal':1 'haunt':2 'japan':20 'must':14 'secret':11 'student':8
306	FEATHERS METAL	A Thoughtful Yarn of a Monkey And a Teacher who must Find a Dog in Australia	2006	1	\N	3	0.99	104	12.99	2006-02-15 05:03:42	'australia':18 'dog':16 'feather':1 'find':14 'metal':2 'monkey':8 'must':13 'teacher':11 'thought':4 'yarn':5
307	FELLOWSHIP AUTUMN	A Lacklusture Reflection of a Dentist And a Hunter who must Meet a Teacher in A Baloon	2006	1	\N	6	4.99	77	9.99	2006-02-15 05:03:42	'autumn':2 'baloon':19 'dentist':8 'fellowship':1 'hunter':11 'lacklustur':4 'meet':14 'must':13 'reflect':5 'teacher':16
308	FERRIS MOTHER	A Touching Display of a Frisbee And a Frisbee who must Kill a Girl in The Gulf of Mexico	2006	1	\N	3	2.99	142	13.99	2006-02-15 05:03:42	'display':5 'ferri':1 'frisbe':8,11 'girl':16 'gulf':19 'kill':14 'mexico':21 'mother':2 'must':13 'touch':4
309	FEUD FROGMEN	A Brilliant Reflection of a Database Administrator And a Mad Cow who must Chase a Woman in The Canadian Rockies	2006	1	\N	6	0.99	98	29.99	2006-02-15 05:03:42	'administr':9 'brilliant':4 'canadian':21 'chase':16 'cow':13 'databas':8 'feud':1 'frogmen':2 'mad':12 'must':15 'reflect':5 'rocki':22 'woman':18
310	FEVER EMPIRE	A Insightful Panorama of a Cat And a Boat who must Defeat a Boat in The Gulf of Mexico	2006	1	\N	5	4.99	158	20.99	2006-02-15 05:03:42	'boat':11,16 'cat':8 'defeat':14 'empir':2 'fever':1 'gulf':19 'insight':4 'mexico':21 'must':13 'panorama':5
311	FICTION CHRISTMAS	A Emotional Yarn of a A Shark And a Student who must Battle a Robot in An Abandoned Mine Shaft	2006	1	\N	4	0.99	72	14.99	2006-02-15 05:03:42	'abandon':20 'battl':15 'christma':2 'emot':4 'fiction':1 'mine':21 'must':14 'robot':17 'shaft':22 'shark':9 'student':12 'yarn':5
312	FIDDLER LOST	A Boring Tale of a Squirrel And a Dog who must Challenge a Madman in The Gulf of Mexico	2006	1	\N	4	4.99	75	20.99	2006-02-15 05:03:42	'bore':4 'challeng':14 'dog':11 'fiddler':1 'gulf':19 'lost':2 'madman':16 'mexico':21 'must':13 'squirrel':8 'tale':5
313	FIDELITY DEVIL	A Awe-Inspiring Drama of a Technical Writer And a Composer who must Reach a Pastry Chef in A U-Boat	2006	1	\N	5	4.99	118	11.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'boat':25 'chef':20 'compos':14 'devil':2 'drama':7 'fidel':1 'inspir':6 'must':16 'pastri':19 'reach':17 'technic':10 'u':24 'u-boat':23 'writer':11
314	FIGHT JAWBREAKER	A Intrepid Panorama of a Womanizer And a Girl who must Escape a Girl in A Manhattan Penthouse	2006	1	\N	3	0.99	91	13.99	2006-02-15 05:03:42	'escap':14 'fight':1 'girl':11,16 'intrepid':4 'jawbreak':2 'manhattan':19 'must':13 'panorama':5 'penthous':20 'woman':8
315	FINDING ANACONDA	A Fateful Tale of a Database Administrator And a Girl who must Battle a Squirrel in New Orleans	2006	1	\N	4	0.99	156	10.99	2006-02-15 05:03:42	'administr':9 'anaconda':2 'battl':15 'databas':8 'fate':4 'find':1 'girl':12 'must':14 'new':19 'orlean':20 'squirrel':17 'tale':5
316	FIRE WOLVES	A Intrepid Documentary of a Frisbee And a Dog who must Outrace a Lumberjack in Nigeria	2006	1	\N	5	4.99	173	18.99	2006-02-15 05:03:42	'documentari':5 'dog':11 'fire':1 'frisbe':8 'intrepid':4 'lumberjack':16 'must':13 'nigeria':18 'outrac':14 'wolv':2
317	FIREBALL PHILADELPHIA	A Amazing Yarn of a Dentist And a A Shark who must Vanquish a Madman in An Abandoned Mine Shaft	2006	1	\N	4	0.99	148	25.99	2006-02-15 05:03:42	'abandon':20 'amaz':4 'dentist':8 'firebal':1 'madman':17 'mine':21 'must':14 'philadelphia':2 'shaft':22 'shark':12 'vanquish':15 'yarn':5
318	FIREHOUSE VIETNAM	A Awe-Inspiring Character Study of a Boat And a Boy who must Kill a Pastry Chef in The Sahara Desert	2006	1	\N	7	0.99	103	14.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'boat':11 'boy':14 'charact':7 'chef':20 'desert':24 'firehous':1 'inspir':6 'kill':17 'must':16 'pastri':19 'sahara':23 'studi':8 'vietnam':2
319	FISH OPUS	A Touching Display of a Feminist And a Girl who must Confront a Astronaut in Australia	2006	1	\N	4	2.99	125	22.99	2006-02-15 05:03:42	'astronaut':16 'australia':18 'confront':14 'display':5 'feminist':8 'fish':1 'girl':11 'must':13 'opus':2 'touch':4
320	FLAMINGOS CONNECTICUT	A Fast-Paced Reflection of a Composer And a Composer who must Meet a Cat in The Sahara Desert	2006	1	\N	4	4.99	80	28.99	2006-02-15 05:03:42	'cat':18 'compos':10,13 'connecticut':2 'desert':22 'fast':5 'fast-pac':4 'flamingo':1 'meet':16 'must':15 'pace':6 'reflect':7 'sahara':21
321	FLASH WARS	A Astounding Saga of a Moose And a Pastry Chef who must Chase a Student in The Gulf of Mexico	2006	1	\N	3	4.99	123	21.99	2006-02-15 05:03:42	'astound':4 'chase':15 'chef':12 'flash':1 'gulf':20 'mexico':22 'moos':8 'must':14 'pastri':11 'saga':5 'student':17 'war':2
322	FLATLINERS KILLER	A Taut Display of a Secret Agent And a Waitress who must Sink a Robot in An Abandoned Mine Shaft	2006	1	\N	5	2.99	100	29.99	2006-02-15 05:03:42	'abandon':20 'agent':9 'display':5 'flatlin':1 'killer':2 'mine':21 'must':14 'robot':17 'secret':8 'shaft':22 'sink':15 'taut':4 'waitress':12
323	FLIGHT LIES	A Stunning Character Study of a Crocodile And a Pioneer who must Pursue a Teacher in New Orleans	2006	1	\N	7	4.99	179	22.99	2006-02-15 05:03:42	'charact':5 'crocodil':9 'flight':1 'lie':2 'must':14 'new':19 'orlean':20 'pioneer':12 'pursu':15 'studi':6 'stun':4 'teacher':17
324	FLINTSTONES HAPPINESS	A Fateful Story of a Husband And a Moose who must Vanquish a Boy in California	2006	1	\N	3	4.99	148	11.99	2006-02-15 05:03:42	'boy':16 'california':18 'fate':4 'flintston':1 'happi':2 'husband':8 'moos':11 'must':13 'stori':5 'vanquish':14
325	FLOATS GARDEN	A Action-Packed Epistle of a Robot And a Car who must Chase a Boat in Ancient Japan	2006	1	\N	6	2.99	145	29.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'ancient':20 'boat':18 'car':13 'chase':16 'epistl':7 'float':1 'garden':2 'japan':21 'must':15 'pack':6 'robot':10
326	FLYING HOOK	A Thrilling Display of a Mad Cow And a Dog who must Challenge a Frisbee in Nigeria	2006	1	\N	6	2.99	69	18.99	2006-02-15 05:03:42	'challeng':15 'cow':9 'display':5 'dog':12 'fli':1 'frisbe':17 'hook':2 'mad':8 'must':14 'nigeria':19 'thrill':4
327	FOOL MOCKINGBIRD	A Lacklusture Tale of a Crocodile And a Composer who must Defeat a Madman in A U-Boat	2006	1	\N	3	4.99	158	24.99	2006-02-15 05:03:42	'boat':21 'compos':11 'crocodil':8 'defeat':14 'fool':1 'lacklustur':4 'madman':16 'mockingbird':2 'must':13 'tale':5 'u':20 'u-boat':19
328	FOREVER CANDIDATE	A Unbelieveable Panorama of a Technical Writer And a Man who must Pursue a Frisbee in A U-Boat	2006	1	\N	7	2.99	131	28.99	2006-02-15 05:03:42	'boat':22 'candid':2 'forev':1 'frisbe':17 'man':12 'must':14 'panorama':5 'pursu':15 'technic':8 'u':21 'u-boat':20 'unbeliev':4 'writer':9
329	FORREST SONS	A Thrilling Documentary of a Forensic Psychologist And a Butler who must Defeat a Explorer in A Jet Boat	2006	1	\N	4	2.99	63	15.99	2006-02-15 05:03:42	'boat':21 'butler':12 'defeat':15 'documentari':5 'explor':17 'forens':8 'forrest':1 'jet':20 'must':14 'psychologist':9 'son':2 'thrill':4
330	FORRESTER COMANCHEROS	A Fateful Tale of a Squirrel And a Forensic Psychologist who must Redeem a Man in Nigeria	2006	1	\N	7	4.99	112	22.99	2006-02-15 05:03:42	'comanchero':2 'fate':4 'forens':11 'forrest':1 'man':17 'must':14 'nigeria':19 'psychologist':12 'redeem':15 'squirrel':8 'tale':5
331	FORWARD TEMPLE	A Astounding Display of a Forensic Psychologist And a Mad Scientist who must Challenge a Girl in New Orleans	2006	1	\N	6	2.99	90	25.99	2006-02-15 05:03:42	'astound':4 'challeng':16 'display':5 'forens':8 'forward':1 'girl':18 'mad':12 'must':15 'new':20 'orlean':21 'psychologist':9 'scientist':13 'templ':2
332	FRANKENSTEIN STRANGER	A Insightful Character Study of a Feminist And a Pioneer who must Pursue a Pastry Chef in Nigeria	2006	1	\N	7	0.99	159	16.99	2006-02-15 05:03:42	'charact':5 'chef':18 'feminist':9 'frankenstein':1 'insight':4 'must':14 'nigeria':20 'pastri':17 'pioneer':12 'pursu':15 'stranger':2 'studi':6
333	FREAKY POCUS	A Fast-Paced Documentary of a Pastry Chef And a Crocodile who must Chase a Squirrel in The Gulf of Mexico	2006	1	\N	7	2.99	126	16.99	2006-02-15 05:03:42	'chase':17 'chef':11 'crocodil':14 'documentari':7 'fast':5 'fast-pac':4 'freaki':1 'gulf':22 'mexico':24 'must':16 'pace':6 'pastri':10 'pocus':2 'squirrel':19
334	FREDDY STORM	A Intrepid Saga of a Man And a Lumberjack who must Vanquish a Husband in The Outback	2006	1	\N	6	4.99	65	21.99	2006-02-15 05:03:42	'freddi':1 'husband':16 'intrepid':4 'lumberjack':11 'man':8 'must':13 'outback':19 'saga':5 'storm':2 'vanquish':14
335	FREEDOM CLEOPATRA	A Emotional Reflection of a Dentist And a Mad Cow who must Face a Squirrel in A Baloon	2006	1	\N	5	0.99	133	23.99	2006-02-15 05:03:42	'baloon':20 'cleopatra':2 'cow':12 'dentist':8 'emot':4 'face':15 'freedom':1 'mad':11 'must':14 'reflect':5 'squirrel':17
336	FRENCH HOLIDAY	A Thrilling Epistle of a Dog And a Feminist who must Kill a Madman in Berlin	2006	1	\N	5	4.99	99	22.99	2006-02-15 05:03:42	'berlin':18 'dog':8 'epistl':5 'feminist':11 'french':1 'holiday':2 'kill':14 'madman':16 'must':13 'thrill':4
337	FRIDA SLIPPER	A Fateful Story of a Lumberjack And a Car who must Escape a Boat in An Abandoned Mine Shaft	2006	1	\N	6	2.99	73	11.99	2006-02-15 05:03:42	'abandon':19 'boat':16 'car':11 'escap':14 'fate':4 'frida':1 'lumberjack':8 'mine':20 'must':13 'shaft':21 'slipper':2 'stori':5
338	FRISCO FORREST	A Beautiful Documentary of a Woman And a Pioneer who must Pursue a Mad Scientist in A Shark Tank	2006	1	\N	6	4.99	51	23.99	2006-02-15 05:03:42	'beauti':4 'documentari':5 'forrest':2 'frisco':1 'mad':16 'must':13 'pioneer':11 'pursu':14 'scientist':17 'shark':20 'tank':21 'woman':8
339	FROGMEN BREAKING	A Unbelieveable Yarn of a Mad Scientist And a Cat who must Chase a Lumberjack in Australia	2006	1	\N	5	0.99	111	17.99	2006-02-15 05:03:42	'australia':19 'break':2 'cat':12 'chase':15 'frogmen':1 'lumberjack':17 'mad':8 'must':14 'scientist':9 'unbeliev':4 'yarn':5
340	FRONTIER CABIN	A Emotional Story of a Madman And a Waitress who must Battle a Teacher in An Abandoned Fun House	2006	1	\N	6	4.99	183	14.99	2006-02-15 05:03:42	'abandon':19 'battl':14 'cabin':2 'emot':4 'frontier':1 'fun':20 'hous':21 'madman':8 'must':13 'stori':5 'teacher':16 'waitress':11
341	FROST HEAD	A Amazing Reflection of a Lumberjack And a Cat who must Discover a Husband in A MySQL Convention	2006	1	\N	5	0.99	82	13.99	2006-02-15 05:03:42	'amaz':4 'cat':11 'convent':20 'discov':14 'frost':1 'head':2 'husband':16 'lumberjack':8 'must':13 'mysql':19 'reflect':5
342	FUGITIVE MAGUIRE	A Taut Epistle of a Feminist And a Sumo Wrestler who must Battle a Crocodile in Australia	2006	1	\N	7	4.99	83	28.99	2006-02-15 05:03:42	'australia':19 'battl':15 'crocodil':17 'epistl':5 'feminist':8 'fugit':1 'maguir':2 'must':14 'sumo':11 'taut':4 'wrestler':12
343	FULL FLATLINERS	A Beautiful Documentary of a Astronaut And a Moose who must Pursue a Monkey in A Shark Tank	2006	1	\N	6	2.99	94	14.99	2006-02-15 05:03:42	'astronaut':8 'beauti':4 'documentari':5 'flatlin':2 'full':1 'monkey':16 'moos':11 'must':13 'pursu':14 'shark':19 'tank':20
344	FURY MURDER	A Lacklusture Reflection of a Boat And a Forensic Psychologist who must Fight a Waitress in A Monastery	2006	1	\N	3	0.99	178	28.99	2006-02-15 05:03:42	'boat':8 'fight':15 'forens':11 'furi':1 'lacklustur':4 'monasteri':20 'murder':2 'must':14 'psychologist':12 'reflect':5 'waitress':17
345	GABLES METROPOLIS	A Fateful Display of a Cat And a Pioneer who must Challenge a Pastry Chef in A Baloon Factory	2006	1	\N	3	0.99	161	17.99	2006-02-15 05:03:42	'baloon':20 'cat':8 'challeng':14 'chef':17 'display':5 'factori':21 'fate':4 'gabl':1 'metropoli':2 'must':13 'pastri':16 'pioneer':11
346	GALAXY SWEETHEARTS	A Emotional Reflection of a Womanizer And a Pioneer who must Face a Squirrel in Berlin	2006	1	\N	4	4.99	128	13.99	2006-02-15 05:03:42	'berlin':18 'emot':4 'face':14 'galaxi':1 'must':13 'pioneer':11 'reflect':5 'squirrel':16 'sweetheart':2 'woman':8
347	GAMES BOWFINGER	A Astounding Documentary of a Butler And a Explorer who must Challenge a Butler in A Monastery	2006	1	\N	7	4.99	119	17.99	2006-02-15 05:03:42	'astound':4 'bowfing':2 'butler':8,16 'challeng':14 'documentari':5 'explor':11 'game':1 'monasteri':19 'must':13
348	GANDHI KWAI	A Thoughtful Display of a Mad Scientist And a Secret Agent who must Chase a Boat in Berlin	2006	1	\N	7	0.99	86	9.99	2006-02-15 05:03:42	'agent':13 'berlin':20 'boat':18 'chase':16 'display':5 'gandhi':1 'kwai':2 'mad':8 'must':15 'scientist':9 'secret':12 'thought':4
349	GANGS PRIDE	A Taut Character Study of a Woman And a A Shark who must Confront a Frisbee in Berlin	2006	1	\N	4	2.99	185	27.99	2006-02-15 05:03:42	'berlin':20 'charact':5 'confront':16 'frisbe':18 'gang':1 'must':15 'pride':2 'shark':13 'studi':6 'taut':4 'woman':9
350	GARDEN ISLAND	A Unbelieveable Character Study of a Womanizer And a Madman who must Reach a Man in The Outback	2006	1	\N	3	4.99	80	21.99	2006-02-15 05:03:42	'charact':5 'garden':1 'island':2 'madman':12 'man':17 'must':14 'outback':20 'reach':15 'studi':6 'unbeliev':4 'woman':9
351	GASLIGHT CRUSADE	A Amazing Epistle of a Boy And a Astronaut who must Redeem a Man in The Gulf of Mexico	2006	1	\N	4	2.99	106	10.99	2006-02-15 05:03:42	'amaz':4 'astronaut':11 'boy':8 'crusad':2 'epistl':5 'gaslight':1 'gulf':19 'man':16 'mexico':21 'must':13 'redeem':14
352	GATHERING CALENDAR	A Intrepid Tale of a Pioneer And a Moose who must Conquer a Frisbee in A MySQL Convention	2006	1	\N	4	0.99	176	22.99	2006-02-15 05:03:42	'calendar':2 'conquer':14 'convent':20 'frisbe':16 'gather':1 'intrepid':4 'moos':11 'must':13 'mysql':19 'pioneer':8 'tale':5
353	GENTLEMEN STAGE	A Awe-Inspiring Reflection of a Monkey And a Student who must Overcome a Dentist in The First Manned Space Station	2006	1	\N	6	2.99	125	22.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'dentist':18 'first':21 'gentlemen':1 'inspir':6 'man':22 'monkey':10 'must':15 'overcom':16 'reflect':7 'space':23 'stage':2 'station':24 'student':13
354	GHOST GROUNDHOG	A Brilliant Panorama of a Madman And a Composer who must Succumb a Car in Ancient India	2006	1	\N	6	4.99	85	18.99	2006-02-15 05:03:42	'ancient':18 'brilliant':4 'car':16 'compos':11 'ghost':1 'groundhog':2 'india':19 'madman':8 'must':13 'panorama':5 'succumb':14
355	GHOSTBUSTERS ELF	A Thoughtful Epistle of a Dog And a Feminist who must Chase a Composer in Berlin	2006	1	\N	7	0.99	101	18.99	2006-02-15 05:03:42	'berlin':18 'chase':14 'compos':16 'dog':8 'elf':2 'epistl':5 'feminist':11 'ghostbust':1 'must':13 'thought':4
356	GIANT TROOPERS	A Fateful Display of a Feminist And a Monkey who must Vanquish a Monkey in The Canadian Rockies	2006	1	\N	5	2.99	102	10.99	2006-02-15 05:03:42	'canadian':19 'display':5 'fate':4 'feminist':8 'giant':1 'monkey':11,16 'must':13 'rocki':20 'trooper':2 'vanquish':14
357	GILBERT PELICAN	A Fateful Tale of a Man And a Feminist who must Conquer a Crocodile in A Manhattan Penthouse	2006	1	\N	7	0.99	114	13.99	2006-02-15 05:03:42	'conquer':14 'crocodil':16 'fate':4 'feminist':11 'gilbert':1 'man':8 'manhattan':19 'must':13 'pelican':2 'penthous':20 'tale':5
358	GILMORE BOILED	A Unbelieveable Documentary of a Boat And a Husband who must Succumb a Student in A U-Boat	2006	1	\N	5	0.99	163	29.99	2006-02-15 05:03:42	'boat':8,21 'boil':2 'documentari':5 'gilmor':1 'husband':11 'must':13 'student':16 'succumb':14 'u':20 'u-boat':19 'unbeliev':4
359	GLADIATOR WESTWARD	A Astounding Reflection of a Squirrel And a Sumo Wrestler who must Sink a Dentist in Ancient Japan	2006	1	\N	6	4.99	173	20.99	2006-02-15 05:03:42	'ancient':19 'astound':4 'dentist':17 'gladiat':1 'japan':20 'must':14 'reflect':5 'sink':15 'squirrel':8 'sumo':11 'westward':2 'wrestler':12
360	GLASS DYING	A Astounding Drama of a Frisbee And a Astronaut who must Fight a Dog in Ancient Japan	2006	1	\N	4	0.99	103	24.99	2006-02-15 05:03:42	'ancient':18 'astound':4 'astronaut':11 'die':2 'dog':16 'drama':5 'fight':14 'frisbe':8 'glass':1 'japan':19 'must':13
361	GLEAMING JAWBREAKER	A Amazing Display of a Composer And a Forensic Psychologist who must Discover a Car in The Canadian Rockies	2006	1	\N	5	2.99	89	25.99	2006-02-15 05:03:42	'amaz':4 'canadian':20 'car':17 'compos':8 'discov':15 'display':5 'forens':11 'gleam':1 'jawbreak':2 'must':14 'psychologist':12 'rocki':21
362	GLORY TRACY	A Amazing Saga of a Woman And a Womanizer who must Discover a Cat in The First Manned Space Station	2006	1	\N	7	2.99	115	13.99	2006-02-15 05:03:42	'amaz':4 'cat':16 'discov':14 'first':19 'glori':1 'man':20 'must':13 'saga':5 'space':21 'station':22 'traci':2 'woman':8,11
363	GO PURPLE	A Fast-Paced Display of a Car And a Database Administrator who must Battle a Woman in A Baloon	2006	1	\N	3	0.99	54	12.99	2006-02-15 05:03:42	'administr':14 'baloon':22 'battl':17 'car':10 'databas':13 'display':7 'fast':5 'fast-pac':4 'go':1 'must':16 'pace':6 'purpl':2 'woman':19
364	GODFATHER DIARY	A Stunning Saga of a Lumberjack And a Squirrel who must Chase a Car in The Outback	2006	1	\N	3	2.99	73	14.99	2006-02-15 05:03:42	'car':16 'chase':14 'diari':2 'godfath':1 'lumberjack':8 'must':13 'outback':19 'saga':5 'squirrel':11 'stun':4
365	GOLD RIVER	A Taut Documentary of a Database Administrator And a Waitress who must Reach a Mad Scientist in A Baloon Factory	2006	1	\N	4	4.99	154	21.99	2006-02-15 05:03:42	'administr':9 'baloon':21 'databas':8 'documentari':5 'factori':22 'gold':1 'mad':17 'must':14 'reach':15 'river':2 'scientist':18 'taut':4 'waitress':12
366	GOLDFINGER SENSIBILITY	A Insightful Drama of a Mad Scientist And a Hunter who must Defeat a Pastry Chef in New Orleans	2006	1	\N	3	0.99	93	29.99	2006-02-15 05:03:42	'chef':18 'defeat':15 'drama':5 'goldfing':1 'hunter':12 'insight':4 'mad':8 'must':14 'new':20 'orlean':21 'pastri':17 'scientist':9 'sensibl':2
367	GOLDMINE TYCOON	A Brilliant Epistle of a Composer And a Frisbee who must Conquer a Husband in The Outback	2006	1	\N	6	0.99	153	20.99	2006-02-15 05:03:42	'brilliant':4 'compos':8 'conquer':14 'epistl':5 'frisbe':11 'goldmin':1 'husband':16 'must':13 'outback':19 'tycoon':2
368	GONE TROUBLE	A Insightful Character Study of a Mad Cow And a Forensic Psychologist who must Conquer a A Shark in A Manhattan Penthouse	2006	1	\N	7	2.99	84	20.99	2006-02-15 05:03:42	'charact':5 'conquer':17 'cow':10 'forens':13 'gone':1 'insight':4 'mad':9 'manhattan':23 'must':16 'penthous':24 'psychologist':14 'shark':20 'studi':6 'troubl':2
369	GOODFELLAS SALUTE	A Unbelieveable Tale of a Dog And a Explorer who must Sink a Mad Cow in A Baloon Factory	2006	1	\N	4	4.99	56	22.99	2006-02-15 05:03:42	'baloon':20 'cow':17 'dog':8 'explor':11 'factori':21 'goodfella':1 'mad':16 'must':13 'salut':2 'sink':14 'tale':5 'unbeliev':4
370	GORGEOUS BINGO	A Action-Packed Display of a Sumo Wrestler And a Car who must Overcome a Waitress in A Baloon Factory	2006	1	\N	4	2.99	108	26.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'baloon':22 'bingo':2 'car':14 'display':7 'factori':23 'gorgeous':1 'must':16 'overcom':17 'pack':6 'sumo':10 'waitress':19 'wrestler':11
371	GOSFORD DONNIE	A Epic Panorama of a Mad Scientist And a Monkey who must Redeem a Secret Agent in Berlin	2006	1	\N	5	4.99	129	17.99	2006-02-15 05:03:42	'agent':18 'berlin':20 'donni':2 'epic':4 'gosford':1 'mad':8 'monkey':12 'must':14 'panorama':5 'redeem':15 'scientist':9 'secret':17
372	GRACELAND DYNAMITE	A Taut Display of a Cat And a Girl who must Overcome a Database Administrator in New Orleans	2006	1	\N	5	4.99	140	26.99	2006-02-15 05:03:42	'administr':17 'cat':8 'databas':16 'display':5 'dynamit':2 'girl':11 'graceland':1 'must':13 'new':19 'orlean':20 'overcom':14 'taut':4
373	GRADUATE LORD	A Lacklusture Epistle of a Girl And a A Shark who must Meet a Mad Scientist in Ancient China	2006	1	\N	7	2.99	156	14.99	2006-02-15 05:03:42	'ancient':20 'china':21 'epistl':5 'girl':8 'graduat':1 'lacklustur':4 'lord':2 'mad':17 'meet':15 'must':14 'scientist':18 'shark':12
374	GRAFFITI LOVE	A Unbelieveable Epistle of a Sumo Wrestler And a Hunter who must Build a Composer in Berlin	2006	1	\N	3	0.99	117	29.99	2006-02-15 05:03:42	'berlin':19 'build':15 'compos':17 'epistl':5 'graffiti':1 'hunter':12 'love':2 'must':14 'sumo':8 'unbeliev':4 'wrestler':9
375	GRAIL FRANKENSTEIN	A Unbelieveable Saga of a Teacher And a Monkey who must Fight a Girl in An Abandoned Mine Shaft	2006	1	\N	4	2.99	85	17.99	2006-02-15 05:03:42	'abandon':19 'fight':14 'frankenstein':2 'girl':16 'grail':1 'mine':20 'monkey':11 'must':13 'saga':5 'shaft':21 'teacher':8 'unbeliev':4
376	GRAPES FURY	A Boring Yarn of a Mad Cow And a Sumo Wrestler who must Meet a Robot in Australia	2006	1	\N	4	0.99	155	20.99	2006-02-15 05:03:42	'australia':20 'bore':4 'cow':9 'furi':2 'grape':1 'mad':8 'meet':16 'must':15 'robot':18 'sumo':12 'wrestler':13 'yarn':5
377	GREASE YOUTH	A Emotional Panorama of a Secret Agent And a Waitress who must Escape a Composer in Soviet Georgia	2006	1	\N	7	0.99	135	20.99	2006-02-15 05:03:42	'agent':9 'compos':17 'emot':4 'escap':15 'georgia':20 'greas':1 'must':14 'panorama':5 'secret':8 'soviet':19 'waitress':12 'youth':2
378	GREATEST NORTH	A Astounding Character Study of a Secret Agent And a Robot who must Build a A Shark in Berlin	2006	1	\N	5	2.99	93	24.99	2006-02-15 05:03:42	'agent':10 'astound':4 'berlin':21 'build':16 'charact':5 'greatest':1 'must':15 'north':2 'robot':13 'secret':9 'shark':19 'studi':6
379	GREEDY ROOTS	A Amazing Reflection of a A Shark And a Butler who must Chase a Hunter in The Canadian Rockies	2006	1	\N	7	0.99	166	14.99	2006-02-15 05:03:42	'amaz':4 'butler':12 'canadian':20 'chase':15 'greedi':1 'hunter':17 'must':14 'reflect':5 'rocki':21 'root':2 'shark':9
380	GREEK EVERYONE	A Stunning Display of a Butler And a Teacher who must Confront a A Shark in The First Manned Space Station	2006	1	\N	7	2.99	176	11.99	2006-02-15 05:03:42	'butler':8 'confront':14 'display':5 'everyon':2 'first':20 'greek':1 'man':21 'must':13 'shark':17 'space':22 'station':23 'stun':4 'teacher':11
381	GRINCH MASSAGE	A Intrepid Display of a Madman And a Feminist who must Pursue a Pioneer in The First Manned Space Station	2006	1	\N	7	4.99	150	25.99	2006-02-15 05:03:42	'display':5 'feminist':11 'first':19 'grinch':1 'intrepid':4 'madman':8 'man':20 'massag':2 'must':13 'pioneer':16 'pursu':14 'space':21 'station':22
382	GRIT CLOCKWORK	A Thoughtful Display of a Dentist And a Squirrel who must Confront a Lumberjack in A Shark Tank	2006	1	\N	3	0.99	137	21.99	2006-02-15 05:03:42	'clockwork':2 'confront':14 'dentist':8 'display':5 'grit':1 'lumberjack':16 'must':13 'shark':19 'squirrel':11 'tank':20 'thought':4
383	GROOVE FICTION	A Unbelieveable Reflection of a Moose And a A Shark who must Defeat a Lumberjack in An Abandoned Mine Shaft	2006	1	\N	6	0.99	111	13.99	2006-02-15 05:03:42	'abandon':20 'defeat':15 'fiction':2 'groov':1 'lumberjack':17 'mine':21 'moos':8 'must':14 'reflect':5 'shaft':22 'shark':12 'unbeliev':4
384	GROSSE WONDERFUL	A Epic Drama of a Cat And a Explorer who must Redeem a Moose in Australia	2006	1	\N	5	4.99	49	19.99	2006-02-15 05:03:42	'australia':18 'cat':8 'drama':5 'epic':4 'explor':11 'gross':1 'moos':16 'must':13 'redeem':14 'wonder':2
385	GROUNDHOG UNCUT	A Brilliant Panorama of a Astronaut And a Technical Writer who must Discover a Butler in A Manhattan Penthouse	2006	1	\N	6	4.99	139	26.99	2006-02-15 05:03:42	'astronaut':8 'brilliant':4 'butler':17 'discov':15 'groundhog':1 'manhattan':20 'must':14 'panorama':5 'penthous':21 'technic':11 'uncut':2 'writer':12
386	GUMP DATE	A Intrepid Yarn of a Explorer And a Student who must Kill a Husband in An Abandoned Mine Shaft	2006	1	\N	3	4.99	53	12.99	2006-02-15 05:03:42	'abandon':19 'date':2 'explor':8 'gump':1 'husband':16 'intrepid':4 'kill':14 'mine':20 'must':13 'shaft':21 'student':11 'yarn':5
387	GUN BONNIE	A Boring Display of a Sumo Wrestler And a Husband who must Build a Waitress in The Gulf of Mexico	2006	1	\N	7	0.99	100	27.99	2006-02-15 05:03:42	'bonni':2 'bore':4 'build':15 'display':5 'gulf':20 'gun':1 'husband':12 'mexico':22 'must':14 'sumo':8 'waitress':17 'wrestler':9
388	GUNFIGHT MOON	A Epic Reflection of a Pastry Chef And a Explorer who must Reach a Dentist in The Sahara Desert	2006	1	\N	5	0.99	70	16.99	2006-02-15 05:03:42	'chef':9 'dentist':17 'desert':21 'epic':4 'explor':12 'gunfight':1 'moon':2 'must':14 'pastri':8 'reach':15 'reflect':5 'sahara':20
389	GUNFIGHTER MUSSOLINI	A Touching Saga of a Robot And a Boy who must Kill a Man in Ancient Japan	2006	1	\N	3	2.99	127	9.99	2006-02-15 05:03:42	'ancient':18 'boy':11 'gunfight':1 'japan':19 'kill':14 'man':16 'mussolini':2 'must':13 'robot':8 'saga':5 'touch':4
390	GUYS FALCON	A Boring Story of a Woman And a Feminist who must Redeem a Squirrel in A U-Boat	2006	1	\N	4	4.99	84	20.99	2006-02-15 05:03:42	'boat':21 'bore':4 'falcon':2 'feminist':11 'guy':1 'must':13 'redeem':14 'squirrel':16 'stori':5 'u':20 'u-boat':19 'woman':8
391	HALF OUTFIELD	A Epic Epistle of a Database Administrator And a Crocodile who must Face a Madman in A Jet Boat	2006	1	\N	6	2.99	146	25.99	2006-02-15 05:03:42	'administr':9 'boat':21 'crocodil':12 'databas':8 'epic':4 'epistl':5 'face':15 'half':1 'jet':20 'madman':17 'must':14 'outfield':2
392	HALL CASSIDY	A Beautiful Panorama of a Pastry Chef And a A Shark who must Battle a Pioneer in Soviet Georgia	2006	1	\N	5	4.99	51	13.99	2006-02-15 05:03:42	'battl':16 'beauti':4 'cassidi':2 'chef':9 'georgia':21 'hall':1 'must':15 'panorama':5 'pastri':8 'pioneer':18 'shark':13 'soviet':20
393	HALLOWEEN NUTS	A Amazing Panorama of a Forensic Psychologist And a Technical Writer who must Fight a Dentist in A U-Boat	2006	1	\N	6	2.99	47	19.99	2006-02-15 05:03:42	'amaz':4 'boat':23 'dentist':18 'fight':16 'forens':8 'halloween':1 'must':15 'nut':2 'panorama':5 'psychologist':9 'technic':12 'u':22 'u-boat':21 'writer':13
394	HAMLET WISDOM	A Touching Reflection of a Man And a Man who must Sink a Robot in The Outback	2006	1	\N	7	2.99	146	21.99	2006-02-15 05:03:42	'hamlet':1 'man':8,11 'must':13 'outback':19 'reflect':5 'robot':16 'sink':14 'touch':4 'wisdom':2
395	HANDICAP BOONDOCK	A Beautiful Display of a Pioneer And a Squirrel who must Vanquish a Sumo Wrestler in Soviet Georgia	2006	1	\N	4	0.99	108	28.99	2006-02-15 05:03:42	'beauti':4 'boondock':2 'display':5 'georgia':20 'handicap':1 'must':13 'pioneer':8 'soviet':19 'squirrel':11 'sumo':16 'vanquish':14 'wrestler':17
396	HANGING DEEP	A Action-Packed Yarn of a Boat And a Crocodile who must Build a Monkey in Berlin	2006	1	\N	5	4.99	62	18.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'berlin':20 'boat':10 'build':16 'crocodil':13 'deep':2 'hang':1 'monkey':18 'must':15 'pack':6 'yarn':7
397	HANKY OCTOBER	A Boring Epistle of a Database Administrator And a Explorer who must Pursue a Madman in Soviet Georgia	2006	1	\N	5	2.99	107	26.99	2006-02-15 05:03:42	'administr':9 'bore':4 'databas':8 'epistl':5 'explor':12 'georgia':20 'hanki':1 'madman':17 'must':14 'octob':2 'pursu':15 'soviet':19
398	HANOVER GALAXY	A Stunning Reflection of a Girl And a Secret Agent who must Succumb a Boy in A MySQL Convention	2006	1	\N	5	4.99	47	21.99	2006-02-15 05:03:42	'agent':12 'boy':17 'convent':21 'galaxi':2 'girl':8 'hanov':1 'must':14 'mysql':20 'reflect':5 'secret':11 'stun':4 'succumb':15
399	HAPPINESS UNITED	A Action-Packed Panorama of a Husband And a Feminist who must Meet a Forensic Psychologist in Ancient Japan	2006	1	\N	6	2.99	100	23.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'ancient':21 'feminist':13 'forens':18 'happi':1 'husband':10 'japan':22 'meet':16 'must':15 'pack':6 'panorama':7 'psychologist':19 'unit':2
400	HARDLY ROBBERS	A Emotional Character Study of a Hunter And a Car who must Kill a Woman in Berlin	2006	1	\N	7	2.99	72	15.99	2006-02-15 05:03:42	'berlin':19 'car':12 'charact':5 'emot':4 'hard':1 'hunter':9 'kill':15 'must':14 'robber':2 'studi':6 'woman':17
401	HAROLD FRENCH	A Stunning Saga of a Sumo Wrestler And a Student who must Outrace a Moose in The Sahara Desert	2006	1	\N	6	0.99	168	10.99	2006-02-15 05:03:42	'desert':21 'french':2 'harold':1 'moos':17 'must':14 'outrac':15 'saga':5 'sahara':20 'student':12 'stun':4 'sumo':8 'wrestler':9
402	HARPER DYING	A Awe-Inspiring Reflection of a Woman And a Cat who must Confront a Feminist in The Sahara Desert	2006	1	\N	3	0.99	52	15.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'cat':13 'confront':16 'desert':22 'die':2 'feminist':18 'harper':1 'inspir':6 'must':15 'reflect':7 'sahara':21 'woman':10
403	HARRY IDAHO	A Taut Yarn of a Technical Writer And a Feminist who must Outrace a Dog in California	2006	1	\N	5	4.99	121	18.99	2006-02-15 05:03:42	'california':19 'dog':17 'feminist':12 'harri':1 'idaho':2 'must':14 'outrac':15 'taut':4 'technic':8 'writer':9 'yarn':5
404	HATE HANDICAP	A Intrepid Reflection of a Mad Scientist And a Pioneer who must Overcome a Hunter in The First Manned Space Station	2006	1	\N	4	0.99	107	26.99	2006-02-15 05:03:42	'first':20 'handicap':2 'hate':1 'hunter':17 'intrepid':4 'mad':8 'man':21 'must':14 'overcom':15 'pioneer':12 'reflect':5 'scientist':9 'space':22 'station':23
405	HAUNTED ANTITRUST	A Amazing Saga of a Man And a Dentist who must Reach a Technical Writer in Ancient India	2006	1	\N	6	4.99	76	13.99	2006-02-15 05:03:42	'amaz':4 'ancient':19 'antitrust':2 'dentist':11 'haunt':1 'india':20 'man':8 'must':13 'reach':14 'saga':5 'technic':16 'writer':17
406	HAUNTING PIANIST	A Fast-Paced Story of a Database Administrator And a Composer who must Defeat a Squirrel in An Abandoned Amusement Park	2006	1	\N	5	0.99	181	22.99	2006-02-15 05:03:42	'abandon':22 'administr':11 'amus':23 'compos':14 'databas':10 'defeat':17 'fast':5 'fast-pac':4 'haunt':1 'must':16 'pace':6 'park':24 'pianist':2 'squirrel':19 'stori':7
407	HAWK CHILL	A Action-Packed Drama of a Mad Scientist And a Composer who must Outgun a Car in Australia	2006	1	\N	5	0.99	47	12.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'australia':21 'car':19 'chill':2 'compos':14 'drama':7 'hawk':1 'mad':10 'must':16 'outgun':17 'pack':6 'scientist':11
408	HEAD STRANGER	A Thoughtful Saga of a Hunter And a Crocodile who must Confront a Dog in The Gulf of Mexico	2006	1	\N	4	4.99	69	28.99	2006-02-15 05:03:42	'confront':14 'crocodil':11 'dog':16 'gulf':19 'head':1 'hunter':8 'mexico':21 'must':13 'saga':5 'stranger':2 'thought':4
409	HEARTBREAKERS BRIGHT	A Awe-Inspiring Documentary of a A Shark And a Dentist who must Outrace a Pastry Chef in The Canadian Rockies	2006	1	\N	3	4.99	59	9.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'bright':2 'canadian':23 'chef':20 'dentist':14 'documentari':7 'heartbreak':1 'inspir':6 'must':16 'outrac':17 'pastri':19 'rocki':24 'shark':11
410	HEAVEN FREEDOM	A Intrepid Story of a Butler And a Car who must Vanquish a Man in New Orleans	2006	1	\N	7	2.99	48	19.99	2006-02-15 05:03:42	'butler':8 'car':11 'freedom':2 'heaven':1 'intrepid':4 'man':16 'must':13 'new':18 'orlean':19 'stori':5 'vanquish':14
411	HEAVENLY GUN	A Beautiful Yarn of a Forensic Psychologist And a Frisbee who must Battle a Moose in A Jet Boat	2006	1	\N	5	4.99	49	13.99	2006-02-15 05:03:42	'battl':15 'beauti':4 'boat':21 'forens':8 'frisbe':12 'gun':2 'heaven':1 'jet':20 'moos':17 'must':14 'psychologist':9 'yarn':5
412	HEAVYWEIGHTS BEAST	A Unbelieveable Story of a Composer And a Dog who must Overcome a Womanizer in An Abandoned Amusement Park	2006	1	\N	6	4.99	102	25.99	2006-02-15 05:03:42	'abandon':19 'amus':20 'beast':2 'compos':8 'dog':11 'heavyweight':1 'must':13 'overcom':14 'park':21 'stori':5 'unbeliev':4 'woman':16
413	HEDWIG ALTER	A Action-Packed Yarn of a Womanizer And a Lumberjack who must Chase a Sumo Wrestler in A Monastery	2006	1	\N	7	2.99	169	16.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'alter':2 'chase':16 'hedwig':1 'lumberjack':13 'monasteri':22 'must':15 'pack':6 'sumo':18 'woman':10 'wrestler':19 'yarn':7
414	HELLFIGHTERS SIERRA	A Taut Reflection of a A Shark And a Dentist who must Battle a Boat in Soviet Georgia	2006	1	\N	3	2.99	75	23.99	2006-02-15 05:03:42	'battl':15 'boat':17 'dentist':12 'georgia':20 'hellfight':1 'must':14 'reflect':5 'shark':9 'sierra':2 'soviet':19 'taut':4
415	HIGH ENCINO	A Fateful Saga of a Waitress And a Hunter who must Outrace a Sumo Wrestler in Australia	2006	1	\N	3	2.99	84	23.99	2006-02-15 05:03:42	'australia':19 'encino':2 'fate':4 'high':1 'hunter':11 'must':13 'outrac':14 'saga':5 'sumo':16 'waitress':8 'wrestler':17
416	HIGHBALL POTTER	A Action-Packed Saga of a Husband And a Dog who must Redeem a Database Administrator in The Sahara Desert	2006	1	\N	6	0.99	110	10.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'administr':19 'databas':18 'desert':23 'dog':13 'highbal':1 'husband':10 'must':15 'pack':6 'potter':2 'redeem':16 'saga':7 'sahara':22
417	HILLS NEIGHBORS	A Epic Display of a Hunter And a Feminist who must Sink a Car in A U-Boat	2006	1	\N	5	0.99	93	29.99	2006-02-15 05:03:42	'boat':21 'car':16 'display':5 'epic':4 'feminist':11 'hill':1 'hunter':8 'must':13 'neighbor':2 'sink':14 'u':20 'u-boat':19
418	HOBBIT ALIEN	A Emotional Drama of a Husband And a Girl who must Outgun a Composer in The First Manned Space Station	2006	1	\N	5	0.99	157	27.99	2006-02-15 05:03:42	'alien':2 'compos':16 'drama':5 'emot':4 'first':19 'girl':11 'hobbit':1 'husband':8 'man':20 'must':13 'outgun':14 'space':21 'station':22
419	HOCUS FRIDA	A Awe-Inspiring Tale of a Girl And a Madman who must Outgun a Student in A Shark Tank	2006	1	\N	4	2.99	141	19.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'frida':2 'girl':10 'hocus':1 'inspir':6 'madman':13 'must':15 'outgun':16 'shark':21 'student':18 'tale':7 'tank':22
420	HOLES BRANNIGAN	A Fast-Paced Reflection of a Technical Writer And a Student who must Fight a Boy in The Canadian Rockies	2006	1	\N	7	4.99	128	27.99	2006-02-15 05:03:42	'boy':19 'brannigan':2 'canadian':22 'fast':5 'fast-pac':4 'fight':17 'hole':1 'must':16 'pace':6 'reflect':7 'rocki':23 'student':14 'technic':10 'writer':11
421	HOLIDAY GAMES	A Insightful Reflection of a Waitress And a Madman who must Pursue a Boy in Ancient Japan	2006	1	\N	7	4.99	78	10.99	2006-02-15 05:03:42	'ancient':18 'boy':16 'game':2 'holiday':1 'insight':4 'japan':19 'madman':11 'must':13 'pursu':14 'reflect':5 'waitress':8
422	HOLLOW JEOPARDY	A Beautiful Character Study of a Robot And a Astronaut who must Overcome a Boat in A Monastery	2006	1	\N	7	4.99	136	25.99	2006-02-15 05:03:42	'astronaut':12 'beauti':4 'boat':17 'charact':5 'hollow':1 'jeopardi':2 'monasteri':20 'must':14 'overcom':15 'robot':9 'studi':6
423	HOLLYWOOD ANONYMOUS	A Fast-Paced Epistle of a Boy And a Explorer who must Escape a Dog in A U-Boat	2006	1	\N	7	0.99	69	29.99	2006-02-15 05:03:42	'anonym':2 'boat':23 'boy':10 'dog':18 'epistl':7 'escap':16 'explor':13 'fast':5 'fast-pac':4 'hollywood':1 'must':15 'pace':6 'u':22 'u-boat':21
424	HOLOCAUST HIGHBALL	A Awe-Inspiring Yarn of a Composer And a Man who must Find a Robot in Soviet Georgia	2006	1	\N	6	0.99	149	12.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'compos':10 'find':16 'georgia':21 'highbal':2 'holocaust':1 'inspir':6 'man':13 'must':15 'robot':18 'soviet':20 'yarn':7
425	HOLY TADPOLE	A Action-Packed Display of a Feminist And a Pioneer who must Pursue a Dog in A Baloon Factory	2006	1	\N	6	0.99	88	20.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'baloon':21 'display':7 'dog':18 'factori':22 'feminist':10 'holi':1 'must':15 'pack':6 'pioneer':13 'pursu':16 'tadpol':2
426	HOME PITY	A Touching Panorama of a Man And a Secret Agent who must Challenge a Teacher in A MySQL Convention	2006	1	\N	7	4.99	185	15.99	2006-02-15 05:03:42	'agent':12 'challeng':15 'convent':21 'home':1 'man':8 'must':14 'mysql':20 'panorama':5 'piti':2 'secret':11 'teacher':17 'touch':4
427	HOMEWARD CIDER	A Taut Reflection of a Astronaut And a Squirrel who must Fight a Squirrel in A Manhattan Penthouse	2006	1	\N	5	0.99	103	19.99	2006-02-15 05:03:42	'astronaut':8 'cider':2 'fight':14 'homeward':1 'manhattan':19 'must':13 'penthous':20 'reflect':5 'squirrel':11,16 'taut':4
428	HOMICIDE PEACH	A Astounding Documentary of a Hunter And a Boy who must Confront a Boy in A MySQL Convention	2006	1	\N	6	2.99	141	21.99	2006-02-15 05:03:42	'astound':4 'boy':11,16 'confront':14 'convent':20 'documentari':5 'homicid':1 'hunter':8 'must':13 'mysql':19 'peach':2
429	HONEY TIES	A Taut Story of a Waitress And a Crocodile who must Outrace a Lumberjack in A Shark Tank	2006	1	\N	3	0.99	84	29.99	2006-02-15 05:03:42	'crocodil':11 'honey':1 'lumberjack':16 'must':13 'outrac':14 'shark':19 'stori':5 'tank':20 'taut':4 'tie':2 'waitress':8
430	HOOK CHARIOTS	A Insightful Story of a Boy And a Dog who must Redeem a Boy in Australia	2006	1	\N	7	0.99	49	23.99	2006-02-15 05:03:42	'australia':18 'boy':8,16 'chariot':2 'dog':11 'hook':1 'insight':4 'must':13 'redeem':14 'stori':5
431	HOOSIERS BIRDCAGE	A Astounding Display of a Explorer And a Boat who must Vanquish a Car in The First Manned Space Station	2006	1	\N	3	2.99	176	12.99	2006-02-15 05:03:42	'astound':4 'birdcag':2 'boat':11 'car':16 'display':5 'explor':8 'first':19 'hoosier':1 'man':20 'must':13 'space':21 'station':22 'vanquish':14
432	HOPE TOOTSIE	A Amazing Documentary of a Student And a Sumo Wrestler who must Outgun a A Shark in A Shark Tank	2006	1	\N	4	2.99	139	22.99	2006-02-15 05:03:42	'amaz':4 'documentari':5 'hope':1 'must':14 'outgun':15 'shark':18,21 'student':8 'sumo':11 'tank':22 'tootsi':2 'wrestler':12
433	HORN WORKING	A Stunning Display of a Mad Scientist And a Technical Writer who must Succumb a Monkey in A Shark Tank	2006	1	\N	4	2.99	95	23.99	2006-02-15 05:03:42	'display':5 'horn':1 'mad':8 'monkey':18 'must':15 'scientist':9 'shark':21 'stun':4 'succumb':16 'tank':22 'technic':12 'work':2 'writer':13
434	HORROR REIGN	A Touching Documentary of a A Shark And a Car who must Build a Husband in Nigeria	2006	1	\N	3	0.99	139	25.99	2006-02-15 05:03:42	'build':15 'car':12 'documentari':5 'horror':1 'husband':17 'must':14 'nigeria':19 'reign':2 'shark':9 'touch':4
435	HOTEL HAPPINESS	A Thrilling Yarn of a Pastry Chef And a A Shark who must Challenge a Mad Scientist in The Outback	2006	1	\N	6	4.99	181	28.99	2006-02-15 05:03:42	'challeng':16 'chef':9 'happi':2 'hotel':1 'mad':18 'must':15 'outback':22 'pastri':8 'scientist':19 'shark':13 'thrill':4 'yarn':5
436	HOURS RAGE	A Fateful Story of a Explorer And a Feminist who must Meet a Technical Writer in Soviet Georgia	2006	1	\N	4	0.99	122	14.99	2006-02-15 05:03:42	'explor':8 'fate':4 'feminist':11 'georgia':20 'hour':1 'meet':14 'must':13 'rage':2 'soviet':19 'stori':5 'technic':16 'writer':17
437	HOUSE DYNAMITE	A Taut Story of a Pioneer And a Squirrel who must Battle a Student in Soviet Georgia	2006	1	\N	7	2.99	109	13.99	2006-02-15 05:03:42	'battl':14 'dynamit':2 'georgia':19 'hous':1 'must':13 'pioneer':8 'soviet':18 'squirrel':11 'stori':5 'student':16 'taut':4
438	HUMAN GRAFFITI	A Beautiful Reflection of a Womanizer And a Sumo Wrestler who must Chase a Database Administrator in The Gulf of Mexico	2006	1	\N	3	2.99	68	22.99	2006-02-15 05:03:42	'administr':18 'beauti':4 'chase':15 'databas':17 'graffiti':2 'gulf':21 'human':1 'mexico':23 'must':14 'reflect':5 'sumo':11 'woman':8 'wrestler':12
439	HUNCHBACK IMPOSSIBLE	A Touching Yarn of a Frisbee And a Dentist who must Fight a Composer in Ancient Japan	2006	1	\N	4	4.99	151	28.99	2006-02-15 05:03:42	'ancient':18 'compos':16 'dentist':11 'fight':14 'frisbe':8 'hunchback':1 'imposs':2 'japan':19 'must':13 'touch':4 'yarn':5
440	HUNGER ROOF	A Unbelieveable Yarn of a Student And a Database Administrator who must Outgun a Husband in An Abandoned Mine Shaft	2006	1	\N	6	0.99	105	21.99	2006-02-15 05:03:42	'abandon':20 'administr':12 'databas':11 'hunger':1 'husband':17 'mine':21 'must':14 'outgun':15 'roof':2 'shaft':22 'student':8 'unbeliev':4 'yarn':5
441	HUNTER ALTER	A Emotional Drama of a Mad Cow And a Boat who must Redeem a Secret Agent in A Shark Tank	2006	1	\N	5	2.99	125	21.99	2006-02-15 05:03:42	'agent':18 'alter':2 'boat':12 'cow':9 'drama':5 'emot':4 'hunter':1 'mad':8 'must':14 'redeem':15 'secret':17 'shark':21 'tank':22
442	HUNTING MUSKETEERS	A Thrilling Reflection of a Pioneer And a Dentist who must Outrace a Womanizer in An Abandoned Mine Shaft	2006	1	\N	6	2.99	65	24.99	2006-02-15 05:03:42	'abandon':19 'dentist':11 'hunt':1 'mine':20 'musket':2 'must':13 'outrac':14 'pioneer':8 'reflect':5 'shaft':21 'thrill':4 'woman':16
443	HURRICANE AFFAIR	A Lacklusture Epistle of a Database Administrator And a Woman who must Meet a Hunter in An Abandoned Mine Shaft	2006	1	\N	6	2.99	49	11.99	2006-02-15 05:03:42	'abandon':20 'administr':9 'affair':2 'databas':8 'epistl':5 'hunter':17 'hurrican':1 'lacklustur':4 'meet':15 'mine':21 'must':14 'shaft':22 'woman':12
444	HUSTLER PARTY	A Emotional Reflection of a Sumo Wrestler And a Monkey who must Conquer a Robot in The Sahara Desert	2006	1	\N	3	4.99	83	22.99	2006-02-15 05:03:42	'conquer':15 'desert':21 'emot':4 'hustler':1 'monkey':12 'must':14 'parti':2 'reflect':5 'robot':17 'sahara':20 'sumo':8 'wrestler':9
445	HYDE DOCTOR	A Fanciful Documentary of a Boy And a Woman who must Redeem a Womanizer in A Jet Boat	2006	1	\N	5	2.99	100	11.99	2006-02-15 05:03:42	'boat':20 'boy':8 'doctor':2 'documentari':5 'fanci':4 'hyde':1 'jet':19 'must':13 'redeem':14 'woman':11,16
446	HYSTERICAL GRAIL	A Amazing Saga of a Madman And a Dentist who must Build a Car in A Manhattan Penthouse	2006	1	\N	5	4.99	150	19.99	2006-02-15 05:03:42	'amaz':4 'build':14 'car':16 'dentist':11 'grail':2 'hyster':1 'madman':8 'manhattan':19 'must':13 'penthous':20 'saga':5
447	ICE CROSSING	A Fast-Paced Tale of a Butler And a Moose who must Overcome a Pioneer in A Manhattan Penthouse	2006	1	\N	5	2.99	131	28.99	2006-02-15 05:03:42	'butler':10 'cross':2 'fast':5 'fast-pac':4 'ice':1 'manhattan':21 'moos':13 'must':15 'overcom':16 'pace':6 'penthous':22 'pioneer':18 'tale':7
448	IDAHO LOVE	A Fast-Paced Drama of a Student And a Crocodile who must Meet a Database Administrator in The Outback	2006	1	\N	3	2.99	172	25.99	2006-02-15 05:03:42	'administr':19 'crocodil':13 'databas':18 'drama':7 'fast':5 'fast-pac':4 'idaho':1 'love':2 'meet':16 'must':15 'outback':22 'pace':6 'student':10
449	IDENTITY LOVER	A Boring Tale of a Composer And a Mad Cow who must Defeat a Car in The Outback	2006	1	\N	4	2.99	119	12.99	2006-02-15 05:03:42	'bore':4 'car':17 'compos':8 'cow':12 'defeat':15 'ident':1 'lover':2 'mad':11 'must':14 'outback':20 'tale':5
450	IDOLS SNATCHERS	A Insightful Drama of a Car And a Composer who must Fight a Man in A Monastery	2006	1	\N	5	2.99	84	29.99	2006-02-15 05:03:42	'car':8 'compos':11 'drama':5 'fight':14 'idol':1 'insight':4 'man':16 'monasteri':19 'must':13 'snatcher':2
451	IGBY MAKER	A Epic Documentary of a Hunter And a Dog who must Outgun a Dog in A Baloon Factory	2006	1	\N	7	4.99	160	12.99	2006-02-15 05:03:42	'baloon':19 'documentari':5 'dog':11,16 'epic':4 'factori':20 'hunter':8 'igbi':1 'maker':2 'must':13 'outgun':14
452	ILLUSION AMELIE	A Emotional Epistle of a Boat And a Mad Scientist who must Outrace a Robot in An Abandoned Mine Shaft	2006	1	\N	4	0.99	122	15.99	2006-02-15 05:03:42	'abandon':20 'ameli':2 'boat':8 'emot':4 'epistl':5 'illus':1 'mad':11 'mine':21 'must':14 'outrac':15 'robot':17 'scientist':12 'shaft':22
453	IMAGE PRINCESS	A Lacklusture Panorama of a Secret Agent And a Crocodile who must Discover a Madman in The Canadian Rockies	2006	1	\N	3	2.99	178	17.99	2006-02-15 05:03:42	'agent':9 'canadian':20 'crocodil':12 'discov':15 'imag':1 'lacklustur':4 'madman':17 'must':14 'panorama':5 'princess':2 'rocki':21 'secret':8
454	IMPACT ALADDIN	A Epic Character Study of a Frisbee And a Moose who must Outgun a Technical Writer in A Shark Tank	2006	1	\N	6	0.99	180	20.99	2006-02-15 05:03:42	'aladdin':2 'charact':5 'epic':4 'frisbe':9 'impact':1 'moos':12 'must':14 'outgun':15 'shark':21 'studi':6 'tank':22 'technic':17 'writer':18
455	IMPOSSIBLE PREJUDICE	A Awe-Inspiring Yarn of a Monkey And a Hunter who must Chase a Teacher in Ancient China	2006	1	\N	7	4.99	103	11.99	2006-02-15 05:03:42	'ancient':20 'awe':5 'awe-inspir':4 'chase':16 'china':21 'hunter':13 'imposs':1 'inspir':6 'monkey':10 'must':15 'prejudic':2 'teacher':18 'yarn':7
457	INDEPENDENCE HOTEL	A Thrilling Tale of a Technical Writer And a Boy who must Face a Pioneer in A Monastery	2006	1	\N	5	0.99	157	21.99	2006-02-15 05:03:42	'boy':12 'face':15 'hotel':2 'independ':1 'monasteri':20 'must':14 'pioneer':17 'tale':5 'technic':8 'thrill':4 'writer':9
753	RUSH GOODFELLAS	A Emotional Display of a Man And a Dentist who must Challenge a Squirrel in Australia	2006	1	\N	3	0.99	48	20.99	2006-02-15 05:03:42	'australia':18 'challeng':14 'dentist':11 'display':5 'emot':4 'goodfella':2 'man':8 'must':13 'rush':1 'squirrel':16
458	INDIAN LOVE	A Insightful Saga of a Mad Scientist And a Mad Scientist who must Kill a Astronaut in An Abandoned Fun House	2006	1	\N	4	0.99	135	26.99	2006-02-15 05:03:42	'abandon':21 'astronaut':18 'fun':22 'hous':23 'indian':1 'insight':4 'kill':16 'love':2 'mad':8,12 'must':15 'saga':5 'scientist':9,13
459	INFORMER DOUBLE	A Action-Packed Display of a Woman And a Dentist who must Redeem a Forensic Psychologist in The Canadian Rockies	2006	1	\N	4	4.99	74	23.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'canadian':22 'dentist':13 'display':7 'doubl':2 'forens':18 'inform':1 'must':15 'pack':6 'psychologist':19 'redeem':16 'rocki':23 'woman':10
460	INNOCENT USUAL	A Beautiful Drama of a Pioneer And a Crocodile who must Challenge a Student in The Outback	2006	1	\N	3	4.99	178	26.99	2006-02-15 05:03:42	'beauti':4 'challeng':14 'crocodil':11 'drama':5 'innoc':1 'must':13 'outback':19 'pioneer':8 'student':16 'usual':2
461	INSECTS STONE	A Epic Display of a Butler And a Dog who must Vanquish a Crocodile in A Manhattan Penthouse	2006	1	\N	3	0.99	123	14.99	2006-02-15 05:03:42	'butler':8 'crocodil':16 'display':5 'dog':11 'epic':4 'insect':1 'manhattan':19 'must':13 'penthous':20 'stone':2 'vanquish':14
462	INSIDER ARIZONA	A Astounding Saga of a Mad Scientist And a Hunter who must Pursue a Robot in A Baloon Factory	2006	1	\N	5	2.99	78	17.99	2006-02-15 05:03:42	'arizona':2 'astound':4 'baloon':20 'factori':21 'hunter':12 'insid':1 'mad':8 'must':14 'pursu':15 'robot':17 'saga':5 'scientist':9
463	INSTINCT AIRPORT	A Touching Documentary of a Mad Cow And a Explorer who must Confront a Butler in A Manhattan Penthouse	2006	1	\N	4	2.99	116	21.99	2006-02-15 05:03:42	'airport':2 'butler':17 'confront':15 'cow':9 'documentari':5 'explor':12 'instinct':1 'mad':8 'manhattan':20 'must':14 'penthous':21 'touch':4
464	INTENTIONS EMPIRE	A Astounding Epistle of a Cat And a Cat who must Conquer a Mad Cow in A U-Boat	2006	1	\N	3	2.99	107	13.99	2006-02-15 05:03:42	'astound':4 'boat':22 'cat':8,11 'conquer':14 'cow':17 'empir':2 'epistl':5 'intent':1 'mad':16 'must':13 'u':21 'u-boat':20
465	INTERVIEW LIAISONS	A Action-Packed Reflection of a Student And a Butler who must Discover a Database Administrator in A Manhattan Penthouse	2006	1	\N	4	4.99	59	17.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'administr':19 'butler':13 'databas':18 'discov':16 'interview':1 'liaison':2 'manhattan':22 'must':15 'pack':6 'penthous':23 'reflect':7 'student':10
466	INTOLERABLE INTENTIONS	A Awe-Inspiring Story of a Monkey And a Pastry Chef who must Succumb a Womanizer in A MySQL Convention	2006	1	\N	6	4.99	63	20.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'chef':14 'convent':23 'inspir':6 'intent':2 'intoler':1 'monkey':10 'must':16 'mysql':22 'pastri':13 'stori':7 'succumb':17 'woman':19
467	INTRIGUE WORST	A Fanciful Character Study of a Explorer And a Mad Scientist who must Vanquish a Squirrel in A Jet Boat	2006	1	\N	6	0.99	181	10.99	2006-02-15 05:03:42	'boat':22 'charact':5 'explor':9 'fanci':4 'intrigu':1 'jet':21 'mad':12 'must':15 'scientist':13 'squirrel':18 'studi':6 'vanquish':16 'worst':2
468	INVASION CYCLONE	A Lacklusture Character Study of a Mad Scientist And a Womanizer who must Outrace a Explorer in A Monastery	2006	1	\N	5	2.99	97	12.99	2006-02-15 05:03:42	'charact':5 'cyclon':2 'explor':18 'invas':1 'lacklustur':4 'mad':9 'monasteri':21 'must':15 'outrac':16 'scientist':10 'studi':6 'woman':13
469	IRON MOON	A Fast-Paced Documentary of a Mad Cow And a Boy who must Pursue a Dentist in A Baloon	2006	1	\N	7	4.99	46	27.99	2006-02-15 05:03:42	'baloon':22 'boy':14 'cow':11 'dentist':19 'documentari':7 'fast':5 'fast-pac':4 'iron':1 'mad':10 'moon':2 'must':16 'pace':6 'pursu':17
470	ISHTAR ROCKETEER	A Astounding Saga of a Dog And a Squirrel who must Conquer a Dog in An Abandoned Fun House	2006	1	\N	4	4.99	79	24.99	2006-02-15 05:03:42	'abandon':19 'astound':4 'conquer':14 'dog':8,16 'fun':20 'hous':21 'ishtar':1 'must':13 'rocket':2 'saga':5 'squirrel':11
471	ISLAND EXORCIST	A Fanciful Panorama of a Technical Writer And a Boy who must Find a Dentist in An Abandoned Fun House	2006	1	\N	7	2.99	84	23.99	2006-02-15 05:03:42	'abandon':20 'boy':12 'dentist':17 'exorcist':2 'fanci':4 'find':15 'fun':21 'hous':22 'island':1 'must':14 'panorama':5 'technic':8 'writer':9
472	ITALIAN AFRICAN	A Astounding Character Study of a Monkey And a Moose who must Outgun a Cat in A U-Boat	2006	1	\N	3	4.99	174	24.99	2006-02-15 05:03:42	'african':2 'astound':4 'boat':22 'cat':17 'charact':5 'italian':1 'monkey':9 'moos':12 'must':14 'outgun':15 'studi':6 'u':21 'u-boat':20
473	JACKET FRISCO	A Insightful Reflection of a Womanizer And a Husband who must Conquer a Pastry Chef in A Baloon	2006	1	\N	5	2.99	181	16.99	2006-02-15 05:03:42	'baloon':20 'chef':17 'conquer':14 'frisco':2 'husband':11 'insight':4 'jacket':1 'must':13 'pastri':16 'reflect':5 'woman':8
474	JADE BUNCH	A Insightful Panorama of a Squirrel And a Mad Cow who must Confront a Student in The First Manned Space Station	2006	1	\N	6	2.99	174	21.99	2006-02-15 05:03:42	'bunch':2 'confront':15 'cow':12 'first':20 'insight':4 'jade':1 'mad':11 'man':21 'must':14 'panorama':5 'space':22 'squirrel':8 'station':23 'student':17
475	JAPANESE RUN	A Awe-Inspiring Epistle of a Feminist And a Girl who must Sink a Girl in The Outback	2006	1	\N	6	0.99	135	29.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'epistl':7 'feminist':10 'girl':13,18 'inspir':6 'japanes':1 'must':15 'outback':21 'run':2 'sink':16
476	JASON TRAP	A Thoughtful Tale of a Woman And a A Shark who must Conquer a Dog in A Monastery	2006	1	\N	5	2.99	130	9.99	2006-02-15 05:03:42	'conquer':15 'dog':17 'jason':1 'monasteri':20 'must':14 'shark':12 'tale':5 'thought':4 'trap':2 'woman':8
477	JAWBREAKER BROOKLYN	A Stunning Reflection of a Boat And a Pastry Chef who must Succumb a A Shark in A Jet Boat	2006	1	\N	5	0.99	118	15.99	2006-02-15 05:03:42	'boat':8,22 'brooklyn':2 'chef':12 'jawbreak':1 'jet':21 'must':14 'pastri':11 'reflect':5 'shark':18 'stun':4 'succumb':15
478	JAWS HARRY	A Thrilling Display of a Database Administrator And a Monkey who must Overcome a Dog in An Abandoned Fun House	2006	1	\N	4	2.99	112	10.99	2006-02-15 05:03:42	'abandon':20 'administr':9 'databas':8 'display':5 'dog':17 'fun':21 'harri':2 'hous':22 'jaw':1 'monkey':12 'must':14 'overcom':15 'thrill':4
479	JEDI BENEATH	A Astounding Reflection of a Explorer And a Dentist who must Pursue a Student in Nigeria	2006	1	\N	7	0.99	128	12.99	2006-02-15 05:03:42	'astound':4 'beneath':2 'dentist':11 'explor':8 'jedi':1 'must':13 'nigeria':18 'pursu':14 'reflect':5 'student':16
480	JEEPERS WEDDING	A Astounding Display of a Composer And a Dog who must Kill a Pastry Chef in Soviet Georgia	2006	1	\N	3	2.99	84	29.99	2006-02-15 05:03:42	'astound':4 'chef':17 'compos':8 'display':5 'dog':11 'georgia':20 'jeeper':1 'kill':14 'must':13 'pastri':16 'soviet':19 'wed':2
481	JEKYLL FROGMEN	A Fanciful Epistle of a Student And a Astronaut who must Kill a Waitress in A Shark Tank	2006	1	\N	4	2.99	58	22.99	2006-02-15 05:03:42	'astronaut':11 'epistl':5 'fanci':4 'frogmen':2 'jekyl':1 'kill':14 'must':13 'shark':19 'student':8 'tank':20 'waitress':16
482	JEOPARDY ENCINO	A Boring Panorama of a Man And a Mad Cow who must Face a Explorer in Ancient India	2006	1	\N	3	0.99	102	12.99	2006-02-15 05:03:42	'ancient':19 'bore':4 'cow':12 'encino':2 'explor':17 'face':15 'india':20 'jeopardi':1 'mad':11 'man':8 'must':14 'panorama':5
483	JERICHO MULAN	A Amazing Yarn of a Hunter And a Butler who must Defeat a Boy in A Jet Boat	2006	1	\N	3	2.99	171	29.99	2006-02-15 05:03:42	'amaz':4 'boat':20 'boy':16 'butler':11 'defeat':14 'hunter':8 'jericho':1 'jet':19 'mulan':2 'must':13 'yarn':5
484	JERK PAYCHECK	A Touching Character Study of a Pastry Chef And a Database Administrator who must Reach a A Shark in Ancient Japan	2006	1	\N	3	2.99	172	13.99	2006-02-15 05:03:42	'administr':14 'ancient':22 'charact':5 'chef':10 'databas':13 'japan':23 'jerk':1 'must':16 'pastri':9 'paycheck':2 'reach':17 'shark':20 'studi':6 'touch':4
485	JERSEY SASSY	A Lacklusture Documentary of a Madman And a Mad Cow who must Find a Feminist in Ancient Japan	2006	1	\N	6	4.99	60	16.99	2006-02-15 05:03:42	'ancient':19 'cow':12 'documentari':5 'feminist':17 'find':15 'japan':20 'jersey':1 'lacklustur':4 'mad':11 'madman':8 'must':14 'sassi':2
486	JET NEIGHBORS	A Amazing Display of a Lumberjack And a Teacher who must Outrace a Woman in A U-Boat	2006	1	\N	7	4.99	59	14.99	2006-02-15 05:03:42	'amaz':4 'boat':21 'display':5 'jet':1 'lumberjack':8 'must':13 'neighbor':2 'outrac':14 'teacher':11 'u':20 'u-boat':19 'woman':16
487	JINGLE SAGEBRUSH	A Epic Character Study of a Feminist And a Student who must Meet a Woman in A Baloon	2006	1	\N	6	4.99	124	29.99	2006-02-15 05:03:42	'baloon':20 'charact':5 'epic':4 'feminist':9 'jingl':1 'meet':15 'must':14 'sagebrush':2 'student':12 'studi':6 'woman':17
488	JOON NORTHWEST	A Thrilling Panorama of a Technical Writer And a Car who must Discover a Forensic Psychologist in A Shark Tank	2006	1	\N	3	0.99	105	23.99	2006-02-15 05:03:42	'car':12 'discov':15 'forens':17 'joon':1 'must':14 'northwest':2 'panorama':5 'psychologist':18 'shark':21 'tank':22 'technic':8 'thrill':4 'writer':9
489	JUGGLER HARDLY	A Epic Story of a Mad Cow And a Astronaut who must Challenge a Car in California	2006	1	\N	4	0.99	54	14.99	2006-02-15 05:03:42	'astronaut':12 'california':19 'car':17 'challeng':15 'cow':9 'epic':4 'hard':2 'juggler':1 'mad':8 'must':14 'stori':5
490	JUMANJI BLADE	A Intrepid Yarn of a Husband And a Womanizer who must Pursue a Mad Scientist in New Orleans	2006	1	\N	4	2.99	121	13.99	2006-02-15 05:03:42	'blade':2 'husband':8 'intrepid':4 'jumanji':1 'mad':16 'must':13 'new':19 'orlean':20 'pursu':14 'scientist':17 'woman':11 'yarn':5
491	JUMPING WRATH	A Touching Epistle of a Monkey And a Feminist who must Discover a Boat in Berlin	2006	1	\N	4	0.99	74	18.99	2006-02-15 05:03:42	'berlin':18 'boat':16 'discov':14 'epistl':5 'feminist':11 'jump':1 'monkey':8 'must':13 'touch':4 'wrath':2
492	JUNGLE CLOSER	A Boring Character Study of a Boy And a Woman who must Battle a Astronaut in Australia	2006	1	\N	6	0.99	134	11.99	2006-02-15 05:03:42	'astronaut':17 'australia':19 'battl':15 'bore':4 'boy':9 'charact':5 'closer':2 'jungl':1 'must':14 'studi':6 'woman':12
493	KANE EXORCIST	A Epic Documentary of a Composer And a Robot who must Overcome a Car in Berlin	2006	1	\N	5	0.99	92	18.99	2006-02-15 05:03:42	'berlin':18 'car':16 'compos':8 'documentari':5 'epic':4 'exorcist':2 'kane':1 'must':13 'overcom':14 'robot':11
494	KARATE MOON	A Astounding Yarn of a Womanizer And a Dog who must Reach a Waitress in A MySQL Convention	2006	1	\N	4	0.99	120	21.99	2006-02-15 05:03:42	'astound':4 'convent':20 'dog':11 'karat':1 'moon':2 'must':13 'mysql':19 'reach':14 'waitress':16 'woman':8 'yarn':5
495	KENTUCKIAN GIANT	A Stunning Yarn of a Woman And a Frisbee who must Escape a Waitress in A U-Boat	2006	1	\N	5	2.99	169	10.99	2006-02-15 05:03:42	'boat':21 'escap':14 'frisbe':11 'giant':2 'kentuckian':1 'must':13 'stun':4 'u':20 'u-boat':19 'waitress':16 'woman':8 'yarn':5
496	KICK SAVANNAH	A Emotional Drama of a Monkey And a Robot who must Defeat a Monkey in New Orleans	2006	1	\N	3	0.99	179	10.99	2006-02-15 05:03:42	'defeat':14 'drama':5 'emot':4 'kick':1 'monkey':8,16 'must':13 'new':18 'orlean':19 'robot':11 'savannah':2
497	KILL BROTHERHOOD	A Touching Display of a Hunter And a Secret Agent who must Redeem a Husband in The Outback	2006	1	\N	4	0.99	54	15.99	2006-02-15 05:03:42	'agent':12 'brotherhood':2 'display':5 'hunter':8 'husband':17 'kill':1 'must':14 'outback':20 'redeem':15 'secret':11 'touch':4
498	KILLER INNOCENT	A Fanciful Character Study of a Student And a Explorer who must Succumb a Composer in An Abandoned Mine Shaft	2006	1	\N	7	2.99	161	11.99	2006-02-15 05:03:42	'abandon':20 'charact':5 'compos':17 'explor':12 'fanci':4 'innoc':2 'killer':1 'mine':21 'must':14 'shaft':22 'student':9 'studi':6 'succumb':15
499	KING EVOLUTION	A Action-Packed Tale of a Boy And a Lumberjack who must Chase a Madman in A Baloon	2006	1	\N	3	4.99	184	24.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'baloon':21 'boy':10 'chase':16 'evolut':2 'king':1 'lumberjack':13 'madman':18 'must':15 'pack':6 'tale':7
500	KISS GLORY	A Lacklusture Reflection of a Girl And a Husband who must Find a Robot in The Canadian Rockies	2006	1	\N	5	4.99	163	11.99	2006-02-15 05:03:42	'canadian':19 'find':14 'girl':8 'glori':2 'husband':11 'kiss':1 'lacklustur':4 'must':13 'reflect':5 'robot':16 'rocki':20
501	KISSING DOLLS	A Insightful Reflection of a Pioneer And a Teacher who must Build a Composer in The First Manned Space Station	2006	1	\N	3	4.99	141	9.99	2006-02-15 05:03:42	'build':14 'compos':16 'doll':2 'first':19 'insight':4 'kiss':1 'man':20 'must':13 'pioneer':8 'reflect':5 'space':21 'station':22 'teacher':11
502	KNOCK WARLOCK	A Unbelieveable Story of a Teacher And a Boat who must Confront a Moose in A Baloon	2006	1	\N	4	2.99	71	21.99	2006-02-15 05:03:42	'baloon':19 'boat':11 'confront':14 'knock':1 'moos':16 'must':13 'stori':5 'teacher':8 'unbeliev':4 'warlock':2
503	KRAMER CHOCOLATE	A Amazing Yarn of a Robot And a Pastry Chef who must Redeem a Mad Scientist in The Outback	2006	1	\N	3	2.99	171	24.99	2006-02-15 05:03:42	'amaz':4 'chef':12 'chocol':2 'kramer':1 'mad':17 'must':14 'outback':21 'pastri':11 'redeem':15 'robot':8 'scientist':18 'yarn':5
504	KWAI HOMEWARD	A Amazing Drama of a Car And a Squirrel who must Pursue a Car in Soviet Georgia	2006	1	\N	5	0.99	46	25.99	2006-02-15 05:03:42	'amaz':4 'car':8,16 'drama':5 'georgia':19 'homeward':2 'kwai':1 'must':13 'pursu':14 'soviet':18 'squirrel':11
505	LABYRINTH LEAGUE	A Awe-Inspiring Saga of a Composer And a Frisbee who must Succumb a Pioneer in The Sahara Desert	2006	1	\N	6	2.99	46	24.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'compos':10 'desert':22 'frisbe':13 'inspir':6 'labyrinth':1 'leagu':2 'must':15 'pioneer':18 'saga':7 'sahara':21 'succumb':16
506	LADY STAGE	A Beautiful Character Study of a Woman And a Man who must Pursue a Explorer in A U-Boat	2006	1	\N	4	4.99	67	14.99	2006-02-15 05:03:42	'beauti':4 'boat':22 'charact':5 'explor':17 'ladi':1 'man':12 'must':14 'pursu':15 'stage':2 'studi':6 'u':21 'u-boat':20 'woman':9
507	LADYBUGS ARMAGEDDON	A Fateful Reflection of a Dog And a Mad Scientist who must Meet a Mad Scientist in New Orleans	2006	1	\N	4	0.99	113	13.99	2006-02-15 05:03:42	'armageddon':2 'dog':8 'fate':4 'ladybug':1 'mad':11,17 'meet':15 'must':14 'new':20 'orlean':21 'reflect':5 'scientist':12,18
508	LAMBS CINCINATTI	A Insightful Story of a Man And a Feminist who must Fight a Composer in Australia	2006	1	\N	6	4.99	144	18.99	2006-02-15 05:03:42	'australia':18 'cincinatti':2 'compos':16 'feminist':11 'fight':14 'insight':4 'lamb':1 'man':8 'must':13 'stori':5
509	LANGUAGE COWBOY	A Epic Yarn of a Cat And a Madman who must Vanquish a Dentist in An Abandoned Amusement Park	2006	1	\N	5	0.99	78	26.99	2006-02-15 05:03:42	'abandon':19 'amus':20 'cat':8 'cowboy':2 'dentist':16 'epic':4 'languag':1 'madman':11 'must':13 'park':21 'vanquish':14 'yarn':5
510	LAWLESS VISION	A Insightful Yarn of a Boy And a Sumo Wrestler who must Outgun a Car in The Outback	2006	1	\N	6	4.99	181	29.99	2006-02-15 05:03:42	'boy':8 'car':17 'insight':4 'lawless':1 'must':14 'outback':20 'outgun':15 'sumo':11 'vision':2 'wrestler':12 'yarn':5
511	LAWRENCE LOVE	A Fanciful Yarn of a Database Administrator And a Mad Cow who must Pursue a Womanizer in Berlin	2006	1	\N	7	0.99	175	23.99	2006-02-15 05:03:42	'administr':9 'berlin':20 'cow':13 'databas':8 'fanci':4 'lawrenc':1 'love':2 'mad':12 'must':15 'pursu':16 'woman':18 'yarn':5
512	LEAGUE HELLFIGHTERS	A Thoughtful Saga of a A Shark And a Monkey who must Outgun a Student in Ancient China	2006	1	\N	5	4.99	110	25.99	2006-02-15 05:03:42	'ancient':19 'china':20 'hellfight':2 'leagu':1 'monkey':12 'must':14 'outgun':15 'saga':5 'shark':9 'student':17 'thought':4
513	LEATHERNECKS DWARFS	A Fateful Reflection of a Dog And a Mad Cow who must Outrace a Teacher in An Abandoned Mine Shaft	2006	1	\N	6	2.99	153	21.99	2006-02-15 05:03:42	'abandon':20 'cow':12 'dog':8 'dwarf':2 'fate':4 'leatherneck':1 'mad':11 'mine':21 'must':14 'outrac':15 'reflect':5 'shaft':22 'teacher':17
514	LEBOWSKI SOLDIERS	A Beautiful Epistle of a Secret Agent And a Pioneer who must Chase a Astronaut in Ancient China	2006	1	\N	6	2.99	69	17.99	2006-02-15 05:03:42	'agent':9 'ancient':19 'astronaut':17 'beauti':4 'chase':15 'china':20 'epistl':5 'lebowski':1 'must':14 'pioneer':12 'secret':8 'soldier':2
515	LEGALLY SECRETARY	A Astounding Tale of a A Shark And a Moose who must Meet a Womanizer in The Sahara Desert	2006	1	\N	7	4.99	113	14.99	2006-02-15 05:03:42	'astound':4 'desert':21 'legal':1 'meet':15 'moos':12 'must':14 'sahara':20 'secretari':2 'shark':9 'tale':5 'woman':17
516	LEGEND JEDI	A Awe-Inspiring Epistle of a Pioneer And a Student who must Outgun a Crocodile in The Outback	2006	1	\N	7	0.99	59	18.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'crocodil':18 'epistl':7 'inspir':6 'jedi':2 'legend':1 'must':15 'outback':21 'outgun':16 'pioneer':10 'student':13
517	LESSON CLEOPATRA	A Emotional Display of a Man And a Explorer who must Build a Boy in A Manhattan Penthouse	2006	1	\N	3	0.99	167	28.99	2006-02-15 05:03:42	'boy':16 'build':14 'cleopatra':2 'display':5 'emot':4 'explor':11 'lesson':1 'man':8 'manhattan':19 'must':13 'penthous':20
518	LIAISONS SWEET	A Boring Drama of a A Shark And a Explorer who must Redeem a Waitress in The Canadian Rockies	2006	1	\N	5	4.99	140	15.99	2006-02-15 05:03:42	'bore':4 'canadian':20 'drama':5 'explor':12 'liaison':1 'must':14 'redeem':15 'rocki':21 'shark':9 'sweet':2 'waitress':17
519	LIBERTY MAGNIFICENT	A Boring Drama of a Student And a Cat who must Sink a Technical Writer in A Baloon	2006	1	\N	3	2.99	138	27.99	2006-02-15 05:03:42	'baloon':20 'bore':4 'cat':11 'drama':5 'liberti':1 'magnific':2 'must':13 'sink':14 'student':8 'technic':16 'writer':17
520	LICENSE WEEKEND	A Insightful Story of a Man And a Husband who must Overcome a Madman in A Monastery	2006	1	\N	7	2.99	91	28.99	2006-02-15 05:03:42	'husband':11 'insight':4 'licens':1 'madman':16 'man':8 'monasteri':19 'must':13 'overcom':14 'stori':5 'weekend':2
521	LIES TREATMENT	A Fast-Paced Character Study of a Dentist And a Moose who must Defeat a Composer in The First Manned Space Station	2006	1	\N	7	4.99	147	28.99	2006-02-15 05:03:42	'charact':7 'compos':19 'defeat':17 'dentist':11 'fast':5 'fast-pac':4 'first':22 'lie':1 'man':23 'moos':14 'must':16 'pace':6 'space':24 'station':25 'studi':8 'treatment':2
522	LIFE TWISTED	A Thrilling Reflection of a Teacher And a Composer who must Find a Man in The First Manned Space Station	2006	1	\N	4	2.99	137	9.99	2006-02-15 05:03:42	'compos':11 'find':14 'first':19 'life':1 'man':16,20 'must':13 'reflect':5 'space':21 'station':22 'teacher':8 'thrill':4 'twist':2
523	LIGHTS DEER	A Unbelieveable Epistle of a Dog And a Woman who must Confront a Moose in The Gulf of Mexico	2006	1	\N	7	0.99	174	21.99	2006-02-15 05:03:42	'confront':14 'deer':2 'dog':8 'epistl':5 'gulf':19 'light':1 'mexico':21 'moos':16 'must':13 'unbeliev':4 'woman':11
524	LION UNCUT	A Intrepid Display of a Pastry Chef And a Cat who must Kill a A Shark in Ancient China	2006	1	\N	6	0.99	50	13.99	2006-02-15 05:03:42	'ancient':20 'cat':12 'chef':9 'china':21 'display':5 'intrepid':4 'kill':15 'lion':1 'must':14 'pastri':8 'shark':18 'uncut':2
525	LOATHING LEGALLY	A Boring Epistle of a Pioneer And a Mad Scientist who must Escape a Frisbee in The Gulf of Mexico	2006	1	\N	4	0.99	140	29.99	2006-02-15 05:03:42	'bore':4 'epistl':5 'escap':15 'frisbe':17 'gulf':20 'legal':2 'loath':1 'mad':11 'mexico':22 'must':14 'pioneer':8 'scientist':12
526	LOCK REAR	A Thoughtful Character Study of a Squirrel And a Technical Writer who must Outrace a Student in Ancient Japan	2006	1	\N	7	2.99	120	10.99	2006-02-15 05:03:42	'ancient':20 'charact':5 'japan':21 'lock':1 'must':15 'outrac':16 'rear':2 'squirrel':9 'student':18 'studi':6 'technic':12 'thought':4 'writer':13
527	LOLA AGENT	A Astounding Tale of a Mad Scientist And a Husband who must Redeem a Database Administrator in Ancient Japan	2006	1	\N	4	4.99	85	24.99	2006-02-15 05:03:42	'administr':18 'agent':2 'ancient':20 'astound':4 'databas':17 'husband':12 'japan':21 'lola':1 'mad':8 'must':14 'redeem':15 'scientist':9 'tale':5
528	LOLITA WORLD	A Thrilling Drama of a Girl And a Robot who must Redeem a Waitress in An Abandoned Mine Shaft	2006	1	\N	4	2.99	155	25.99	2006-02-15 05:03:42	'abandon':19 'drama':5 'girl':8 'lolita':1 'mine':20 'must':13 'redeem':14 'robot':11 'shaft':21 'thrill':4 'waitress':16 'world':2
529	LONELY ELEPHANT	A Intrepid Story of a Student And a Dog who must Challenge a Explorer in Soviet Georgia	2006	1	\N	3	2.99	67	12.99	2006-02-15 05:03:42	'challeng':14 'dog':11 'eleph':2 'explor':16 'georgia':19 'intrepid':4 'lone':1 'must':13 'soviet':18 'stori':5 'student':8
530	LORD ARIZONA	A Action-Packed Display of a Frisbee And a Pastry Chef who must Pursue a Crocodile in A Jet Boat	2006	1	\N	5	2.99	108	27.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'arizona':2 'boat':23 'chef':14 'crocodil':19 'display':7 'frisbe':10 'jet':22 'lord':1 'must':16 'pack':6 'pastri':13 'pursu':17
531	LOSE INCH	A Stunning Reflection of a Student And a Technical Writer who must Battle a Butler in The First Manned Space Station	2006	1	\N	3	0.99	137	18.99	2006-02-15 05:03:42	'battl':15 'butler':17 'first':20 'inch':2 'lose':1 'man':21 'must':14 'reflect':5 'space':22 'station':23 'student':8 'stun':4 'technic':11 'writer':12
532	LOSER HUSTLER	A Stunning Drama of a Robot And a Feminist who must Outgun a Butler in Nigeria	2006	1	\N	5	4.99	80	28.99	2006-02-15 05:03:42	'butler':16 'drama':5 'feminist':11 'hustler':2 'loser':1 'must':13 'nigeria':18 'outgun':14 'robot':8 'stun':4
533	LOST BIRD	A Emotional Character Study of a Robot And a A Shark who must Defeat a Technical Writer in A Manhattan Penthouse	2006	1	\N	4	2.99	98	21.99	2006-02-15 05:03:42	'bird':2 'charact':5 'defeat':16 'emot':4 'lost':1 'manhattan':22 'must':15 'penthous':23 'robot':9 'shark':13 'studi':6 'technic':18 'writer':19
534	LOUISIANA HARRY	A Lacklusture Drama of a Girl And a Technical Writer who must Redeem a Monkey in A Shark Tank	2006	1	\N	5	0.99	70	18.99	2006-02-15 05:03:42	'drama':5 'girl':8 'harri':2 'lacklustur':4 'louisiana':1 'monkey':17 'must':14 'redeem':15 'shark':20 'tank':21 'technic':11 'writer':12
535	LOVE SUICIDES	A Brilliant Panorama of a Hunter And a Explorer who must Pursue a Dentist in An Abandoned Fun House	2006	1	\N	6	0.99	181	21.99	2006-02-15 05:03:42	'abandon':19 'brilliant':4 'dentist':16 'explor':11 'fun':20 'hous':21 'hunter':8 'love':1 'must':13 'panorama':5 'pursu':14 'suicid':2
536	LOVELY JINGLE	A Fanciful Yarn of a Crocodile And a Forensic Psychologist who must Discover a Crocodile in The Outback	2006	1	\N	3	2.99	65	18.99	2006-02-15 05:03:42	'crocodil':8,17 'discov':15 'fanci':4 'forens':11 'jingl':2 'love':1 'must':14 'outback':20 'psychologist':12 'yarn':5
537	LOVER TRUMAN	A Emotional Yarn of a Robot And a Boy who must Outgun a Technical Writer in A U-Boat	2006	1	\N	3	2.99	75	29.99	2006-02-15 05:03:42	'boat':22 'boy':11 'emot':4 'lover':1 'must':13 'outgun':14 'robot':8 'technic':16 'truman':2 'u':21 'u-boat':20 'writer':17 'yarn':5
538	LOVERBOY ATTACKS	A Boring Story of a Car And a Butler who must Build a Girl in Soviet Georgia	2006	1	\N	7	0.99	162	19.99	2006-02-15 05:03:42	'attack':2 'bore':4 'build':14 'butler':11 'car':8 'georgia':19 'girl':16 'loverboy':1 'must':13 'soviet':18 'stori':5
539	LUCK OPUS	A Boring Display of a Moose And a Squirrel who must Outrace a Teacher in A Shark Tank	2006	1	\N	7	2.99	152	21.99	2006-02-15 05:03:42	'bore':4 'display':5 'luck':1 'moos':8 'must':13 'opus':2 'outrac':14 'shark':19 'squirrel':11 'tank':20 'teacher':16
540	LUCKY FLYING	A Lacklusture Character Study of a A Shark And a Man who must Find a Forensic Psychologist in A U-Boat	2006	1	\N	7	2.99	97	10.99	2006-02-15 05:03:42	'boat':24 'charact':5 'find':16 'fli':2 'forens':18 'lacklustur':4 'lucki':1 'man':13 'must':15 'psychologist':19 'shark':10 'studi':6 'u':23 'u-boat':22
541	LUKE MUMMY	A Taut Character Study of a Boy And a Robot who must Redeem a Mad Scientist in Ancient India	2006	1	\N	5	2.99	74	21.99	2006-02-15 05:03:42	'ancient':20 'boy':9 'charact':5 'india':21 'luke':1 'mad':17 'mummi':2 'must':14 'redeem':15 'robot':12 'scientist':18 'studi':6 'taut':4
542	LUST LOCK	A Fanciful Panorama of a Hunter And a Dentist who must Meet a Secret Agent in The Sahara Desert	2006	1	\N	3	2.99	52	28.99	2006-02-15 05:03:42	'agent':17 'dentist':11 'desert':21 'fanci':4 'hunter':8 'lock':2 'lust':1 'meet':14 'must':13 'panorama':5 'sahara':20 'secret':16
543	MADIGAN DORADO	A Astounding Character Study of a A Shark And a A Shark who must Discover a Crocodile in The Outback	2006	1	\N	5	4.99	116	20.99	2006-02-15 05:03:42	'astound':4 'charact':5 'crocodil':19 'discov':17 'dorado':2 'madigan':1 'must':16 'outback':22 'shark':10,14 'studi':6
544	MADISON TRAP	A Awe-Inspiring Reflection of a Monkey And a Dentist who must Overcome a Pioneer in A U-Boat	2006	1	\N	4	2.99	147	11.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'boat':23 'dentist':13 'inspir':6 'madison':1 'monkey':10 'must':15 'overcom':16 'pioneer':18 'reflect':7 'trap':2 'u':22 'u-boat':21
545	MADNESS ATTACKS	A Fanciful Tale of a Squirrel And a Boat who must Defeat a Crocodile in The Gulf of Mexico	2006	1	\N	4	0.99	178	14.99	2006-02-15 05:03:42	'attack':2 'boat':11 'crocodil':16 'defeat':14 'fanci':4 'gulf':19 'mad':1 'mexico':21 'must':13 'squirrel':8 'tale':5
546	MADRE GABLES	A Intrepid Panorama of a Sumo Wrestler And a Forensic Psychologist who must Discover a Moose in The First Manned Space Station	2006	1	\N	7	2.99	98	27.99	2006-02-15 05:03:42	'discov':16 'first':21 'forens':12 'gabl':2 'intrepid':4 'madr':1 'man':22 'moos':18 'must':15 'panorama':5 'psychologist':13 'space':23 'station':24 'sumo':8 'wrestler':9
547	MAGIC MALLRATS	A Touching Documentary of a Pastry Chef And a Pastry Chef who must Build a Mad Scientist in California	2006	1	\N	3	0.99	117	19.99	2006-02-15 05:03:42	'build':16 'california':21 'chef':9,13 'documentari':5 'mad':18 'magic':1 'mallrat':2 'must':15 'pastri':8,12 'scientist':19 'touch':4
548	MAGNIFICENT CHITTY	A Insightful Story of a Teacher And a Hunter who must Face a Mad Cow in California	2006	1	\N	3	2.99	53	27.99	2006-02-15 05:03:42	'california':19 'chitti':2 'cow':17 'face':14 'hunter':11 'insight':4 'mad':16 'magnific':1 'must':13 'stori':5 'teacher':8
549	MAGNOLIA FORRESTER	A Thoughtful Documentary of a Composer And a Explorer who must Conquer a Dentist in New Orleans	2006	1	\N	4	0.99	171	28.99	2006-02-15 05:03:42	'compos':8 'conquer':14 'dentist':16 'documentari':5 'explor':11 'forrest':2 'magnolia':1 'must':13 'new':18 'orlean':19 'thought':4
550	MAGUIRE APACHE	A Fast-Paced Reflection of a Waitress And a Hunter who must Defeat a Forensic Psychologist in A Baloon	2006	1	\N	6	2.99	74	22.99	2006-02-15 05:03:42	'apach':2 'baloon':22 'defeat':16 'fast':5 'fast-pac':4 'forens':18 'hunter':13 'maguir':1 'must':15 'pace':6 'psychologist':19 'reflect':7 'waitress':10
551	MAIDEN HOME	A Lacklusture Saga of a Moose And a Teacher who must Kill a Forensic Psychologist in A MySQL Convention	2006	1	\N	3	4.99	138	9.99	2006-02-15 05:03:42	'convent':21 'forens':16 'home':2 'kill':14 'lacklustur':4 'maiden':1 'moos':8 'must':13 'mysql':20 'psychologist':17 'saga':5 'teacher':11
552	MAJESTIC FLOATS	A Thrilling Character Study of a Moose And a Student who must Escape a Butler in The First Manned Space Station	2006	1	\N	5	0.99	130	15.99	2006-02-15 05:03:42	'butler':17 'charact':5 'escap':15 'first':20 'float':2 'majest':1 'man':21 'moos':9 'must':14 'space':22 'station':23 'student':12 'studi':6 'thrill':4
553	MAKER GABLES	A Stunning Display of a Moose And a Database Administrator who must Pursue a Composer in A Jet Boat	2006	1	\N	4	0.99	136	12.99	2006-02-15 05:03:42	'administr':12 'boat':21 'compos':17 'databas':11 'display':5 'gabl':2 'jet':20 'maker':1 'moos':8 'must':14 'pursu':15 'stun':4
554	MALKOVICH PET	A Intrepid Reflection of a Waitress And a A Shark who must Kill a Squirrel in The Outback	2006	1	\N	6	2.99	159	22.99	2006-02-15 05:03:42	'intrepid':4 'kill':15 'malkovich':1 'must':14 'outback':20 'pet':2 'reflect':5 'shark':12 'squirrel':17 'waitress':8
555	MALLRATS UNITED	A Thrilling Yarn of a Waitress And a Dentist who must Find a Hunter in A Monastery	2006	1	\N	4	0.99	133	25.99	2006-02-15 05:03:42	'dentist':11 'find':14 'hunter':16 'mallrat':1 'monasteri':19 'must':13 'thrill':4 'unit':2 'waitress':8 'yarn':5
556	MALTESE HOPE	A Fast-Paced Documentary of a Crocodile And a Sumo Wrestler who must Conquer a Explorer in California	2006	1	\N	6	4.99	127	26.99	2006-02-15 05:03:42	'california':21 'conquer':17 'crocodil':10 'documentari':7 'explor':19 'fast':5 'fast-pac':4 'hope':2 'maltes':1 'must':16 'pace':6 'sumo':13 'wrestler':14
557	MANCHURIAN CURTAIN	A Stunning Tale of a Mad Cow And a Boy who must Battle a Boy in Berlin	2006	1	\N	5	2.99	177	27.99	2006-02-15 05:03:42	'battl':15 'berlin':19 'boy':12,17 'cow':9 'curtain':2 'mad':8 'manchurian':1 'must':14 'stun':4 'tale':5
558	MANNEQUIN WORST	A Astounding Saga of a Mad Cow And a Pastry Chef who must Discover a Husband in Ancient India	2006	1	\N	3	2.99	71	18.99	2006-02-15 05:03:42	'ancient':20 'astound':4 'chef':13 'cow':9 'discov':16 'husband':18 'india':21 'mad':8 'mannequin':1 'must':15 'pastri':12 'saga':5 'worst':2
559	MARRIED GO	A Fanciful Story of a Womanizer And a Dog who must Face a Forensic Psychologist in The Sahara Desert	2006	1	\N	7	2.99	114	22.99	2006-02-15 05:03:42	'desert':21 'dog':11 'face':14 'fanci':4 'forens':16 'go':2 'marri':1 'must':13 'psychologist':17 'sahara':20 'stori':5 'woman':8
560	MARS ROMAN	A Boring Drama of a Car And a Dog who must Succumb a Madman in Soviet Georgia	2006	1	\N	6	0.99	62	21.99	2006-02-15 05:03:42	'bore':4 'car':8 'dog':11 'drama':5 'georgia':19 'madman':16 'mar':1 'must':13 'roman':2 'soviet':18 'succumb':14
561	MASK PEACH	A Boring Character Study of a Student And a Robot who must Meet a Woman in California	2006	1	\N	6	2.99	123	26.99	2006-02-15 05:03:42	'bore':4 'california':19 'charact':5 'mask':1 'meet':15 'must':14 'peach':2 'robot':12 'student':9 'studi':6 'woman':17
562	MASKED BUBBLE	A Fanciful Documentary of a Pioneer And a Boat who must Pursue a Pioneer in An Abandoned Mine Shaft	2006	1	\N	6	0.99	151	12.99	2006-02-15 05:03:42	'abandon':19 'boat':11 'bubbl':2 'documentari':5 'fanci':4 'mask':1 'mine':20 'must':13 'pioneer':8,16 'pursu':14 'shaft':21
563	MASSACRE USUAL	A Fateful Reflection of a Waitress And a Crocodile who must Challenge a Forensic Psychologist in California	2006	1	\N	6	4.99	165	16.99	2006-02-15 05:03:42	'california':19 'challeng':14 'crocodil':11 'fate':4 'forens':16 'massacr':1 'must':13 'psychologist':17 'reflect':5 'usual':2 'waitress':8
564	MASSAGE IMAGE	A Fateful Drama of a Frisbee And a Crocodile who must Vanquish a Dog in The First Manned Space Station	2006	1	\N	4	2.99	161	11.99	2006-02-15 05:03:42	'crocodil':11 'dog':16 'drama':5 'fate':4 'first':19 'frisbe':8 'imag':2 'man':20 'massag':1 'must':13 'space':21 'station':22 'vanquish':14
565	MATRIX SNOWMAN	A Action-Packed Saga of a Womanizer And a Woman who must Overcome a Student in California	2006	1	\N	6	4.99	56	9.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'california':20 'matrix':1 'must':15 'overcom':16 'pack':6 'saga':7 'snowman':2 'student':18 'woman':10,13
566	MAUDE MOD	A Beautiful Documentary of a Forensic Psychologist And a Cat who must Reach a Astronaut in Nigeria	2006	1	\N	6	0.99	72	20.99	2006-02-15 05:03:42	'astronaut':17 'beauti':4 'cat':12 'documentari':5 'forens':8 'maud':1 'mod':2 'must':14 'nigeria':19 'psychologist':9 'reach':15
567	MEET CHOCOLATE	A Boring Documentary of a Dentist And a Butler who must Confront a Monkey in A MySQL Convention	2006	1	\N	3	2.99	80	26.99	2006-02-15 05:03:42	'bore':4 'butler':11 'chocol':2 'confront':14 'convent':20 'dentist':8 'documentari':5 'meet':1 'monkey':16 'must':13 'mysql':19
568	MEMENTO ZOOLANDER	A Touching Epistle of a Squirrel And a Explorer who must Redeem a Pastry Chef in The Sahara Desert	2006	1	\N	4	4.99	77	11.99	2006-02-15 05:03:42	'chef':17 'desert':21 'epistl':5 'explor':11 'memento':1 'must':13 'pastri':16 'redeem':14 'sahara':20 'squirrel':8 'touch':4 'zooland':2
569	MENAGERIE RUSHMORE	A Unbelieveable Panorama of a Composer And a Butler who must Overcome a Database Administrator in The First Manned Space Station	2006	1	\N	7	2.99	147	18.99	2006-02-15 05:03:42	'administr':17 'butler':11 'compos':8 'databas':16 'first':20 'man':21 'menageri':1 'must':13 'overcom':14 'panorama':5 'rushmor':2 'space':22 'station':23 'unbeliev':4
570	MERMAID INSECTS	A Lacklusture Drama of a Waitress And a Husband who must Fight a Husband in California	2006	1	\N	5	4.99	104	20.99	2006-02-15 05:03:42	'california':18 'drama':5 'fight':14 'husband':11,16 'insect':2 'lacklustur':4 'mermaid':1 'must':13 'waitress':8
571	METAL ARMAGEDDON	A Thrilling Display of a Lumberjack And a Crocodile who must Meet a Monkey in A Baloon Factory	2006	1	\N	6	2.99	161	26.99	2006-02-15 05:03:42	'armageddon':2 'baloon':19 'crocodil':11 'display':5 'factori':20 'lumberjack':8 'meet':14 'metal':1 'monkey':16 'must':13 'thrill':4
572	METROPOLIS COMA	A Emotional Saga of a Database Administrator And a Pastry Chef who must Confront a Teacher in A Baloon Factory	2006	1	\N	4	2.99	64	9.99	2006-02-15 05:03:42	'administr':9 'baloon':21 'chef':13 'coma':2 'confront':16 'databas':8 'emot':4 'factori':22 'metropoli':1 'must':15 'pastri':12 'saga':5 'teacher':18
573	MICROCOSMOS PARADISE	A Touching Character Study of a Boat And a Student who must Sink a A Shark in Nigeria	2006	1	\N	6	2.99	105	22.99	2006-02-15 05:03:42	'boat':9 'charact':5 'microcosmo':1 'must':14 'nigeria':20 'paradis':2 'shark':18 'sink':15 'student':12 'studi':6 'touch':4
574	MIDNIGHT WESTWARD	A Taut Reflection of a Husband And a A Shark who must Redeem a Pastry Chef in A Monastery	2006	1	\N	3	0.99	86	19.99	2006-02-15 05:03:42	'chef':18 'husband':8 'midnight':1 'monasteri':21 'must':14 'pastri':17 'redeem':15 'reflect':5 'shark':12 'taut':4 'westward':2
575	MIDSUMMER GROUNDHOG	A Fateful Panorama of a Moose And a Dog who must Chase a Crocodile in Ancient Japan	2006	1	\N	3	4.99	48	27.99	2006-02-15 05:03:42	'ancient':18 'chase':14 'crocodil':16 'dog':11 'fate':4 'groundhog':2 'japan':19 'midsumm':1 'moos':8 'must':13 'panorama':5
576	MIGHTY LUCK	A Astounding Epistle of a Mad Scientist And a Pioneer who must Escape a Database Administrator in A MySQL Convention	2006	1	\N	7	2.99	122	13.99	2006-02-15 05:03:42	'administr':18 'astound':4 'convent':22 'databas':17 'epistl':5 'escap':15 'luck':2 'mad':8 'mighti':1 'must':14 'mysql':21 'pioneer':12 'scientist':9
577	MILE MULAN	A Lacklusture Epistle of a Cat And a Husband who must Confront a Boy in A MySQL Convention	2006	1	\N	4	0.99	64	10.99	2006-02-15 05:03:42	'boy':16 'cat':8 'confront':14 'convent':20 'epistl':5 'husband':11 'lacklustur':4 'mile':1 'mulan':2 'must':13 'mysql':19
578	MILLION ACE	A Brilliant Documentary of a Womanizer And a Squirrel who must Find a Technical Writer in The Sahara Desert	2006	1	\N	4	4.99	142	16.99	2006-02-15 05:03:42	'ace':2 'brilliant':4 'desert':21 'documentari':5 'find':14 'million':1 'must':13 'sahara':20 'squirrel':11 'technic':16 'woman':8 'writer':17
579	MINDS TRUMAN	A Taut Yarn of a Mad Scientist And a Crocodile who must Outgun a Database Administrator in A Monastery	2006	1	\N	3	4.99	149	22.99	2006-02-15 05:03:42	'administr':18 'crocodil':12 'databas':17 'mad':8 'mind':1 'monasteri':21 'must':14 'outgun':15 'scientist':9 'taut':4 'truman':2 'yarn':5
580	MINE TITANS	A Amazing Yarn of a Robot And a Womanizer who must Discover a Forensic Psychologist in Berlin	2006	1	\N	3	4.99	166	12.99	2006-02-15 05:03:42	'amaz':4 'berlin':19 'discov':14 'forens':16 'mine':1 'must':13 'psychologist':17 'robot':8 'titan':2 'woman':11 'yarn':5
581	MINORITY KISS	A Insightful Display of a Lumberjack And a Sumo Wrestler who must Meet a Man in The Outback	2006	1	\N	4	0.99	59	16.99	2006-02-15 05:03:42	'display':5 'insight':4 'kiss':2 'lumberjack':8 'man':17 'meet':15 'minor':1 'must':14 'outback':20 'sumo':11 'wrestler':12
582	MIRACLE VIRTUAL	A Touching Epistle of a Butler And a Boy who must Find a Mad Scientist in The Sahara Desert	2006	1	\N	3	2.99	162	19.99	2006-02-15 05:03:42	'boy':11 'butler':8 'desert':21 'epistl':5 'find':14 'mad':16 'miracl':1 'must':13 'sahara':20 'scientist':17 'touch':4 'virtual':2
583	MISSION ZOOLANDER	A Intrepid Story of a Sumo Wrestler And a Teacher who must Meet a A Shark in An Abandoned Fun House	2006	1	\N	3	4.99	164	26.99	2006-02-15 05:03:42	'abandon':21 'fun':22 'hous':23 'intrepid':4 'meet':15 'mission':1 'must':14 'shark':18 'stori':5 'sumo':8 'teacher':12 'wrestler':9 'zooland':2
584	MIXED DOORS	A Taut Drama of a Womanizer And a Lumberjack who must Succumb a Pioneer in Ancient India	2006	1	\N	6	2.99	180	26.99	2006-02-15 05:03:42	'ancient':18 'door':2 'drama':5 'india':19 'lumberjack':11 'mix':1 'must':13 'pioneer':16 'succumb':14 'taut':4 'woman':8
585	MOB DUFFEL	A Unbelieveable Documentary of a Frisbee And a Boat who must Meet a Boy in The Canadian Rockies	2006	1	\N	4	0.99	105	25.99	2006-02-15 05:03:42	'boat':11 'boy':16 'canadian':19 'documentari':5 'duffel':2 'frisbe':8 'meet':14 'mob':1 'must':13 'rocki':20 'unbeliev':4
586	MOCKINGBIRD HOLLYWOOD	A Thoughtful Panorama of a Man And a Car who must Sink a Composer in Berlin	2006	1	\N	4	0.99	60	27.99	2006-02-15 05:03:42	'berlin':18 'car':11 'compos':16 'hollywood':2 'man':8 'mockingbird':1 'must':13 'panorama':5 'sink':14 'thought':4
587	MOD SECRETARY	A Boring Documentary of a Mad Cow And a Cat who must Build a Lumberjack in New Orleans	2006	1	\N	6	4.99	77	20.99	2006-02-15 05:03:42	'bore':4 'build':15 'cat':12 'cow':9 'documentari':5 'lumberjack':17 'mad':8 'mod':1 'must':14 'new':19 'orlean':20 'secretari':2
588	MODEL FISH	A Beautiful Panorama of a Boat And a Crocodile who must Outrace a Dog in Australia	2006	1	\N	4	4.99	175	11.99	2006-02-15 05:03:42	'australia':18 'beauti':4 'boat':8 'crocodil':11 'dog':16 'fish':2 'model':1 'must':13 'outrac':14 'panorama':5
589	MODERN DORADO	A Awe-Inspiring Story of a Butler And a Sumo Wrestler who must Redeem a Boy in New Orleans	2006	1	\N	3	0.99	74	20.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'boy':19 'butler':10 'dorado':2 'inspir':6 'modern':1 'must':16 'new':21 'orlean':22 'redeem':17 'stori':7 'sumo':13 'wrestler':14
590	MONEY HAROLD	A Touching Tale of a Explorer And a Boat who must Defeat a Robot in Australia	2006	1	\N	3	2.99	135	17.99	2006-02-15 05:03:42	'australia':18 'boat':11 'defeat':14 'explor':8 'harold':2 'money':1 'must':13 'robot':16 'tale':5 'touch':4
591	MONSOON CAUSE	A Astounding Tale of a Crocodile And a Car who must Outrace a Squirrel in A U-Boat	2006	1	\N	6	4.99	182	20.99	2006-02-15 05:03:42	'astound':4 'boat':21 'car':11 'caus':2 'crocodil':8 'monsoon':1 'must':13 'outrac':14 'squirrel':16 'tale':5 'u':20 'u-boat':19
592	MONSTER SPARTACUS	A Fast-Paced Story of a Waitress And a Cat who must Fight a Girl in Australia	2006	1	\N	6	2.99	107	28.99	2006-02-15 05:03:42	'australia':20 'cat':13 'fast':5 'fast-pac':4 'fight':16 'girl':18 'monster':1 'must':15 'pace':6 'spartacus':2 'stori':7 'waitress':10
593	MONTEREY LABYRINTH	A Awe-Inspiring Drama of a Monkey And a Composer who must Escape a Feminist in A U-Boat	2006	1	\N	6	0.99	158	13.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'boat':23 'compos':13 'drama':7 'escap':16 'feminist':18 'inspir':6 'labyrinth':2 'monkey':10 'monterey':1 'must':15 'u':22 'u-boat':21
594	MONTEZUMA COMMAND	A Thrilling Reflection of a Waitress And a Butler who must Battle a Butler in A Jet Boat	2006	1	\N	6	0.99	126	22.99	2006-02-15 05:03:42	'battl':14 'boat':20 'butler':11,16 'command':2 'jet':19 'montezuma':1 'must':13 'reflect':5 'thrill':4 'waitress':8
595	MOON BUNCH	A Beautiful Tale of a Astronaut And a Mad Cow who must Challenge a Cat in A Baloon Factory	2006	1	\N	7	0.99	83	20.99	2006-02-15 05:03:42	'astronaut':8 'baloon':20 'beauti':4 'bunch':2 'cat':17 'challeng':15 'cow':12 'factori':21 'mad':11 'moon':1 'must':14 'tale':5
596	MOONSHINE CABIN	A Thoughtful Display of a Astronaut And a Feminist who must Chase a Frisbee in A Jet Boat	2006	1	\N	4	4.99	171	25.99	2006-02-15 05:03:42	'astronaut':8 'boat':20 'cabin':2 'chase':14 'display':5 'feminist':11 'frisbe':16 'jet':19 'moonshin':1 'must':13 'thought':4
597	MOONWALKER FOOL	A Epic Drama of a Feminist And a Pioneer who must Sink a Composer in New Orleans	2006	1	\N	5	4.99	184	12.99	2006-02-15 05:03:42	'compos':16 'drama':5 'epic':4 'feminist':8 'fool':2 'moonwalk':1 'must':13 'new':18 'orlean':19 'pioneer':11 'sink':14
598	MOSQUITO ARMAGEDDON	A Thoughtful Character Study of a Waitress And a Feminist who must Build a Teacher in Ancient Japan	2006	1	\N	6	0.99	57	22.99	2006-02-15 05:03:42	'ancient':19 'armageddon':2 'build':15 'charact':5 'feminist':12 'japan':20 'mosquito':1 'must':14 'studi':6 'teacher':17 'thought':4 'waitress':9
599	MOTHER OLEANDER	A Boring Tale of a Husband And a Boy who must Fight a Squirrel in Ancient China	2006	1	\N	3	0.99	103	20.99	2006-02-15 05:03:42	'ancient':18 'bore':4 'boy':11 'china':19 'fight':14 'husband':8 'mother':1 'must':13 'oleand':2 'squirrel':16 'tale':5
600	MOTIONS DETAILS	A Awe-Inspiring Reflection of a Dog And a Student who must Kill a Car in An Abandoned Fun House	2006	1	\N	5	0.99	166	16.99	2006-02-15 05:03:42	'abandon':21 'awe':5 'awe-inspir':4 'car':18 'detail':2 'dog':10 'fun':22 'hous':23 'inspir':6 'kill':16 'motion':1 'must':15 'reflect':7 'student':13
601	MOULIN WAKE	A Astounding Story of a Forensic Psychologist And a Cat who must Battle a Teacher in An Abandoned Mine Shaft	2006	1	\N	4	0.99	79	20.99	2006-02-15 05:03:42	'abandon':20 'astound':4 'battl':15 'cat':12 'forens':8 'mine':21 'moulin':1 'must':14 'psychologist':9 'shaft':22 'stori':5 'teacher':17 'wake':2
602	MOURNING PURPLE	A Lacklusture Display of a Waitress And a Lumberjack who must Chase a Pioneer in New Orleans	2006	1	\N	5	0.99	146	14.99	2006-02-15 05:03:42	'chase':14 'display':5 'lacklustur':4 'lumberjack':11 'mourn':1 'must':13 'new':18 'orlean':19 'pioneer':16 'purpl':2 'waitress':8
603	MOVIE SHAKESPEARE	A Insightful Display of a Database Administrator And a Student who must Build a Hunter in Berlin	2006	1	\N	6	4.99	53	27.99	2006-02-15 05:03:42	'administr':9 'berlin':19 'build':15 'databas':8 'display':5 'hunter':17 'insight':4 'movi':1 'must':14 'shakespear':2 'student':12
604	MULAN MOON	A Emotional Saga of a Womanizer And a Pioneer who must Overcome a Dentist in A Baloon	2006	1	\N	4	0.99	160	10.99	2006-02-15 05:03:42	'baloon':19 'dentist':16 'emot':4 'moon':2 'mulan':1 'must':13 'overcom':14 'pioneer':11 'saga':5 'woman':8
605	MULHOLLAND BEAST	A Awe-Inspiring Display of a Husband And a Squirrel who must Battle a Sumo Wrestler in A Jet Boat	2006	1	\N	7	2.99	157	13.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'battl':16 'beast':2 'boat':23 'display':7 'husband':10 'inspir':6 'jet':22 'mulholland':1 'must':15 'squirrel':13 'sumo':18 'wrestler':19
606	MUMMY CREATURES	A Fateful Character Study of a Crocodile And a Monkey who must Meet a Dentist in Australia	2006	1	\N	3	0.99	160	15.99	2006-02-15 05:03:42	'australia':19 'charact':5 'creatur':2 'crocodil':9 'dentist':17 'fate':4 'meet':15 'monkey':12 'mummi':1 'must':14 'studi':6
607	MUPPET MILE	A Lacklusture Story of a Madman And a Teacher who must Kill a Frisbee in The Gulf of Mexico	2006	1	\N	5	4.99	50	18.99	2006-02-15 05:03:42	'frisbe':16 'gulf':19 'kill':14 'lacklustur':4 'madman':8 'mexico':21 'mile':2 'muppet':1 'must':13 'stori':5 'teacher':11
608	MURDER ANTITRUST	A Brilliant Yarn of a Car And a Database Administrator who must Escape a Boy in A MySQL Convention	2006	1	\N	6	2.99	166	11.99	2006-02-15 05:03:42	'administr':12 'antitrust':2 'boy':17 'brilliant':4 'car':8 'convent':21 'databas':11 'escap':15 'murder':1 'must':14 'mysql':20 'yarn':5
609	MUSCLE BRIGHT	A Stunning Panorama of a Sumo Wrestler And a Husband who must Redeem a Madman in Ancient India	2006	1	\N	7	2.99	185	23.99	2006-02-15 05:03:42	'ancient':19 'bright':2 'husband':12 'india':20 'madman':17 'muscl':1 'must':14 'panorama':5 'redeem':15 'stun':4 'sumo':8 'wrestler':9
610	MUSIC BOONDOCK	A Thrilling Tale of a Butler And a Astronaut who must Battle a Explorer in The First Manned Space Station	2006	1	\N	7	0.99	129	17.99	2006-02-15 05:03:42	'astronaut':11 'battl':14 'boondock':2 'butler':8 'explor':16 'first':19 'man':20 'music':1 'must':13 'space':21 'station':22 'tale':5 'thrill':4
611	MUSKETEERS WAIT	A Touching Yarn of a Student And a Moose who must Fight a Mad Cow in Australia	2006	1	\N	7	4.99	73	17.99	2006-02-15 05:03:42	'australia':19 'cow':17 'fight':14 'mad':16 'moos':11 'musket':1 'must':13 'student':8 'touch':4 'wait':2 'yarn':5
612	MUSSOLINI SPOILERS	A Thrilling Display of a Boat And a Monkey who must Meet a Composer in Ancient China	2006	1	\N	6	2.99	180	10.99	2006-02-15 05:03:42	'ancient':18 'boat':8 'china':19 'compos':16 'display':5 'meet':14 'monkey':11 'mussolini':1 'must':13 'spoiler':2 'thrill':4
613	MYSTIC TRUMAN	A Epic Yarn of a Teacher And a Hunter who must Outgun a Explorer in Soviet Georgia	2006	1	\N	5	0.99	92	19.99	2006-02-15 05:03:42	'epic':4 'explor':16 'georgia':19 'hunter':11 'must':13 'mystic':1 'outgun':14 'soviet':18 'teacher':8 'truman':2 'yarn':5
614	NAME DETECTIVE	A Touching Saga of a Sumo Wrestler And a Cat who must Pursue a Mad Scientist in Nigeria	2006	1	\N	5	4.99	178	11.99	2006-02-15 05:03:42	'cat':12 'detect':2 'mad':17 'must':14 'name':1 'nigeria':20 'pursu':15 'saga':5 'scientist':18 'sumo':8 'touch':4 'wrestler':9
615	NASH CHOCOLAT	A Epic Reflection of a Monkey And a Mad Cow who must Kill a Forensic Psychologist in An Abandoned Mine Shaft	2006	1	\N	6	2.99	180	21.99	2006-02-15 05:03:42	'abandon':21 'chocolat':2 'cow':12 'epic':4 'forens':17 'kill':15 'mad':11 'mine':22 'monkey':8 'must':14 'nash':1 'psychologist':18 'reflect':5 'shaft':23
616	NATIONAL STORY	A Taut Epistle of a Mad Scientist And a Girl who must Escape a Monkey in California	2006	1	\N	4	2.99	92	19.99	2006-02-15 05:03:42	'california':19 'epistl':5 'escap':15 'girl':12 'mad':8 'monkey':17 'must':14 'nation':1 'scientist':9 'stori':2 'taut':4
617	NATURAL STOCK	A Fast-Paced Story of a Sumo Wrestler And a Girl who must Defeat a Car in A Baloon Factory	2006	1	\N	4	0.99	50	24.99	2006-02-15 05:03:42	'baloon':22 'car':19 'defeat':17 'factori':23 'fast':5 'fast-pac':4 'girl':14 'must':16 'natur':1 'pace':6 'stock':2 'stori':7 'sumo':10 'wrestler':11
618	NECKLACE OUTBREAK	A Astounding Epistle of a Database Administrator And a Mad Scientist who must Pursue a Cat in California	2006	1	\N	3	0.99	132	21.99	2006-02-15 05:03:42	'administr':9 'astound':4 'california':20 'cat':18 'databas':8 'epistl':5 'mad':12 'must':15 'necklac':1 'outbreak':2 'pursu':16 'scientist':13
619	NEIGHBORS CHARADE	A Fanciful Reflection of a Crocodile And a Astronaut who must Outrace a Feminist in An Abandoned Amusement Park	2006	1	\N	3	0.99	161	20.99	2006-02-15 05:03:42	'abandon':19 'amus':20 'astronaut':11 'charad':2 'crocodil':8 'fanci':4 'feminist':16 'must':13 'neighbor':1 'outrac':14 'park':21 'reflect':5
620	NEMO CAMPUS	A Lacklusture Reflection of a Monkey And a Squirrel who must Outrace a Womanizer in A Manhattan Penthouse	2006	1	\N	5	2.99	131	23.99	2006-02-15 05:03:42	'campus':2 'lacklustur':4 'manhattan':19 'monkey':8 'must':13 'nemo':1 'outrac':14 'penthous':20 'reflect':5 'squirrel':11 'woman':16
621	NETWORK PEAK	A Unbelieveable Reflection of a Butler And a Boat who must Outgun a Mad Scientist in California	2006	1	\N	5	2.99	75	23.99	2006-02-15 05:03:42	'boat':11 'butler':8 'california':19 'mad':16 'must':13 'network':1 'outgun':14 'peak':2 'reflect':5 'scientist':17 'unbeliev':4
622	NEWSIES STORY	A Action-Packed Character Study of a Dog And a Lumberjack who must Outrace a Moose in The Gulf of Mexico	2006	1	\N	4	0.99	159	25.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'charact':7 'dog':11 'gulf':22 'lumberjack':14 'mexico':24 'moos':19 'must':16 'newsi':1 'outrac':17 'pack':6 'stori':2 'studi':8
623	NEWTON LABYRINTH	A Intrepid Character Study of a Moose And a Waitress who must Find a A Shark in Ancient India	2006	1	\N	4	0.99	75	9.99	2006-02-15 05:03:42	'ancient':20 'charact':5 'find':15 'india':21 'intrepid':4 'labyrinth':2 'moos':9 'must':14 'newton':1 'shark':18 'studi':6 'waitress':12
624	NIGHTMARE CHILL	A Brilliant Display of a Robot And a Butler who must Fight a Waitress in An Abandoned Mine Shaft	2006	1	\N	3	4.99	149	25.99	2006-02-15 05:03:42	'abandon':19 'brilliant':4 'butler':11 'chill':2 'display':5 'fight':14 'mine':20 'must':13 'nightmar':1 'robot':8 'shaft':21 'waitress':16
625	NONE SPIKING	A Boring Reflection of a Secret Agent And a Astronaut who must Face a Composer in A Manhattan Penthouse	2006	1	\N	3	0.99	83	18.99	2006-02-15 05:03:42	'agent':9 'astronaut':12 'bore':4 'compos':17 'face':15 'manhattan':20 'must':14 'none':1 'penthous':21 'reflect':5 'secret':8 'spike':2
626	NOON PAPI	A Unbelieveable Character Study of a Mad Scientist And a Astronaut who must Find a Pioneer in A Manhattan Penthouse	2006	1	\N	5	2.99	57	12.99	2006-02-15 05:03:42	'astronaut':13 'charact':5 'find':16 'mad':9 'manhattan':21 'must':15 'noon':1 'papi':2 'penthous':22 'pioneer':18 'scientist':10 'studi':6 'unbeliev':4
627	NORTH TEQUILA	A Beautiful Character Study of a Mad Cow And a Robot who must Reach a Womanizer in New Orleans	2006	1	\N	4	4.99	67	9.99	2006-02-15 05:03:42	'beauti':4 'charact':5 'cow':10 'mad':9 'must':15 'new':20 'north':1 'orlean':21 'reach':16 'robot':13 'studi':6 'tequila':2 'woman':18
628	NORTHWEST POLISH	A Boring Character Study of a Boy And a A Shark who must Outrace a Womanizer in The Outback	2006	1	\N	5	2.99	172	24.99	2006-02-15 05:03:42	'bore':4 'boy':9 'charact':5 'must':15 'northwest':1 'outback':21 'outrac':16 'polish':2 'shark':13 'studi':6 'woman':18
629	NOTORIOUS REUNION	A Amazing Epistle of a Woman And a Squirrel who must Fight a Hunter in A Baloon	2006	1	\N	7	0.99	128	9.99	2006-02-15 05:03:42	'amaz':4 'baloon':19 'epistl':5 'fight':14 'hunter':16 'must':13 'notori':1 'reunion':2 'squirrel':11 'woman':8
630	NOTTING SPEAKEASY	A Thoughtful Display of a Butler And a Womanizer who must Find a Waitress in The Canadian Rockies	2006	1	\N	7	0.99	48	19.99	2006-02-15 05:03:42	'butler':8 'canadian':19 'display':5 'find':14 'must':13 'not':1 'rocki':20 'speakeasi':2 'thought':4 'waitress':16 'woman':11
631	NOVOCAINE FLIGHT	A Fanciful Display of a Student And a Teacher who must Outgun a Crocodile in Nigeria	2006	1	\N	4	0.99	64	11.99	2006-02-15 05:03:42	'crocodil':16 'display':5 'fanci':4 'flight':2 'must':13 'nigeria':18 'novocain':1 'outgun':14 'student':8 'teacher':11
632	NUTS TIES	A Thoughtful Drama of a Explorer And a Womanizer who must Meet a Teacher in California	2006	1	\N	5	4.99	145	10.99	2006-02-15 05:03:42	'california':18 'drama':5 'explor':8 'meet':14 'must':13 'nut':1 'teacher':16 'thought':4 'tie':2 'woman':11
633	OCTOBER SUBMARINE	A Taut Epistle of a Monkey And a Boy who must Confront a Husband in A Jet Boat	2006	1	\N	6	4.99	54	10.99	2006-02-15 05:03:42	'boat':20 'boy':11 'confront':14 'epistl':5 'husband':16 'jet':19 'monkey':8 'must':13 'octob':1 'submarin':2 'taut':4
634	ODDS BOOGIE	A Thrilling Yarn of a Feminist And a Madman who must Battle a Hunter in Berlin	2006	1	\N	6	0.99	48	14.99	2006-02-15 05:03:42	'battl':14 'berlin':18 'boogi':2 'feminist':8 'hunter':16 'madman':11 'must':13 'odd':1 'thrill':4 'yarn':5
635	OKLAHOMA JUMANJI	A Thoughtful Drama of a Dentist And a Womanizer who must Meet a Husband in The Sahara Desert	2006	1	\N	7	0.99	58	15.99	2006-02-15 05:03:42	'dentist':8 'desert':20 'drama':5 'husband':16 'jumanji':2 'meet':14 'must':13 'oklahoma':1 'sahara':19 'thought':4 'woman':11
636	OLEANDER CLUE	A Boring Story of a Teacher And a Monkey who must Succumb a Forensic Psychologist in A Jet Boat	2006	1	\N	5	0.99	161	12.99	2006-02-15 05:03:42	'boat':21 'bore':4 'clue':2 'forens':16 'jet':20 'monkey':11 'must':13 'oleand':1 'psychologist':17 'stori':5 'succumb':14 'teacher':8
637	OPEN AFRICAN	A Lacklusture Drama of a Secret Agent And a Explorer who must Discover a Car in A U-Boat	2006	1	\N	7	4.99	131	16.99	2006-02-15 05:03:42	'african':2 'agent':9 'boat':22 'car':17 'discov':15 'drama':5 'explor':12 'lacklustur':4 'must':14 'open':1 'secret':8 'u':21 'u-boat':20
638	OPERATION OPERATION	A Intrepid Character Study of a Man And a Frisbee who must Overcome a Madman in Ancient China	2006	1	\N	7	2.99	156	23.99	2006-02-15 05:03:42	'ancient':19 'charact':5 'china':20 'frisbe':12 'intrepid':4 'madman':17 'man':9 'must':14 'oper':1,2 'overcom':15 'studi':6
639	OPPOSITE NECKLACE	A Fateful Epistle of a Crocodile And a Moose who must Kill a Explorer in Nigeria	2006	1	\N	7	4.99	92	9.99	2006-02-15 05:03:42	'crocodil':8 'epistl':5 'explor':16 'fate':4 'kill':14 'moos':11 'must':13 'necklac':2 'nigeria':18 'opposit':1
640	OPUS ICE	A Fast-Paced Drama of a Hunter And a Boy who must Discover a Feminist in The Sahara Desert	2006	1	\N	5	4.99	102	21.99	2006-02-15 05:03:42	'boy':13 'desert':22 'discov':16 'drama':7 'fast':5 'fast-pac':4 'feminist':18 'hunter':10 'ice':2 'must':15 'opus':1 'pace':6 'sahara':21
641	ORANGE GRAPES	A Astounding Documentary of a Butler And a Womanizer who must Face a Dog in A U-Boat	2006	1	\N	4	0.99	76	21.99	2006-02-15 05:03:42	'astound':4 'boat':21 'butler':8 'documentari':5 'dog':16 'face':14 'grape':2 'must':13 'orang':1 'u':20 'u-boat':19 'woman':11
642	ORDER BETRAYED	A Amazing Saga of a Dog And a A Shark who must Challenge a Cat in The Sahara Desert	2006	1	\N	7	2.99	120	13.99	2006-02-15 05:03:42	'amaz':4 'betray':2 'cat':17 'challeng':15 'desert':21 'dog':8 'must':14 'order':1 'saga':5 'sahara':20 'shark':12
643	ORIENT CLOSER	A Astounding Epistle of a Technical Writer And a Teacher who must Fight a Squirrel in The Sahara Desert	2006	1	\N	3	2.99	118	22.99	2006-02-15 05:03:42	'astound':4 'closer':2 'desert':21 'epistl':5 'fight':15 'must':14 'orient':1 'sahara':20 'squirrel':17 'teacher':12 'technic':8 'writer':9
644	OSCAR GOLD	A Insightful Tale of a Database Administrator And a Dog who must Face a Madman in Soviet Georgia	2006	1	\N	7	2.99	115	29.99	2006-02-15 05:03:42	'administr':9 'databas':8 'dog':12 'face':15 'georgia':20 'gold':2 'insight':4 'madman':17 'must':14 'oscar':1 'soviet':19 'tale':5
645	OTHERS SOUP	A Lacklusture Documentary of a Mad Cow And a Madman who must Sink a Moose in The Gulf of Mexico	2006	1	\N	7	2.99	118	18.99	2006-02-15 05:03:42	'cow':9 'documentari':5 'gulf':20 'lacklustur':4 'mad':8 'madman':12 'mexico':22 'moos':17 'must':14 'other':1 'sink':15 'soup':2
646	OUTBREAK DIVINE	A Unbelieveable Yarn of a Database Administrator And a Woman who must Succumb a A Shark in A U-Boat	2006	1	\N	6	0.99	169	12.99	2006-02-15 05:03:42	'administr':9 'boat':23 'databas':8 'divin':2 'must':14 'outbreak':1 'shark':18 'succumb':15 'u':22 'u-boat':21 'unbeliev':4 'woman':12 'yarn':5
647	OUTFIELD MASSACRE	A Thoughtful Drama of a Husband And a Secret Agent who must Pursue a Database Administrator in Ancient India	2006	1	\N	4	0.99	129	18.99	2006-02-15 05:03:42	'administr':18 'agent':12 'ancient':20 'databas':17 'drama':5 'husband':8 'india':21 'massacr':2 'must':14 'outfield':1 'pursu':15 'secret':11 'thought':4
648	OUTLAW HANKY	A Thoughtful Story of a Astronaut And a Composer who must Conquer a Dog in The Sahara Desert	2006	1	\N	7	4.99	148	17.99	2006-02-15 05:03:42	'astronaut':8 'compos':11 'conquer':14 'desert':20 'dog':16 'hanki':2 'must':13 'outlaw':1 'sahara':19 'stori':5 'thought':4
649	OZ LIAISONS	A Epic Yarn of a Mad Scientist And a Cat who must Confront a Womanizer in A Baloon Factory	2006	1	\N	4	2.99	85	14.99	2006-02-15 05:03:42	'baloon':20 'cat':12 'confront':15 'epic':4 'factori':21 'liaison':2 'mad':8 'must':14 'oz':1 'scientist':9 'woman':17 'yarn':5
650	PACIFIC AMISTAD	A Thrilling Yarn of a Dog And a Moose who must Kill a Pastry Chef in A Manhattan Penthouse	2006	1	\N	3	0.99	144	27.99	2006-02-15 05:03:42	'amistad':2 'chef':17 'dog':8 'kill':14 'manhattan':20 'moos':11 'must':13 'pacif':1 'pastri':16 'penthous':21 'thrill':4 'yarn':5
651	PACKER MADIGAN	A Epic Display of a Sumo Wrestler And a Forensic Psychologist who must Build a Woman in An Abandoned Amusement Park	2006	1	\N	3	0.99	84	20.99	2006-02-15 05:03:42	'abandon':21 'amus':22 'build':16 'display':5 'epic':4 'forens':12 'madigan':2 'must':15 'packer':1 'park':23 'psychologist':13 'sumo':8 'woman':18 'wrestler':9
652	PAJAMA JAWBREAKER	A Emotional Drama of a Boy And a Technical Writer who must Redeem a Sumo Wrestler in California	2006	1	\N	3	0.99	126	14.99	2006-02-15 05:03:42	'boy':8 'california':20 'drama':5 'emot':4 'jawbreak':2 'must':14 'pajama':1 'redeem':15 'sumo':17 'technic':11 'wrestler':18 'writer':12
653	PANIC CLUB	A Fanciful Display of a Teacher And a Crocodile who must Succumb a Girl in A Baloon	2006	1	\N	3	4.99	102	15.99	2006-02-15 05:03:42	'baloon':19 'club':2 'crocodil':11 'display':5 'fanci':4 'girl':16 'must':13 'panic':1 'succumb':14 'teacher':8
654	PANKY SUBMARINE	A Touching Documentary of a Dentist And a Sumo Wrestler who must Overcome a Boy in The Gulf of Mexico	2006	1	\N	4	4.99	93	19.99	2006-02-15 05:03:42	'boy':17 'dentist':8 'documentari':5 'gulf':20 'mexico':22 'must':14 'overcom':15 'panki':1 'submarin':2 'sumo':11 'touch':4 'wrestler':12
655	PANTHER REDS	A Brilliant Panorama of a Moose And a Man who must Reach a Teacher in The Gulf of Mexico	2006	1	\N	5	4.99	109	22.99	2006-02-15 05:03:42	'brilliant':4 'gulf':19 'man':11 'mexico':21 'moos':8 'must':13 'panorama':5 'panther':1 'reach':14 'red':2 'teacher':16
656	PAPI NECKLACE	A Fanciful Display of a Car And a Monkey who must Escape a Squirrel in Ancient Japan	2006	1	\N	3	0.99	128	9.99	2006-02-15 05:03:42	'ancient':18 'car':8 'display':5 'escap':14 'fanci':4 'japan':19 'monkey':11 'must':13 'necklac':2 'papi':1 'squirrel':16
657	PARADISE SABRINA	A Intrepid Yarn of a Car And a Moose who must Outrace a Crocodile in A Manhattan Penthouse	2006	1	\N	5	2.99	48	12.99	2006-02-15 05:03:42	'car':8 'crocodil':16 'intrepid':4 'manhattan':19 'moos':11 'must':13 'outrac':14 'paradis':1 'penthous':20 'sabrina':2 'yarn':5
658	PARIS WEEKEND	A Intrepid Story of a Squirrel And a Crocodile who must Defeat a Monkey in The Outback	2006	1	\N	7	2.99	121	19.99	2006-02-15 05:03:42	'crocodil':11 'defeat':14 'intrepid':4 'monkey':16 'must':13 'outback':19 'pari':1 'squirrel':8 'stori':5 'weekend':2
659	PARK CITIZEN	A Taut Epistle of a Sumo Wrestler And a Girl who must Face a Husband in Ancient Japan	2006	1	\N	3	4.99	109	14.99	2006-02-15 05:03:42	'ancient':19 'citizen':2 'epistl':5 'face':15 'girl':12 'husband':17 'japan':20 'must':14 'park':1 'sumo':8 'taut':4 'wrestler':9
660	PARTY KNOCK	A Fateful Display of a Technical Writer And a Butler who must Battle a Sumo Wrestler in An Abandoned Mine Shaft	2006	1	\N	7	2.99	107	11.99	2006-02-15 05:03:42	'abandon':21 'battl':15 'butler':12 'display':5 'fate':4 'knock':2 'mine':22 'must':14 'parti':1 'shaft':23 'sumo':17 'technic':8 'wrestler':18 'writer':9
661	PAST SUICIDES	A Intrepid Tale of a Madman And a Astronaut who must Challenge a Hunter in A Monastery	2006	1	\N	5	4.99	157	17.99	2006-02-15 05:03:42	'astronaut':11 'challeng':14 'hunter':16 'intrepid':4 'madman':8 'monasteri':19 'must':13 'past':1 'suicid':2 'tale':5
662	PATHS CONTROL	A Astounding Documentary of a Butler And a Cat who must Find a Frisbee in Ancient China	2006	1	\N	3	4.99	118	9.99	2006-02-15 05:03:42	'ancient':18 'astound':4 'butler':8 'cat':11 'china':19 'control':2 'documentari':5 'find':14 'frisbe':16 'must':13 'path':1
663	PATIENT SISTER	A Emotional Epistle of a Squirrel And a Robot who must Confront a Lumberjack in Soviet Georgia	2006	1	\N	7	0.99	99	29.99	2006-02-15 05:03:42	'confront':14 'emot':4 'epistl':5 'georgia':19 'lumberjack':16 'must':13 'patient':1 'robot':11 'sister':2 'soviet':18 'squirrel':8
664	PATRIOT ROMAN	A Taut Saga of a Robot And a Database Administrator who must Challenge a Astronaut in California	2006	1	\N	6	2.99	65	12.99	2006-02-15 05:03:42	'administr':12 'astronaut':17 'california':19 'challeng':15 'databas':11 'must':14 'patriot':1 'robot':8 'roman':2 'saga':5 'taut':4
665	PATTON INTERVIEW	A Thrilling Documentary of a Composer And a Secret Agent who must Succumb a Cat in Berlin	2006	1	\N	4	2.99	175	22.99	2006-02-15 05:03:42	'agent':12 'berlin':19 'cat':17 'compos':8 'documentari':5 'interview':2 'must':14 'patton':1 'secret':11 'succumb':15 'thrill':4
666	PAYCHECK WAIT	A Awe-Inspiring Reflection of a Boy And a Man who must Discover a Moose in The Sahara Desert	2006	1	\N	4	4.99	145	27.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'boy':10 'desert':22 'discov':16 'inspir':6 'man':13 'moos':18 'must':15 'paycheck':1 'reflect':7 'sahara':21 'wait':2
667	PEACH INNOCENT	A Action-Packed Drama of a Monkey And a Dentist who must Chase a Butler in Berlin	2006	1	\N	3	2.99	160	20.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'berlin':20 'butler':18 'chase':16 'dentist':13 'drama':7 'innoc':2 'monkey':10 'must':15 'pack':6 'peach':1
668	PEAK FOREVER	A Insightful Reflection of a Boat And a Secret Agent who must Vanquish a Astronaut in An Abandoned Mine Shaft	2006	1	\N	7	4.99	80	25.99	2006-02-15 05:03:42	'abandon':20 'agent':12 'astronaut':17 'boat':8 'forev':2 'insight':4 'mine':21 'must':14 'peak':1 'reflect':5 'secret':11 'shaft':22 'vanquish':15
669	PEARL DESTINY	A Lacklusture Yarn of a Astronaut And a Pastry Chef who must Sink a Dog in A U-Boat	2006	1	\N	3	2.99	74	10.99	2006-02-15 05:03:42	'astronaut':8 'boat':22 'chef':12 'destini':2 'dog':17 'lacklustur':4 'must':14 'pastri':11 'pearl':1 'sink':15 'u':21 'u-boat':20 'yarn':5
670	PELICAN COMFORTS	A Epic Documentary of a Boy And a Monkey who must Pursue a Astronaut in Berlin	2006	1	\N	4	4.99	48	17.99	2006-02-15 05:03:42	'astronaut':16 'berlin':18 'boy':8 'comfort':2 'documentari':5 'epic':4 'monkey':11 'must':13 'pelican':1 'pursu':14
671	PERDITION FARGO	A Fast-Paced Story of a Car And a Cat who must Outgun a Hunter in Berlin	2006	1	\N	7	4.99	99	27.99	2006-02-15 05:03:42	'berlin':20 'car':10 'cat':13 'fargo':2 'fast':5 'fast-pac':4 'hunter':18 'must':15 'outgun':16 'pace':6 'perdit':1 'stori':7
672	PERFECT GROOVE	A Thrilling Yarn of a Dog And a Dog who must Build a Husband in A Baloon	2006	1	\N	7	2.99	82	17.99	2006-02-15 05:03:42	'baloon':19 'build':14 'dog':8,11 'groov':2 'husband':16 'must':13 'perfect':1 'thrill':4 'yarn':5
673	PERSONAL LADYBUGS	A Epic Saga of a Hunter And a Technical Writer who must Conquer a Cat in Ancient Japan	2006	1	\N	3	0.99	118	19.99	2006-02-15 05:03:42	'ancient':19 'cat':17 'conquer':15 'epic':4 'hunter':8 'japan':20 'ladybug':2 'must':14 'person':1 'saga':5 'technic':11 'writer':12
674	PET HAUNTING	A Unbelieveable Reflection of a Explorer And a Boat who must Conquer a Woman in California	2006	1	\N	3	0.99	99	11.99	2006-02-15 05:03:42	'boat':11 'california':18 'conquer':14 'explor':8 'haunt':2 'must':13 'pet':1 'reflect':5 'unbeliev':4 'woman':16
675	PHANTOM GLORY	A Beautiful Documentary of a Astronaut And a Crocodile who must Discover a Madman in A Monastery	2006	1	\N	6	2.99	60	17.99	2006-02-15 05:03:42	'astronaut':8 'beauti':4 'crocodil':11 'discov':14 'documentari':5 'glori':2 'madman':16 'monasteri':19 'must':13 'phantom':1
676	PHILADELPHIA WIFE	A Taut Yarn of a Hunter And a Astronaut who must Conquer a Database Administrator in The Sahara Desert	2006	1	\N	7	4.99	137	16.99	2006-02-15 05:03:42	'administr':17 'astronaut':11 'conquer':14 'databas':16 'desert':21 'hunter':8 'must':13 'philadelphia':1 'sahara':20 'taut':4 'wife':2 'yarn':5
677	PIANIST OUTFIELD	A Intrepid Story of a Boy And a Technical Writer who must Pursue a Lumberjack in A Monastery	2006	1	\N	6	0.99	136	25.99	2006-02-15 05:03:42	'boy':8 'intrepid':4 'lumberjack':17 'monasteri':20 'must':14 'outfield':2 'pianist':1 'pursu':15 'stori':5 'technic':11 'writer':12
678	PICKUP DRIVING	A Touching Documentary of a Husband And a Boat who must Meet a Pastry Chef in A Baloon Factory	2006	1	\N	3	2.99	77	23.99	2006-02-15 05:03:42	'baloon':20 'boat':11 'chef':17 'documentari':5 'drive':2 'factori':21 'husband':8 'meet':14 'must':13 'pastri':16 'pickup':1 'touch':4
679	PILOT HOOSIERS	A Awe-Inspiring Reflection of a Crocodile And a Sumo Wrestler who must Meet a Forensic Psychologist in An Abandoned Mine Shaft	2006	1	\N	6	2.99	50	17.99	2006-02-15 05:03:42	'abandon':23 'awe':5 'awe-inspir':4 'crocodil':10 'forens':19 'hoosier':2 'inspir':6 'meet':17 'mine':24 'must':16 'pilot':1 'psychologist':20 'reflect':7 'shaft':25 'sumo':13 'wrestler':14
680	PINOCCHIO SIMON	A Action-Packed Reflection of a Mad Scientist And a A Shark who must Find a Feminist in California	2006	1	\N	4	4.99	103	21.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'california':22 'feminist':20 'find':18 'mad':10 'must':17 'pack':6 'pinocchio':1 'reflect':7 'scientist':11 'shark':15 'simon':2
681	PIRATES ROXANNE	A Stunning Drama of a Woman And a Lumberjack who must Overcome a A Shark in The Canadian Rockies	2006	1	\N	4	0.99	100	20.99	2006-02-15 05:03:42	'canadian':20 'drama':5 'lumberjack':11 'must':13 'overcom':14 'pirat':1 'rocki':21 'roxann':2 'shark':17 'stun':4 'woman':8
682	PITTSBURGH HUNCHBACK	A Thrilling Epistle of a Boy And a Boat who must Find a Student in Soviet Georgia	2006	1	\N	4	4.99	134	17.99	2006-02-15 05:03:42	'boat':11 'boy':8 'epistl':5 'find':14 'georgia':19 'hunchback':2 'must':13 'pittsburgh':1 'soviet':18 'student':16 'thrill':4
683	PITY BOUND	A Boring Panorama of a Feminist And a Moose who must Defeat a Database Administrator in Nigeria	2006	1	\N	5	4.99	60	19.99	2006-02-15 05:03:42	'administr':17 'bore':4 'bound':2 'databas':16 'defeat':14 'feminist':8 'moos':11 'must':13 'nigeria':19 'panorama':5 'piti':1
684	PIZZA JUMANJI	A Epic Saga of a Cat And a Squirrel who must Outgun a Robot in A U-Boat	2006	1	\N	4	2.99	173	11.99	2006-02-15 05:03:42	'boat':21 'cat':8 'epic':4 'jumanji':2 'must':13 'outgun':14 'pizza':1 'robot':16 'saga':5 'squirrel':11 'u':20 'u-boat':19
685	PLATOON INSTINCT	A Thrilling Panorama of a Man And a Woman who must Reach a Woman in Australia	2006	1	\N	6	4.99	132	10.99	2006-02-15 05:03:42	'australia':18 'instinct':2 'man':8 'must':13 'panorama':5 'platoon':1 'reach':14 'thrill':4 'woman':11,16
686	PLUTO OLEANDER	A Action-Packed Reflection of a Car And a Moose who must Outgun a Car in A Shark Tank	2006	1	\N	5	4.99	84	9.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'car':10,18 'moos':13 'must':15 'oleand':2 'outgun':16 'pack':6 'pluto':1 'reflect':7 'shark':21 'tank':22
687	POCUS PULP	A Intrepid Yarn of a Frisbee And a Dog who must Build a Astronaut in A Baloon Factory	2006	1	\N	6	0.99	138	15.99	2006-02-15 05:03:42	'astronaut':16 'baloon':19 'build':14 'dog':11 'factori':20 'frisbe':8 'intrepid':4 'must':13 'pocus':1 'pulp':2 'yarn':5
688	POLISH BROOKLYN	A Boring Character Study of a Database Administrator And a Lumberjack who must Reach a Madman in The Outback	2006	1	\N	6	0.99	61	12.99	2006-02-15 05:03:42	'administr':10 'bore':4 'brooklyn':2 'charact':5 'databas':9 'lumberjack':13 'madman':18 'must':15 'outback':21 'polish':1 'reach':16 'studi':6
689	POLLOCK DELIVERANCE	A Intrepid Story of a Madman And a Frisbee who must Outgun a Boat in The Sahara Desert	2006	1	\N	5	2.99	137	14.99	2006-02-15 05:03:42	'boat':16 'deliver':2 'desert':20 'frisbe':11 'intrepid':4 'madman':8 'must':13 'outgun':14 'pollock':1 'sahara':19 'stori':5
690	POND SEATTLE	A Stunning Drama of a Teacher And a Boat who must Battle a Feminist in Ancient China	2006	1	\N	7	2.99	185	25.99	2006-02-15 05:03:42	'ancient':18 'battl':14 'boat':11 'china':19 'drama':5 'feminist':16 'must':13 'pond':1 'seattl':2 'stun':4 'teacher':8
691	POSEIDON FOREVER	A Thoughtful Epistle of a Womanizer And a Monkey who must Vanquish a Dentist in A Monastery	2006	1	\N	6	4.99	159	29.99	2006-02-15 05:03:42	'dentist':16 'epistl':5 'forev':2 'monasteri':19 'monkey':11 'must':13 'poseidon':1 'thought':4 'vanquish':14 'woman':8
692	POTLUCK MIXED	A Beautiful Story of a Dog And a Technical Writer who must Outgun a Student in A Baloon	2006	1	\N	3	2.99	179	10.99	2006-02-15 05:03:42	'baloon':20 'beauti':4 'dog':8 'mix':2 'must':14 'outgun':15 'potluck':1 'stori':5 'student':17 'technic':11 'writer':12
693	POTTER CONNECTICUT	A Thrilling Epistle of a Frisbee And a Cat who must Fight a Technical Writer in Berlin	2006	1	\N	5	2.99	115	16.99	2006-02-15 05:03:42	'berlin':19 'cat':11 'connecticut':2 'epistl':5 'fight':14 'frisbe':8 'must':13 'potter':1 'technic':16 'thrill':4 'writer':17
694	PREJUDICE OLEANDER	A Epic Saga of a Boy And a Dentist who must Outrace a Madman in A U-Boat	2006	1	\N	6	4.99	98	15.99	2006-02-15 05:03:42	'boat':21 'boy':8 'dentist':11 'epic':4 'madman':16 'must':13 'oleand':2 'outrac':14 'prejudic':1 'saga':5 'u':20 'u-boat':19
695	PRESIDENT BANG	A Fateful Panorama of a Technical Writer And a Moose who must Battle a Robot in Soviet Georgia	2006	1	\N	6	4.99	144	12.99	2006-02-15 05:03:42	'bang':2 'battl':15 'fate':4 'georgia':20 'moos':12 'must':14 'panorama':5 'presid':1 'robot':17 'soviet':19 'technic':8 'writer':9
696	PRIDE ALAMO	A Thoughtful Drama of a A Shark And a Forensic Psychologist who must Vanquish a Student in Ancient India	2006	1	\N	6	0.99	114	20.99	2006-02-15 05:03:42	'alamo':2 'ancient':20 'drama':5 'forens':12 'india':21 'must':15 'pride':1 'psychologist':13 'shark':9 'student':18 'thought':4 'vanquish':16
697	PRIMARY GLASS	A Fateful Documentary of a Pastry Chef And a Butler who must Build a Dog in The Canadian Rockies	2006	1	\N	7	0.99	53	16.99	2006-02-15 05:03:42	'build':15 'butler':12 'canadian':20 'chef':9 'documentari':5 'dog':17 'fate':4 'glass':2 'must':14 'pastri':8 'primari':1 'rocki':21
698	PRINCESS GIANT	A Thrilling Yarn of a Pastry Chef And a Monkey who must Battle a Monkey in A Shark Tank	2006	1	\N	3	2.99	71	29.99	2006-02-15 05:03:42	'battl':15 'chef':9 'giant':2 'monkey':12,17 'must':14 'pastri':8 'princess':1 'shark':20 'tank':21 'thrill':4 'yarn':5
699	PRIVATE DROP	A Stunning Story of a Technical Writer And a Hunter who must Succumb a Secret Agent in A Baloon	2006	1	\N	7	4.99	106	26.99	2006-02-15 05:03:42	'agent':18 'baloon':21 'drop':2 'hunter':12 'must':14 'privat':1 'secret':17 'stori':5 'stun':4 'succumb':15 'technic':8 'writer':9
700	PRIX UNDEFEATED	A Stunning Saga of a Mad Scientist And a Boat who must Overcome a Dentist in Ancient China	2006	1	\N	4	2.99	115	13.99	2006-02-15 05:03:42	'ancient':19 'boat':12 'china':20 'dentist':17 'mad':8 'must':14 'overcom':15 'prix':1 'saga':5 'scientist':9 'stun':4 'undef':2
701	PSYCHO SHRUNK	A Amazing Panorama of a Crocodile And a Explorer who must Fight a Husband in Nigeria	2006	1	\N	5	2.99	155	11.99	2006-02-15 05:03:42	'amaz':4 'crocodil':8 'explor':11 'fight':14 'husband':16 'must':13 'nigeria':18 'panorama':5 'psycho':1 'shrunk':2
702	PULP BEVERLY	A Unbelieveable Display of a Dog And a Crocodile who must Outrace a Man in Nigeria	2006	1	\N	4	2.99	89	12.99	2006-02-15 05:03:42	'bever':2 'crocodil':11 'display':5 'dog':8 'man':16 'must':13 'nigeria':18 'outrac':14 'pulp':1 'unbeliev':4
703	PUNK DIVORCE	A Fast-Paced Tale of a Pastry Chef And a Boat who must Face a Frisbee in The Canadian Rockies	2006	1	\N	6	4.99	100	18.99	2006-02-15 05:03:42	'boat':14 'canadian':22 'chef':11 'divorc':2 'face':17 'fast':5 'fast-pac':4 'frisbe':19 'must':16 'pace':6 'pastri':10 'punk':1 'rocki':23 'tale':7
704	PURE RUNNER	A Thoughtful Documentary of a Student And a Madman who must Challenge a Squirrel in A Manhattan Penthouse	2006	1	\N	3	2.99	121	25.99	2006-02-15 05:03:42	'challeng':14 'documentari':5 'madman':11 'manhattan':19 'must':13 'penthous':20 'pure':1 'runner':2 'squirrel':16 'student':8 'thought':4
705	PURPLE MOVIE	A Boring Display of a Pastry Chef And a Sumo Wrestler who must Discover a Frisbee in An Abandoned Amusement Park	2006	1	\N	4	2.99	88	9.99	2006-02-15 05:03:42	'abandon':21 'amus':22 'bore':4 'chef':9 'discov':16 'display':5 'frisbe':18 'movi':2 'must':15 'park':23 'pastri':8 'purpl':1 'sumo':12 'wrestler':13
706	QUEEN LUKE	A Astounding Story of a Girl And a Boy who must Challenge a Composer in New Orleans	2006	1	\N	5	4.99	163	22.99	2006-02-15 05:03:42	'astound':4 'boy':11 'challeng':14 'compos':16 'girl':8 'luke':2 'must':13 'new':18 'orlean':19 'queen':1 'stori':5
707	QUEST MUSSOLINI	A Fateful Drama of a Husband And a Sumo Wrestler who must Battle a Pastry Chef in A Baloon Factory	2006	1	\N	5	2.99	177	29.99	2006-02-15 05:03:42	'baloon':21 'battl':15 'chef':18 'drama':5 'factori':22 'fate':4 'husband':8 'mussolini':2 'must':14 'pastri':17 'quest':1 'sumo':11 'wrestler':12
708	QUILLS BULL	A Thoughtful Story of a Pioneer And a Woman who must Reach a Moose in Australia	2006	1	\N	4	4.99	112	19.99	2006-02-15 05:03:42	'australia':18 'bull':2 'moos':16 'must':13 'pioneer':8 'quill':1 'reach':14 'stori':5 'thought':4 'woman':11
709	RACER EGG	A Emotional Display of a Monkey And a Waitress who must Reach a Secret Agent in California	2006	1	\N	7	2.99	147	19.99	2006-02-15 05:03:42	'agent':17 'california':19 'display':5 'egg':2 'emot':4 'monkey':8 'must':13 'racer':1 'reach':14 'secret':16 'waitress':11
710	RAGE GAMES	A Fast-Paced Saga of a Astronaut And a Secret Agent who must Escape a Hunter in An Abandoned Amusement Park	2006	1	\N	4	4.99	120	18.99	2006-02-15 05:03:42	'abandon':22 'agent':14 'amus':23 'astronaut':10 'escap':17 'fast':5 'fast-pac':4 'game':2 'hunter':19 'must':16 'pace':6 'park':24 'rage':1 'saga':7 'secret':13
711	RAGING AIRPLANE	A Astounding Display of a Secret Agent And a Technical Writer who must Escape a Mad Scientist in A Jet Boat	2006	1	\N	4	4.99	154	18.99	2006-02-15 05:03:42	'agent':9 'airplan':2 'astound':4 'boat':23 'display':5 'escap':16 'jet':22 'mad':18 'must':15 'rage':1 'scientist':19 'secret':8 'technic':12 'writer':13
712	RAIDERS ANTITRUST	A Amazing Drama of a Teacher And a Feminist who must Meet a Woman in The First Manned Space Station	2006	1	\N	4	0.99	82	11.99	2006-02-15 05:03:42	'amaz':4 'antitrust':2 'drama':5 'feminist':11 'first':19 'man':20 'meet':14 'must':13 'raider':1 'space':21 'station':22 'teacher':8 'woman':16
713	RAINBOW SHOCK	A Action-Packed Story of a Hunter And a Boy who must Discover a Lumberjack in Ancient India	2006	1	\N	3	4.99	74	14.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'ancient':20 'boy':13 'discov':16 'hunter':10 'india':21 'lumberjack':18 'must':15 'pack':6 'rainbow':1 'shock':2 'stori':7
714	RANDOM GO	A Fateful Drama of a Frisbee And a Student who must Confront a Cat in A Shark Tank	2006	1	\N	6	2.99	73	29.99	2006-02-15 05:03:42	'cat':16 'confront':14 'drama':5 'fate':4 'frisbe':8 'go':2 'must':13 'random':1 'shark':19 'student':11 'tank':20
715	RANGE MOONWALKER	A Insightful Documentary of a Hunter And a Dentist who must Confront a Crocodile in A Baloon	2006	1	\N	3	4.99	147	25.99	2006-02-15 05:03:42	'baloon':19 'confront':14 'crocodil':16 'dentist':11 'documentari':5 'hunter':8 'insight':4 'moonwalk':2 'must':13 'rang':1
716	REAP UNFAITHFUL	A Thrilling Epistle of a Composer And a Sumo Wrestler who must Challenge a Mad Cow in A MySQL Convention	2006	1	\N	6	2.99	136	26.99	2006-02-15 05:03:42	'challeng':15 'compos':8 'convent':22 'cow':18 'epistl':5 'mad':17 'must':14 'mysql':21 'reap':1 'sumo':11 'thrill':4 'unfaith':2 'wrestler':12
717	REAR TRADING	A Awe-Inspiring Reflection of a Forensic Psychologist And a Secret Agent who must Succumb a Pastry Chef in Soviet Georgia	2006	1	\N	6	0.99	97	23.99	2006-02-15 05:03:42	'agent':15 'awe':5 'awe-inspir':4 'chef':21 'forens':10 'georgia':24 'inspir':6 'must':17 'pastri':20 'psychologist':11 'rear':1 'reflect':7 'secret':14 'soviet':23 'succumb':18 'trade':2
718	REBEL AIRPORT	A Intrepid Yarn of a Database Administrator And a Boat who must Outrace a Husband in Ancient India	2006	1	\N	7	0.99	73	24.99	2006-02-15 05:03:42	'administr':9 'airport':2 'ancient':19 'boat':12 'databas':8 'husband':17 'india':20 'intrepid':4 'must':14 'outrac':15 'rebel':1 'yarn':5
719	RECORDS ZORRO	A Amazing Drama of a Mad Scientist And a Composer who must Build a Husband in The Outback	2006	1	\N	7	4.99	182	11.99	2006-02-15 05:03:42	'amaz':4 'build':15 'compos':12 'drama':5 'husband':17 'mad':8 'must':14 'outback':20 'record':1 'scientist':9 'zorro':2
720	REDEMPTION COMFORTS	A Emotional Documentary of a Dentist And a Woman who must Battle a Mad Scientist in Ancient China	2006	1	\N	3	2.99	179	20.99	2006-02-15 05:03:42	'ancient':19 'battl':14 'china':20 'comfort':2 'dentist':8 'documentari':5 'emot':4 'mad':16 'must':13 'redempt':1 'scientist':17 'woman':11
721	REDS POCUS	A Lacklusture Yarn of a Sumo Wrestler And a Squirrel who must Redeem a Monkey in Soviet Georgia	2006	1	\N	7	4.99	182	23.99	2006-02-15 05:03:42	'georgia':20 'lacklustur':4 'monkey':17 'must':14 'pocus':2 'red':1 'redeem':15 'soviet':19 'squirrel':12 'sumo':8 'wrestler':9 'yarn':5
722	REEF SALUTE	A Action-Packed Saga of a Teacher And a Lumberjack who must Battle a Dentist in A Baloon	2006	1	\N	5	0.99	123	26.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'baloon':21 'battl':16 'dentist':18 'lumberjack':13 'must':15 'pack':6 'reef':1 'saga':7 'salut':2 'teacher':10
723	REIGN GENTLEMEN	A Emotional Yarn of a Composer And a Man who must Escape a Butler in The Gulf of Mexico	2006	1	\N	3	2.99	82	29.99	2006-02-15 05:03:42	'butler':16 'compos':8 'emot':4 'escap':14 'gentlemen':2 'gulf':19 'man':11 'mexico':21 'must':13 'reign':1 'yarn':5
724	REMEMBER DIARY	A Insightful Tale of a Technical Writer And a Waitress who must Conquer a Monkey in Ancient India	2006	1	\N	5	2.99	110	15.99	2006-02-15 05:03:42	'ancient':19 'conquer':15 'diari':2 'india':20 'insight':4 'monkey':17 'must':14 'rememb':1 'tale':5 'technic':8 'waitress':12 'writer':9
725	REQUIEM TYCOON	A Unbelieveable Character Study of a Cat And a Database Administrator who must Pursue a Teacher in A Monastery	2006	1	\N	6	4.99	167	25.99	2006-02-15 05:03:42	'administr':13 'cat':9 'charact':5 'databas':12 'monasteri':21 'must':15 'pursu':16 'requiem':1 'studi':6 'teacher':18 'tycoon':2 'unbeliev':4
726	RESERVOIR ADAPTATION	A Intrepid Drama of a Teacher And a Moose who must Kill a Car in California	2006	1	\N	7	2.99	61	29.99	2006-02-15 05:03:42	'adapt':2 'california':18 'car':16 'drama':5 'intrepid':4 'kill':14 'moos':11 'must':13 'reservoir':1 'teacher':8
727	RESURRECTION SILVERADO	A Epic Yarn of a Robot And a Explorer who must Challenge a Girl in A MySQL Convention	2006	1	\N	6	0.99	117	12.99	2006-02-15 05:03:42	'challeng':14 'convent':20 'epic':4 'explor':11 'girl':16 'must':13 'mysql':19 'resurrect':1 'robot':8 'silverado':2 'yarn':5
728	REUNION WITCHES	A Unbelieveable Documentary of a Database Administrator And a Frisbee who must Redeem a Mad Scientist in A Baloon Factory	2006	1	\N	3	0.99	63	26.99	2006-02-15 05:03:42	'administr':9 'baloon':21 'databas':8 'documentari':5 'factori':22 'frisbe':12 'mad':17 'must':14 'redeem':15 'reunion':1 'scientist':18 'unbeliev':4 'witch':2
729	RIDER CADDYSHACK	A Taut Reflection of a Monkey And a Womanizer who must Chase a Moose in Nigeria	2006	1	\N	5	2.99	177	28.99	2006-02-15 05:03:42	'caddyshack':2 'chase':14 'monkey':8 'moos':16 'must':13 'nigeria':18 'reflect':5 'rider':1 'taut':4 'woman':11
730	RIDGEMONT SUBMARINE	A Unbelieveable Drama of a Waitress And a Composer who must Sink a Mad Cow in Ancient Japan	2006	1	\N	3	0.99	46	28.99	2006-02-15 05:03:42	'ancient':19 'compos':11 'cow':17 'drama':5 'japan':20 'mad':16 'must':13 'ridgemont':1 'sink':14 'submarin':2 'unbeliev':4 'waitress':8
731	RIGHT CRANES	A Fateful Character Study of a Boat And a Cat who must Find a Database Administrator in A Jet Boat	2006	1	\N	7	4.99	153	29.99	2006-02-15 05:03:42	'administr':18 'boat':9,22 'cat':12 'charact':5 'crane':2 'databas':17 'fate':4 'find':15 'jet':21 'must':14 'right':1 'studi':6
732	RINGS HEARTBREAKERS	A Amazing Yarn of a Sumo Wrestler And a Boat who must Conquer a Waitress in New Orleans	2006	1	\N	5	0.99	58	17.99	2006-02-15 05:03:42	'amaz':4 'boat':12 'conquer':15 'heartbreak':2 'must':14 'new':19 'orlean':20 'ring':1 'sumo':8 'waitress':17 'wrestler':9 'yarn':5
733	RIVER OUTLAW	A Thrilling Character Study of a Squirrel And a Lumberjack who must Face a Hunter in A MySQL Convention	2006	1	\N	4	0.99	149	29.99	2006-02-15 05:03:42	'charact':5 'convent':21 'face':15 'hunter':17 'lumberjack':12 'must':14 'mysql':20 'outlaw':2 'river':1 'squirrel':9 'studi':6 'thrill':4
734	ROAD ROXANNE	A Boring Character Study of a Waitress And a Astronaut who must Fight a Crocodile in Ancient Japan	2006	1	\N	4	4.99	158	12.99	2006-02-15 05:03:42	'ancient':19 'astronaut':12 'bore':4 'charact':5 'crocodil':17 'fight':15 'japan':20 'must':14 'road':1 'roxann':2 'studi':6 'waitress':9
735	ROBBERS JOON	A Thoughtful Story of a Mad Scientist And a Waitress who must Confront a Forensic Psychologist in Soviet Georgia	2006	1	\N	7	2.99	102	26.99	2006-02-15 05:03:42	'confront':15 'forens':17 'georgia':21 'joon':2 'mad':8 'must':14 'psychologist':18 'robber':1 'scientist':9 'soviet':20 'stori':5 'thought':4 'waitress':12
736	ROBBERY BRIGHT	A Taut Reflection of a Robot And a Squirrel who must Fight a Boat in Ancient Japan	2006	1	\N	4	0.99	134	21.99	2006-02-15 05:03:42	'ancient':18 'boat':16 'bright':2 'fight':14 'japan':19 'must':13 'reflect':5 'robberi':1 'robot':8 'squirrel':11 'taut':4
737	ROCK INSTINCT	A Astounding Character Study of a Robot And a Moose who must Overcome a Astronaut in Ancient India	2006	1	\N	4	0.99	102	28.99	2006-02-15 05:03:42	'ancient':19 'astound':4 'astronaut':17 'charact':5 'india':20 'instinct':2 'moos':12 'must':14 'overcom':15 'robot':9 'rock':1 'studi':6
738	ROCKETEER MOTHER	A Awe-Inspiring Character Study of a Robot And a Sumo Wrestler who must Discover a Womanizer in A Shark Tank	2006	1	\N	3	0.99	178	27.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'charact':7 'discov':18 'inspir':6 'mother':2 'must':17 'robot':11 'rocket':1 'shark':23 'studi':8 'sumo':14 'tank':24 'woman':20 'wrestler':15
739	ROCKY WAR	A Fast-Paced Display of a Squirrel And a Explorer who must Outgun a Mad Scientist in Nigeria	2006	1	\N	4	4.99	145	17.99	2006-02-15 05:03:42	'display':7 'explor':13 'fast':5 'fast-pac':4 'mad':18 'must':15 'nigeria':21 'outgun':16 'pace':6 'rocki':1 'scientist':19 'squirrel':10 'war':2
740	ROLLERCOASTER BRINGING	A Beautiful Drama of a Robot And a Lumberjack who must Discover a Technical Writer in A Shark Tank	2006	1	\N	5	2.99	153	13.99	2006-02-15 05:03:42	'beauti':4 'bring':2 'discov':14 'drama':5 'lumberjack':11 'must':13 'robot':8 'rollercoast':1 'shark':20 'tank':21 'technic':16 'writer':17
765	SATURN NAME	A Fateful Epistle of a Butler And a Boy who must Redeem a Teacher in Berlin	2006	1	\N	7	4.99	182	18.99	2006-02-15 05:03:42	'berlin':18 'boy':11 'butler':8 'epistl':5 'fate':4 'must':13 'name':2 'redeem':14 'saturn':1 'teacher':16
741	ROMAN PUNK	A Thoughtful Panorama of a Mad Cow And a Student who must Battle a Forensic Psychologist in Berlin	2006	1	\N	7	0.99	81	28.99	2006-02-15 05:03:42	'battl':15 'berlin':20 'cow':9 'forens':17 'mad':8 'must':14 'panorama':5 'psychologist':18 'punk':2 'roman':1 'student':12 'thought':4
743	ROOM ROMAN	A Awe-Inspiring Panorama of a Composer And a Secret Agent who must Sink a Composer in A Shark Tank	2006	1	\N	7	0.99	60	27.99	2006-02-15 05:03:42	'agent':14 'awe':5 'awe-inspir':4 'compos':10,19 'inspir':6 'must':16 'panorama':7 'roman':2 'room':1 'secret':13 'shark':22 'sink':17 'tank':23
744	ROOTS REMEMBER	A Brilliant Drama of a Mad Cow And a Hunter who must Escape a Hunter in Berlin	2006	1	\N	4	0.99	89	23.99	2006-02-15 05:03:42	'berlin':19 'brilliant':4 'cow':9 'drama':5 'escap':15 'hunter':12,17 'mad':8 'must':14 'rememb':2 'root':1
745	ROSES TREASURE	A Astounding Panorama of a Monkey And a Secret Agent who must Defeat a Woman in The First Manned Space Station	2006	1	\N	5	4.99	162	23.99	2006-02-15 05:03:42	'agent':12 'astound':4 'defeat':15 'first':20 'man':21 'monkey':8 'must':14 'panorama':5 'rose':1 'secret':11 'space':22 'station':23 'treasur':2 'woman':17
746	ROUGE SQUAD	A Awe-Inspiring Drama of a Astronaut And a Frisbee who must Conquer a Mad Scientist in Australia	2006	1	\N	3	0.99	118	10.99	2006-02-15 05:03:42	'astronaut':10 'australia':21 'awe':5 'awe-inspir':4 'conquer':16 'drama':7 'frisbe':13 'inspir':6 'mad':18 'must':15 'roug':1 'scientist':19 'squad':2
747	ROXANNE REBEL	A Astounding Story of a Pastry Chef And a Database Administrator who must Fight a Man in The Outback	2006	1	\N	5	0.99	171	9.99	2006-02-15 05:03:42	'administr':13 'astound':4 'chef':9 'databas':12 'fight':16 'man':18 'must':15 'outback':21 'pastri':8 'rebel':2 'roxann':1 'stori':5
748	RUGRATS SHAKESPEARE	A Touching Saga of a Crocodile And a Crocodile who must Discover a Technical Writer in Nigeria	2006	1	\N	4	0.99	109	16.99	2006-02-15 05:03:42	'crocodil':8,11 'discov':14 'must':13 'nigeria':19 'rugrat':1 'saga':5 'shakespear':2 'technic':16 'touch':4 'writer':17
749	RULES HUMAN	A Beautiful Epistle of a Astronaut And a Student who must Confront a Monkey in An Abandoned Fun House	2006	1	\N	6	4.99	153	19.99	2006-02-15 05:03:42	'abandon':19 'astronaut':8 'beauti':4 'confront':14 'epistl':5 'fun':20 'hous':21 'human':2 'monkey':16 'must':13 'rule':1 'student':11
750	RUN PACIFIC	A Touching Tale of a Cat And a Pastry Chef who must Conquer a Pastry Chef in A MySQL Convention	2006	1	\N	3	0.99	145	25.99	2006-02-15 05:03:42	'cat':8 'chef':12,18 'conquer':15 'convent':22 'must':14 'mysql':21 'pacif':2 'pastri':11,17 'run':1 'tale':5 'touch':4
751	RUNAWAY TENENBAUMS	A Thoughtful Documentary of a Boat And a Man who must Meet a Boat in An Abandoned Fun House	2006	1	\N	6	0.99	181	17.99	2006-02-15 05:03:42	'abandon':19 'boat':8,16 'documentari':5 'fun':20 'hous':21 'man':11 'meet':14 'must':13 'runaway':1 'tenenbaum':2 'thought':4
752	RUNNER MADIGAN	A Thoughtful Documentary of a Crocodile And a Robot who must Outrace a Womanizer in The Outback	2006	1	\N	6	0.99	101	27.99	2006-02-15 05:03:42	'crocodil':8 'documentari':5 'madigan':2 'must':13 'outback':19 'outrac':14 'robot':11 'runner':1 'thought':4 'woman':16
754	RUSHMORE MERMAID	A Boring Story of a Woman And a Moose who must Reach a Husband in A Shark Tank	2006	1	\N	6	2.99	150	17.99	2006-02-15 05:03:42	'bore':4 'husband':16 'mermaid':2 'moos':11 'must':13 'reach':14 'rushmor':1 'shark':19 'stori':5 'tank':20 'woman':8
755	SABRINA MIDNIGHT	A Emotional Story of a Squirrel And a Crocodile who must Succumb a Husband in The Sahara Desert	2006	1	\N	5	4.99	99	11.99	2006-02-15 05:03:42	'crocodil':11 'desert':20 'emot':4 'husband':16 'midnight':2 'must':13 'sabrina':1 'sahara':19 'squirrel':8 'stori':5 'succumb':14
756	SADDLE ANTITRUST	A Stunning Epistle of a Feminist And a A Shark who must Battle a Woman in An Abandoned Fun House	2006	1	\N	7	2.99	80	10.99	2006-02-15 05:03:42	'abandon':20 'antitrust':2 'battl':15 'epistl':5 'feminist':8 'fun':21 'hous':22 'must':14 'saddl':1 'shark':12 'stun':4 'woman':17
757	SAGEBRUSH CLUELESS	A Insightful Story of a Lumberjack And a Hunter who must Kill a Boy in Ancient Japan	2006	1	\N	4	2.99	106	28.99	2006-02-15 05:03:42	'ancient':18 'boy':16 'clueless':2 'hunter':11 'insight':4 'japan':19 'kill':14 'lumberjack':8 'must':13 'sagebrush':1 'stori':5
758	SAINTS BRIDE	A Fateful Tale of a Technical Writer And a Composer who must Pursue a Explorer in The Gulf of Mexico	2006	1	\N	5	2.99	125	11.99	2006-02-15 05:03:42	'bride':2 'compos':12 'explor':17 'fate':4 'gulf':20 'mexico':22 'must':14 'pursu':15 'saint':1 'tale':5 'technic':8 'writer':9
759	SALUTE APOLLO	A Awe-Inspiring Character Study of a Boy And a Feminist who must Sink a Crocodile in Ancient China	2006	1	\N	4	2.99	73	29.99	2006-02-15 05:03:42	'ancient':21 'apollo':2 'awe':5 'awe-inspir':4 'boy':11 'charact':7 'china':22 'crocodil':19 'feminist':14 'inspir':6 'must':16 'salut':1 'sink':17 'studi':8
760	SAMURAI LION	A Fast-Paced Story of a Pioneer And a Astronaut who must Reach a Boat in A Baloon	2006	1	\N	5	2.99	110	21.99	2006-02-15 05:03:42	'astronaut':13 'baloon':21 'boat':18 'fast':5 'fast-pac':4 'lion':2 'must':15 'pace':6 'pioneer':10 'reach':16 'samurai':1 'stori':7
761	SANTA PARIS	A Emotional Documentary of a Moose And a Car who must Redeem a Mad Cow in A Baloon Factory	2006	1	\N	7	2.99	154	23.99	2006-02-15 05:03:42	'baloon':20 'car':11 'cow':17 'documentari':5 'emot':4 'factori':21 'mad':16 'moos':8 'must':13 'pari':2 'redeem':14 'santa':1
762	SASSY PACKER	A Fast-Paced Documentary of a Dog And a Teacher who must Find a Moose in A Manhattan Penthouse	2006	1	\N	6	0.99	154	29.99	2006-02-15 05:03:42	'documentari':7 'dog':10 'fast':5 'fast-pac':4 'find':16 'manhattan':21 'moos':18 'must':15 'pace':6 'packer':2 'penthous':22 'sassi':1 'teacher':13
763	SATISFACTION CONFIDENTIAL	A Lacklusture Yarn of a Dentist And a Butler who must Meet a Secret Agent in Ancient China	2006	1	\N	3	4.99	75	26.99	2006-02-15 05:03:42	'agent':17 'ancient':19 'butler':11 'china':20 'confidenti':2 'dentist':8 'lacklustur':4 'meet':14 'must':13 'satisfact':1 'secret':16 'yarn':5
764	SATURDAY LAMBS	A Thoughtful Reflection of a Mad Scientist And a Moose who must Kill a Husband in A Baloon	2006	1	\N	3	4.99	150	28.99	2006-02-15 05:03:42	'baloon':20 'husband':17 'kill':15 'lamb':2 'mad':8 'moos':12 'must':14 'reflect':5 'saturday':1 'scientist':9 'thought':4
766	SAVANNAH TOWN	A Awe-Inspiring Tale of a Astronaut And a Database Administrator who must Chase a Secret Agent in The Gulf of Mexico	2006	1	\N	5	0.99	84	25.99	2006-02-15 05:03:42	'administr':14 'agent':20 'astronaut':10 'awe':5 'awe-inspir':4 'chase':17 'databas':13 'gulf':23 'inspir':6 'mexico':25 'must':16 'savannah':1 'secret':19 'tale':7 'town':2
767	SCALAWAG DUCK	A Fateful Reflection of a Car And a Teacher who must Confront a Waitress in A Monastery	2006	1	\N	6	4.99	183	13.99	2006-02-15 05:03:42	'car':8 'confront':14 'duck':2 'fate':4 'monasteri':19 'must':13 'reflect':5 'scalawag':1 'teacher':11 'waitress':16
768	SCARFACE BANG	A Emotional Yarn of a Teacher And a Girl who must Find a Teacher in A Baloon Factory	2006	1	\N	3	4.99	102	11.99	2006-02-15 05:03:42	'baloon':19 'bang':2 'emot':4 'factori':20 'find':14 'girl':11 'must':13 'scarfac':1 'teacher':8,16 'yarn':5
769	SCHOOL JACKET	A Intrepid Yarn of a Monkey And a Boy who must Fight a Composer in A Manhattan Penthouse	2006	1	\N	5	4.99	151	21.99	2006-02-15 05:03:42	'boy':11 'compos':16 'fight':14 'intrepid':4 'jacket':2 'manhattan':19 'monkey':8 'must':13 'penthous':20 'school':1 'yarn':5
770	SCISSORHANDS SLUMS	A Awe-Inspiring Drama of a Girl And a Technical Writer who must Meet a Feminist in The Canadian Rockies	2006	1	\N	5	2.99	147	13.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'canadian':22 'drama':7 'feminist':19 'girl':10 'inspir':6 'meet':17 'must':16 'rocki':23 'scissorhand':1 'slum':2 'technic':13 'writer':14
771	SCORPION APOLLO	A Awe-Inspiring Documentary of a Technical Writer And a Husband who must Meet a Monkey in An Abandoned Fun House	2006	1	\N	3	4.99	137	23.99	2006-02-15 05:03:42	'abandon':22 'apollo':2 'awe':5 'awe-inspir':4 'documentari':7 'fun':23 'hous':24 'husband':14 'inspir':6 'meet':17 'monkey':19 'must':16 'scorpion':1 'technic':10 'writer':11
772	SEA VIRGIN	A Fast-Paced Documentary of a Technical Writer And a Pastry Chef who must Escape a Moose in A U-Boat	2006	1	\N	4	2.99	80	24.99	2006-02-15 05:03:42	'boat':25 'chef':15 'documentari':7 'escap':18 'fast':5 'fast-pac':4 'moos':20 'must':17 'pace':6 'pastri':14 'sea':1 'technic':10 'u':24 'u-boat':23 'virgin':2 'writer':11
773	SEABISCUIT PUNK	A Insightful Saga of a Man And a Forensic Psychologist who must Discover a Mad Cow in A MySQL Convention	2006	1	\N	6	2.99	112	28.99	2006-02-15 05:03:42	'convent':22 'cow':18 'discov':15 'forens':11 'insight':4 'mad':17 'man':8 'must':14 'mysql':21 'psychologist':12 'punk':2 'saga':5 'seabiscuit':1
774	SEARCHERS WAIT	A Fast-Paced Tale of a Car And a Mad Scientist who must Kill a Womanizer in Ancient Japan	2006	1	\N	3	2.99	182	22.99	2006-02-15 05:03:42	'ancient':21 'car':10 'fast':5 'fast-pac':4 'japan':22 'kill':17 'mad':13 'must':16 'pace':6 'scientist':14 'searcher':1 'tale':7 'wait':2 'woman':19
775	SEATTLE EXPECATIONS	A Insightful Reflection of a Crocodile And a Sumo Wrestler who must Meet a Technical Writer in The Sahara Desert	2006	1	\N	4	4.99	110	18.99	2006-02-15 05:03:42	'crocodil':8 'desert':22 'expec':2 'insight':4 'meet':15 'must':14 'reflect':5 'sahara':21 'seattl':1 'sumo':11 'technic':17 'wrestler':12 'writer':18
776	SECRET GROUNDHOG	A Astounding Story of a Cat And a Database Administrator who must Build a Technical Writer in New Orleans	2006	1	\N	6	4.99	90	11.99	2006-02-15 05:03:42	'administr':12 'astound':4 'build':15 'cat':8 'databas':11 'groundhog':2 'must':14 'new':20 'orlean':21 'secret':1 'stori':5 'technic':17 'writer':18
777	SECRETARY ROUGE	A Action-Packed Panorama of a Mad Cow And a Composer who must Discover a Robot in A Baloon Factory	2006	1	\N	5	4.99	158	10.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'baloon':22 'compos':14 'cow':11 'discov':17 'factori':23 'mad':10 'must':16 'pack':6 'panorama':7 'robot':19 'roug':2 'secretari':1
778	SECRETS PARADISE	A Fateful Saga of a Cat And a Frisbee who must Kill a Girl in A Manhattan Penthouse	2006	1	\N	3	4.99	109	24.99	2006-02-15 05:03:42	'cat':8 'fate':4 'frisbe':11 'girl':16 'kill':14 'manhattan':19 'must':13 'paradis':2 'penthous':20 'saga':5 'secret':1
779	SENSE GREEK	A Taut Saga of a Lumberjack And a Pastry Chef who must Escape a Sumo Wrestler in An Abandoned Fun House	2006	1	\N	4	4.99	54	23.99	2006-02-15 05:03:42	'abandon':21 'chef':12 'escap':15 'fun':22 'greek':2 'hous':23 'lumberjack':8 'must':14 'pastri':11 'saga':5 'sens':1 'sumo':17 'taut':4 'wrestler':18
780	SENSIBILITY REAR	A Emotional Tale of a Robot And a Sumo Wrestler who must Redeem a Pastry Chef in A Baloon Factory	2006	1	\N	7	4.99	98	15.99	2006-02-15 05:03:42	'baloon':21 'chef':18 'emot':4 'factori':22 'must':14 'pastri':17 'rear':2 'redeem':15 'robot':8 'sensibl':1 'sumo':11 'tale':5 'wrestler':12
781	SEVEN SWARM	A Unbelieveable Character Study of a Dog And a Mad Cow who must Kill a Monkey in Berlin	2006	1	\N	4	4.99	127	15.99	2006-02-15 05:03:42	'berlin':20 'charact':5 'cow':13 'dog':9 'kill':16 'mad':12 'monkey':18 'must':15 'seven':1 'studi':6 'swarm':2 'unbeliev':4
782	SHAKESPEARE SADDLE	A Fast-Paced Panorama of a Lumberjack And a Database Administrator who must Defeat a Madman in A MySQL Convention	2006	1	\N	6	2.99	60	26.99	2006-02-15 05:03:42	'administr':14 'convent':23 'databas':13 'defeat':17 'fast':5 'fast-pac':4 'lumberjack':10 'madman':19 'must':16 'mysql':22 'pace':6 'panorama':7 'saddl':2 'shakespear':1
783	SHANE DARKNESS	A Action-Packed Saga of a Moose And a Lumberjack who must Find a Woman in Berlin	2006	1	\N	5	2.99	93	22.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'berlin':20 'dark':2 'find':16 'lumberjack':13 'moos':10 'must':15 'pack':6 'saga':7 'shane':1 'woman':18
784	SHANGHAI TYCOON	A Fast-Paced Character Study of a Crocodile And a Lumberjack who must Build a Husband in An Abandoned Fun House	2006	1	\N	7	2.99	47	20.99	2006-02-15 05:03:42	'abandon':22 'build':17 'charact':7 'crocodil':11 'fast':5 'fast-pac':4 'fun':23 'hous':24 'husband':19 'lumberjack':14 'must':16 'pace':6 'shanghai':1 'studi':8 'tycoon':2
785	SHAWSHANK BUBBLE	A Lacklusture Story of a Moose And a Monkey who must Confront a Butler in An Abandoned Amusement Park	2006	1	\N	6	4.99	80	20.99	2006-02-15 05:03:42	'abandon':19 'amus':20 'bubbl':2 'butler':16 'confront':14 'lacklustur':4 'monkey':11 'moos':8 'must':13 'park':21 'shawshank':1 'stori':5
786	SHEPHERD MIDSUMMER	A Thoughtful Drama of a Robot And a Womanizer who must Kill a Lumberjack in A Baloon	2006	1	\N	7	0.99	113	14.99	2006-02-15 05:03:42	'baloon':19 'drama':5 'kill':14 'lumberjack':16 'midsumm':2 'must':13 'robot':8 'shepherd':1 'thought':4 'woman':11
787	SHINING ROSES	A Awe-Inspiring Character Study of a Astronaut And a Forensic Psychologist who must Challenge a Madman in Ancient India	2006	1	\N	4	0.99	125	12.99	2006-02-15 05:03:42	'ancient':22 'astronaut':11 'awe':5 'awe-inspir':4 'challeng':18 'charact':7 'forens':14 'india':23 'inspir':6 'madman':20 'must':17 'psychologist':15 'rose':2 'shine':1 'studi':8
788	SHIP WONDERLAND	A Thrilling Saga of a Monkey And a Frisbee who must Escape a Explorer in The Outback	2006	1	\N	5	2.99	104	15.99	2006-02-15 05:03:42	'escap':14 'explor':16 'frisbe':11 'monkey':8 'must':13 'outback':19 'saga':5 'ship':1 'thrill':4 'wonderland':2
789	SHOCK CABIN	A Fateful Tale of a Mad Cow And a Crocodile who must Meet a Husband in New Orleans	2006	1	\N	7	2.99	79	15.99	2006-02-15 05:03:42	'cabin':2 'cow':9 'crocodil':12 'fate':4 'husband':17 'mad':8 'meet':15 'must':14 'new':19 'orlean':20 'shock':1 'tale':5
790	SHOOTIST SUPERFLY	A Fast-Paced Story of a Crocodile And a A Shark who must Sink a Pioneer in Berlin	2006	1	\N	6	0.99	67	22.99	2006-02-15 05:03:42	'berlin':21 'crocodil':10 'fast':5 'fast-pac':4 'must':16 'pace':6 'pioneer':19 'shark':14 'shootist':1 'sink':17 'stori':7 'superfli':2
791	SHOW LORD	A Fanciful Saga of a Student And a Girl who must Find a Butler in Ancient Japan	2006	1	\N	3	4.99	167	24.99	2006-02-15 05:03:42	'ancient':18 'butler':16 'fanci':4 'find':14 'girl':11 'japan':19 'lord':2 'must':13 'saga':5 'show':1 'student':8
792	SHREK LICENSE	A Fateful Yarn of a Secret Agent And a Feminist who must Find a Feminist in A Jet Boat	2006	1	\N	7	2.99	154	15.99	2006-02-15 05:03:42	'agent':9 'boat':21 'fate':4 'feminist':12,17 'find':15 'jet':20 'licens':2 'must':14 'secret':8 'shrek':1 'yarn':5
793	SHRUNK DIVINE	A Fateful Character Study of a Waitress And a Technical Writer who must Battle a Hunter in A Baloon	2006	1	\N	6	2.99	139	14.99	2006-02-15 05:03:42	'baloon':21 'battl':16 'charact':5 'divin':2 'fate':4 'hunter':18 'must':15 'shrunk':1 'studi':6 'technic':12 'waitress':9 'writer':13
794	SIDE ARK	A Stunning Panorama of a Crocodile And a Womanizer who must Meet a Feminist in The Canadian Rockies	2006	1	\N	5	0.99	52	28.99	2006-02-15 05:03:42	'ark':2 'canadian':19 'crocodil':8 'feminist':16 'meet':14 'must':13 'panorama':5 'rocki':20 'side':1 'stun':4 'woman':11
795	SIEGE MADRE	A Boring Tale of a Frisbee And a Crocodile who must Vanquish a Moose in An Abandoned Mine Shaft	2006	1	\N	7	0.99	111	23.99	2006-02-15 05:03:42	'abandon':19 'bore':4 'crocodil':11 'frisbe':8 'madr':2 'mine':20 'moos':16 'must':13 'shaft':21 'sieg':1 'tale':5 'vanquish':14
796	SIERRA DIVIDE	A Emotional Character Study of a Frisbee And a Mad Scientist who must Build a Madman in California	2006	1	\N	3	0.99	135	12.99	2006-02-15 05:03:42	'build':16 'california':20 'charact':5 'divid':2 'emot':4 'frisbe':9 'mad':12 'madman':18 'must':15 'scientist':13 'sierra':1 'studi':6
797	SILENCE KANE	A Emotional Drama of a Sumo Wrestler And a Dentist who must Confront a Sumo Wrestler in A Baloon	2006	1	\N	7	0.99	67	23.99	2006-02-15 05:03:42	'baloon':21 'confront':15 'dentist':12 'drama':5 'emot':4 'kane':2 'must':14 'silenc':1 'sumo':8,17 'wrestler':9,18
798	SILVERADO GOLDFINGER	A Stunning Epistle of a Sumo Wrestler And a Man who must Challenge a Waitress in Ancient India	2006	1	\N	4	4.99	74	11.99	2006-02-15 05:03:42	'ancient':19 'challeng':15 'epistl':5 'goldfing':2 'india':20 'man':12 'must':14 'silverado':1 'stun':4 'sumo':8 'waitress':17 'wrestler':9
799	SIMON NORTH	A Thrilling Documentary of a Technical Writer And a A Shark who must Face a Pioneer in A Shark Tank	2006	1	\N	3	0.99	51	26.99	2006-02-15 05:03:42	'documentari':5 'face':16 'must':15 'north':2 'pioneer':18 'shark':13,21 'simon':1 'tank':22 'technic':8 'thrill':4 'writer':9
800	SINNERS ATLANTIS	A Epic Display of a Dog And a Boat who must Succumb a Mad Scientist in An Abandoned Mine Shaft	2006	1	\N	7	2.99	126	19.99	2006-02-15 05:03:42	'abandon':20 'atlanti':2 'boat':11 'display':5 'dog':8 'epic':4 'mad':16 'mine':21 'must':13 'scientist':17 'shaft':22 'sinner':1 'succumb':14
801	SISTER FREDDY	A Stunning Saga of a Butler And a Woman who must Pursue a Explorer in Australia	2006	1	\N	5	4.99	152	19.99	2006-02-15 05:03:42	'australia':18 'butler':8 'explor':16 'freddi':2 'must':13 'pursu':14 'saga':5 'sister':1 'stun':4 'woman':11
802	SKY MIRACLE	A Epic Drama of a Mad Scientist And a Explorer who must Succumb a Waitress in An Abandoned Fun House	2006	1	\N	7	2.99	132	15.99	2006-02-15 05:03:42	'abandon':20 'drama':5 'epic':4 'explor':12 'fun':21 'hous':22 'mad':8 'miracl':2 'must':14 'scientist':9 'sky':1 'succumb':15 'waitress':17
803	SLACKER LIAISONS	A Fast-Paced Tale of a A Shark And a Student who must Meet a Crocodile in Ancient China	2006	1	\N	7	4.99	179	29.99	2006-02-15 05:03:42	'ancient':21 'china':22 'crocodil':19 'fast':5 'fast-pac':4 'liaison':2 'meet':17 'must':16 'pace':6 'shark':11 'slacker':1 'student':14 'tale':7
804	SLEEPING SUSPECTS	A Stunning Reflection of a Sumo Wrestler And a Explorer who must Sink a Frisbee in A MySQL Convention	2006	1	\N	7	4.99	129	13.99	2006-02-15 05:03:42	'convent':21 'explor':12 'frisbe':17 'must':14 'mysql':20 'reflect':5 'sink':15 'sleep':1 'stun':4 'sumo':8 'suspect':2 'wrestler':9
805	SLEEPLESS MONSOON	A Amazing Saga of a Moose And a Pastry Chef who must Escape a Butler in Australia	2006	1	\N	5	4.99	64	12.99	2006-02-15 05:03:42	'amaz':4 'australia':19 'butler':17 'chef':12 'escap':15 'monsoon':2 'moos':8 'must':14 'pastri':11 'saga':5 'sleepless':1
806	SLEEPY JAPANESE	A Emotional Epistle of a Moose And a Composer who must Fight a Technical Writer in The Outback	2006	1	\N	4	2.99	137	25.99	2006-02-15 05:03:42	'compos':11 'emot':4 'epistl':5 'fight':14 'japanes':2 'moos':8 'must':13 'outback':20 'sleepi':1 'technic':16 'writer':17
807	SLEUTH ORIENT	A Fateful Character Study of a Husband And a Dog who must Find a Feminist in Ancient India	2006	1	\N	4	0.99	87	25.99	2006-02-15 05:03:42	'ancient':19 'charact':5 'dog':12 'fate':4 'feminist':17 'find':15 'husband':9 'india':20 'must':14 'orient':2 'sleuth':1 'studi':6
808	SLING LUKE	A Intrepid Character Study of a Robot And a Monkey who must Reach a Secret Agent in An Abandoned Amusement Park	2006	1	\N	5	0.99	84	10.99	2006-02-15 05:03:42	'abandon':21 'agent':18 'amus':22 'charact':5 'intrepid':4 'luke':2 'monkey':12 'must':14 'park':23 'reach':15 'robot':9 'secret':17 'sling':1 'studi':6
809	SLIPPER FIDELITY	A Taut Reflection of a Secret Agent And a Man who must Redeem a Explorer in A MySQL Convention	2006	1	\N	5	0.99	156	14.99	2006-02-15 05:03:42	'agent':9 'convent':21 'explor':17 'fidel':2 'man':12 'must':14 'mysql':20 'redeem':15 'reflect':5 'secret':8 'slipper':1 'taut':4
810	SLUMS DUCK	A Amazing Character Study of a Teacher And a Database Administrator who must Defeat a Waitress in A Jet Boat	2006	1	\N	5	0.99	147	21.99	2006-02-15 05:03:42	'administr':13 'amaz':4 'boat':22 'charact':5 'databas':12 'defeat':16 'duck':2 'jet':21 'must':15 'slum':1 'studi':6 'teacher':9 'waitress':18
811	SMILE EARRING	A Intrepid Drama of a Teacher And a Butler who must Build a Pastry Chef in Berlin	2006	1	\N	4	2.99	60	29.99	2006-02-15 05:03:42	'berlin':19 'build':14 'butler':11 'chef':17 'drama':5 'earring':2 'intrepid':4 'must':13 'pastri':16 'smile':1 'teacher':8
812	SMOKING BARBARELLA	A Lacklusture Saga of a Mad Cow And a Mad Scientist who must Sink a Cat in A MySQL Convention	2006	1	\N	7	0.99	50	13.99	2006-02-15 05:03:42	'barbarella':2 'cat':18 'convent':22 'cow':9 'lacklustur':4 'mad':8,12 'must':15 'mysql':21 'saga':5 'scientist':13 'sink':16 'smoke':1
813	SMOOCHY CONTROL	A Thrilling Documentary of a Husband And a Feminist who must Face a Mad Scientist in Ancient China	2006	1	\N	7	0.99	184	18.99	2006-02-15 05:03:42	'ancient':19 'china':20 'control':2 'documentari':5 'face':14 'feminist':11 'husband':8 'mad':16 'must':13 'scientist':17 'smoochi':1 'thrill':4
814	SNATCH SLIPPER	A Insightful Panorama of a Woman And a Feminist who must Defeat a Forensic Psychologist in Berlin	2006	1	\N	6	4.99	110	15.99	2006-02-15 05:03:42	'berlin':19 'defeat':14 'feminist':11 'forens':16 'insight':4 'must':13 'panorama':5 'psychologist':17 'slipper':2 'snatch':1 'woman':8
815	SNATCHERS MONTEZUMA	A Boring Epistle of a Sumo Wrestler And a Woman who must Escape a Man in The Canadian Rockies	2006	1	\N	4	2.99	74	14.99	2006-02-15 05:03:42	'bore':4 'canadian':20 'epistl':5 'escap':15 'man':17 'montezuma':2 'must':14 'rocki':21 'snatcher':1 'sumo':8 'woman':12 'wrestler':9
816	SNOWMAN ROLLERCOASTER	A Fateful Display of a Lumberjack And a Girl who must Succumb a Mad Cow in A Manhattan Penthouse	2006	1	\N	3	0.99	62	27.99	2006-02-15 05:03:42	'cow':17 'display':5 'fate':4 'girl':11 'lumberjack':8 'mad':16 'manhattan':20 'must':13 'penthous':21 'rollercoast':2 'snowman':1 'succumb':14
835	SPY MILE	A Thrilling Documentary of a Feminist And a Feminist who must Confront a Feminist in A Baloon	2006	1	\N	6	2.99	112	13.99	2006-02-15 05:03:42	'baloon':19 'confront':14 'documentari':5 'feminist':8,11,16 'mile':2 'must':13 'spi':1 'thrill':4
817	SOLDIERS EVOLUTION	A Lacklusture Panorama of a A Shark And a Pioneer who must Confront a Student in The First Manned Space Station	2006	1	\N	7	4.99	185	27.99	2006-02-15 05:03:42	'confront':15 'evolut':2 'first':20 'lacklustur':4 'man':21 'must':14 'panorama':5 'pioneer':12 'shark':9 'soldier':1 'space':22 'station':23 'student':17
818	SOMETHING DUCK	A Boring Character Study of a Car And a Husband who must Outgun a Frisbee in The First Manned Space Station	2006	1	\N	4	4.99	180	17.99	2006-02-15 05:03:42	'bore':4 'car':9 'charact':5 'duck':2 'first':20 'frisbe':17 'husband':12 'man':21 'must':14 'outgun':15 'someth':1 'space':22 'station':23 'studi':6
819	SONG HEDWIG	A Amazing Documentary of a Man And a Husband who must Confront a Squirrel in A MySQL Convention	2006	1	\N	3	0.99	165	29.99	2006-02-15 05:03:42	'amaz':4 'confront':14 'convent':20 'documentari':5 'hedwig':2 'husband':11 'man':8 'must':13 'mysql':19 'song':1 'squirrel':16
820	SONS INTERVIEW	A Taut Character Study of a Explorer And a Mad Cow who must Battle a Hunter in Ancient China	2006	1	\N	3	2.99	184	11.99	2006-02-15 05:03:42	'ancient':20 'battl':16 'charact':5 'china':21 'cow':13 'explor':9 'hunter':18 'interview':2 'mad':12 'must':15 'son':1 'studi':6 'taut':4
821	SORORITY QUEEN	A Fast-Paced Display of a Squirrel And a Composer who must Fight a Forensic Psychologist in A Jet Boat	2006	1	\N	6	0.99	184	17.99	2006-02-15 05:03:42	'boat':23 'compos':13 'display':7 'fast':5 'fast-pac':4 'fight':16 'forens':18 'jet':22 'must':15 'pace':6 'psychologist':19 'queen':2 'soror':1 'squirrel':10
822	SOUP WISDOM	A Fast-Paced Display of a Robot And a Butler who must Defeat a Butler in A MySQL Convention	2006	1	\N	6	0.99	169	12.99	2006-02-15 05:03:42	'butler':13,18 'convent':22 'defeat':16 'display':7 'fast':5 'fast-pac':4 'must':15 'mysql':21 'pace':6 'robot':10 'soup':1 'wisdom':2
823	SOUTH WAIT	A Amazing Documentary of a Car And a Robot who must Escape a Lumberjack in An Abandoned Amusement Park	2006	1	\N	4	2.99	143	21.99	2006-02-15 05:03:42	'abandon':19 'amaz':4 'amus':20 'car':8 'documentari':5 'escap':14 'lumberjack':16 'must':13 'park':21 'robot':11 'south':1 'wait':2
824	SPARTACUS CHEAPER	A Thrilling Panorama of a Pastry Chef And a Secret Agent who must Overcome a Student in A Manhattan Penthouse	2006	1	\N	4	4.99	52	19.99	2006-02-15 05:03:42	'agent':13 'cheaper':2 'chef':9 'manhattan':21 'must':15 'overcom':16 'panorama':5 'pastri':8 'penthous':22 'secret':12 'spartacus':1 'student':18 'thrill':4
825	SPEAKEASY DATE	A Lacklusture Drama of a Forensic Psychologist And a Car who must Redeem a Man in A Manhattan Penthouse	2006	1	\N	6	2.99	165	22.99	2006-02-15 05:03:42	'car':12 'date':2 'drama':5 'forens':8 'lacklustur':4 'man':17 'manhattan':20 'must':14 'penthous':21 'psychologist':9 'redeem':15 'speakeasi':1
826	SPEED SUIT	A Brilliant Display of a Frisbee And a Mad Scientist who must Succumb a Robot in Ancient China	2006	1	\N	7	4.99	124	19.99	2006-02-15 05:03:42	'ancient':19 'brilliant':4 'china':20 'display':5 'frisbe':8 'mad':11 'must':14 'robot':17 'scientist':12 'speed':1 'succumb':15 'suit':2
827	SPICE SORORITY	A Fateful Display of a Pioneer And a Hunter who must Defeat a Husband in An Abandoned Mine Shaft	2006	1	\N	5	4.99	141	22.99	2006-02-15 05:03:42	'abandon':19 'defeat':14 'display':5 'fate':4 'hunter':11 'husband':16 'mine':20 'must':13 'pioneer':8 'shaft':21 'soror':2 'spice':1
828	SPIKING ELEMENT	A Lacklusture Epistle of a Dentist And a Technical Writer who must Find a Dog in A Monastery	2006	1	\N	7	2.99	79	12.99	2006-02-15 05:03:42	'dentist':8 'dog':17 'element':2 'epistl':5 'find':15 'lacklustur':4 'monasteri':20 'must':14 'spike':1 'technic':11 'writer':12
829	SPINAL ROCKY	A Lacklusture Epistle of a Sumo Wrestler And a Squirrel who must Defeat a Explorer in California	2006	1	\N	7	2.99	138	12.99	2006-02-15 05:03:42	'california':19 'defeat':15 'epistl':5 'explor':17 'lacklustur':4 'must':14 'rocki':2 'spinal':1 'squirrel':12 'sumo':8 'wrestler':9
830	SPIRIT FLINTSTONES	A Brilliant Yarn of a Cat And a Car who must Confront a Explorer in Ancient Japan	2006	1	\N	7	0.99	149	23.99	2006-02-15 05:03:42	'ancient':18 'brilliant':4 'car':11 'cat':8 'confront':14 'explor':16 'flintston':2 'japan':19 'must':13 'spirit':1 'yarn':5
831	SPIRITED CASUALTIES	A Taut Story of a Waitress And a Man who must Face a Car in A Baloon Factory	2006	1	\N	5	0.99	138	20.99	2006-02-15 05:03:42	'baloon':19 'car':16 'casualti':2 'face':14 'factori':20 'man':11 'must':13 'spirit':1 'stori':5 'taut':4 'waitress':8
832	SPLASH GUMP	A Taut Saga of a Crocodile And a Boat who must Conquer a Hunter in A Shark Tank	2006	1	\N	5	0.99	175	16.99	2006-02-15 05:03:42	'boat':11 'conquer':14 'crocodil':8 'gump':2 'hunter':16 'must':13 'saga':5 'shark':19 'splash':1 'tank':20 'taut':4
833	SPLENDOR PATTON	A Taut Story of a Dog And a Explorer who must Find a Astronaut in Berlin	2006	1	\N	5	0.99	134	20.99	2006-02-15 05:03:42	'astronaut':16 'berlin':18 'dog':8 'explor':11 'find':14 'must':13 'patton':2 'splendor':1 'stori':5 'taut':4
834	SPOILERS HELLFIGHTERS	A Fanciful Story of a Technical Writer And a Squirrel who must Defeat a Dog in The Gulf of Mexico	2006	1	\N	4	0.99	151	26.99	2006-02-15 05:03:42	'defeat':15 'dog':17 'fanci':4 'gulf':20 'hellfight':2 'mexico':22 'must':14 'spoiler':1 'squirrel':12 'stori':5 'technic':8 'writer':9
836	SQUAD FISH	A Fast-Paced Display of a Pastry Chef And a Dog who must Kill a Teacher in Berlin	2006	1	\N	3	2.99	136	14.99	2006-02-15 05:03:42	'berlin':21 'chef':11 'display':7 'dog':14 'fast':5 'fast-pac':4 'fish':2 'kill':17 'must':16 'pace':6 'pastri':10 'squad':1 'teacher':19
837	STAGE WORLD	A Lacklusture Panorama of a Woman And a Frisbee who must Chase a Crocodile in A Jet Boat	2006	1	\N	4	2.99	85	19.99	2006-02-15 05:03:42	'boat':20 'chase':14 'crocodil':16 'frisbe':11 'jet':19 'lacklustur':4 'must':13 'panorama':5 'stage':1 'woman':8 'world':2
838	STAGECOACH ARMAGEDDON	A Touching Display of a Pioneer And a Butler who must Chase a Car in California	2006	1	\N	5	4.99	112	25.99	2006-02-15 05:03:42	'armageddon':2 'butler':11 'california':18 'car':16 'chase':14 'display':5 'must':13 'pioneer':8 'stagecoach':1 'touch':4
839	STALLION SUNDANCE	A Fast-Paced Tale of a Car And a Dog who must Outgun a A Shark in Australia	2006	1	\N	5	0.99	130	23.99	2006-02-15 05:03:42	'australia':21 'car':10 'dog':13 'fast':5 'fast-pac':4 'must':15 'outgun':16 'pace':6 'shark':19 'stallion':1 'sundanc':2 'tale':7
840	STAMPEDE DISTURBING	A Unbelieveable Tale of a Woman And a Lumberjack who must Fight a Frisbee in A U-Boat	2006	1	\N	5	0.99	75	26.99	2006-02-15 05:03:42	'boat':21 'disturb':2 'fight':14 'frisbe':16 'lumberjack':11 'must':13 'stamped':1 'tale':5 'u':20 'u-boat':19 'unbeliev':4 'woman':8
841	STAR OPERATION	A Insightful Character Study of a Girl And a Car who must Pursue a Mad Cow in A Shark Tank	2006	1	\N	5	2.99	181	9.99	2006-02-15 05:03:42	'car':12 'charact':5 'cow':18 'girl':9 'insight':4 'mad':17 'must':14 'oper':2 'pursu':15 'shark':21 'star':1 'studi':6 'tank':22
842	STATE WASTELAND	A Beautiful Display of a Cat And a Pastry Chef who must Outrace a Mad Cow in A Jet Boat	2006	1	\N	4	2.99	113	13.99	2006-02-15 05:03:42	'beauti':4 'boat':22 'cat':8 'chef':12 'cow':18 'display':5 'jet':21 'mad':17 'must':14 'outrac':15 'pastri':11 'state':1 'wasteland':2
843	STEEL SANTA	A Fast-Paced Yarn of a Composer And a Frisbee who must Face a Moose in Nigeria	2006	1	\N	4	4.99	143	15.99	2006-02-15 05:03:42	'compos':10 'face':16 'fast':5 'fast-pac':4 'frisbe':13 'moos':18 'must':15 'nigeria':20 'pace':6 'santa':2 'steel':1 'yarn':7
844	STEERS ARMAGEDDON	A Stunning Character Study of a Car And a Girl who must Succumb a Car in A MySQL Convention	2006	1	\N	6	4.99	140	16.99	2006-02-15 05:03:42	'armageddon':2 'car':9,17 'charact':5 'convent':21 'girl':12 'must':14 'mysql':20 'steer':1 'studi':6 'stun':4 'succumb':15
845	STEPMOM DREAM	A Touching Epistle of a Crocodile And a Teacher who must Build a Forensic Psychologist in A MySQL Convention	2006	1	\N	7	4.99	48	9.99	2006-02-15 05:03:42	'build':14 'convent':21 'crocodil':8 'dream':2 'epistl':5 'forens':16 'must':13 'mysql':20 'psychologist':17 'stepmom':1 'teacher':11 'touch':4
846	STING PERSONAL	A Fanciful Drama of a Frisbee And a Dog who must Fight a Madman in A Jet Boat	2006	1	\N	3	4.99	93	9.99	2006-02-15 05:03:42	'boat':20 'dog':11 'drama':5 'fanci':4 'fight':14 'frisbe':8 'jet':19 'madman':16 'must':13 'person':2 'sting':1
847	STOCK GLASS	A Boring Epistle of a Crocodile And a Lumberjack who must Outgun a Moose in Ancient China	2006	1	\N	7	2.99	160	10.99	2006-02-15 05:03:42	'ancient':18 'bore':4 'china':19 'crocodil':8 'epistl':5 'glass':2 'lumberjack':11 'moos':16 'must':13 'outgun':14 'stock':1
848	STONE FIRE	A Intrepid Drama of a Astronaut And a Crocodile who must Find a Boat in Soviet Georgia	2006	1	\N	3	0.99	94	19.99	2006-02-15 05:03:42	'astronaut':8 'boat':16 'crocodil':11 'drama':5 'find':14 'fire':2 'georgia':19 'intrepid':4 'must':13 'soviet':18 'stone':1
849	STORM HAPPINESS	A Insightful Drama of a Feminist And a A Shark who must Vanquish a Boat in A Shark Tank	2006	1	\N	6	0.99	57	28.99	2006-02-15 05:03:42	'boat':17 'drama':5 'feminist':8 'happi':2 'insight':4 'must':14 'shark':12,20 'storm':1 'tank':21 'vanquish':15
850	STORY SIDE	A Lacklusture Saga of a Boy And a Cat who must Sink a Dentist in An Abandoned Mine Shaft	2006	1	\N	7	0.99	163	27.99	2006-02-15 05:03:42	'abandon':19 'boy':8 'cat':11 'dentist':16 'lacklustur':4 'mine':20 'must':13 'saga':5 'shaft':21 'side':2 'sink':14 'stori':1
851	STRAIGHT HOURS	A Boring Panorama of a Secret Agent And a Girl who must Sink a Waitress in The Outback	2006	1	\N	3	0.99	151	19.99	2006-02-15 05:03:42	'agent':9 'bore':4 'girl':12 'hour':2 'must':14 'outback':20 'panorama':5 'secret':8 'sink':15 'straight':1 'waitress':17
852	STRANGELOVE DESIRE	A Awe-Inspiring Panorama of a Lumberjack And a Waitress who must Defeat a Crocodile in An Abandoned Amusement Park	2006	1	\N	4	0.99	103	27.99	2006-02-15 05:03:42	'abandon':21 'amus':22 'awe':5 'awe-inspir':4 'crocodil':18 'defeat':16 'desir':2 'inspir':6 'lumberjack':10 'must':15 'panorama':7 'park':23 'strangelov':1 'waitress':13
853	STRANGER STRANGERS	A Awe-Inspiring Yarn of a Womanizer And a Explorer who must Fight a Woman in The First Manned Space Station	2006	1	\N	3	4.99	139	12.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'explor':13 'fight':16 'first':21 'inspir':6 'man':22 'must':15 'space':23 'station':24 'stranger':1,2 'woman':10,18 'yarn':7
854	STRANGERS GRAFFITI	A Brilliant Character Study of a Secret Agent And a Man who must Find a Cat in The Gulf of Mexico	2006	1	\N	4	4.99	119	22.99	2006-02-15 05:03:42	'agent':10 'brilliant':4 'cat':18 'charact':5 'find':16 'graffiti':2 'gulf':21 'man':13 'mexico':23 'must':15 'secret':9 'stranger':1 'studi':6
855	STREAK RIDGEMONT	A Astounding Character Study of a Hunter And a Waitress who must Sink a Man in New Orleans	2006	1	\N	7	0.99	132	28.99	2006-02-15 05:03:42	'astound':4 'charact':5 'hunter':9 'man':17 'must':14 'new':19 'orlean':20 'ridgemont':2 'sink':15 'streak':1 'studi':6 'waitress':12
856	STREETCAR INTENTIONS	A Insightful Character Study of a Waitress And a Crocodile who must Sink a Waitress in The Gulf of Mexico	2006	1	\N	5	4.99	73	11.99	2006-02-15 05:03:42	'charact':5 'crocodil':12 'gulf':20 'insight':4 'intent':2 'mexico':22 'must':14 'sink':15 'streetcar':1 'studi':6 'waitress':9,17
857	STRICTLY SCARFACE	A Touching Reflection of a Crocodile And a Dog who must Chase a Hunter in An Abandoned Fun House	2006	1	\N	3	2.99	144	24.99	2006-02-15 05:03:42	'abandon':19 'chase':14 'crocodil':8 'dog':11 'fun':20 'hous':21 'hunter':16 'must':13 'reflect':5 'scarfac':2 'strict':1 'touch':4
858	SUBMARINE BED	A Amazing Display of a Car And a Monkey who must Fight a Teacher in Soviet Georgia	2006	1	\N	5	4.99	127	21.99	2006-02-15 05:03:42	'amaz':4 'bed':2 'car':8 'display':5 'fight':14 'georgia':19 'monkey':11 'must':13 'soviet':18 'submarin':1 'teacher':16
859	SUGAR WONKA	A Touching Story of a Dentist And a Database Administrator who must Conquer a Astronaut in An Abandoned Amusement Park	2006	1	\N	3	4.99	114	20.99	2006-02-15 05:03:42	'abandon':20 'administr':12 'amus':21 'astronaut':17 'conquer':15 'databas':11 'dentist':8 'must':14 'park':22 'stori':5 'sugar':1 'touch':4 'wonka':2
860	SUICIDES SILENCE	A Emotional Character Study of a Car And a Girl who must Face a Composer in A U-Boat	2006	1	\N	4	4.99	93	13.99	2006-02-15 05:03:42	'boat':22 'car':9 'charact':5 'compos':17 'emot':4 'face':15 'girl':12 'must':14 'silenc':2 'studi':6 'suicid':1 'u':21 'u-boat':20
861	SUIT WALLS	A Touching Panorama of a Lumberjack And a Frisbee who must Build a Dog in Australia	2006	1	\N	3	4.99	111	12.99	2006-02-15 05:03:42	'australia':18 'build':14 'dog':16 'frisbe':11 'lumberjack':8 'must':13 'panorama':5 'suit':1 'touch':4 'wall':2
862	SUMMER SCARFACE	A Emotional Panorama of a Lumberjack And a Hunter who must Meet a Girl in A Shark Tank	2006	1	\N	5	0.99	53	25.99	2006-02-15 05:03:42	'emot':4 'girl':16 'hunter':11 'lumberjack':8 'meet':14 'must':13 'panorama':5 'scarfac':2 'shark':19 'summer':1 'tank':20
863	SUN CONFESSIONS	A Beautiful Display of a Mad Cow And a Dog who must Redeem a Waitress in An Abandoned Amusement Park	2006	1	\N	5	0.99	141	9.99	2006-02-15 05:03:42	'abandon':20 'amus':21 'beauti':4 'confess':2 'cow':9 'display':5 'dog':12 'mad':8 'must':14 'park':22 'redeem':15 'sun':1 'waitress':17
864	SUNDANCE INVASION	A Epic Drama of a Lumberjack And a Explorer who must Confront a Hunter in A Baloon Factory	2006	1	\N	5	0.99	92	21.99	2006-02-15 05:03:42	'baloon':19 'confront':14 'drama':5 'epic':4 'explor':11 'factori':20 'hunter':16 'invas':2 'lumberjack':8 'must':13 'sundanc':1
865	SUNRISE LEAGUE	A Beautiful Epistle of a Madman And a Butler who must Face a Crocodile in A Manhattan Penthouse	2006	1	\N	3	4.99	135	19.99	2006-02-15 05:03:42	'beauti':4 'butler':11 'crocodil':16 'epistl':5 'face':14 'leagu':2 'madman':8 'manhattan':19 'must':13 'penthous':20 'sunris':1
866	SUNSET RACER	A Awe-Inspiring Reflection of a Astronaut And a A Shark who must Defeat a Forensic Psychologist in California	2006	1	\N	6	0.99	48	28.99	2006-02-15 05:03:42	'astronaut':10 'awe':5 'awe-inspir':4 'california':22 'defeat':17 'forens':19 'inspir':6 'must':16 'psychologist':20 'racer':2 'reflect':7 'shark':14 'sunset':1
867	SUPER WYOMING	A Action-Packed Saga of a Pastry Chef And a Explorer who must Discover a A Shark in The Outback	2006	1	\N	5	4.99	58	10.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'chef':11 'discov':17 'explor':14 'must':16 'outback':23 'pack':6 'pastri':10 'saga':7 'shark':20 'super':1 'wyom':2
868	SUPERFLY TRIP	A Beautiful Saga of a Lumberjack And a Teacher who must Build a Technical Writer in An Abandoned Fun House	2006	1	\N	5	0.99	114	27.99	2006-02-15 05:03:42	'abandon':20 'beauti':4 'build':14 'fun':21 'hous':22 'lumberjack':8 'must':13 'saga':5 'superfli':1 'teacher':11 'technic':16 'trip':2 'writer':17
869	SUSPECTS QUILLS	A Emotional Epistle of a Pioneer And a Crocodile who must Battle a Man in A Manhattan Penthouse	2006	1	\N	4	2.99	47	22.99	2006-02-15 05:03:42	'battl':14 'crocodil':11 'emot':4 'epistl':5 'man':16 'manhattan':19 'must':13 'penthous':20 'pioneer':8 'quill':2 'suspect':1
870	SWARM GOLD	A Insightful Panorama of a Crocodile And a Boat who must Conquer a Sumo Wrestler in A MySQL Convention	2006	1	\N	4	0.99	123	12.99	2006-02-15 05:03:42	'boat':11 'conquer':14 'convent':21 'crocodil':8 'gold':2 'insight':4 'must':13 'mysql':20 'panorama':5 'sumo':16 'swarm':1 'wrestler':17
871	SWEDEN SHINING	A Taut Documentary of a Car And a Robot who must Conquer a Boy in The Canadian Rockies	2006	1	\N	6	4.99	176	19.99	2006-02-15 05:03:42	'boy':16 'canadian':19 'car':8 'conquer':14 'documentari':5 'must':13 'robot':11 'rocki':20 'shine':2 'sweden':1 'taut':4
872	SWEET BROTHERHOOD	A Unbelieveable Epistle of a Sumo Wrestler And a Hunter who must Chase a Forensic Psychologist in A Baloon	2006	1	\N	3	2.99	185	27.99	2006-02-15 05:03:42	'baloon':21 'brotherhood':2 'chase':15 'epistl':5 'forens':17 'hunter':12 'must':14 'psychologist':18 'sumo':8 'sweet':1 'unbeliev':4 'wrestler':9
873	SWEETHEARTS SUSPECTS	A Brilliant Character Study of a Frisbee And a Sumo Wrestler who must Confront a Woman in The Gulf of Mexico	2006	1	\N	3	0.99	108	13.99	2006-02-15 05:03:42	'brilliant':4 'charact':5 'confront':16 'frisbe':9 'gulf':21 'mexico':23 'must':15 'studi':6 'sumo':12 'suspect':2 'sweetheart':1 'woman':18 'wrestler':13
874	TADPOLE PARK	A Beautiful Tale of a Frisbee And a Moose who must Vanquish a Dog in An Abandoned Amusement Park	2006	1	\N	6	2.99	155	13.99	2006-02-15 05:03:42	'abandon':19 'amus':20 'beauti':4 'dog':16 'frisbe':8 'moos':11 'must':13 'park':2,21 'tadpol':1 'tale':5 'vanquish':14
875	TALENTED HOMICIDE	A Lacklusture Panorama of a Dentist And a Forensic Psychologist who must Outrace a Pioneer in A U-Boat	2006	1	\N	6	0.99	173	9.99	2006-02-15 05:03:42	'boat':22 'dentist':8 'forens':11 'homicid':2 'lacklustur':4 'must':14 'outrac':15 'panorama':5 'pioneer':17 'psychologist':12 'talent':1 'u':21 'u-boat':20
876	TARZAN VIDEOTAPE	A Fast-Paced Display of a Lumberjack And a Mad Scientist who must Succumb a Sumo Wrestler in The Sahara Desert	2006	1	\N	3	2.99	91	11.99	2006-02-15 05:03:42	'desert':24 'display':7 'fast':5 'fast-pac':4 'lumberjack':10 'mad':13 'must':16 'pace':6 'sahara':23 'scientist':14 'succumb':17 'sumo':19 'tarzan':1 'videotap':2 'wrestler':20
877	TAXI KICK	A Amazing Epistle of a Girl And a Woman who must Outrace a Waitress in Soviet Georgia	2006	1	\N	4	0.99	64	23.99	2006-02-15 05:03:42	'amaz':4 'epistl':5 'georgia':19 'girl':8 'kick':2 'must':13 'outrac':14 'soviet':18 'taxi':1 'waitress':16 'woman':11
878	TEEN APOLLO	A Awe-Inspiring Drama of a Dog And a Man who must Escape a Robot in A Shark Tank	2006	1	\N	3	4.99	74	25.99	2006-02-15 05:03:42	'apollo':2 'awe':5 'awe-inspir':4 'dog':10 'drama':7 'escap':16 'inspir':6 'man':13 'must':15 'robot':18 'shark':21 'tank':22 'teen':1
879	TELEGRAPH VOYAGE	A Fateful Yarn of a Husband And a Dog who must Battle a Waitress in A Jet Boat	2006	1	\N	3	4.99	148	20.99	2006-02-15 05:03:42	'battl':14 'boat':20 'dog':11 'fate':4 'husband':8 'jet':19 'must':13 'telegraph':1 'voyag':2 'waitress':16 'yarn':5
880	TELEMARK HEARTBREAKERS	A Action-Packed Panorama of a Technical Writer And a Man who must Build a Forensic Psychologist in A Manhattan Penthouse	2006	1	\N	6	2.99	152	9.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'build':17 'forens':19 'heartbreak':2 'man':14 'manhattan':23 'must':16 'pack':6 'panorama':7 'penthous':24 'psychologist':20 'technic':10 'telemark':1 'writer':11
881	TEMPLE ATTRACTION	A Action-Packed Saga of a Forensic Psychologist And a Woman who must Battle a Womanizer in Soviet Georgia	2006	1	\N	5	4.99	71	13.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'attract':2 'battl':17 'forens':10 'georgia':22 'must':16 'pack':6 'psychologist':11 'saga':7 'soviet':21 'templ':1 'woman':14,19
882	TENENBAUMS COMMAND	A Taut Display of a Pioneer And a Man who must Reach a Girl in The Gulf of Mexico	2006	1	\N	4	0.99	99	24.99	2006-02-15 05:03:42	'command':2 'display':5 'girl':16 'gulf':19 'man':11 'mexico':21 'must':13 'pioneer':8 'reach':14 'taut':4 'tenenbaum':1
883	TEQUILA PAST	A Action-Packed Panorama of a Mad Scientist And a Robot who must Challenge a Student in Nigeria	2006	1	\N	6	4.99	53	17.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'challeng':17 'mad':10 'must':16 'nigeria':21 'pack':6 'panorama':7 'past':2 'robot':14 'scientist':11 'student':19 'tequila':1
884	TERMINATOR CLUB	A Touching Story of a Crocodile And a Girl who must Sink a Man in The Gulf of Mexico	2006	1	\N	5	4.99	88	11.99	2006-02-15 05:03:42	'club':2 'crocodil':8 'girl':11 'gulf':19 'man':16 'mexico':21 'must':13 'sink':14 'stori':5 'termin':1 'touch':4
885	TEXAS WATCH	A Awe-Inspiring Yarn of a Student And a Teacher who must Fight a Teacher in An Abandoned Amusement Park	2006	1	\N	7	0.99	179	22.99	2006-02-15 05:03:42	'abandon':21 'amus':22 'awe':5 'awe-inspir':4 'fight':16 'inspir':6 'must':15 'park':23 'student':10 'teacher':13,18 'texa':1 'watch':2 'yarn':7
886	THEORY MERMAID	A Fateful Yarn of a Composer And a Monkey who must Vanquish a Womanizer in The First Manned Space Station	2006	1	\N	5	0.99	184	9.99	2006-02-15 05:03:42	'compos':8 'fate':4 'first':19 'man':20 'mermaid':2 'monkey':11 'must':13 'space':21 'station':22 'theori':1 'vanquish':14 'woman':16 'yarn':5
887	THIEF PELICAN	A Touching Documentary of a Madman And a Mad Scientist who must Outrace a Feminist in An Abandoned Mine Shaft	2006	1	\N	5	4.99	135	28.99	2006-02-15 05:03:42	'abandon':20 'documentari':5 'feminist':17 'mad':11 'madman':8 'mine':21 'must':14 'outrac':15 'pelican':2 'scientist':12 'shaft':22 'thief':1 'touch':4
888	THIN SAGEBRUSH	A Emotional Drama of a Husband And a Lumberjack who must Build a Cat in Ancient India	2006	1	\N	5	4.99	53	9.99	2006-02-15 05:03:42	'ancient':18 'build':14 'cat':16 'drama':5 'emot':4 'husband':8 'india':19 'lumberjack':11 'must':13 'sagebrush':2 'thin':1
889	TIES HUNGER	A Insightful Saga of a Astronaut And a Explorer who must Pursue a Mad Scientist in A U-Boat	2006	1	\N	3	4.99	111	28.99	2006-02-15 05:03:42	'astronaut':8 'boat':22 'explor':11 'hunger':2 'insight':4 'mad':16 'must':13 'pursu':14 'saga':5 'scientist':17 'tie':1 'u':21 'u-boat':20
890	TIGHTS DAWN	A Thrilling Epistle of a Boat And a Secret Agent who must Face a Boy in A Baloon	2006	1	\N	5	0.99	172	14.99	2006-02-15 05:03:42	'agent':12 'baloon':20 'boat':8 'boy':17 'dawn':2 'epistl':5 'face':15 'must':14 'secret':11 'thrill':4 'tight':1
891	TIMBERLAND SKY	A Boring Display of a Man And a Dog who must Redeem a Girl in A U-Boat	2006	1	\N	3	0.99	69	13.99	2006-02-15 05:03:42	'boat':21 'bore':4 'display':5 'dog':11 'girl':16 'man':8 'must':13 'redeem':14 'sky':2 'timberland':1 'u':20 'u-boat':19
947	VISION TORQUE	A Thoughtful Documentary of a Dog And a Man who must Sink a Man in A Shark Tank	2006	1	\N	5	0.99	59	16.99	2006-02-15 05:03:42	'documentari':5 'dog':8 'man':11,16 'must':13 'shark':19 'sink':14 'tank':20 'thought':4 'torqu':2 'vision':1
892	TITANIC BOONDOCK	A Brilliant Reflection of a Feminist And a Dog who must Fight a Boy in A Baloon Factory	2006	1	\N	3	4.99	104	18.99	2006-02-15 05:03:42	'baloon':19 'boondock':2 'boy':16 'brilliant':4 'dog':11 'factori':20 'feminist':8 'fight':14 'must':13 'reflect':5 'titan':1
893	TITANS JERK	A Unbelieveable Panorama of a Feminist And a Sumo Wrestler who must Challenge a Technical Writer in Ancient China	2006	1	\N	4	4.99	91	11.99	2006-02-15 05:03:42	'ancient':20 'challeng':15 'china':21 'feminist':8 'jerk':2 'must':14 'panorama':5 'sumo':11 'technic':17 'titan':1 'unbeliev':4 'wrestler':12 'writer':18
894	TOMATOES HELLFIGHTERS	A Thoughtful Epistle of a Madman And a Astronaut who must Overcome a Monkey in A Shark Tank	2006	1	\N	6	0.99	68	23.99	2006-02-15 05:03:42	'astronaut':11 'epistl':5 'hellfight':2 'madman':8 'monkey':16 'must':13 'overcom':14 'shark':19 'tank':20 'thought':4 'tomato':1
895	TOMORROW HUSTLER	A Thoughtful Story of a Moose And a Husband who must Face a Secret Agent in The Sahara Desert	2006	1	\N	3	2.99	142	21.99	2006-02-15 05:03:42	'agent':17 'desert':21 'face':14 'husband':11 'hustler':2 'moos':8 'must':13 'sahara':20 'secret':16 'stori':5 'thought':4 'tomorrow':1
896	TOOTSIE PILOT	A Awe-Inspiring Documentary of a Womanizer And a Pastry Chef who must Kill a Lumberjack in Berlin	2006	1	\N	3	0.99	157	10.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'berlin':21 'chef':14 'documentari':7 'inspir':6 'kill':17 'lumberjack':19 'must':16 'pastri':13 'pilot':2 'tootsi':1 'woman':10
897	TORQUE BOUND	A Emotional Display of a Crocodile And a Husband who must Reach a Man in Ancient Japan	2006	1	\N	3	4.99	179	27.99	2006-02-15 05:03:42	'ancient':18 'bound':2 'crocodil':8 'display':5 'emot':4 'husband':11 'japan':19 'man':16 'must':13 'reach':14 'torqu':1
898	TOURIST PELICAN	A Boring Story of a Butler And a Astronaut who must Outrace a Pioneer in Australia	2006	1	\N	4	4.99	152	18.99	2006-02-15 05:03:42	'astronaut':11 'australia':18 'bore':4 'butler':8 'must':13 'outrac':14 'pelican':2 'pioneer':16 'stori':5 'tourist':1
899	TOWERS HURRICANE	A Fateful Display of a Monkey And a Car who must Sink a Husband in A MySQL Convention	2006	1	\N	7	0.99	144	14.99	2006-02-15 05:03:42	'car':11 'convent':20 'display':5 'fate':4 'hurrican':2 'husband':16 'monkey':8 'must':13 'mysql':19 'sink':14 'tower':1
900	TOWN ARK	A Awe-Inspiring Documentary of a Moose And a Madman who must Meet a Dog in An Abandoned Mine Shaft	2006	1	\N	6	2.99	136	17.99	2006-02-15 05:03:42	'abandon':21 'ark':2 'awe':5 'awe-inspir':4 'documentari':7 'dog':18 'inspir':6 'madman':13 'meet':16 'mine':22 'moos':10 'must':15 'shaft':23 'town':1
901	TRACY CIDER	A Touching Reflection of a Database Administrator And a Madman who must Build a Lumberjack in Nigeria	2006	1	\N	3	0.99	142	29.99	2006-02-15 05:03:42	'administr':9 'build':15 'cider':2 'databas':8 'lumberjack':17 'madman':12 'must':14 'nigeria':19 'reflect':5 'touch':4 'traci':1
902	TRADING PINOCCHIO	A Emotional Character Study of a Student And a Explorer who must Discover a Frisbee in The First Manned Space Station	2006	1	\N	6	4.99	170	22.99	2006-02-15 05:03:42	'charact':5 'discov':15 'emot':4 'explor':12 'first':20 'frisbe':17 'man':21 'must':14 'pinocchio':2 'space':22 'station':23 'student':9 'studi':6 'trade':1
903	TRAFFIC HOBBIT	A Amazing Epistle of a Squirrel And a Lumberjack who must Succumb a Database Administrator in A U-Boat	2006	1	\N	5	4.99	139	13.99	2006-02-15 05:03:42	'administr':17 'amaz':4 'boat':22 'databas':16 'epistl':5 'hobbit':2 'lumberjack':11 'must':13 'squirrel':8 'succumb':14 'traffic':1 'u':21 'u-boat':20
904	TRAIN BUNCH	A Thrilling Character Study of a Robot And a Squirrel who must Face a Dog in Ancient India	2006	1	\N	3	4.99	71	26.99	2006-02-15 05:03:42	'ancient':19 'bunch':2 'charact':5 'dog':17 'face':15 'india':20 'must':14 'robot':9 'squirrel':12 'studi':6 'thrill':4 'train':1
905	TRAINSPOTTING STRANGERS	A Fast-Paced Drama of a Pioneer And a Mad Cow who must Challenge a Madman in Ancient Japan	2006	1	\N	7	4.99	132	10.99	2006-02-15 05:03:42	'ancient':21 'challeng':17 'cow':14 'drama':7 'fast':5 'fast-pac':4 'japan':22 'mad':13 'madman':19 'must':16 'pace':6 'pioneer':10 'stranger':2 'trainspot':1
906	TRAMP OTHERS	A Brilliant Display of a Composer And a Cat who must Succumb a A Shark in Ancient India	2006	1	\N	4	0.99	171	27.99	2006-02-15 05:03:42	'ancient':19 'brilliant':4 'cat':11 'compos':8 'display':5 'india':20 'must':13 'other':2 'shark':17 'succumb':14 'tramp':1
907	TRANSLATION SUMMER	A Touching Reflection of a Man And a Monkey who must Pursue a Womanizer in A MySQL Convention	2006	1	\N	4	0.99	168	10.99	2006-02-15 05:03:42	'convent':20 'man':8 'monkey':11 'must':13 'mysql':19 'pursu':14 'reflect':5 'summer':2 'touch':4 'translat':1 'woman':16
908	TRAP GUYS	A Unbelieveable Story of a Boy And a Mad Cow who must Challenge a Database Administrator in The Sahara Desert	2006	1	\N	3	4.99	110	11.99	2006-02-15 05:03:42	'administr':18 'boy':8 'challeng':15 'cow':12 'databas':17 'desert':22 'guy':2 'mad':11 'must':14 'sahara':21 'stori':5 'trap':1 'unbeliev':4
909	TREASURE COMMAND	A Emotional Saga of a Car And a Madman who must Discover a Pioneer in California	2006	1	\N	3	0.99	102	28.99	2006-02-15 05:03:42	'california':18 'car':8 'command':2 'discov':14 'emot':4 'madman':11 'must':13 'pioneer':16 'saga':5 'treasur':1
910	TREATMENT JEKYLL	A Boring Story of a Teacher And a Student who must Outgun a Cat in An Abandoned Mine Shaft	2006	1	\N	3	0.99	87	19.99	2006-02-15 05:03:42	'abandon':19 'bore':4 'cat':16 'jekyl':2 'mine':20 'must':13 'outgun':14 'shaft':21 'stori':5 'student':11 'teacher':8 'treatment':1
911	TRIP NEWTON	A Fanciful Character Study of a Lumberjack And a Car who must Discover a Cat in An Abandoned Amusement Park	2006	1	\N	7	4.99	64	14.99	2006-02-15 05:03:42	'abandon':20 'amus':21 'car':12 'cat':17 'charact':5 'discov':15 'fanci':4 'lumberjack':9 'must':14 'newton':2 'park':22 'studi':6 'trip':1
912	TROJAN TOMORROW	A Astounding Panorama of a Husband And a Sumo Wrestler who must Pursue a Boat in Ancient India	2006	1	\N	3	2.99	52	9.99	2006-02-15 05:03:42	'ancient':19 'astound':4 'boat':17 'husband':8 'india':20 'must':14 'panorama':5 'pursu':15 'sumo':11 'tomorrow':2 'trojan':1 'wrestler':12
913	TROOPERS METAL	A Fanciful Drama of a Monkey And a Feminist who must Sink a Man in Berlin	2006	1	\N	3	0.99	115	20.99	2006-02-15 05:03:42	'berlin':18 'drama':5 'fanci':4 'feminist':11 'man':16 'metal':2 'monkey':8 'must':13 'sink':14 'trooper':1
914	TROUBLE DATE	A Lacklusture Panorama of a Forensic Psychologist And a Woman who must Kill a Explorer in Ancient Japan	2006	1	\N	6	2.99	61	13.99	2006-02-15 05:03:42	'ancient':19 'date':2 'explor':17 'forens':8 'japan':20 'kill':15 'lacklustur':4 'must':14 'panorama':5 'psychologist':9 'troubl':1 'woman':12
915	TRUMAN CRAZY	A Thrilling Epistle of a Moose And a Boy who must Meet a Database Administrator in A Monastery	2006	1	\N	7	4.99	92	9.99	2006-02-15 05:03:42	'administr':17 'boy':11 'crazi':2 'databas':16 'epistl':5 'meet':14 'monasteri':20 'moos':8 'must':13 'thrill':4 'truman':1
916	TURN STAR	A Stunning Tale of a Man And a Monkey who must Chase a Student in New Orleans	2006	1	\N	3	2.99	80	10.99	2006-02-15 05:03:42	'chase':14 'man':8 'monkey':11 'must':13 'new':18 'orlean':19 'star':2 'student':16 'stun':4 'tale':5 'turn':1
917	TUXEDO MILE	A Boring Drama of a Man And a Forensic Psychologist who must Face a Frisbee in Ancient India	2006	1	\N	3	2.99	152	24.99	2006-02-15 05:03:42	'ancient':19 'bore':4 'drama':5 'face':15 'forens':11 'frisbe':17 'india':20 'man':8 'mile':2 'must':14 'psychologist':12 'tuxedo':1
918	TWISTED PIRATES	A Touching Display of a Frisbee And a Boat who must Kill a Girl in A MySQL Convention	2006	1	\N	4	4.99	152	23.99	2006-02-15 05:03:42	'boat':11 'convent':20 'display':5 'frisbe':8 'girl':16 'kill':14 'must':13 'mysql':19 'pirat':2 'touch':4 'twist':1
919	TYCOON GATHERING	A Emotional Display of a Husband And a A Shark who must Succumb a Madman in A Manhattan Penthouse	2006	1	\N	3	4.99	82	17.99	2006-02-15 05:03:42	'display':5 'emot':4 'gather':2 'husband':8 'madman':17 'manhattan':20 'must':14 'penthous':21 'shark':12 'succumb':15 'tycoon':1
920	UNBREAKABLE KARATE	A Amazing Character Study of a Robot And a Student who must Chase a Robot in Australia	2006	1	\N	3	0.99	62	16.99	2006-02-15 05:03:42	'amaz':4 'australia':19 'charact':5 'chase':15 'karat':2 'must':14 'robot':9,17 'student':12 'studi':6 'unbreak':1
921	UNCUT SUICIDES	A Intrepid Yarn of a Explorer And a Pastry Chef who must Pursue a Mad Cow in A U-Boat	2006	1	\N	7	2.99	172	29.99	2006-02-15 05:03:42	'boat':23 'chef':12 'cow':18 'explor':8 'intrepid':4 'mad':17 'must':14 'pastri':11 'pursu':15 'suicid':2 'u':22 'u-boat':21 'uncut':1 'yarn':5
922	UNDEFEATED DALMATIONS	A Unbelieveable Display of a Crocodile And a Feminist who must Overcome a Moose in An Abandoned Amusement Park	2006	1	\N	7	4.99	107	22.99	2006-02-15 05:03:42	'abandon':19 'amus':20 'crocodil':8 'dalmat':2 'display':5 'feminist':11 'moos':16 'must':13 'overcom':14 'park':21 'unbeliev':4 'undef':1
923	UNFAITHFUL KILL	A Taut Documentary of a Waitress And a Mad Scientist who must Battle a Technical Writer in New Orleans	2006	1	\N	7	2.99	78	12.99	2006-02-15 05:03:42	'battl':15 'documentari':5 'kill':2 'mad':11 'must':14 'new':20 'orlean':21 'scientist':12 'taut':4 'technic':17 'unfaith':1 'waitress':8 'writer':18
924	UNFORGIVEN ZOOLANDER	A Taut Epistle of a Monkey And a Sumo Wrestler who must Vanquish a A Shark in A Baloon Factory	2006	1	\N	7	0.99	129	15.99	2006-02-15 05:03:42	'baloon':21 'epistl':5 'factori':22 'monkey':8 'must':14 'shark':18 'sumo':11 'taut':4 'unforgiven':1 'vanquish':15 'wrestler':12 'zooland':2
925	UNITED PILOT	A Fast-Paced Reflection of a Cat And a Mad Cow who must Fight a Car in The Sahara Desert	2006	1	\N	3	0.99	164	27.99	2006-02-15 05:03:42	'car':19 'cat':10 'cow':14 'desert':23 'fast':5 'fast-pac':4 'fight':17 'mad':13 'must':16 'pace':6 'pilot':2 'reflect':7 'sahara':22 'unit':1
926	UNTOUCHABLES SUNRISE	A Amazing Documentary of a Woman And a Astronaut who must Outrace a Teacher in An Abandoned Fun House	2006	1	\N	5	2.99	120	11.99	2006-02-15 05:03:42	'abandon':19 'amaz':4 'astronaut':11 'documentari':5 'fun':20 'hous':21 'must':13 'outrac':14 'sunris':2 'teacher':16 'untouch':1 'woman':8
927	UPRISING UPTOWN	A Fanciful Reflection of a Boy And a Butler who must Pursue a Woman in Berlin	2006	1	\N	6	2.99	174	16.99	2006-02-15 05:03:42	'berlin':18 'boy':8 'butler':11 'fanci':4 'must':13 'pursu':14 'reflect':5 'upris':1 'uptown':2 'woman':16
928	UPTOWN YOUNG	A Fateful Documentary of a Dog And a Hunter who must Pursue a Teacher in An Abandoned Amusement Park	2006	1	\N	5	2.99	84	16.99	2006-02-15 05:03:42	'abandon':19 'amus':20 'documentari':5 'dog':8 'fate':4 'hunter':11 'must':13 'park':21 'pursu':14 'teacher':16 'uptown':1 'young':2
929	USUAL UNTOUCHABLES	A Touching Display of a Explorer And a Lumberjack who must Fight a Forensic Psychologist in A Shark Tank	2006	1	\N	5	4.99	128	21.99	2006-02-15 05:03:42	'display':5 'explor':8 'fight':14 'forens':16 'lumberjack':11 'must':13 'psychologist':17 'shark':20 'tank':21 'touch':4 'untouch':2 'usual':1
930	VACATION BOONDOCK	A Fanciful Character Study of a Secret Agent And a Mad Scientist who must Reach a Teacher in Australia	2006	1	\N	4	2.99	145	23.99	2006-02-15 05:03:42	'agent':10 'australia':21 'boondock':2 'charact':5 'fanci':4 'mad':13 'must':16 'reach':17 'scientist':14 'secret':9 'studi':6 'teacher':19 'vacat':1
931	VALENTINE VANISHING	A Thrilling Display of a Husband And a Butler who must Reach a Pastry Chef in California	2006	1	\N	7	0.99	48	9.99	2006-02-15 05:03:42	'butler':11 'california':19 'chef':17 'display':5 'husband':8 'must':13 'pastri':16 'reach':14 'thrill':4 'valentin':1 'vanish':2
932	VALLEY PACKER	A Astounding Documentary of a Astronaut And a Boy who must Outrace a Sumo Wrestler in Berlin	2006	1	\N	3	0.99	73	21.99	2006-02-15 05:03:42	'astound':4 'astronaut':8 'berlin':19 'boy':11 'documentari':5 'must':13 'outrac':14 'packer':2 'sumo':16 'valley':1 'wrestler':17
933	VAMPIRE WHALE	A Epic Story of a Lumberjack And a Monkey who must Confront a Pioneer in A MySQL Convention	2006	1	\N	4	4.99	126	11.99	2006-02-15 05:03:42	'confront':14 'convent':20 'epic':4 'lumberjack':8 'monkey':11 'must':13 'mysql':19 'pioneer':16 'stori':5 'vampir':1 'whale':2
934	VANILLA DAY	A Fast-Paced Saga of a Girl And a Forensic Psychologist who must Redeem a Girl in Nigeria	2006	1	\N	7	4.99	122	20.99	2006-02-15 05:03:42	'day':2 'fast':5 'fast-pac':4 'forens':13 'girl':10,19 'must':16 'nigeria':21 'pace':6 'psychologist':14 'redeem':17 'saga':7 'vanilla':1
935	VANISHED GARDEN	A Intrepid Character Study of a Squirrel And a A Shark who must Kill a Lumberjack in California	2006	1	\N	5	0.99	142	17.99	2006-02-15 05:03:42	'california':20 'charact':5 'garden':2 'intrepid':4 'kill':16 'lumberjack':18 'must':15 'shark':13 'squirrel':9 'studi':6 'vanish':1
936	VANISHING ROCKY	A Brilliant Reflection of a Man And a Woman who must Conquer a Pioneer in A MySQL Convention	2006	1	\N	3	2.99	123	21.99	2006-02-15 05:03:42	'brilliant':4 'conquer':14 'convent':20 'man':8 'must':13 'mysql':19 'pioneer':16 'reflect':5 'rocki':2 'vanish':1 'woman':11
937	VARSITY TRIP	A Action-Packed Character Study of a Astronaut And a Explorer who must Reach a Monkey in A MySQL Convention	2006	1	\N	7	2.99	85	14.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'astronaut':11 'charact':7 'convent':23 'explor':14 'monkey':19 'must':16 'mysql':22 'pack':6 'reach':17 'studi':8 'trip':2 'varsiti':1
982	WOMEN DORADO	A Insightful Documentary of a Waitress And a Butler who must Vanquish a Composer in Australia	2006	1	\N	4	0.99	126	23.99	2006-02-15 05:03:42	'australia':18 'butler':11 'compos':16 'documentari':5 'dorado':2 'insight':4 'must':13 'vanquish':14 'waitress':8 'women':1
938	VELVET TERMINATOR	A Lacklusture Tale of a Pastry Chef And a Technical Writer who must Confront a Crocodile in An Abandoned Amusement Park	2006	1	\N	3	4.99	173	14.99	2006-02-15 05:03:42	'abandon':21 'amus':22 'chef':9 'confront':16 'crocodil':18 'lacklustur':4 'must':15 'park':23 'pastri':8 'tale':5 'technic':12 'termin':2 'velvet':1 'writer':13
939	VERTIGO NORTHWEST	A Unbelieveable Display of a Mad Scientist And a Mad Scientist who must Outgun a Mad Cow in Ancient Japan	2006	1	\N	4	2.99	90	17.99	2006-02-15 05:03:42	'ancient':21 'cow':19 'display':5 'japan':22 'mad':8,12,18 'must':15 'northwest':2 'outgun':16 'scientist':9,13 'unbeliev':4 'vertigo':1
940	VICTORY ACADEMY	A Insightful Epistle of a Mad Scientist And a Explorer who must Challenge a Cat in The Sahara Desert	2006	1	\N	6	0.99	64	19.99	2006-02-15 05:03:42	'academi':2 'cat':17 'challeng':15 'desert':21 'epistl':5 'explor':12 'insight':4 'mad':8 'must':14 'sahara':20 'scientist':9 'victori':1
941	VIDEOTAPE ARSENIC	A Lacklusture Display of a Girl And a Astronaut who must Succumb a Student in Australia	2006	1	\N	4	4.99	145	10.99	2006-02-15 05:03:42	'arsenic':2 'astronaut':11 'australia':18 'display':5 'girl':8 'lacklustur':4 'must':13 'student':16 'succumb':14 'videotap':1
942	VIETNAM SMOOCHY	A Lacklusture Display of a Butler And a Man who must Sink a Explorer in Soviet Georgia	2006	1	\N	7	0.99	174	27.99	2006-02-15 05:03:42	'butler':8 'display':5 'explor':16 'georgia':19 'lacklustur':4 'man':11 'must':13 'sink':14 'smoochi':2 'soviet':18 'vietnam':1
943	VILLAIN DESPERATE	A Boring Yarn of a Pioneer And a Feminist who must Redeem a Cat in An Abandoned Amusement Park	2006	1	\N	4	4.99	76	27.99	2006-02-15 05:03:42	'abandon':19 'amus':20 'bore':4 'cat':16 'desper':2 'feminist':11 'must':13 'park':21 'pioneer':8 'redeem':14 'villain':1 'yarn':5
944	VIRGIN DAISY	A Awe-Inspiring Documentary of a Robot And a Mad Scientist who must Reach a Database Administrator in A Shark Tank	2006	1	\N	6	4.99	179	29.99	2006-02-15 05:03:42	'administr':20 'awe':5 'awe-inspir':4 'daisi':2 'databas':19 'documentari':7 'inspir':6 'mad':13 'must':16 'reach':17 'robot':10 'scientist':14 'shark':23 'tank':24 'virgin':1
945	VIRGINIAN PLUTO	A Emotional Panorama of a Dentist And a Crocodile who must Meet a Boy in Berlin	2006	1	\N	5	0.99	164	22.99	2006-02-15 05:03:42	'berlin':18 'boy':16 'crocodil':11 'dentist':8 'emot':4 'meet':14 'must':13 'panorama':5 'pluto':2 'virginian':1
946	VIRTUAL SPOILERS	A Fateful Tale of a Database Administrator And a Squirrel who must Discover a Student in Soviet Georgia	2006	1	\N	3	4.99	144	14.99	2006-02-15 05:03:42	'administr':9 'databas':8 'discov':15 'fate':4 'georgia':20 'must':14 'soviet':19 'spoiler':2 'squirrel':12 'student':17 'tale':5 'virtual':1
948	VOICE PEACH	A Amazing Panorama of a Pioneer And a Student who must Overcome a Mad Scientist in A Manhattan Penthouse	2006	1	\N	6	0.99	139	22.99	2006-02-15 05:03:42	'amaz':4 'mad':16 'manhattan':20 'must':13 'overcom':14 'panorama':5 'peach':2 'penthous':21 'pioneer':8 'scientist':17 'student':11 'voic':1
949	VOLCANO TEXAS	A Awe-Inspiring Yarn of a Hunter And a Feminist who must Challenge a Dentist in The Outback	2006	1	\N	6	0.99	157	27.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'challeng':16 'dentist':18 'feminist':13 'hunter':10 'inspir':6 'must':15 'outback':21 'texa':2 'volcano':1 'yarn':7
950	VOLUME HOUSE	A Boring Tale of a Dog And a Woman who must Meet a Dentist in California	2006	1	\N	7	4.99	132	12.99	2006-02-15 05:03:42	'bore':4 'california':18 'dentist':16 'dog':8 'hous':2 'meet':14 'must':13 'tale':5 'volum':1 'woman':11
951	VOYAGE LEGALLY	A Epic Tale of a Squirrel And a Hunter who must Conquer a Boy in An Abandoned Mine Shaft	2006	1	\N	6	0.99	78	28.99	2006-02-15 05:03:42	'abandon':19 'boy':16 'conquer':14 'epic':4 'hunter':11 'legal':2 'mine':20 'must':13 'shaft':21 'squirrel':8 'tale':5 'voyag':1
952	WAGON JAWS	A Intrepid Drama of a Moose And a Boat who must Kill a Explorer in A Manhattan Penthouse	2006	1	\N	7	2.99	152	17.99	2006-02-15 05:03:42	'boat':11 'drama':5 'explor':16 'intrepid':4 'jaw':2 'kill':14 'manhattan':19 'moos':8 'must':13 'penthous':20 'wagon':1
953	WAIT CIDER	A Intrepid Epistle of a Woman And a Forensic Psychologist who must Succumb a Astronaut in A Manhattan Penthouse	2006	1	\N	3	0.99	112	9.99	2006-02-15 05:03:42	'astronaut':17 'cider':2 'epistl':5 'forens':11 'intrepid':4 'manhattan':20 'must':14 'penthous':21 'psychologist':12 'succumb':15 'wait':1 'woman':8
954	WAKE JAWS	A Beautiful Saga of a Feminist And a Composer who must Challenge a Moose in Berlin	2006	1	\N	7	4.99	73	18.99	2006-02-15 05:03:42	'beauti':4 'berlin':18 'challeng':14 'compos':11 'feminist':8 'jaw':2 'moos':16 'must':13 'saga':5 'wake':1
955	WALLS ARTIST	A Insightful Panorama of a Teacher And a Teacher who must Overcome a Mad Cow in An Abandoned Fun House	2006	1	\N	7	4.99	135	19.99	2006-02-15 05:03:42	'abandon':20 'artist':2 'cow':17 'fun':21 'hous':22 'insight':4 'mad':16 'must':13 'overcom':14 'panorama':5 'teacher':8,11 'wall':1
956	WANDA CHAMBER	A Insightful Drama of a A Shark And a Pioneer who must Find a Womanizer in The Outback	2006	1	\N	7	4.99	107	23.99	2006-02-15 05:03:42	'chamber':2 'drama':5 'find':15 'insight':4 'must':14 'outback':20 'pioneer':12 'shark':9 'wanda':1 'woman':17
957	WAR NOTTING	A Boring Drama of a Teacher And a Sumo Wrestler who must Challenge a Secret Agent in The Canadian Rockies	2006	1	\N	7	4.99	80	26.99	2006-02-15 05:03:42	'agent':18 'bore':4 'canadian':21 'challeng':15 'drama':5 'must':14 'not':2 'rocki':22 'secret':17 'sumo':11 'teacher':8 'war':1 'wrestler':12
958	WARDROBE PHANTOM	A Action-Packed Display of a Mad Cow And a Astronaut who must Kill a Car in Ancient India	2006	1	\N	6	2.99	178	19.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'ancient':21 'astronaut':14 'car':19 'cow':11 'display':7 'india':22 'kill':17 'mad':10 'must':16 'pack':6 'phantom':2 'wardrob':1
959	WARLOCK WEREWOLF	A Astounding Yarn of a Pioneer And a Crocodile who must Defeat a A Shark in The Outback	2006	1	\N	6	2.99	83	10.99	2006-02-15 05:03:42	'astound':4 'crocodil':11 'defeat':14 'must':13 'outback':20 'pioneer':8 'shark':17 'warlock':1 'werewolf':2 'yarn':5
960	WARS PLUTO	A Taut Reflection of a Teacher And a Database Administrator who must Chase a Madman in The Sahara Desert	2006	1	\N	5	2.99	128	15.99	2006-02-15 05:03:42	'administr':12 'chase':15 'databas':11 'desert':21 'madman':17 'must':14 'pluto':2 'reflect':5 'sahara':20 'taut':4 'teacher':8 'war':1
961	WASH HEAVENLY	A Awe-Inspiring Reflection of a Cat And a Pioneer who must Escape a Hunter in Ancient China	2006	1	\N	7	4.99	161	22.99	2006-02-15 05:03:42	'ancient':20 'awe':5 'awe-inspir':4 'cat':10 'china':21 'escap':16 'heaven':2 'hunter':18 'inspir':6 'must':15 'pioneer':13 'reflect':7 'wash':1
962	WASTELAND DIVINE	A Fanciful Story of a Database Administrator And a Womanizer who must Fight a Database Administrator in Ancient China	2006	1	\N	7	2.99	85	18.99	2006-02-15 05:03:42	'administr':9,18 'ancient':20 'china':21 'databas':8,17 'divin':2 'fanci':4 'fight':15 'must':14 'stori':5 'wasteland':1 'woman':12
963	WATCH TRACY	A Fast-Paced Yarn of a Dog And a Frisbee who must Conquer a Hunter in Nigeria	2006	1	\N	5	0.99	78	12.99	2006-02-15 05:03:42	'conquer':16 'dog':10 'fast':5 'fast-pac':4 'frisbe':13 'hunter':18 'must':15 'nigeria':20 'pace':6 'traci':2 'watch':1 'yarn':7
964	WATERFRONT DELIVERANCE	A Unbelieveable Documentary of a Dentist And a Technical Writer who must Build a Womanizer in Nigeria	2006	1	\N	4	4.99	61	17.99	2006-02-15 05:03:42	'build':15 'deliver':2 'dentist':8 'documentari':5 'must':14 'nigeria':19 'technic':11 'unbeliev':4 'waterfront':1 'woman':17 'writer':12
965	WATERSHIP FRONTIER	A Emotional Yarn of a Boat And a Crocodile who must Meet a Moose in Soviet Georgia	2006	1	\N	6	0.99	112	28.99	2006-02-15 05:03:42	'boat':8 'crocodil':11 'emot':4 'frontier':2 'georgia':19 'meet':14 'moos':16 'must':13 'soviet':18 'watership':1 'yarn':5
966	WEDDING APOLLO	A Action-Packed Tale of a Student And a Waitress who must Conquer a Lumberjack in An Abandoned Mine Shaft	2006	1	\N	3	0.99	70	14.99	2006-02-15 05:03:42	'abandon':21 'action':5 'action-pack':4 'apollo':2 'conquer':16 'lumberjack':18 'mine':22 'must':15 'pack':6 'shaft':23 'student':10 'tale':7 'waitress':13 'wed':1
967	WEEKEND PERSONAL	A Fast-Paced Documentary of a Car And a Butler who must Find a Frisbee in A Jet Boat	2006	1	\N	5	2.99	134	26.99	2006-02-15 05:03:42	'boat':22 'butler':13 'car':10 'documentari':7 'fast':5 'fast-pac':4 'find':16 'frisbe':18 'jet':21 'must':15 'pace':6 'person':2 'weekend':1
968	WEREWOLF LOLA	A Fanciful Story of a Man And a Sumo Wrestler who must Outrace a Student in A Monastery	2006	1	\N	6	4.99	79	19.99	2006-02-15 05:03:42	'fanci':4 'lola':2 'man':8 'monasteri':20 'must':14 'outrac':15 'stori':5 'student':17 'sumo':11 'werewolf':1 'wrestler':12
969	WEST LION	A Intrepid Drama of a Butler And a Lumberjack who must Challenge a Database Administrator in A Manhattan Penthouse	2006	1	\N	4	4.99	159	29.99	2006-02-15 05:03:42	'administr':17 'butler':8 'challeng':14 'databas':16 'drama':5 'intrepid':4 'lion':2 'lumberjack':11 'manhattan':20 'must':13 'penthous':21 'west':1
970	WESTWARD SEABISCUIT	A Lacklusture Tale of a Butler And a Husband who must Face a Boy in Ancient China	2006	1	\N	7	0.99	52	11.99	2006-02-15 05:03:42	'ancient':18 'boy':16 'butler':8 'china':19 'face':14 'husband':11 'lacklustur':4 'must':13 'seabiscuit':2 'tale':5 'westward':1
971	WHALE BIKINI	A Intrepid Story of a Pastry Chef And a Database Administrator who must Kill a Feminist in A MySQL Convention	2006	1	\N	4	4.99	109	11.99	2006-02-15 05:03:42	'administr':13 'bikini':2 'chef':9 'convent':22 'databas':12 'feminist':18 'intrepid':4 'kill':16 'must':15 'mysql':21 'pastri':8 'stori':5 'whale':1
972	WHISPERER GIANT	A Intrepid Story of a Dentist And a Hunter who must Confront a Monkey in Ancient Japan	2006	1	\N	4	4.99	59	24.99	2006-02-15 05:03:42	'ancient':18 'confront':14 'dentist':8 'giant':2 'hunter':11 'intrepid':4 'japan':19 'monkey':16 'must':13 'stori':5 'whisper':1
973	WIFE TURN	A Awe-Inspiring Epistle of a Teacher And a Feminist who must Confront a Pioneer in Ancient Japan	2006	1	\N	3	4.99	183	27.99	2006-02-15 05:03:42	'ancient':20 'awe':5 'awe-inspir':4 'confront':16 'epistl':7 'feminist':13 'inspir':6 'japan':21 'must':15 'pioneer':18 'teacher':10 'turn':2 'wife':1
974	WILD APOLLO	A Beautiful Story of a Monkey And a Sumo Wrestler who must Conquer a A Shark in A MySQL Convention	2006	1	\N	4	0.99	181	24.99	2006-02-15 05:03:42	'apollo':2 'beauti':4 'conquer':15 'convent':22 'monkey':8 'must':14 'mysql':21 'shark':18 'stori':5 'sumo':11 'wild':1 'wrestler':12
975	WILLOW TRACY	A Brilliant Panorama of a Boat And a Astronaut who must Challenge a Teacher in A Manhattan Penthouse	2006	1	\N	6	2.99	137	22.99	2006-02-15 05:03:42	'astronaut':11 'boat':8 'brilliant':4 'challeng':14 'manhattan':19 'must':13 'panorama':5 'penthous':20 'teacher':16 'traci':2 'willow':1
976	WIND PHANTOM	A Touching Saga of a Madman And a Forensic Psychologist who must Build a Sumo Wrestler in An Abandoned Mine Shaft	2006	1	\N	6	0.99	111	12.99	2006-02-15 05:03:42	'abandon':21 'build':15 'forens':11 'madman':8 'mine':22 'must':14 'phantom':2 'psychologist':12 'saga':5 'shaft':23 'sumo':17 'touch':4 'wind':1 'wrestler':18
977	WINDOW SIDE	A Astounding Character Study of a Womanizer And a Hunter who must Escape a Robot in A Monastery	2006	1	\N	3	2.99	85	25.99	2006-02-15 05:03:42	'astound':4 'charact':5 'escap':15 'hunter':12 'monasteri':20 'must':14 'robot':17 'side':2 'studi':6 'window':1 'woman':9
978	WISDOM WORKER	A Unbelieveable Saga of a Forensic Psychologist And a Student who must Face a Squirrel in The First Manned Space Station	2006	1	\N	3	0.99	98	12.99	2006-02-15 05:03:42	'face':15 'first':20 'forens':8 'man':21 'must':14 'psychologist':9 'saga':5 'space':22 'squirrel':17 'station':23 'student':12 'unbeliev':4 'wisdom':1 'worker':2
979	WITCHES PANIC	A Awe-Inspiring Drama of a Secret Agent And a Hunter who must Fight a Moose in Nigeria	2006	1	\N	6	4.99	100	10.99	2006-02-15 05:03:42	'agent':11 'awe':5 'awe-inspir':4 'drama':7 'fight':17 'hunter':14 'inspir':6 'moos':19 'must':16 'nigeria':21 'panic':2 'secret':10 'witch':1
980	WIZARD COLDBLOODED	A Lacklusture Display of a Robot And a Girl who must Defeat a Sumo Wrestler in A MySQL Convention	2006	1	\N	4	4.99	75	12.99	2006-02-15 05:03:42	'coldblood':2 'convent':21 'defeat':14 'display':5 'girl':11 'lacklustur':4 'must':13 'mysql':20 'robot':8 'sumo':16 'wizard':1 'wrestler':17
981	WOLVES DESIRE	A Fast-Paced Drama of a Squirrel And a Robot who must Succumb a Technical Writer in A Manhattan Penthouse	2006	1	\N	7	0.99	55	13.99	2006-02-15 05:03:42	'desir':2 'drama':7 'fast':5 'fast-pac':4 'manhattan':22 'must':15 'pace':6 'penthous':23 'robot':13 'squirrel':10 'succumb':16 'technic':18 'wolv':1 'writer':19
983	WON DARES	A Unbelieveable Documentary of a Teacher And a Monkey who must Defeat a Explorer in A U-Boat	2006	1	\N	7	2.99	105	18.99	2006-02-15 05:03:42	'boat':21 'dare':2 'defeat':14 'documentari':5 'explor':16 'monkey':11 'must':13 'teacher':8 'u':20 'u-boat':19 'unbeliev':4 'won':1
984	WONDERFUL DROP	A Boring Panorama of a Woman And a Madman who must Overcome a Butler in A U-Boat	2006	1	\N	3	2.99	126	20.99	2006-02-15 05:03:42	'boat':21 'bore':4 'butler':16 'drop':2 'madman':11 'must':13 'overcom':14 'panorama':5 'u':20 'u-boat':19 'woman':8 'wonder':1
985	WONDERLAND CHRISTMAS	A Awe-Inspiring Character Study of a Waitress And a Car who must Pursue a Mad Scientist in The First Manned Space Station	2006	1	\N	4	4.99	111	19.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'car':14 'charact':7 'christma':2 'first':23 'inspir':6 'mad':19 'man':24 'must':16 'pursu':17 'scientist':20 'space':25 'station':26 'studi':8 'waitress':11 'wonderland':1
986	WONKA SEA	A Brilliant Saga of a Boat And a Mad Scientist who must Meet a Moose in Ancient India	2006	1	\N	6	2.99	85	24.99	2006-02-15 05:03:42	'ancient':19 'boat':8 'brilliant':4 'india':20 'mad':11 'meet':15 'moos':17 'must':14 'saga':5 'scientist':12 'sea':2 'wonka':1
987	WORDS HUNTER	A Action-Packed Reflection of a Composer And a Mad Scientist who must Face a Pioneer in A MySQL Convention	2006	1	\N	3	2.99	116	13.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'compos':10 'convent':23 'face':17 'hunter':2 'mad':13 'must':16 'mysql':22 'pack':6 'pioneer':19 'reflect':7 'scientist':14 'word':1
988	WORKER TARZAN	A Action-Packed Yarn of a Secret Agent And a Technical Writer who must Battle a Sumo Wrestler in The First Manned Space Station	2006	1	\N	7	2.99	139	26.99	2006-02-15 05:03:42	'action':5 'action-pack':4 'agent':11 'battl':18 'first':24 'man':25 'must':17 'pack':6 'secret':10 'space':26 'station':27 'sumo':20 'tarzan':2 'technic':14 'worker':1 'wrestler':21 'writer':15 'yarn':7
989	WORKING MICROCOSMOS	A Stunning Epistle of a Dentist And a Dog who must Kill a Madman in Ancient China	2006	1	\N	4	4.99	74	22.99	2006-02-15 05:03:42	'ancient':18 'china':19 'dentist':8 'dog':11 'epistl':5 'kill':14 'madman':16 'microcosmo':2 'must':13 'stun':4 'work':1
990	WORLD LEATHERNECKS	A Unbelieveable Tale of a Pioneer And a Astronaut who must Overcome a Robot in An Abandoned Amusement Park	2006	1	\N	3	0.99	171	13.99	2006-02-15 05:03:42	'abandon':19 'amus':20 'astronaut':11 'leatherneck':2 'must':13 'overcom':14 'park':21 'pioneer':8 'robot':16 'tale':5 'unbeliev':4 'world':1
991	WORST BANGER	A Thrilling Drama of a Madman And a Dentist who must Conquer a Boy in The Outback	2006	1	\N	4	2.99	185	26.99	2006-02-15 05:03:42	'banger':2 'boy':16 'conquer':14 'dentist':11 'drama':5 'madman':8 'must':13 'outback':19 'thrill':4 'worst':1
992	WRATH MILE	A Intrepid Reflection of a Technical Writer And a Hunter who must Defeat a Sumo Wrestler in A Monastery	2006	1	\N	5	0.99	176	17.99	2006-02-15 05:03:42	'defeat':15 'hunter':12 'intrepid':4 'mile':2 'monasteri':21 'must':14 'reflect':5 'sumo':17 'technic':8 'wrath':1 'wrestler':18 'writer':9
993	WRONG BEHAVIOR	A Emotional Saga of a Crocodile And a Sumo Wrestler who must Discover a Mad Cow in New Orleans	2006	1	\N	6	2.99	178	10.99	2006-02-15 05:03:42	'behavior':2 'cow':18 'crocodil':8 'discov':15 'emot':4 'mad':17 'must':14 'new':20 'orlean':21 'saga':5 'sumo':11 'wrestler':12 'wrong':1
994	WYOMING STORM	A Awe-Inspiring Panorama of a Robot And a Boat who must Overcome a Feminist in A U-Boat	2006	1	\N	6	4.99	100	29.99	2006-02-15 05:03:42	'awe':5 'awe-inspir':4 'boat':13,23 'feminist':18 'inspir':6 'must':15 'overcom':16 'panorama':7 'robot':10 'storm':2 'u':22 'u-boat':21 'wyom':1
995	YENTL IDAHO	A Amazing Display of a Robot And a Astronaut who must Fight a Womanizer in Berlin	2006	1	\N	5	4.99	86	11.99	2006-02-15 05:03:42	'amaz':4 'astronaut':11 'berlin':18 'display':5 'fight':14 'idaho':2 'must':13 'robot':8 'woman':16 'yentl':1
996	YOUNG LANGUAGE	A Unbelieveable Yarn of a Boat And a Database Administrator who must Meet a Boy in The First Manned Space Station	2006	1	\N	6	0.99	183	9.99	2006-02-15 05:03:42	'administr':12 'boat':8 'boy':17 'databas':11 'first':20 'languag':2 'man':21 'meet':15 'must':14 'space':22 'station':23 'unbeliev':4 'yarn':5 'young':1
997	YOUTH KICK	A Touching Drama of a Teacher And a Cat who must Challenge a Technical Writer in A U-Boat	2006	1	\N	4	0.99	179	14.99	2006-02-15 05:03:42	'boat':22 'cat':11 'challeng':14 'drama':5 'kick':2 'must':13 'teacher':8 'technic':16 'touch':4 'u':21 'u-boat':20 'writer':17 'youth':1
998	ZHIVAGO CORE	A Fateful Yarn of a Composer And a Man who must Face a Boy in The Canadian Rockies	2006	1	\N	6	0.99	105	10.99	2006-02-15 05:03:42	'boy':16 'canadian':19 'compos':8 'core':2 'face':14 'fate':4 'man':11 'must':13 'rocki':20 'yarn':5 'zhivago':1
999	ZOOLANDER FICTION	A Fateful Reflection of a Waitress And a Boat who must Discover a Sumo Wrestler in Ancient China	2006	1	\N	5	2.99	101	28.99	2006-02-15 05:03:42	'ancient':19 'boat':11 'china':20 'discov':14 'fate':4 'fiction':2 'must':13 'reflect':5 'sumo':16 'waitress':8 'wrestler':17 'zooland':1
1000	ZORRO ARK	A Intrepid Panorama of a Mad Scientist And a Boy who must Redeem a Boy in A Monastery	2006	1	\N	3	4.99	50	18.99	2006-02-15 05:03:42	'ark':2 'boy':12,17 'intrepid':4 'mad':8 'monasteri':20 'must':14 'panorama':5 'redeem':15 'scientist':9 'zorro':1
\.


--
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.language (language_id, name, last_update) FROM stdin;
1	English             	2006-02-15 05:02:19
2	Italian             	2006-02-15 05:02:19
3	Japanese            	2006-02-15 05:02:19
4	Mandarin            	2006-02-15 05:02:19
5	French              	2006-02-15 05:02:19
6	German              	2006-02-15 05:02:19
\.


--
-- Name: actor_actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actor_actor_id_seq', 200, true);


--
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_category_id_seq', 16, true);


--
-- Name: film_film_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.film_film_id_seq', 1000, true);


--
-- Name: language_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.language_language_id_seq', 6, true);


--
-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (actor_id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- Name: film film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (film_id);


--
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (language_id);


--
-- Name: film_fulltext_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX film_fulltext_idx ON public.film USING gist (fulltext);


--
-- Name: idx_actor_last_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_actor_last_name ON public.actor USING btree (last_name);


--
-- Name: idx_fk_language_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_language_id ON public.film USING btree (language_id);


--
-- Name: idx_fk_original_language_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_original_language_id ON public.film USING btree (original_language_id);


--
-- Name: idx_title; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_title ON public.film USING btree (title);


--
-- Name: film film_fulltext_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER film_fulltext_trigger BEFORE INSERT OR UPDATE ON public.film FOR EACH ROW EXECUTE FUNCTION tsvector_update_trigger('fulltext', 'pg_catalog.english', 'title', 'description');


--
-- Name: actor last_updated; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER last_updated BEFORE UPDATE ON public.actor FOR EACH ROW EXECUTE FUNCTION public.last_updated();


--
-- Name: category last_updated; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER last_updated BEFORE UPDATE ON public.category FOR EACH ROW EXECUTE FUNCTION public.last_updated();


--
-- Name: film last_updated; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER last_updated BEFORE UPDATE ON public.film FOR EACH ROW EXECUTE FUNCTION public.last_updated();


--
-- Name: language last_updated; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER last_updated BEFORE UPDATE ON public.language FOR EACH ROW EXECUTE FUNCTION public.last_updated();


--
-- Name: film film_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.language(language_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: film film_original_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_original_language_id_fkey FOREIGN KEY (original_language_id) REFERENCES public.language(language_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

