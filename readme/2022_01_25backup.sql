PGDMP     '                     z         
   biblioteka    14.0    14.0 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    41389 
   biblioteka    DATABASE     o   CREATE DATABASE biblioteka WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United Kingdom.1252';
    DROP DATABASE biblioteka;
                postgres    false            �           0    0    DATABASE biblioteka    COMMENT     U   COMMENT ON DATABASE biblioteka IS 'biblioteka projekt z baz danych 1 
podejscie 2
';
                   postgres    false    3501            �            1259    41726    adres    TABLE     �   CREATE TABLE public.adres (
    adres_id integer NOT NULL,
    kod_pocztowy character varying NOT NULL,
    miejscowosc_id integer NOT NULL,
    ulica_i_numer character varying NOT NULL
);
    DROP TABLE public.adres;
       public         heap    postgres    false            �            1259    41725    adres_adres_id_seq    SEQUENCE     {   CREATE SEQUENCE public.adres_adres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.adres_adres_id_seq;
       public          postgres    false    227            �           0    0    adres_adres_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.adres_adres_id_seq OWNED BY public.adres.adres_id;
          public          postgres    false    226            �            1259    41646    autor    TABLE     �   CREATE TABLE public.autor (
    autor_id integer NOT NULL,
    imie character varying NOT NULL,
    nazwisko character varying NOT NULL
);
    DROP TABLE public.autor;
       public         heap    postgres    false            �            1259    41645    autor_autor_id_seq    SEQUENCE     {   CREATE SEQUENCE public.autor_autor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.autor_autor_id_seq;
       public          postgres    false    210            �           0    0    autor_autor_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.autor_autor_id_seq OWNED BY public.autor.autor_id;
          public          postgres    false    209            �            1259    41745 
   biblioteka    TABLE     f   CREATE TABLE public.biblioteka (
    biblioteka_id integer NOT NULL,
    adres_id integer NOT NULL
);
    DROP TABLE public.biblioteka;
       public         heap    postgres    false            �            1259    41744    biblioteka_biblioteka_id_seq_1    SEQUENCE     �   CREATE SEQUENCE public.biblioteka_biblioteka_id_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.biblioteka_biblioteka_id_seq_1;
       public          postgres    false    231            �           0    0    biblioteka_biblioteka_id_seq_1    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.biblioteka_biblioteka_id_seq_1 OWNED BY public.biblioteka.biblioteka_id;
          public          postgres    false    230            �            1259    41900    biblioteka_bibliotekarz    TABLE     z   CREATE TABLE public.biblioteka_bibliotekarz (
    bibliotekarz_id integer NOT NULL,
    biblioteka_id integer NOT NULL
);
 +   DROP TABLE public.biblioteka_bibliotekarz;
       public         heap    postgres    false            �            1259    41735    bibliotekarz    TABLE     W  CREATE TABLE public.bibliotekarz (
    bibliotekarz_id integer NOT NULL,
    imie character varying NOT NULL,
    nazwisko character varying NOT NULL,
    email character varying NOT NULL,
    telefon character varying NOT NULL,
    aktywny boolean DEFAULT true NOT NULL,
    login character varying NOT NULL,
    adres_id integer NOT NULL
);
     DROP TABLE public.bibliotekarz;
       public         heap    postgres    false            �            1259    41734     bibliotekarz_bibliotekarz_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bibliotekarz_bibliotekarz_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.bibliotekarz_bibliotekarz_id_seq;
       public          postgres    false    229            �           0    0     bibliotekarz_bibliotekarz_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.bibliotekarz_bibliotekarz_id_seq OWNED BY public.bibliotekarz.bibliotekarz_id;
          public          postgres    false    228            �            1259    41759 	   czytelnik    TABLE     Q  CREATE TABLE public.czytelnik (
    czytelnik_id integer NOT NULL,
    adres_id integer NOT NULL,
    imie character varying NOT NULL,
    nazwisko character varying NOT NULL,
    email character varying NOT NULL,
    telefon character varying NOT NULL,
    aktywny boolean DEFAULT true NOT NULL,
    login character varying NOT NULL
);
    DROP TABLE public.czytelnik;
       public         heap    postgres    false            �            1259    41758    czytelnik_czytelnik_id_seq    SEQUENCE     �   CREATE SEQUENCE public.czytelnik_czytelnik_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.czytelnik_czytelnik_id_seq;
       public          postgres    false    235            �           0    0    czytelnik_czytelnik_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.czytelnik_czytelnik_id_seq OWNED BY public.czytelnik.czytelnik_id;
          public          postgres    false    234            �            1259    41752 	   inwentarz    TABLE     �   CREATE TABLE public.inwentarz (
    inwentarz_id integer NOT NULL,
    ksiazka_id integer NOT NULL,
    biblioteka_id integer NOT NULL
);
    DROP TABLE public.inwentarz;
       public         heap    postgres    false            �            1259    41751    inwentarz_inwentarz_id_seq_1    SEQUENCE     �   CREATE SEQUENCE public.inwentarz_inwentarz_id_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.inwentarz_inwentarz_id_seq_1;
       public          postgres    false    233            �           0    0    inwentarz_inwentarz_id_seq_1    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.inwentarz_inwentarz_id_seq_1 OWNED BY public.inwentarz.inwentarz_id;
          public          postgres    false    232            �            1259    41655    jezyk    TABLE     c   CREATE TABLE public.jezyk (
    jezyk_id integer NOT NULL,
    jezyk character varying NOT NULL
);
    DROP TABLE public.jezyk;
       public         heap    postgres    false            �            1259    41654    jezyk_jezyk_id_seq_1    SEQUENCE     }   CREATE SEQUENCE public.jezyk_jezyk_id_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.jezyk_jezyk_id_seq_1;
       public          postgres    false    212            �           0    0    jezyk_jezyk_id_seq_1    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.jezyk_jezyk_id_seq_1 OWNED BY public.jezyk.jezyk_id;
          public          postgres    false    211            �            1259    41664 	   kategoria    TABLE     o   CREATE TABLE public.kategoria (
    kategoria_id integer NOT NULL,
    kategoria character varying NOT NULL
);
    DROP TABLE public.kategoria;
       public         heap    postgres    false            �            1259    41663    kategoria_kategoria_id_seq    SEQUENCE     �   CREATE SEQUENCE public.kategoria_kategoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.kategoria_kategoria_id_seq;
       public          postgres    false    214            �           0    0    kategoria_kategoria_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.kategoria_kategoria_id_seq OWNED BY public.kategoria.kategoria_id;
          public          postgres    false    213            �            1259    41699    kraj    TABLE     `   CREATE TABLE public.kraj (
    kraj_id integer NOT NULL,
    kraj character varying NOT NULL
);
    DROP TABLE public.kraj;
       public         heap    postgres    false            �            1259    41698    kraj_kraj_id_seq    SEQUENCE     y   CREATE SEQUENCE public.kraj_kraj_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.kraj_kraj_id_seq;
       public          postgres    false    221            �           0    0    kraj_kraj_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.kraj_kraj_id_seq OWNED BY public.kraj.kraj_id;
          public          postgres    false    220            �            1259    41673    ksiazka    TABLE     [  CREATE TABLE public.ksiazka (
    ksiazka_id integer NOT NULL,
    tytul character varying NOT NULL,
    opis character varying NOT NULL,
    data_wydania date NOT NULL,
    czas_wypozyczenia_dni integer NOT NULL,
    ilosc_stron integer NOT NULL,
    cena numeric(10,2) NOT NULL,
    ocena numeric(2,1) NOT NULL,
    jezyk_id integer NOT NULL
);
    DROP TABLE public.ksiazka;
       public         heap    postgres    false            �           0    0    COLUMN ksiazka.ocena    COMMENT     A   COMMENT ON COLUMN public.ksiazka.ocena IS 'ocena od 0.0 do 5.0';
          public          postgres    false    216            �            1259    41681    ksiazka_autor    TABLE     f   CREATE TABLE public.ksiazka_autor (
    ksiazka_id integer NOT NULL,
    autor_id integer NOT NULL
);
 !   DROP TABLE public.ksiazka_autor;
       public         heap    postgres    false            �            1259    41686    ksiazka_kategoria    TABLE     n   CREATE TABLE public.ksiazka_kategoria (
    kategoria_id integer NOT NULL,
    ksiazka_id integer NOT NULL
);
 %   DROP TABLE public.ksiazka_kategoria;
       public         heap    postgres    false            �            1259    41672    ksiazka_ksiazka_id_seq    SEQUENCE        CREATE SEQUENCE public.ksiazka_ksiazka_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.ksiazka_ksiazka_id_seq;
       public          postgres    false    216            �           0    0    ksiazka_ksiazka_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.ksiazka_ksiazka_id_seq OWNED BY public.ksiazka.ksiazka_id;
          public          postgres    false    215            �            1259    41769    wypozyczenie    TABLE     �   CREATE TABLE public.wypozyczenie (
    wypozyczenie_id integer NOT NULL,
    data_wypozyczenia date NOT NULL,
    czytelnik_id integer NOT NULL,
    bibliotekarz_id integer NOT NULL,
    data_oddania date,
    inwentarz_id integer NOT NULL
);
     DROP TABLE public.wypozyczenie;
       public         heap    postgres    false            �            1259    50100    ksiazkainfo    VIEW     �  CREATE VIEW public.ksiazkainfo AS
 SELECT ( SELECT count(*) AS count
           FROM public.wypozyczenie
          WHERE ((wypozyczenie.inwentarz_id = inwentarz.inwentarz_id) AND (wypozyczenie.data_oddania IS NULL))) AS niedostepna,
    ksiazka_kategoria.kategoria_id,
    ksiazka_id,
    ksiazka.tytul,
    ksiazka.opis,
    ksiazka.data_wydania,
    ksiazka.czas_wypozyczenia_dni,
    ksiazka.ilosc_stron,
    ksiazka.cena,
    ksiazka.ocena,
    autor.imie,
    autor.nazwisko,
    inwentarz.biblioteka_id
   FROM ((((public.ksiazka
     JOIN public.ksiazka_kategoria USING (ksiazka_id))
     JOIN public.ksiazka_autor USING (ksiazka_id))
     JOIN public.autor USING (autor_id))
     FULL JOIN public.inwentarz USING (ksiazka_id));
    DROP VIEW public.ksiazkainfo;
       public          postgres    false    210    237    237    233    233    233    218    218    217    217    216    216    216    216    216    216    216    216    210    210            �            1259    41717    miejscowosc    TABLE     �   CREATE TABLE public.miejscowosc (
    miejscowosc_id integer NOT NULL,
    miejscowosc character varying NOT NULL,
    wojewodztwo_id integer NOT NULL
);
    DROP TABLE public.miejscowosc;
       public         heap    postgres    false            �            1259    41716    miejscowosc_miejscowosc_id_seq    SEQUENCE     �   CREATE SEQUENCE public.miejscowosc_miejscowosc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.miejscowosc_miejscowosc_id_seq;
       public          postgres    false    225            �           0    0    miejscowosc_miejscowosc_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.miejscowosc_miejscowosc_id_seq OWNED BY public.miejscowosc.miejscowosc_id;
          public          postgres    false    224            �            1259    41776    oplata    TABLE     �   CREATE TABLE public.oplata (
    oplata_id integer NOT NULL,
    czytelnik_id integer NOT NULL,
    bibliotekarz_id integer NOT NULL,
    wypozyczenie_id integer NOT NULL,
    oplata numeric(10,2) NOT NULL,
    data_zaplaty date NOT NULL
);
    DROP TABLE public.oplata;
       public         heap    postgres    false            �           0    0    TABLE oplata    COMMENT     d   COMMENT ON TABLE public.oplata IS 'oplata za oddanie ksiazki po terminie lub za zgubienie ksiazki';
          public          postgres    false    239            �            1259    41775    oplata_oplata_id_seq    SEQUENCE     }   CREATE SEQUENCE public.oplata_oplata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.oplata_oplata_id_seq;
       public          postgres    false    239            �           0    0    oplata_oplata_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.oplata_oplata_id_seq OWNED BY public.oplata.oplata_id;
          public          postgres    false    238            �            1259    41691 
   uzytkownik    TABLE     o   CREATE TABLE public.uzytkownik (
    login character varying NOT NULL,
    haslo character varying NOT NULL
);
    DROP TABLE public.uzytkownik;
       public         heap    postgres    false            �            1259    41708    wojewodztwo    TABLE     �   CREATE TABLE public.wojewodztwo (
    wojewodztwo_id integer NOT NULL,
    wojewodztwo character varying NOT NULL,
    kraj_id integer NOT NULL
);
    DROP TABLE public.wojewodztwo;
       public         heap    postgres    false            �            1259    41707     wojewodztwo_wojewodztwo_id_seq_1    SEQUENCE     �   CREATE SEQUENCE public.wojewodztwo_wojewodztwo_id_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.wojewodztwo_wojewodztwo_id_seq_1;
       public          postgres    false    223            �           0    0     wojewodztwo_wojewodztwo_id_seq_1    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.wojewodztwo_wojewodztwo_id_seq_1 OWNED BY public.wojewodztwo.wojewodztwo_id;
          public          postgres    false    222            �            1259    41768     wypozyczenie_wypozyczenie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.wypozyczenie_wypozyczenie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.wypozyczenie_wypozyczenie_id_seq;
       public          postgres    false    237            �           0    0     wypozyczenie_wypozyczenie_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.wypozyczenie_wypozyczenie_id_seq OWNED BY public.wypozyczenie.wypozyczenie_id;
          public          postgres    false    236            �           2604    41729    adres adres_id    DEFAULT     p   ALTER TABLE ONLY public.adres ALTER COLUMN adres_id SET DEFAULT nextval('public.adres_adres_id_seq'::regclass);
 =   ALTER TABLE public.adres ALTER COLUMN adres_id DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    41649    autor autor_id    DEFAULT     p   ALTER TABLE ONLY public.autor ALTER COLUMN autor_id SET DEFAULT nextval('public.autor_autor_id_seq'::regclass);
 =   ALTER TABLE public.autor ALTER COLUMN autor_id DROP DEFAULT;
       public          postgres    false    210    209    210            �           2604    41748    biblioteka biblioteka_id    DEFAULT     �   ALTER TABLE ONLY public.biblioteka ALTER COLUMN biblioteka_id SET DEFAULT nextval('public.biblioteka_biblioteka_id_seq_1'::regclass);
 G   ALTER TABLE public.biblioteka ALTER COLUMN biblioteka_id DROP DEFAULT;
       public          postgres    false    230    231    231            �           2604    41738    bibliotekarz bibliotekarz_id    DEFAULT     �   ALTER TABLE ONLY public.bibliotekarz ALTER COLUMN bibliotekarz_id SET DEFAULT nextval('public.bibliotekarz_bibliotekarz_id_seq'::regclass);
 K   ALTER TABLE public.bibliotekarz ALTER COLUMN bibliotekarz_id DROP DEFAULT;
       public          postgres    false    229    228    229            �           2604    41762    czytelnik czytelnik_id    DEFAULT     �   ALTER TABLE ONLY public.czytelnik ALTER COLUMN czytelnik_id SET DEFAULT nextval('public.czytelnik_czytelnik_id_seq'::regclass);
 E   ALTER TABLE public.czytelnik ALTER COLUMN czytelnik_id DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    41755    inwentarz inwentarz_id    DEFAULT     �   ALTER TABLE ONLY public.inwentarz ALTER COLUMN inwentarz_id SET DEFAULT nextval('public.inwentarz_inwentarz_id_seq_1'::regclass);
 E   ALTER TABLE public.inwentarz ALTER COLUMN inwentarz_id DROP DEFAULT;
       public          postgres    false    232    233    233            �           2604    41658    jezyk jezyk_id    DEFAULT     r   ALTER TABLE ONLY public.jezyk ALTER COLUMN jezyk_id SET DEFAULT nextval('public.jezyk_jezyk_id_seq_1'::regclass);
 =   ALTER TABLE public.jezyk ALTER COLUMN jezyk_id DROP DEFAULT;
       public          postgres    false    211    212    212            �           2604    41667    kategoria kategoria_id    DEFAULT     �   ALTER TABLE ONLY public.kategoria ALTER COLUMN kategoria_id SET DEFAULT nextval('public.kategoria_kategoria_id_seq'::regclass);
 E   ALTER TABLE public.kategoria ALTER COLUMN kategoria_id DROP DEFAULT;
       public          postgres    false    214    213    214            �           2604    41702    kraj kraj_id    DEFAULT     l   ALTER TABLE ONLY public.kraj ALTER COLUMN kraj_id SET DEFAULT nextval('public.kraj_kraj_id_seq'::regclass);
 ;   ALTER TABLE public.kraj ALTER COLUMN kraj_id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    41676    ksiazka ksiazka_id    DEFAULT     x   ALTER TABLE ONLY public.ksiazka ALTER COLUMN ksiazka_id SET DEFAULT nextval('public.ksiazka_ksiazka_id_seq'::regclass);
 A   ALTER TABLE public.ksiazka ALTER COLUMN ksiazka_id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    41720    miejscowosc miejscowosc_id    DEFAULT     �   ALTER TABLE ONLY public.miejscowosc ALTER COLUMN miejscowosc_id SET DEFAULT nextval('public.miejscowosc_miejscowosc_id_seq'::regclass);
 I   ALTER TABLE public.miejscowosc ALTER COLUMN miejscowosc_id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    41779    oplata oplata_id    DEFAULT     t   ALTER TABLE ONLY public.oplata ALTER COLUMN oplata_id SET DEFAULT nextval('public.oplata_oplata_id_seq'::regclass);
 ?   ALTER TABLE public.oplata ALTER COLUMN oplata_id DROP DEFAULT;
       public          postgres    false    239    238    239            �           2604    41711    wojewodztwo wojewodztwo_id    DEFAULT     �   ALTER TABLE ONLY public.wojewodztwo ALTER COLUMN wojewodztwo_id SET DEFAULT nextval('public.wojewodztwo_wojewodztwo_id_seq_1'::regclass);
 I   ALTER TABLE public.wojewodztwo ALTER COLUMN wojewodztwo_id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    41772    wypozyczenie wypozyczenie_id    DEFAULT     �   ALTER TABLE ONLY public.wypozyczenie ALTER COLUMN wypozyczenie_id SET DEFAULT nextval('public.wypozyczenie_wypozyczenie_id_seq'::regclass);
 K   ALTER TABLE public.wypozyczenie ALTER COLUMN wypozyczenie_id DROP DEFAULT;
       public          postgres    false    236    237    237            �          0    41726    adres 
   TABLE DATA           V   COPY public.adres (adres_id, kod_pocztowy, miejscowosc_id, ulica_i_numer) FROM stdin;
    public          postgres    false    227   ��       �          0    41646    autor 
   TABLE DATA           9   COPY public.autor (autor_id, imie, nazwisko) FROM stdin;
    public          postgres    false    210   ��       �          0    41745 
   biblioteka 
   TABLE DATA           =   COPY public.biblioteka (biblioteka_id, adres_id) FROM stdin;
    public          postgres    false    231   ҳ       �          0    41900    biblioteka_bibliotekarz 
   TABLE DATA           Q   COPY public.biblioteka_bibliotekarz (bibliotekarz_id, biblioteka_id) FROM stdin;
    public          postgres    false    240   ��       �          0    41735    bibliotekarz 
   TABLE DATA           q   COPY public.bibliotekarz (bibliotekarz_id, imie, nazwisko, email, telefon, aktywny, login, adres_id) FROM stdin;
    public          postgres    false    229   "�       �          0    41759 	   czytelnik 
   TABLE DATA           k   COPY public.czytelnik (czytelnik_id, adres_id, imie, nazwisko, email, telefon, aktywny, login) FROM stdin;
    public          postgres    false    235   ִ       �          0    41752 	   inwentarz 
   TABLE DATA           L   COPY public.inwentarz (inwentarz_id, ksiazka_id, biblioteka_id) FROM stdin;
    public          postgres    false    233   T�       �          0    41655    jezyk 
   TABLE DATA           0   COPY public.jezyk (jezyk_id, jezyk) FROM stdin;
    public          postgres    false    212   �       �          0    41664 	   kategoria 
   TABLE DATA           <   COPY public.kategoria (kategoria_id, kategoria) FROM stdin;
    public          postgres    false    214   ?�       �          0    41699    kraj 
   TABLE DATA           -   COPY public.kraj (kraj_id, kraj) FROM stdin;
    public          postgres    false    221   ��       �          0    41673    ksiazka 
   TABLE DATA           �   COPY public.ksiazka (ksiazka_id, tytul, opis, data_wydania, czas_wypozyczenia_dni, ilosc_stron, cena, ocena, jezyk_id) FROM stdin;
    public          postgres    false    216   �       �          0    41681    ksiazka_autor 
   TABLE DATA           =   COPY public.ksiazka_autor (ksiazka_id, autor_id) FROM stdin;
    public          postgres    false    217   ��       �          0    41686    ksiazka_kategoria 
   TABLE DATA           E   COPY public.ksiazka_kategoria (kategoria_id, ksiazka_id) FROM stdin;
    public          postgres    false    218   r�       �          0    41717    miejscowosc 
   TABLE DATA           R   COPY public.miejscowosc (miejscowosc_id, miejscowosc, wojewodztwo_id) FROM stdin;
    public          postgres    false    225   ��       �          0    41776    oplata 
   TABLE DATA           q   COPY public.oplata (oplata_id, czytelnik_id, bibliotekarz_id, wypozyczenie_id, oplata, data_zaplaty) FROM stdin;
    public          postgres    false    239   @�       �          0    41691 
   uzytkownik 
   TABLE DATA           2   COPY public.uzytkownik (login, haslo) FROM stdin;
    public          postgres    false    219   t�       �          0    41708    wojewodztwo 
   TABLE DATA           K   COPY public.wojewodztwo (wojewodztwo_id, wojewodztwo, kraj_id) FROM stdin;
    public          postgres    false    223   ��       �          0    41769    wypozyczenie 
   TABLE DATA           �   COPY public.wypozyczenie (wypozyczenie_id, data_wypozyczenia, czytelnik_id, bibliotekarz_id, data_oddania, inwentarz_id) FROM stdin;
    public          postgres    false    237   ��       �           0    0    adres_adres_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.adres_adres_id_seq', 6, true);
          public          postgres    false    226            �           0    0    autor_autor_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.autor_autor_id_seq', 116, true);
          public          postgres    false    209            �           0    0    biblioteka_biblioteka_id_seq_1    SEQUENCE SET     L   SELECT pg_catalog.setval('public.biblioteka_biblioteka_id_seq_1', 3, true);
          public          postgres    false    230            �           0    0     bibliotekarz_bibliotekarz_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.bibliotekarz_bibliotekarz_id_seq', 7, true);
          public          postgres    false    228            �           0    0    czytelnik_czytelnik_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.czytelnik_czytelnik_id_seq', 6, true);
          public          postgres    false    234            �           0    0    inwentarz_inwentarz_id_seq_1    SEQUENCE SET     L   SELECT pg_catalog.setval('public.inwentarz_inwentarz_id_seq_1', 107, true);
          public          postgres    false    232            �           0    0    jezyk_jezyk_id_seq_1    SEQUENCE SET     B   SELECT pg_catalog.setval('public.jezyk_jezyk_id_seq_1', 2, true);
          public          postgres    false    211            �           0    0    kategoria_kategoria_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.kategoria_kategoria_id_seq', 45, true);
          public          postgres    false    213            �           0    0    kraj_kraj_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.kraj_kraj_id_seq', 237, true);
          public          postgres    false    220            �           0    0    ksiazka_ksiazka_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.ksiazka_ksiazka_id_seq', 239, true);
          public          postgres    false    215            �           0    0    miejscowosc_miejscowosc_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.miejscowosc_miejscowosc_id_seq', 918, true);
          public          postgres    false    224            �           0    0    oplata_oplata_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.oplata_oplata_id_seq', 3, true);
          public          postgres    false    238            �           0    0     wojewodztwo_wojewodztwo_id_seq_1    SEQUENCE SET     O   SELECT pg_catalog.setval('public.wojewodztwo_wojewodztwo_id_seq_1', 17, true);
          public          postgres    false    222            �           0    0     wypozyczenie_wypozyczenie_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.wypozyczenie_wypozyczenie_id_seq', 9, true);
          public          postgres    false    236            �           2606    41733    adres adres_id 
   CONSTRAINT     R   ALTER TABLE ONLY public.adres
    ADD CONSTRAINT adres_id PRIMARY KEY (adres_id);
 8   ALTER TABLE ONLY public.adres DROP CONSTRAINT adres_id;
       public            postgres    false    227            �           2606    41653    autor autor_id 
   CONSTRAINT     R   ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_id PRIMARY KEY (autor_id);
 8   ALTER TABLE ONLY public.autor DROP CONSTRAINT autor_id;
       public            postgres    false    210            �           2606    41904 2   biblioteka_bibliotekarz biblioteka_bibliotekarz_id 
   CONSTRAINT     �   ALTER TABLE ONLY public.biblioteka_bibliotekarz
    ADD CONSTRAINT biblioteka_bibliotekarz_id PRIMARY KEY (bibliotekarz_id, biblioteka_id);
 \   ALTER TABLE ONLY public.biblioteka_bibliotekarz DROP CONSTRAINT biblioteka_bibliotekarz_id;
       public            postgres    false    240    240            �           2606    41750    biblioteka biblioteka_id 
   CONSTRAINT     a   ALTER TABLE ONLY public.biblioteka
    ADD CONSTRAINT biblioteka_id PRIMARY KEY (biblioteka_id);
 B   ALTER TABLE ONLY public.biblioteka DROP CONSTRAINT biblioteka_id;
       public            postgres    false    231            �           2606    41743    bibliotekarz bibliotekarz_id 
   CONSTRAINT     g   ALTER TABLE ONLY public.bibliotekarz
    ADD CONSTRAINT bibliotekarz_id PRIMARY KEY (bibliotekarz_id);
 F   ALTER TABLE ONLY public.bibliotekarz DROP CONSTRAINT bibliotekarz_id;
       public            postgres    false    229            �           2606    41767    czytelnik czytelnik_id 
   CONSTRAINT     ^   ALTER TABLE ONLY public.czytelnik
    ADD CONSTRAINT czytelnik_id PRIMARY KEY (czytelnik_id);
 @   ALTER TABLE ONLY public.czytelnik DROP CONSTRAINT czytelnik_id;
       public            postgres    false    235            �           2606    41757    inwentarz inwentarz_id 
   CONSTRAINT     ^   ALTER TABLE ONLY public.inwentarz
    ADD CONSTRAINT inwentarz_id PRIMARY KEY (inwentarz_id);
 @   ALTER TABLE ONLY public.inwentarz DROP CONSTRAINT inwentarz_id;
       public            postgres    false    233            �           2606    41662    jezyk jezyk_id 
   CONSTRAINT     R   ALTER TABLE ONLY public.jezyk
    ADD CONSTRAINT jezyk_id PRIMARY KEY (jezyk_id);
 8   ALTER TABLE ONLY public.jezyk DROP CONSTRAINT jezyk_id;
       public            postgres    false    212            �           2606    41671    kategoria kategoria_id 
   CONSTRAINT     ^   ALTER TABLE ONLY public.kategoria
    ADD CONSTRAINT kategoria_id PRIMARY KEY (kategoria_id);
 @   ALTER TABLE ONLY public.kategoria DROP CONSTRAINT kategoria_id;
       public            postgres    false    214            �           2606    41706    kraj kraj_id 
   CONSTRAINT     O   ALTER TABLE ONLY public.kraj
    ADD CONSTRAINT kraj_id PRIMARY KEY (kraj_id);
 6   ALTER TABLE ONLY public.kraj DROP CONSTRAINT kraj_id;
       public            postgres    false    221            �           2606    41685    ksiazka_autor ksiazka_autor_id 
   CONSTRAINT     n   ALTER TABLE ONLY public.ksiazka_autor
    ADD CONSTRAINT ksiazka_autor_id PRIMARY KEY (ksiazka_id, autor_id);
 H   ALTER TABLE ONLY public.ksiazka_autor DROP CONSTRAINT ksiazka_autor_id;
       public            postgres    false    217    217            �           2606    41680    ksiazka ksiazka_id 
   CONSTRAINT     X   ALTER TABLE ONLY public.ksiazka
    ADD CONSTRAINT ksiazka_id PRIMARY KEY (ksiazka_id);
 <   ALTER TABLE ONLY public.ksiazka DROP CONSTRAINT ksiazka_id;
       public            postgres    false    216            �           2606    41690 &   ksiazka_kategoria ksiazka_kategoria_id 
   CONSTRAINT     z   ALTER TABLE ONLY public.ksiazka_kategoria
    ADD CONSTRAINT ksiazka_kategoria_id PRIMARY KEY (kategoria_id, ksiazka_id);
 P   ALTER TABLE ONLY public.ksiazka_kategoria DROP CONSTRAINT ksiazka_kategoria_id;
       public            postgres    false    218    218            �           2606    41697    uzytkownik login 
   CONSTRAINT     Q   ALTER TABLE ONLY public.uzytkownik
    ADD CONSTRAINT login PRIMARY KEY (login);
 :   ALTER TABLE ONLY public.uzytkownik DROP CONSTRAINT login;
       public            postgres    false    219            �           2606    41724    miejscowosc miejscowosc_id 
   CONSTRAINT     d   ALTER TABLE ONLY public.miejscowosc
    ADD CONSTRAINT miejscowosc_id PRIMARY KEY (miejscowosc_id);
 D   ALTER TABLE ONLY public.miejscowosc DROP CONSTRAINT miejscowosc_id;
       public            postgres    false    225            �           2606    41781    oplata oplata_id 
   CONSTRAINT     U   ALTER TABLE ONLY public.oplata
    ADD CONSTRAINT oplata_id PRIMARY KEY (oplata_id);
 :   ALTER TABLE ONLY public.oplata DROP CONSTRAINT oplata_id;
       public            postgres    false    239            �           2606    41715    wojewodztwo wojewodztwo_id 
   CONSTRAINT     d   ALTER TABLE ONLY public.wojewodztwo
    ADD CONSTRAINT wojewodztwo_id PRIMARY KEY (wojewodztwo_id);
 D   ALTER TABLE ONLY public.wojewodztwo DROP CONSTRAINT wojewodztwo_id;
       public            postgres    false    223            �           2606    41774    wypozyczenie wypozyczenie_id 
   CONSTRAINT     g   ALTER TABLE ONLY public.wypozyczenie
    ADD CONSTRAINT wypozyczenie_id PRIMARY KEY (wypozyczenie_id);
 F   ALTER TABLE ONLY public.wypozyczenie DROP CONSTRAINT wypozyczenie_id;
       public            postgres    false    237            �           2606    41847    biblioteka adres_biblioteka_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.biblioteka
    ADD CONSTRAINT adres_biblioteka_fk FOREIGN KEY (adres_id) REFERENCES public.adres(adres_id);
 H   ALTER TABLE ONLY public.biblioteka DROP CONSTRAINT adres_biblioteka_fk;
       public          postgres    false    227    3286    231            �           2606    41842 "   bibliotekarz adres_bibliotekarz_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.bibliotekarz
    ADD CONSTRAINT adres_bibliotekarz_fk FOREIGN KEY (adres_id) REFERENCES public.adres(adres_id);
 L   ALTER TABLE ONLY public.bibliotekarz DROP CONSTRAINT adres_bibliotekarz_fk;
       public          postgres    false    227    3286    229            �           2606    41837    czytelnik adres_czytelnik_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.czytelnik
    ADD CONSTRAINT adres_czytelnik_fk FOREIGN KEY (adres_id) REFERENCES public.adres(adres_id);
 F   ALTER TABLE ONLY public.czytelnik DROP CONSTRAINT adres_czytelnik_fk;
       public          postgres    false    3286    235    227            �           2606    41782 $   ksiazka_autor autor_ksiazka_autor_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ksiazka_autor
    ADD CONSTRAINT autor_ksiazka_autor_fk FOREIGN KEY (autor_id) REFERENCES public.autor(autor_id);
 N   ALTER TABLE ONLY public.ksiazka_autor DROP CONSTRAINT autor_ksiazka_autor_fk;
       public          postgres    false    210    3266    217            �           2606    41910 =   biblioteka_bibliotekarz biblioteka_biblioteka_bibliotekarz_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.biblioteka_bibliotekarz
    ADD CONSTRAINT biblioteka_biblioteka_bibliotekarz_fk FOREIGN KEY (biblioteka_id) REFERENCES public.biblioteka(biblioteka_id);
 g   ALTER TABLE ONLY public.biblioteka_bibliotekarz DROP CONSTRAINT biblioteka_biblioteka_bibliotekarz_fk;
       public          postgres    false    240    231    3290            �           2606    41872 !   inwentarz biblioteka_inwentarz_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.inwentarz
    ADD CONSTRAINT biblioteka_inwentarz_fk FOREIGN KEY (biblioteka_id) REFERENCES public.biblioteka(biblioteka_id);
 K   ALTER TABLE ONLY public.inwentarz DROP CONSTRAINT biblioteka_inwentarz_fk;
       public          postgres    false    3290    233    231            �           2606    41905 ?   biblioteka_bibliotekarz bibliotekarz_biblioteka_bibliotekarz_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.biblioteka_bibliotekarz
    ADD CONSTRAINT bibliotekarz_biblioteka_bibliotekarz_fk FOREIGN KEY (bibliotekarz_id) REFERENCES public.bibliotekarz(bibliotekarz_id);
 i   ALTER TABLE ONLY public.biblioteka_bibliotekarz DROP CONSTRAINT bibliotekarz_biblioteka_bibliotekarz_fk;
       public          postgres    false    3288    240    229            �           2606    41862    oplata bibliotekarz_oplata_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.oplata
    ADD CONSTRAINT bibliotekarz_oplata_fk FOREIGN KEY (bibliotekarz_id) REFERENCES public.bibliotekarz(bibliotekarz_id);
 G   ALTER TABLE ONLY public.oplata DROP CONSTRAINT bibliotekarz_oplata_fk;
       public          postgres    false    239    229    3288            �           2606    41857 )   wypozyczenie bibliotekarz_wypozyczenie_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.wypozyczenie
    ADD CONSTRAINT bibliotekarz_wypozyczenie_fk FOREIGN KEY (bibliotekarz_id) REFERENCES public.bibliotekarz(bibliotekarz_id);
 S   ALTER TABLE ONLY public.wypozyczenie DROP CONSTRAINT bibliotekarz_wypozyczenie_fk;
       public          postgres    false    229    237    3288            �           2606    41887    oplata czytelnik_oplata_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.oplata
    ADD CONSTRAINT czytelnik_oplata_fk FOREIGN KEY (czytelnik_id) REFERENCES public.czytelnik(czytelnik_id);
 D   ALTER TABLE ONLY public.oplata DROP CONSTRAINT czytelnik_oplata_fk;
       public          postgres    false    3294    239    235            �           2606    41882 &   wypozyczenie czytelnik_wypozyczenie_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.wypozyczenie
    ADD CONSTRAINT czytelnik_wypozyczenie_fk FOREIGN KEY (czytelnik_id) REFERENCES public.czytelnik(czytelnik_id);
 P   ALTER TABLE ONLY public.wypozyczenie DROP CONSTRAINT czytelnik_wypozyczenie_fk;
       public          postgres    false    235    3294    237            �           2606    41877 &   wypozyczenie inwentarz_wypozyczenie_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.wypozyczenie
    ADD CONSTRAINT inwentarz_wypozyczenie_fk FOREIGN KEY (inwentarz_id) REFERENCES public.inwentarz(inwentarz_id);
 P   ALTER TABLE ONLY public.wypozyczenie DROP CONSTRAINT inwentarz_wypozyczenie_fk;
       public          postgres    false    3292    237    233            �           2606    41787    ksiazka jezyk_ksiazka_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.ksiazka
    ADD CONSTRAINT jezyk_ksiazka_fk FOREIGN KEY (jezyk_id) REFERENCES public.jezyk(jezyk_id);
 B   ALTER TABLE ONLY public.ksiazka DROP CONSTRAINT jezyk_ksiazka_fk;
       public          postgres    false    216    3268    212            �           2606    41792 0   ksiazka_kategoria kategoria_ksiazka_kategoria_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ksiazka_kategoria
    ADD CONSTRAINT kategoria_ksiazka_kategoria_fk FOREIGN KEY (kategoria_id) REFERENCES public.kategoria(kategoria_id);
 Z   ALTER TABLE ONLY public.ksiazka_kategoria DROP CONSTRAINT kategoria_ksiazka_kategoria_fk;
       public          postgres    false    3270    214    218            �           2606    41807    inwentarz ksiazka_inwentarz_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.inwentarz
    ADD CONSTRAINT ksiazka_inwentarz_fk FOREIGN KEY (ksiazka_id) REFERENCES public.ksiazka(ksiazka_id);
 H   ALTER TABLE ONLY public.inwentarz DROP CONSTRAINT ksiazka_inwentarz_fk;
       public          postgres    false    3272    216    233            �           2606    41802 &   ksiazka_autor ksiazka_ksiazka_autor_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ksiazka_autor
    ADD CONSTRAINT ksiazka_ksiazka_autor_fk FOREIGN KEY (ksiazka_id) REFERENCES public.ksiazka(ksiazka_id);
 P   ALTER TABLE ONLY public.ksiazka_autor DROP CONSTRAINT ksiazka_ksiazka_autor_fk;
       public          postgres    false    217    3272    216            �           2606    41797 .   ksiazka_kategoria ksiazka_ksiazka_kategoria_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ksiazka_kategoria
    ADD CONSTRAINT ksiazka_ksiazka_kategoria_fk FOREIGN KEY (ksiazka_id) REFERENCES public.ksiazka(ksiazka_id);
 X   ALTER TABLE ONLY public.ksiazka_kategoria DROP CONSTRAINT ksiazka_ksiazka_kategoria_fk;
       public          postgres    false    216    218    3272            �           2606    41832    adres miasto_adres_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.adres
    ADD CONSTRAINT miasto_adres_fk FOREIGN KEY (miejscowosc_id) REFERENCES public.miejscowosc(miejscowosc_id);
 ?   ALTER TABLE ONLY public.adres DROP CONSTRAINT miasto_adres_fk;
       public          postgres    false    225    227    3284            �           2606    41822 "   wojewodztwo panstwo_wojewodztwo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.wojewodztwo
    ADD CONSTRAINT panstwo_wojewodztwo_fk FOREIGN KEY (kraj_id) REFERENCES public.kraj(kraj_id);
 L   ALTER TABLE ONLY public.wojewodztwo DROP CONSTRAINT panstwo_wojewodztwo_fk;
       public          postgres    false    221    3280    223            �           2606    41817 '   bibliotekarz uzytkownik_bibliotekarz_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.bibliotekarz
    ADD CONSTRAINT uzytkownik_bibliotekarz_fk FOREIGN KEY (login) REFERENCES public.uzytkownik(login);
 Q   ALTER TABLE ONLY public.bibliotekarz DROP CONSTRAINT uzytkownik_bibliotekarz_fk;
       public          postgres    false    3278    219    229            �           2606    41812 !   czytelnik uzytkownik_czytelnik_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.czytelnik
    ADD CONSTRAINT uzytkownik_czytelnik_fk FOREIGN KEY (login) REFERENCES public.uzytkownik(login);
 K   ALTER TABLE ONLY public.czytelnik DROP CONSTRAINT uzytkownik_czytelnik_fk;
       public          postgres    false    219    3278    235            �           2606    41827 &   miejscowosc wojewodztwo_miejscowosc_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.miejscowosc
    ADD CONSTRAINT wojewodztwo_miejscowosc_fk FOREIGN KEY (wojewodztwo_id) REFERENCES public.wojewodztwo(wojewodztwo_id);
 P   ALTER TABLE ONLY public.miejscowosc DROP CONSTRAINT wojewodztwo_miejscowosc_fk;
       public          postgres    false    3282    223    225            �           2606    41892    oplata wypozyczenie_oplata_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.oplata
    ADD CONSTRAINT wypozyczenie_oplata_fk FOREIGN KEY (wypozyczenie_id) REFERENCES public.wypozyczenie(wypozyczenie_id);
 G   ALTER TABLE ONLY public.oplata DROP CONSTRAINT wypozyczenie_oplata_fk;
       public          postgres    false    237    239    3296            �   Q   x�3�42653�4���L�*NNT042�2����D�!�ƜffF@QS��!�	TМ3�<3�$�,j�E��Ԅˌ��x�  !V      �   �  x�mV�r�F]��
~@�"^$����iI,R�&�l.����j f��U��o��gx�dg��4 ��X;�����s΅G�;˩ٳV�ڵ2������m!K�4�ژ����]]V�f���h����믿e�"�+Y�K[ѩ�e%"��ZUvO���2/U��2WbBǲd+i�v,���^3~�U���J��開Ln�R��)�"�K��Vf��E�t.�1�t�����^K����l�(�j
����Ε��Z+���u^6��QY[�[)�ۺ���-c�M[�cW+/�������U�ivKog�����&�����ګ痁EjT`�*m��^qez�ifs��~s���s%�&Ꮑh�8\���z+|U�5[v�s���}zǚV\���m���h��V�����폨��LjG��Uz#�����'��MqC*sZʍҊ��8�\��o9��JK;�
W1k�e.�R���V�W,�NN�~\������jv9[�D��mhUI�E|�� �i!T���@t�����sT%+@Sי2��e����968*v���|�+h=7{&Hh�k�+���ЬpL?�B�NN�,Fا��/����E�������3+�r�x����N�O�W�KBc
vO t��R����Q(�lQN��8U�p��P_8����et�PN�
��t���m+~Rie�,Uft�kј�aUX�BZ8fstnk�q�`�љ���o��ts}I'?�/���D���d�dH��lE�u������MEN��"�$*�� �U���"���U��9�;��0F���/�;=����I�8m�6GŴx��|�)]�%�I�B*-&��gὡ�\���?>�L�ќ��9g�b�IH����.L��b�	�q��b29,�Z����5.�f1J�*�+1�{t������E����s��,��מ�tV#�r1�h^w��3����� �b��*7�n�Ou�8y��6�����okы)��p9p��Rg�*ө�9�������U�1�p&��-��!9�G�Qa.�18� ßr#����h��xdne�m�q�}ų��wbi�����Z}|�U��Q_��f�v�簈m�=5�Ju0R-+���/m�����b�\L"��� Z�=u�<��ο|�s1�m��^Ì{C��K[6����-�eG/`F��B/�FB������c�Hj+s�#9������/3anr�/���V�o�K"�c��	�	�^��y��*d\#0 Y�!cR�$|�@�6I��tJ`7%=<:�Y<� Xܗ�,j��8��q��r�.k���Mn�������s��&�J����צ�8�����hj�/�1VǓ�o0
��iJ�ݠ�.���8��p��uY�o�q�|J���$}�>�~tA�>(0��sx�� +,���tl��e��B@wM�0�|Pm
�o}>'�,{������wa��!���=�      �      x�3�4�2�4����� ��      �      x�3�4�2bS 6bs ����� (J	      �   �   x����� E��W�M�\����B[�b[H c�����᝜�$����j�_)��^�u{n��C��o!�w��B���o(&1�q´L3�$�Me�� .EɲM��l$S4��x���c7۸Ғ�R�hv�ُ�>q)H0}ӕ�	yҊ�lav�|rkc:#L�      �   n   x��ͱ�0���1��13S��]ՕB$����C7ֻw:�`R�nV�W�z����ZZj�YɌ8�咽I�����+G�������>�s�i@��������.3      �   �  x�-���0��b���K��#3t.+J^� ��/-����kgm����~�n����ߵ��^��������$�Ҫ��.3@{��>,��m���?���x)�a;�2�䡸y�� ��.�[py*ٙe�Tz3'�Af�@dZpyJFf��;�)�C^�AoVqN�@^�B�1B^^��,�8Ȓ< /5�K2�����l��S�W`%�v�dێ�l�'�c�r욐�
1�3�3�S�sW�#������(cA�&�K^>��<�|Ճ�\��)W�x��
<��'��7앃���
6�W��^��+p��U!v�+G�oq�Iq����b;�-�.9�����3���]Th�
hѲį� ��7����*8��@h 5$К/� jL�}������*��߄��7"��i|�a}�S�}V���M�^����<� Ѝ�o      �      x�3�,���,��2�L�K�b���� [��      �   >  x�5��j�0�ϻS�;α-I��ā^zQ�M�Ԗ�$��]z�hf>I�s�	tk�-�p�F�ܘ��"������0�pS˚)&l�D��"��WT����#](����{v�g���7wGe�ҙ�GUÁܔo��s~4�8����!��e����.2YW"΄ZI\ɣ֢�"j�<�G:X�]^�8k	2�6��ȃ�Po��'1�x�§�ݹ��`L|-L�0�d��ђ��������-�����9�1�4]�M��0�����9���_B���E��j8E�KZ#���Z�f��5|Q��~?!�t��      �   r  x�]�QW�<���_ỽjO�8�}	(%�Y�������Je����3v(ݽ!�Ȳg4=bu�c�3�kZS�D]��.��F~=�^�����5Qbc�hi*o�T]ԅ��j�K�3�+�9�u��D��K�]at<RakyRc��71�n��u״��2��HܟlX��x㩺4;S�F�3��8F3d�-Ma���s%^M���ԥ-M萱ȭ�*�$"���d���D�"B%�&u�����͗�0�����U}��d��U��ܷ͛��`N��c׺f���u�G��#t�u���1������rkd�cb�oG7��z���Յ�㉺2��2m*��k=��kC��u�ы����X���H]��9��1l�=t��mt���)t���J�ӱ֕��ʗ�ZKa��| �)!x
@���~��(<=�A�D�[��{�.X=!��M+ŅO��	>�٧	NOv���k��/�����Ñ��;L&̩+�z2U_~���Z�'3��W��0&�o�Ǣ'���tK�ӑ�����꺤���a<Q׿:�zv��n;W[�X]��Ad����K9O'��9=U7�����2�1R����M3u�~:=���eL�F�&�zc�,Fٚd�U
l��,|y�m���Xݚ5U0K��&��z�9EJ�g3u�뿒�[��Z�,W��Z�e�^Ad�}Me��%C��݁Yc�*���������agC�أ��8�(��էKG�w:�qw��\}5����W�-��y���.p��D�6�����kWs<�:O����!�uW�Qȧ"���|��Ȟ�3������x4R��J�<MF1v0�D&�5�5V� ��L<Jч~�D}�A����E?:S��d�����(S��>ʋ��w��)Yp7R���E���������NR�����on����t�۝GO�ܭ{$��M&��`֑ĻÝx�s��imݴV���uf �Hͻ�-��3Vfc�>TD����X�ٚfC����~c5�Q��M�(ܫe@C�d"Zy��B�3e���c�� W���YL	��0����:�+q}��D����B��	�=���/�*�(|m�Y�Hn�~N.i���3H(fc����� �6� |�'9J}|`��TW�H�h*��/�	2����e	-X
�B�?�H�Ʋ�\�G�]��=�PQF�[3+h|���.�J���Q�A�����ߣ?|�a��2��8BB��6ǔ��-�<|3�7D�g�ߵ#�0��Q�a��X,8Dن��1\�
ppa\���3b�����A��J� �+���=\�vc\W��n�@႘���.�L��Za��ῌ ,�O���(�䫡���W,K�nla��L����%0qI�r��VZ�8ܻ�m���Ѿ:�7��y������^8j��S�bJ�?��/��+���:,���>Ѱ�I���pFH��x�`vi�ݫI �]�|5x_0�q0:�dY]�z<���,�|�#�]�Q�0�]���}Q�,�Ds�ew����%�Ed%gl߿����Ł�4��ӈ����P^r!��M�y�\�Pz����5��˃�v	�^�M�����3JPz�qpz�jh]C�g�[����'��7�ͤ��|�$�C�����pF�	�(�c`��N!��+�ӝOD�W�>������Μ?�W���[	p_y�������1J@�
6ɻS�b!�0C�+�6��ZQ�M���\?	8)��D���X���|�l���H������oHP���C���S5��]k�!ו��X�?}pOm^���в=O��s��c�p	<���=q�������_��������6�c�׆�uӵ��J������da���J������	%��]�6�7���Yk�_���Y      �      x��Z�r�J�]�~Eͮ;����XM�ۖi=B�[m�lJd�A
 l����~�ݴ�?ë��N�̗�ɪ@ڦ�{m���2�<�۱۲,���y��6�E>-?o�����O�*/���l��(�57N�O�aǡ;��c��O�c��X�e��/���	�V6������"YcXL�J�ժ�������e�+X�4�8���f�6��+�����4Kļl�:Am\��*�n��36+��$�؟k,���5|״��x��&�������z�D�|M�ݭ��z!X��<+�b�N��"��8�\,�=Í����i1����ܳ���Z�l�*��k��;���Jf���M+������&KR�0��|ͳ���ɳ���S�L��=!�j�X4�Z-pC#�J>�)���"-����41ٹ
�vz8��h��#��-�t����x0_�3lp]OM��<�v �����eDl\U8[�y���.��2,��D��I3�3Ql�E���D;�vm�1|ǌ�66���ev��s6`�FkXzƪ|�l㪩V2��HnR�Ȏ\a�M�i�����b%fb�n���@4vNشK��?2q��q��3�U�&�;{�8)���N�w� '[�B����cxڨ��3����Ô�)���:���kS�Zy�/�_�l� �W����O�]Kn<������Yj���y����M>�8 �6�&	�j���ڶg{�b[�$b���B�����Wl�=}����@걘���<�O���
(���Zh�$b��\�HQ��Z3DI.Lv�">��D��D`[�G�V������3�&�O��m��8��Rq.o��1�PnЈ�z'4�El�����WUQ����R>�P�Ό�6�E���_5b��9hqdェ�:!�� �q6.���/O*v� ��Yأ�ud2+�Dm;4��φG��Oj ����>���
����ft��wW�@0��5 9�b��ԧؗ��r/��P�h�\&�eb�y���hr�e�^�
Bj�-��h,6��MX8m~=d篯�'&�]ݾ�f��c�W@���X���.�
j����5��?`����+����"��m�pzӮ%�Dݡ�(/��f���W,Gyi�G�ypa�m44^=~n�;v*��w�Da��U�h�s�g"�y���v(��M+
��=F�+��S^�y
��6=�Q��(�;���C}�@[l�8�t���e�Mɻ{����tM��c�a���-�H��2��}I'��]/ċۥ=ry�%˼x�(G)D�@�b)�_!K4m]��*?3�E[��Hm׌:��6���tf3~��gK���
�1��j�.�����;'��7�A�ch�
0JWE����䞼�_�+��y���>�O�ǝ<��:��E�\)ɧ��Ǳ"])��,bcb$m�����"ϮQ�橪�?ExX�vÁ!Az�8�,�&b5��cOѶ<BL��M�M{�и�����u�^���s�a��{^N6��������C��<��mz���ˬ�(�T���H���_?�r��|!��((���-��4����L�W�qZ�Q��0ʗ���k�^'J[�QQ�L^��X�.�:�|�c��<+AT�E��}���� �ٿ�W��l)��d����F��}��ꝧ�Fd�H�'���r��P�2&c�|�����k�OI��S6dӜ��P��4�G�7�S�PT��2Y�p<w�j)�<���,i�ߑ(Xػ��5�M�l$��)�0M!ZV����l�+g����{w���ҶR6�a)��%eMrt�O5�w"�DR�	Օ(ϵ�M*���FC�h���Ɓ��Gb#��Y����U��lo���3���sA�����D���pM��j��.� �R��$�F��>���R������? ������#cL�k��!]�TP?"��e�:M p��KQ��/�"�lG�@��0�i.����"�C<}ds��ʧ���e�ܮ.�.)2Y0t���?'ل��g��E>�g���ߔ̦��֏�!�s
ׁ�۪4)����{�LCg�b����1aXh����AR��)Đ��	í>��Q��X�z �y��N��1zȱ�������d��DW�����;��/'��@��b �����ox�u-"��5��eF��C�'�:K��(�u4֪C��@E����o��˼YB��bf�e�v*S�<�댂� Ƶ�UA&�O�a��9�Q�Zo���6�
⥶%�{�X�Ջ�RE��	��Ժ`܋�ƧNB�z(�E�p턣�ZFi�E# �^��؀X�1��|�q�����$Aá��۳(�����x[�a^�<����\�o����	_?�v9Bssrv2:CW�nφO��n��"P��rN)���gz_��:�wI�.�"C���q�uD���2��O'6ݮWA�z��j4b��W÷�~{|�n뿆�t�zxyu}3��XrK
WVÚ��ڠK3�i���n>Pi����}R�Q+>A���Ae�Xr�6��	zgz�u����l�,jxH�" ��<P������˓���ѵ���)��Q����=�%�������nȇ�T�e���_>�v=��'W��'Cvu{�f�8������[vqy;�9?>;ci���7g���K�c���G��k��?�į��.;37Y�=�����u��^k���J~~-�,/؟�ƁJ�nYvP?�|���L)o�f.�����LD1ٝ�D6吞}!�('{��H�"��!��Bk�V��j2�;ĕJNx�MP��!Ҿ�#�6����Dc�Q�vm�[���2��<"l���_3���F�Y���mWZtZ��V���^�ďR鱇�݂&�H��v��_ꇼ�3�Ĝ�xȍ�Kؘ�(�jk�
ҵ}��^;��V>O���3��e�S1�������(V����^�*��"�w����<L,�n�3ƹ���}ŧ�d��3H�t�J4	�,���f��1�A ag���c`�%K��_]��>��7P|�]���?6��^�:���~(�y�҈�m�g�4�u��	��Pk�����E��P�ϧw��d�ĒuY�*�����,�[ś�6�o'�9�ϒ��u��G��;��C�S]C�+;��q���N9����N���K��&t�9H O�_��!z�e+�NN��5Q�59�ω�!�W�|UnMB�d��U͐�`�j�A�bl�iu|%���L��l�d4��_�~TD�n��e��L.�����V֭`H~pGrN�����eiː�M>���/a�M�!�O5<�끤M�_��b���m�J�&�鏮�G^��<6�ȴڻ?]�tVV+
��`��ȤWQ�*Aٴ{�Ƙ/y�����������ncg9$���*fI&J�\�?�X�����Јˍ�ffA,���z}7J����$BѠPsI��1W��1��$Q��Z`�l'e2�6g�w�x��&�v�P�����?�U��X��O}��W���1���ۅ����T��9QRJ��Cv��Z˓�g�v$�:�GB=t;C�qL3i�]�q�
��o)�P^F�L�-kG.;�W:_Z��������=%GE�_�F1}������l�B]���P^Ѳu���y�~Ρ��UA�
I�x�A�R]640�*?�&>DV�v)�������4�&>�#{��+�s]��Q���L�*���f����~�ZJ���=؊�ĩ�;[9mg3h�
�^!0���u�lҊ���$���z�S��u�R�s����y*�(P�9��+���3E3W|�
�6�Rd�[�$Q'��������]�����Z[�9|�:Ϧ5U/�O�j��{���;���z�p=�B�@���#g�W���"Y�Rq|[K���{�3/�(�@۶M��`A%_����c��������z�㴡E�@�-�2�MB}H�N�t%k��h�CX���Y��B�3�@�����]T�q���AhbB-��'�*6���ͷHe��U��sh��>�4� ���B �  �*%�_(wHO��+�u��HW�[�[�n���5���_>��.B��\��8g�53����w�'�+�>"��[���)+Q_hl�g=[W-j�ԊØ&�1���ʷ��|ɨl�v��W=�<����^����Q�|�c���-rv�LxY�i������O$�Q�ښ%��"/��ԛwv�Tw�9L�y�,[�B!"����\�'V��PP��l���r۷�n靸}��
=m�(g�Q�@�^�\��{���2xj���C�v�67NĴ�*�Ĵ��]M���r��pbY�$�DD���.i�����E�C-�g�����"H�8���C�H��`�z��@(%���	���,3藏���^��¾IY�(��p>�]��-�9]��*��t�0�{��}��?�_~���G;Kr      �   �  x��ˍ�H��-c�?���ߎ	��
��2�M�3w93�����f+��b��y����2M�t�c���i��8V� F�+���a䓁$��<J�%S��%Gɖ���Qr�(yr�zr�29J��x�JJ��Z�R�@�U��)P�)P�(�J�%J��K��|�%J��O�2O�2�DW�L�P&U(S*�i��aQfU(s*�}*�5ʺeC���F�R�l�Qv�(����}wO�u��:�֥��Ki��5X7�[�q����4�2Ͳ\s��>Vj�UZg�6X�M�j�uZ#3-���B�b�C�ҡX�Plt(�:;�?
�
�
�ڃ��}8_��n�!Q�=(ڵ�E�����ۃ�k�/b��bj�/cr��cz�/d���d��/e��������r��      �   s  x�%R�q 1{�b2F6���:"���?7�t���KKEeE�
���=U̺8�·>`�ta�Ks=.H����={�F�C�ִX�K�}Y�P^#�|�
�@�E��wna���KuU'U���&_o)�(�g����o<�6I�˂�5�	�:C�1gtϲ��Ŷ]�����[��mS���K�vgWzg��o����^���y��^�����Cy�s����o�v��Nl���ڷ6��ş��f4g��8�
����Y8���\������sm�N_��)1Е�u+�](��C���f��"U�`?R���s���dJK���J��H�?(R5S�ʤ�)Q�	�(eJT��߯���rz�      �      x�e[�r�H�]��B?�$�^��3����r�"w�"�b�d0�];�s��ӟ�]�w��s�
��OP���ʓ�UG������ա�g��I��;�E��	�販��P�w���;}u��ۗ$it����8�2 �T]����[�<���W�������[؋e�g(����O[��	��/��u�9�ؖ��8��Tݦ��$z�Uw�o�`���a�E���������q���>���US��68Ɋ��~Z�e�r���Ͳyq?�}y�2F�y�/�8z����gH]�Ż���L��Ƶպ��?�D�������ߝN���������,�j?��#֤�t&y���{%L��v�A����?-t��gJLy�w�x<�~����J<�n:���x�9����8:���Us<�4�8��֧?��4�n��2�ܬ�3ǻ�fmvci����00JK>��������<R/�JƘ2�?'�][khIi�h��C�x�U��w6�dP�˪����8�E��2��i͓2����vG�/u;�_���ˠ�tL�͚�+0�pI����]_����	W��[)%M����S��2���
��7s�|�'��Sn7�@i�*?1ٗnE4�N��:�P6������>���c�o��,������p���U�@s�{m��!�r���C?sL�̘�B�V��LXrg����GX��s[��|]r�/]��ͱ���ѷbg?~�/�`�\?��uXӝ����-���f�c�\V�̣��OS[�g�ϋ��1����=6>t�s4�b����m�8�_8.��^A糨v�u#��˜���	��c��������+�O�����s��z3������z�E�J���S�#ze�����qJ�x�����jM�.����(�������3�%	��V��ցA�+@�\p�vX�j�A����7W���R��v��׀0f�_��r��Ǖ����+��/^:�|v[��x/�{��"H���΅��P���4z�A�P�	`	K�x�9`������Mw<*��j�N>�!h�m���u�X/����#>~R�$�]>~�h�`�+�hZ�V���ћ�� n	C���%���u�z��޹��R	JM��hF�~n���-�L��@Ab6�MW=ԃ�@F���/�Y�&N���<��X
��1k��Xg��ܯ���z�����Jr74W��2-�~���m�6|�|켆{'���=6i�Q�$!(F�:5�������f��X�8x,a��qmx���Mr�p	����L����FNz����gL���ۛ%��2Cm�1�sf;�y�ۊ�MДF���b �.B$8��A8���U��
���K_�H���}խ�yi�X����?�iw��p�l�=�Ws
�$��hN���ڡ)A�u���x�))gf��j�F�Rٛd�`�m�v~Р�ߺ���W���1Ӌ`�kB��u	;}��o]���g%X8�j�6��}��#��a�1���B�yt����w��\��s�kz�o�/��͞�*����T}��������9?�W�X���z	�a\@�b���, R	��^��r�J+�LC�t������D�K� ��������;�*Ac�չ�%hL+_�-
\F>����5(K�{��Q���-�]�9Zo�5(�����W+s��%M@�Z�z����h �5;��$z%_����H�p_y�ņg{������:�����B���P�p�ڹ�Y����+|U�"��'^\a}ౙP����A.+!�^�����C������F���n)!L�4����d�ˮ������{RA0s��$����x���S`����+��Ydi͓�~��Z�ۢ �q��L����;�8���Iׂ��(�!L��t9(o��H�Aw�W�������l�� ��k��
*��e!K�9��n�M�v�o�����+0#ߣ~��h[�WH����ں�8��,�l�¹02זy�XQ���3�`C�ܐ8Rf>J^.�$���6 ������L}�-Ep����f!̵���]xg�H�����mO�p�i02BD�����&�aT}�ȇ0�7��6"P���o_CJ�~Ǌ�>���&��+
)?h�N�z�C��d�� ���\k�!�O7��(��I�ۺyz\�ӭ�l�IfL�"�[��2<��|U����&F�����D��^]�=��t�҃`%F��ə>co��a
��C՝%M�o��zuq� �2�#*$��* S��w
��3J��E�b��%3�C�{�$Y��GA�<|�K(9� �w��~]ɰ�F���Y&�*�$��r 9N$f���^�B_�r�p��
���z�LNb�'����N_cKH��8�$]��-$RQԞ^�0�Vm9b"�|mc�-qG����,s�,t����	�m�&�n�Z�*#HK�T��e} *mV�1��4�Br���D�GԃN@>��3�V�Etu<�����{N�a�1X�U�Z�AQHw<�'Q8���V�!bjz����=��~������R[N(w!��T�n�֚��g�@���N����%>M0��޹�ИDx`Nј����Q���
��菟wG�ƾAL��wf��dd1��ńAE �_\7���C��K�Ҩ�)X檒��}�ZOVl�ab���OZ��YI�^�hCc��'�)���!��WKV��k��45}�w��6���)7�����+U�����!�q�>���χ�q��o\`J���������2��W{X~��Uh��4^/������`��xi��VO0UC z�rp��Ȕ���He�����#�S�cRw�
Rl�-k,�6�N�o��{N�X�#��$��52��.��3[J��p�����#;�yS0>��,�a��(['d��=���!�&%fAt�X�� �����V	��n�+�	>(��ݷ/H�5��2�wO���YA�^Y�|���k1+�Q����Ms��+23�����?��B(���,��D��%���'�ॐ��10��;�Bz�b���zw���I�r�v
p���Y�O��_�fs�-�O�j��Mz�2zٹ�������%&E�GS0�n`��2�̌�}f��_�*��ˀA���útO���^�`qC�D����-qiY�no���׶���̃���աW�x=�w�jh�њ�qnA�UP*(��-����������r��/?�^�A��p��d���ƴ��A=�(��Zu?�tbQ�3�$#f�.��dĘsz�U����l����(|�ퟳ��q�uL��h�z����.�N��~��=���q�;Y��wë�Ȼ����s��w� (d������C�Y' ����k1���xp���ui��t+0$Ov�d)s2ׅG2U�} AA�ij$�I�C��/�����S%+(��H3�~֫�GlzӾ!D��r�D*l<5R� ��!���R��[�K
l�H��t��(�Y6����L�z�ڀG�V�R��*70ߠ�Ī�:��rQ2ҳ���'C[8�ڎ�>j��#+[���o|p�~��}�b���r8����$p �����9ŧ���xΧ����H{,�~{���~3�9T�-�z�~��o*� �dXYG��
��r�R&~�$���C�_i�'���+�P��K���
��ݞ��[�5�`���J��m�{ڄ�~��/[����1D
�$��Ȏ�
�����BXj�Z=lm���TVؑLU�j6��8���a���\2<W���l�3\2Z�Q1R�9��жf�n�����H�Х�C!�-���ɱ��Ӹ
Ke<�0AFB����&&�e�Qy��I޹͓�A%���!7��:��,/���@,LxO_�
�:��"d�Ń���[r�"?4��{�C  �D6+��}�P�.�#��:*%����y�ǚ��l�x�:H�,�[�}�u�쿞����K��K�t�z��ė�ڵ�&�X���çr+�+6I�m��[ 0CPZ�'0��zg� ����+���"5)��L<M�u&aضae�5Z�~5�����Q�� 6  궱0V����I���$ڧxBߠ�� O7���B�σ�F±O���$�Cu���
����Kz�	����z�<O;�$E���(��ok;l��]+�4�t����t[?�M��&��'���
E)���0|p�PW�a��RȯC�m����l�%Fۚ L���k��?��dr%��$��4`ֵ�OB���w� ��}��vau�c<nyF-I��A� ���~ȉ��z�����r'�:��
B�f���LT�Q!=�Eᡯ41���B��P׾��b�Y�j�3k�yͦ��{���a�dUb�sJ���x耤��E��*�t��@\o�����UO������-$�<�� ���+:]�V~�=<8�uk?y)�jY�phf_q���Ώ��09�h�E�>o���$��;7�O���!Љf*׸b���1``:a֣X_��3p�W�n���j�90ֻ��O�uW?|@
��^��]��$,���+��ށ�Ǡ�86��6n' J�ca@1 =e�V,N
�ȃ5%���u�c8�*��<
�x�f���nz�)�5��_6m�:뽰X��GS*�Ҍ�2����+C�:gOHQ{��MG�m�OK��Ve�J ?��wC�3���l3��d`v&� �zi�����,�â�&<�C79
t��/�1�u����*T1%�!�'w�ѵ�u�=Sڿ�s+�,�]G:�	�A2Do�]�|h�X�^2{�F?v�[�s�,��x��-ʖ�D1|񶶎����z�Q=�Ν��Q[f�)�I���S�"w��wSؕ2�� �׫Fw�AOo͈�i^����r8<����}�(�N�*��S��&�&���`��Hu7�3���������V��
��n�Q�B{)�5��!<:�����鎤���H�z�B���L��Y�dg�*�jx�E-9˃��>C�T��J=�l	���'�)+��'� S]ѽ�I&��ł�w�*�>�+'a�u�*�!J}������ZY?�֦��k=~椟��`���t�2�e�(;��y{�]��0�2:�Q�(G�����$J�(�_D�(=�M�=]L�,)�=�(کݷ��"��A�	J��΋��9��j�K �����^��G��Ln?m���D<]��P�t(άr�K+A�K�ĸ�@=����(��*�N ��HtS���nHl���g��A{�`0��������n�E�lM�"�zn�%2���eZ�r��;�_�2QS{��ɼ��+<��UOKY*��jkoQ4a}��ݗ<��va�)$�*����Z�,�dC�m�����鞎p�4���3\D����(bz8����HN4����K�8�֦����,
��'��qt����gߞ���媙-}i�wD��qE�k?�-Ǯ]��"zml!�S�Y����6V��R�=�"�~��Xq�n�&Gw�9�@k(�vqWu�ꡚr������U��it2.=�V�y�߯C{a���AS��u����mT0ъ3��u��r��Q�$]��dYde�jm�0�uk{��|R���܏�Cƀ�a�!>"���U�C،i�7�9Y�bG���U�����u�z�Ogᖺ�bNK9��̬�,ULvݠ����i�b�4h
Y/D�A���p<Y�5'Ă��S�͉Q�d�����j��6QŢ���	Z.*d���T�Rl���l�	':�^���;<���bb�]W/K�O���u1�MW��2���vߍ�CT>���qƀm��] ���|�C��+o�Ī+�f:�����T	��� SZ�g�*��������_�[#έ2�+�ºb��{�	�2�:�a��x������Q뼉Yi�q�\m�d�yd�%^_5<Z�����T���;Z�q��U��Q��vn�Q�z��� ���p����l�<\�c�>7���2�����.ˑ��|M��1)\���r�+�'&
�10� ��[���p0��K���䙚�H�sj��w�d+^���Z��?���a-�����ҡ�G����d������s,F�ǫa0��
KfV�����WHo���CG N�Lf~/���W��nT(9��]�j�޾B~�7#��Q�f�7n�ͼ`V�g�ͫh��vh�Ɵ*����b�q�0(��J�tm,
��j��e�0���tG�-/FT��&dw7^�ԗ~�
�������Fn� X� �.�h�4'�C�d�X�X��8������Ӡ��D�ԭNs��,�>X�'H�����oeZU�|�����)���|�@I)�R	_&`K�?��-P��֟�PG��Ks�O�����y���tq~��f���0�$�̊�1�T�P{�*�?'�s?7�W�ؙh�B��K�W��
�����x�%)�fY*��J(��̔Ɉ�Mh��[�㟅a��:x����#���*��x�AS0ѻ���0����f��8�{|!A��tI�&�Q����an��0;��iW�$�����?\���Bdh�/��܇"�!�/��V�(�μ2r�.��P�(c�%�K����O�$
F���Ub;fU���<SP1lCs�M��ٯ@l���B(Ih�p�~� $ޱkÐAH7�'��,�>�ia���3P�nÅ:E>TF �	O�x� ��ͦQ�K�}�z���c0H�@�p�+Mt�z�����@*'.ͳ���o*���%���3��)Yd�efW����,G~�/.1?Q}�$.14k?�r��p�e(G�GV��ֽ���`�_�Q����Ⱥ�1���z�/�=��a/��IppƇ���yW�i�t|�}o2B���7������ۿ�n�4���租~���C      �   $   x�3�4�4BKs=#N###]C]#�=... GY�      �   V   x�KL����L��\%��%9��@� ���<�(,\Z�Zd�	g�Ō�b�\I�I9��%�ىEU������Ē��<N�+F��� ��-�      �   �   x�U�M�0��ӻh,�������4Ŧ�x�7pc���^�`��73�%�Qu�?jz�R4@��� 텹^�Nc�fd��Q��gmWY��/>,����5nǀt��RAd���%3��Jg��fJ FS�+�, '���n��1�
��ۅ,��H!��q�V��w��=!�GTRK      �   R   x�}˻� D�x�<�@����C�\�3.��E�xH�Hi���	N[�w�π�w��83C�ى�]�\������{�"v     