PGDMP                      |           inventory_db    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24663    inventory_db    DATABASE     �   CREATE DATABASE inventory_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Arabic_Saudi Arabia.1256';
    DROP DATABASE inventory_db;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    24664    order_products    TABLE     e   CREATE TABLE public.order_products (
    order_id bigint NOT NULL,
    product_id bigint NOT NULL
);
 "   DROP TABLE public.order_products;
       public         heap    postgres    false    4            �            1259    24668    orders    TABLE     o   CREATE TABLE public.orders (
    id bigint NOT NULL,
    order_date date,
    status character varying(255)
);
    DROP TABLE public.orders;
       public         heap    postgres    false    4            �            1259    24667    orders_id_seq    SEQUENCE     v   CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    4    217            �           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    216            �            1259    24675    product    TABLE     �   CREATE TABLE public.product (
    id bigint NOT NULL,
    description character varying(255),
    name character varying(255),
    price double precision,
    quantity integer
);
    DROP TABLE public.product;
       public         heap    postgres    false    4            �            1259    24674    product_id_seq    SEQUENCE     w   CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    219    4            �           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    218            �            1259    24684    supplier    TABLE     �   CREATE TABLE public.supplier (
    id bigint NOT NULL,
    address character varying(255),
    name character varying(255),
    phone_number character varying(255)
);
    DROP TABLE public.supplier;
       public         heap    postgres    false    4            �            1259    24683    supplier_id_seq    SEQUENCE     x   CREATE SEQUENCE public.supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.supplier_id_seq;
       public          postgres    false    221    4            �           0    0    supplier_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.supplier_id_seq OWNED BY public.supplier.id;
          public          postgres    false    220            (           2604    24711 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            )           2604    24712 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            *           2604    24713    supplier id    DEFAULT     j   ALTER TABLE ONLY public.supplier ALTER COLUMN id SET DEFAULT nextval('public.supplier_id_seq'::regclass);
 :   ALTER TABLE public.supplier ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �          0    24664    order_products 
   TABLE DATA           >   COPY public.order_products (order_id, product_id) FROM stdin;
    public          postgres    false    215   �       �          0    24668    orders 
   TABLE DATA           8   COPY public.orders (id, order_date, status) FROM stdin;
    public          postgres    false    217   �       �          0    24675    product 
   TABLE DATA           I   COPY public.product (id, description, name, price, quantity) FROM stdin;
    public          postgres    false    219           �          0    24684    supplier 
   TABLE DATA           C   COPY public.supplier (id, address, name, phone_number) FROM stdin;
    public          postgres    false    221   0        �           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 1, false);
          public          postgres    false    216            �           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 1, false);
          public          postgres    false    218            �           0    0    supplier_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.supplier_id_seq', 1, false);
          public          postgres    false    220            ,           2606    24673    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    217            .           2606    24682    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    219            0           2606    24691    supplier supplier_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.supplier DROP CONSTRAINT supplier_pkey;
       public            postgres    false    221            1           2606    24697 *   order_products fkawxpt1ns1sr7al76nvjkv21of    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fkawxpt1ns1sr7al76nvjkv21of FOREIGN KEY (order_id) REFERENCES public.orders(id);
 T   ALTER TABLE ONLY public.order_products DROP CONSTRAINT fkawxpt1ns1sr7al76nvjkv21of;
       public          postgres    false    215    217    4652            2           2606    24692 *   order_products fkb7sieybjsoa6140mh8fsqnge8    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fkb7sieybjsoa6140mh8fsqnge8 FOREIGN KEY (product_id) REFERENCES public.product(id);
 T   ALTER TABLE ONLY public.order_products DROP CONSTRAINT fkb7sieybjsoa6140mh8fsqnge8;
       public          postgres    false    4654    215    219            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     