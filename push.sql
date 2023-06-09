PGDMP         :                {            Oyun    15.3    15.3 .    4           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            5           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            6           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            7           1262    16398    Oyun    DATABASE     z   CREATE DATABASE "Oyun" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Turkish_Turkey.1254';
    DROP DATABASE "Oyun";
                postgres    false                        2615    17247    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            8           0    0    SCHEMA public    COMMENT         COMMENT ON SCHEMA public IS '';
                   postgres    false    5            9           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    5            �            1259    17279    business    TABLE     |  CREATE TABLE public.business (
    business_field_id integer NOT NULL,
    business_type character varying(255) NOT NULL,
    user_salary integer NOT NULL,
    business_level integer NOT NULL,
    business_capacity integer,
    business_employee_count integer NOT NULL,
    business_income integer,
    business_income_rate integer,
    business_level_start_date date NOT NULL
);
    DROP TABLE public.business;
       public         heap    postgres    false    5            �            1259    17319    employee    TABLE     �   CREATE TABLE public.employee (
    business_field_id integer NOT NULL,
    user_id integer,
    user_employment_start_date date NOT NULL,
    user_employment_finish_date date NOT NULL,
    user_worktime integer,
    user_workhours double precision
);
    DROP TABLE public.employee;
       public         heap    postgres    false    5            �            1259    17269    field    TABLE     �   CREATE TABLE public.field (
    field_id integer NOT NULL,
    field_owner_id integer NOT NULL,
    field_type character varying(255) NOT NULL
);
    DROP TABLE public.field;
       public         heap    postgres    false    5            �            1259    17249    game    TABLE     V  CREATE TABLE public.game (
    game_id integer NOT NULL,
    start_food integer NOT NULL,
    start_item integer NOT NULL,
    start_currency integer NOT NULL,
    field_size double precision NOT NULL,
    daily_food integer NOT NULL,
    daily_item integer NOT NULL,
    daily_currency integer NOT NULL,
    admin_salary integer NOT NULL
);
    DROP TABLE public.game;
       public         heap    postgres    false    5            �            1259    17248    game_game_id_seq    SEQUENCE     �   CREATE SEQUENCE public.game_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.game_game_id_seq;
       public          postgres    false    5    215            :           0    0    game_game_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.game_game_id_seq OWNED BY public.game.game_id;
          public          postgres    false    214            �            1259    17299    grocery    TABLE     i   CREATE TABLE public.grocery (
    business_field_id integer NOT NULL,
    food_price integer NOT NULL
);
    DROP TABLE public.grocery;
       public         heap    postgres    false    5            �            1259    17289    real_estate    TABLE     �   CREATE TABLE public.real_estate (
    business_field_id integer NOT NULL,
    estate_field_id integer NOT NULL,
    estate_price integer NOT NULL
);
    DROP TABLE public.real_estate;
       public         heap    postgres    false    5            �            1259    17309    shop    TABLE     f   CREATE TABLE public.shop (
    business_field_id integer NOT NULL,
    item_price integer NOT NULL
);
    DROP TABLE public.shop;
       public         heap    postgres    false    5            �            1259    17256    users    TABLE     3  CREATE TABLE public.users (
    game_id integer,
    user_id integer NOT NULL,
    user_type character varying(255),
    name character varying(255),
    surname character varying(255),
    password character varying(255),
    food integer,
    item integer,
    currency integer,
    user_works boolean
);
    DROP TABLE public.users;
       public         heap    postgres    false    5            �            1259    17255    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    5    217            ;           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    216            �           2604    17252    game game_id    DEFAULT     l   ALTER TABLE ONLY public.game ALTER COLUMN game_id SET DEFAULT nextval('public.game_game_id_seq'::regclass);
 ;   ALTER TABLE public.game ALTER COLUMN game_id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    17259    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    216    217    217            -          0    17279    business 
   TABLE DATA           �   COPY public.business (business_field_id, business_type, user_salary, business_level, business_capacity, business_employee_count, business_income, business_income_rate, business_level_start_date) FROM stdin;
    public          postgres    false    219   (8       1          0    17319    employee 
   TABLE DATA           �   COPY public.employee (business_field_id, user_id, user_employment_start_date, user_employment_finish_date, user_worktime, user_workhours) FROM stdin;
    public          postgres    false    223   E8       ,          0    17269    field 
   TABLE DATA           E   COPY public.field (field_id, field_owner_id, field_type) FROM stdin;
    public          postgres    false    218   b8       )          0    17249    game 
   TABLE DATA           �   COPY public.game (game_id, start_food, start_item, start_currency, field_size, daily_food, daily_item, daily_currency, admin_salary) FROM stdin;
    public          postgres    false    215   8       /          0    17299    grocery 
   TABLE DATA           @   COPY public.grocery (business_field_id, food_price) FROM stdin;
    public          postgres    false    221   �8       .          0    17289    real_estate 
   TABLE DATA           W   COPY public.real_estate (business_field_id, estate_field_id, estate_price) FROM stdin;
    public          postgres    false    220   �8       0          0    17309    shop 
   TABLE DATA           =   COPY public.shop (business_field_id, item_price) FROM stdin;
    public          postgres    false    222   �8       +          0    17256    users 
   TABLE DATA           w   COPY public.users (game_id, user_id, user_type, name, surname, password, food, item, currency, user_works) FROM stdin;
    public          postgres    false    217   9       <           0    0    game_game_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.game_game_id_seq', 1, true);
          public          postgres    false    214            =           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 1, true);
          public          postgres    false    216            �           2606    17283 '   business business_business_field_id_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_business_field_id_key UNIQUE (business_field_id);
 Q   ALTER TABLE ONLY public.business DROP CONSTRAINT business_business_field_id_key;
       public            postgres    false    219            �           2606    17273    field field_field_id_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.field
    ADD CONSTRAINT field_field_id_key UNIQUE (field_id);
 B   ALTER TABLE ONLY public.field DROP CONSTRAINT field_field_id_key;
       public            postgres    false    218            �           2606    17254    game game_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (game_id);
 8   ALTER TABLE ONLY public.game DROP CONSTRAINT game_pkey;
       public            postgres    false    215            �           2606    17303 %   grocery grocery_business_field_id_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.grocery
    ADD CONSTRAINT grocery_business_field_id_key UNIQUE (business_field_id);
 O   ALTER TABLE ONLY public.grocery DROP CONSTRAINT grocery_business_field_id_key;
       public            postgres    false    221            �           2606    17293 -   real_estate real_estate_business_field_id_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.real_estate
    ADD CONSTRAINT real_estate_business_field_id_key UNIQUE (business_field_id);
 W   ALTER TABLE ONLY public.real_estate DROP CONSTRAINT real_estate_business_field_id_key;
       public            postgres    false    220            �           2606    17313    shop shop_business_field_id_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.shop
    ADD CONSTRAINT shop_business_field_id_key UNIQUE (business_field_id);
 I   ALTER TABLE ONLY public.shop DROP CONSTRAINT shop_business_field_id_key;
       public            postgres    false    222            �           2606    17263    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217            �           2606    17284 (   business business_business_field_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_business_field_id_fkey FOREIGN KEY (business_field_id) REFERENCES public.field(field_id);
 R   ALTER TABLE ONLY public.business DROP CONSTRAINT business_business_field_id_fkey;
       public          postgres    false    219    3209    218            �           2606    17322 (   employee employee_business_field_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_business_field_id_fkey FOREIGN KEY (business_field_id) REFERENCES public.business(business_field_id);
 R   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_business_field_id_fkey;
       public          postgres    false    219    3211    223            �           2606    17327    employee employee_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 H   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_user_id_fkey;
       public          postgres    false    3207    217    223            �           2606    17274    field field_field_owner_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.field
    ADD CONSTRAINT field_field_owner_id_fkey FOREIGN KEY (field_owner_id) REFERENCES public.users(user_id);
 I   ALTER TABLE ONLY public.field DROP CONSTRAINT field_field_owner_id_fkey;
       public          postgres    false    218    217    3207            �           2606    17304 &   grocery grocery_business_field_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.grocery
    ADD CONSTRAINT grocery_business_field_id_fkey FOREIGN KEY (business_field_id) REFERENCES public.business(business_field_id);
 P   ALTER TABLE ONLY public.grocery DROP CONSTRAINT grocery_business_field_id_fkey;
       public          postgres    false    219    221    3211            �           2606    17294 .   real_estate real_estate_business_field_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.real_estate
    ADD CONSTRAINT real_estate_business_field_id_fkey FOREIGN KEY (business_field_id) REFERENCES public.business(business_field_id);
 X   ALTER TABLE ONLY public.real_estate DROP CONSTRAINT real_estate_business_field_id_fkey;
       public          postgres    false    219    220    3211            �           2606    17314     shop shop_business_field_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shop
    ADD CONSTRAINT shop_business_field_id_fkey FOREIGN KEY (business_field_id) REFERENCES public.business(business_field_id);
 J   ALTER TABLE ONLY public.shop DROP CONSTRAINT shop_business_field_id_fkey;
       public          postgres    false    3211    222    219            �           2606    17264    users users_game_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.game(game_id);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_game_id_fkey;
       public          postgres    false    217    3205    215            -      x������ � �      1      x������ � �      ,      x������ � �      )      x�3�4400@"L�L9��(����� w��      /      x������ � �      .      x������ � �      0      x������ � �      +      x����4�tL������D\1z\\\ ��n     