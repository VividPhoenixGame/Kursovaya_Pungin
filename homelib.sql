PGDMP  5                    }            homelib    17.3    17.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    25049    homelib    DATABASE     m   CREATE DATABASE homelib WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru-RU';
    DROP DATABASE homelib;
                     postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            �            1259    25065    Источники    TABLE     �   CREATE TABLE public."Источники" (
    "id_источника" integer NOT NULL,
    "источник" character varying(50)
);
 (   DROP TABLE public."Источники";
       public         heap r       postgres    false    4            �            1259    25050 
   Книги    TABLE     c  CREATE TABLE public."Книги" (
    "id_книги" integer NOT NULL,
    "название" character varying(100),
    "автор" character varying(100),
    "год" integer,
    "издатель" character varying(80),
    "количество_страниц" integer,
    "жанры" character varying(100),
    isbn character varying(20)
);
     DROP TABLE public."Книги";
       public         heap r       postgres    false    4            �            1259    25060    События    TABLE       CREATE TABLE public."События" (
    "id_события" integer NOT NULL,
    "новый_статус" character varying(50),
    "дата" date,
    "примечание" character varying(100),
    "id_книги" integer,
    "id_источника" integer
);
 $   DROP TABLE public."События";
       public         heap r       postgres    false    4            �            1259    25055    Тип_книги    TABLE     �   CREATE TABLE public."Тип_книги" (
    "id_книги" integer NOT NULL,
    "тип" character varying(50),
    "количество" integer
);
 '   DROP TABLE public."Тип_книги";
       public         heap r       postgres    false    4            �          0    25065    Источники 
   TABLE DATA           [   COPY public."Источники" ("id_источника", "источник") FROM stdin;
    public               postgres    false    220   :        �          0    25050 
   Книги 
   TABLE DATA           �   COPY public."Книги" ("id_книги", "название", "автор", "год", "издатель", "количество_страниц", "жанры", isbn) FROM stdin;
    public               postgres    false    217   �        �          0    25060    События 
   TABLE DATA           �   COPY public."События" ("id_события", "новый_статус", "дата", "примечание", "id_книги", "id_источника") FROM stdin;
    public               postgres    false    219   q"       �          0    25055    Тип_книги 
   TABLE DATA           `   COPY public."Тип_книги" ("id_книги", "тип", "количество") FROM stdin;
    public               postgres    false    218   #       7           2606    25090 ?   Источники Источники_id_источника_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."Источники"
    ADD CONSTRAINT "Источники_id_источника_key" UNIQUE ("id_источника");
 m   ALTER TABLE ONLY public."Источники" DROP CONSTRAINT "Источники_id_источника_key";
       public                 postgres    false    220            9           2606    25069 *   Источники Источники_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Источники"
    ADD CONSTRAINT "Источники_pkey" PRIMARY KEY ("id_источника");
 X   ALTER TABLE ONLY public."Источники" DROP CONSTRAINT "Источники_pkey";
       public                 postgres    false    220            -           2606    25071 '   Книги Книги_id_книги_key 
   CONSTRAINT     q   ALTER TABLE ONLY public."Книги"
    ADD CONSTRAINT "Книги_id_книги_key" UNIQUE ("id_книги");
 U   ALTER TABLE ONLY public."Книги" DROP CONSTRAINT "Книги_id_книги_key";
       public                 postgres    false    217            /           2606    25054    Книги Книги_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public."Книги"
    ADD CONSTRAINT "Книги_pkey" PRIMARY KEY ("id_книги");
 H   ALTER TABLE ONLY public."Книги" DROP CONSTRAINT "Книги_pkey";
       public                 postgres    false    217            3           2606    25073 /   События События_id_книги_key 
   CONSTRAINT     y   ALTER TABLE ONLY public."События"
    ADD CONSTRAINT "События_id_книги_key" UNIQUE ("id_книги");
 ]   ALTER TABLE ONLY public."События" DROP CONSTRAINT "События_id_книги_key";
       public                 postgres    false    219            5           2606    25064 "   События События_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public."События"
    ADD CONSTRAINT "События_pkey" PRIMARY KEY ("id_события");
 P   ALTER TABLE ONLY public."События" DROP CONSTRAINT "События_pkey";
       public                 postgres    false    219            1           2606    25059 (   Тип_книги Тип_книги_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."Тип_книги"
    ADD CONSTRAINT "Тип_книги_pkey" PRIMARY KEY ("id_книги");
 V   ALTER TABLE ONLY public."Тип_книги" DROP CONSTRAINT "Тип_книги_pkey";
       public                 postgres    false    218            ;           2606    25091 8   События События_id_источника_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."События"
    ADD CONSTRAINT "События_id_источника_fkey" FOREIGN KEY ("id_источника") REFERENCES public."Источники"("id_источника");
 f   ALTER TABLE ONLY public."События" DROP CONSTRAINT "События_id_источника_fkey";
       public               postgres    false    219    220    4665            <           2606    25079 0   События События_id_книги_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."События"
    ADD CONSTRAINT "События_id_книги_fkey" FOREIGN KEY ("id_книги") REFERENCES public."Книги"("id_книги");
 ^   ALTER TABLE ONLY public."События" DROP CONSTRAINT "События_id_книги_fkey";
       public               postgres    false    217    4655    219            :           2606    25084 6   Тип_книги Тип_книги_id_книги_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Тип_книги"
    ADD CONSTRAINT "Тип_книги_id_книги_fkey" FOREIGN KEY ("id_книги") REFERENCES public."Книги"("id_книги");
 d   ALTER TABLE ONLY public."Тип_книги" DROP CONSTRAINT "Тип_книги_id_книги_fkey";
       public               postgres    false    218    4655    217            �   �   x�uN9A��W�@����aw�@�@�!:
�A;�p̼����"V��N��͑���6D֋��µ�u(8 Q�!��7<֝b�Bp�����|$8���dJ畱`O?)JĪ��3l�GF/�9�:��
l�ն"�:��8��      �   �  x�UR[n�0�6��B�Ip��T���/Ji���%�� ���F�]�����ٙY��j��f4PE��Ӵ�Vޚz*�qlfM���:*G�D�3
�8m��s:Q����� ���З��R�cWѠiK�SQ�(z�}�'D7�dc�.�w*�?����M:K���	-\P
���Ԁ?�j޷�z[L5}r3	�E�X2�T2Q�18+� �,F�ObP?a����t'*Mj��ck�6He�QO L?��G�L�]+vɄ�Õ���q���f�q�Gg�|��j�Oƽ�p��)�y��s3�>^��]�>ހj����f�z��J5����m�ޅ�'(r����_É�;� �C?�.���� xQ�'      �   �   x�]�A
�0EדSd�22IŻx��K��݈x�*m�J���ȤR��|�|K��&�Вc�2���g$th�F̷�e�����y���1�Q�h��Ґ%�\&M���pe�N��{�o��<��&<t�9
�������Tr�UKS �ɪ�R)�2Ts       �   K   x�3�0�b�=6\�va��.�2v\�|a��煵v_�za�Ŧ���0Tr�5Ő+F��� [�A     