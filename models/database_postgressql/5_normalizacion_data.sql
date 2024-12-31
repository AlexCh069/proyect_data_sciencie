-- NORMALIZACION DE COLUMNAS REFERIDAS A DATOS SIMILARES: 

------------------------------------------------------------------------------------------------
-- Creamos la tabla referida a los datos de las columnas 'p302_1 a p302_15'
-- Creamos la tabla speak_leng_indg
CREATE TABLE speak_leng (
    id_speak_leng SERIAL PRIMARY KEY,
    id_persona INT NOT NULL REFERENCES data_total(id),
    speak_lenguaje VARCHAR(50) NOT NULL -- Nombre de la read
);

-- Insertamos la data con valor de la tabla data_total
INSERT INTO speak_leng (id_persona, speak_lenguaje)
SELECT id, 'Quechua' FROM public.data_total WHERE p302_1 = 1
UNION ALL
SELECT id, 'Aimara' FROM public.data_total WHERE p302_2 = 1
UNION ALL
SELECT id, 'Ashaninka' FROM public.data_total WHERE p302_3 = 1
UNION ALL
SELECT id, 'Awuajun/Aguaruna' FROM public.data_total WHERE p302_4 = 1
UNION ALL
SELECT id, 'Shipibo-Konibo' FROM public.data_total WHERE p302_5 = 1
UNION ALL
SELECT id, 'Shawi/Chayahuita' FROM public.data_total WHERE p302_6 = 1
UNION ALL
SELECT id, 'Matsigenka/Machiguenga' FROM public.data_total WHERE p302_7 = 1
UNION ALL
SELECT id, 'Achuar' FROM public.data_total WHERE p302_8 = 1
UNION ALL
SELECT id, 'Otra lengua indigena' FROM public.data_total WHERE p302_9 = 1
UNION ALL
SELECT id, 'Castellano' FROM public.data_total WHERE p302_10 = 1
UNION ALL
SELECT id, 'Portugues' FROM public.data_total WHERE p302_11 = 1
UNION ALL
SELECT id, 'Ingles' FROM public.data_total WHERE p302_12 = 1
UNION ALL
SELECT id, 'Otra lengua(s) extranjera(s)' FROM public.data_total WHERE p302_13 = 1
UNION ALL
SELECT id, 'No habla/ No escucha' FROM public.data_total WHERE p302_14 = 1
UNION ALL
SELECT id, 'Lenguaje de señas peruana' FROM public.data_total WHERE p302_15 = 1;

-- Insertamos la data sin valor (util para un contraste futuro)
INSERT INTO speak_leng (id_persona, speak_lenguaje)
SELECT id, 'sin dato'  
FROM public.data_total 
WHERE p302_1 = 0 AND p302_2 = 0 AND p302_3 = 0 AND p302_4 = 0 AND p302_5 = 0 AND
	  p302_6 = 0 AND p302_7 = 0 AND p302_8 = 0 AND p302_9 = 0 AND p302_10 = 0 AND
      p302_11 = 0 AND p302_12 = 0 AND p302_13 = 0 AND p302_14 = 0 AND p302_15 = 0;

-- BORRAMOS LA COMLUMNA CON EL NOMBRE DE LOS DEPARTAMENTOS
ALTER TABLE public.data_total
DROP COLUMN p302_1,
DROP COLUMN p302_2,
DROP COLUMN p302_3,
DROP COLUMN p302_4,
DROP COLUMN p302_5,
DROP COLUMN p302_6,
DROP COLUMN p302_7,
DROP COLUMN p302_8,
DROP COLUMN p302_9,
DROP COLUMN p302_10,
DROP COLUMN p302_11,
DROP COLUMN p302_12,
DROP COLUMN p302_13,
DROP COLUMN p302_14,
DROP COLUMN p302_15;
--------------------------------------------------------------------------------------------------------------------------------
-- Creamos la tabla referida a los datos de las columnas 'p308_2_1 a p302_2_9'
-- Casos en los que usa alguna read indigena o no y que read es esta

-- Creamos la tabla read_leng_indg
CREATE TABLE read_leng_indg (
    id_leng_indg SERIAL PRIMARY KEY,
    id_persona INT NOT NULL REFERENCES data_total(id),
    read_indg VARCHAR(50) NOT NULL -- Nombre de la read
);

-- Insertamos la data con valor de la tabla data_total
INSERT INTO read_leng_indg (id_persona, read_indg)
SELECT id, 'Quechua' FROM public.data_total WHERE p308_2_1 = 1
UNION ALL
SELECT id, 'Aimara' FROM public.data_total WHERE p308_2_2 = 1
UNION ALL
SELECT id, 'Ashaninka' FROM public.data_total WHERE p308_2_3 = 1
UNION ALL
SELECT id, 'Awuajun/Aguaruna' FROM public.data_total WHERE p308_2_4 = 1
UNION ALL
SELECT id, 'Shipibo-Konibo' FROM public.data_total WHERE p308_2_5 = 1
UNION ALL
SELECT id, 'Shawi/Chayahuita' FROM public.data_total WHERE p308_2_6 = 1
UNION ALL
SELECT id, 'Matsigenka/Machiguenga' FROM public.data_total WHERE p308_2_7 = 1
UNION ALL
SELECT id, 'Achuar' FROM public.data_total WHERE p308_2_8 = 1
UNION ALL
SELECT id, 'Otra lengua indigena' FROM public.data_total WHERE p308_2_9 = 1;

-- Insertamos la data sin valor (util para un contraste futuro)
INSERT INTO read_leng_indg (id_persona, read_indg)
SELECT id, 'Lengua no indigena'  
FROM public.data_total 
WHERE p308_2_1 = 0 AND p308_2_2 = 0 AND p308_2_3 = 0 AND p308_2_4 = 0 AND
	p308_2_5 = 0 AND p308_2_6 = 0 AND p308_2_7 = 0 AND p308_2_8 = 0 AND p308_2_9 = 0;

/*
-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_read_leng_indg
FOREIGN KEY (id)
REFERENCES public.read_leng_indg (id_persona); */

-- BORRAMOS LA COMLUMNA CON EL NOMBRE DE LOS DEPARTAMENTOS
ALTER TABLE public.data_total
DROP COLUMN p308_2_1,
DROP COLUMN p308_2_2,
DROP COLUMN p308_2_3,
DROP COLUMN p308_2_4,
DROP COLUMN p308_2_5,
DROP COLUMN p308_2_6,
DROP COLUMN p308_2_7,
DROP COLUMN p308_2_8,
DROP COLUMN p308_2_9;

--------------------------------------------------------------------------------------------------------------------------------

-- Tabla de reazones de no lectura (libros, periodicos, revistas, etc)
-- columnas p404_1 a p404_9
CREATE TABLE razones_no_lectura (
    id_rz_no_lectura SERIAL PRIMARY KEY,
    id_persona INT NOT NULL REFERENCES data_total(id),
    razon_no_lectura VARCHAR(100) NOT NULL -- Identifcar razon de no lectura
);

-- Insertamos la data con valor de la tabla data_total
INSERT INTO razones_no_lectura (id_persona, razon_no_lectura)
SELECT id, 'Otras actividades culturales' FROM public.data_total WHERE p404_1 = 1
UNION ALL
SELECT id, 'Otras actividades recreativas y/o sociales' FROM public.data_total WHERE p404_2 = 1
UNION ALL
SELECT id, 'Falta de tiempo' FROM public.data_total WHERE p404_3 = 1
UNION ALL
SELECT id, 'Falta de dinero' FROM public.data_total WHERE p404_4 = 1
UNION ALL
SELECT id, 'Falta de bibliotecas o centros de estudio' FROM public.data_total WHERE p404_5 = 1
UNION ALL
SELECT id, 'Falta de interes/gusto' FROM public.data_total WHERE p404_6 = 1
UNION ALL
SELECT id, 'Publicaciones en lengua no materna' FROM public.data_total WHERE p404_7 = 1
UNION ALL
SELECT id, 'Formatos no aptos para discapacitado' FROM public.data_total WHERE p404_8 = 1
UNION ALL
SELECT id, 'Otras razones' FROM public.data_total WHERE p404_9 = 1;

-- Insertamos la data sin valor (util para un contraste futuro)
INSERT INTO razones_no_lectura (id_persona, razon_no_lectura)
SELECT id, 'sin informacion (posible lector frecuente)'  
FROM public.data_total 
WHERE p404_1 = 0 AND p404_2 = 0 AND p404_3 = 0 AND p404_4 = 0 AND
      p404_5 = 0 AND p404_6 = 0 AND p404_7 = 0 AND p404_8 = 0 AND p404_9 = 0;


-- BORRAMOS LA COMLUMNA CON EL NOMBRE DE LOS DEPARTAMENTOS
ALTER TABLE public.data_total
DROP COLUMN p404_1,
DROP COLUMN p404_2,
DROP COLUMN p404_3,
DROP COLUMN p404_4,
DROP COLUMN p404_5,
DROP COLUMN p404_6,
DROP COLUMN p404_7,
DROP COLUMN p404_8,
DROP COLUMN p404_9;

--------------------------------------------------------------------------------------------------------------------------------

-- Tabla de las actividades que realiza en el hogar (columnas p501_1 a p501_13)
-- Tabla de ambientes donde la persona leyo (casa, bibliotecas, parques, transporte, etc)
-- columnas p404_1 a p404_9
CREATE TABLE ambientes_lectura (
    id_amb_lect SERIAL PRIMARY KEY,
    id_persona INT NOT NULL REFERENCES data_total(id),
    ambiente_lectura VARCHAR(100) NOT NULL -- Identifcar razon de no lectura
);

-- Insertamos la data con valor de la tabla data_total
INSERT INTO ambientes_lectura (id_persona, ambiente_lectura)
SELECT id, 'Lugar privado/casa' FROM public.data_total WHERE p405_1 = 1
UNION ALL
SELECT id, 'Transporte' FROM public.data_total WHERE p405_2 = 1
UNION ALL
SELECT id, 'Salon de clase' FROM public.data_total WHERE p405_3 = 1
UNION ALL
SELECT id, 'Sitio de trabajo' FROM public.data_total WHERE p405_4 = 1
UNION ALL
SELECT id, 'Areas publicas (parques, plazas, etc)' FROM public.data_total WHERE p405_5 = 1 OR p405_10 = 1
UNION ALL
SELECT id, 'Entorno natural (playa, bosque, etc)' FROM public.data_total WHERE p405_6 = 1
UNION ALL
SELECT id, 'Centro comercial' FROM public.data_total WHERE p405_7 = 1
UNION ALL
SELECT id, 'Librerias' FROM public.data_total WHERE p405_8 = 1
UNION ALL
SELECT id, 'Bibliotecas' FROM public.data_total WHERE p405_9 = 1
UNION ALL
SELECT id, 'Cafeterias/restaurantes' FROM public.data_total WHERE p405_11 = 1 
UNION ALL
SELECT id, 'Acceso publico a TIC/internet' FROM public.data_total WHERE p405_12 = 1
UNION ALL
SELECT id, 'Otro lugar' FROM public.data_total WHERE p405_13 = 1;

-- Insertamos la data sin valor (util para un contraste futuro)
INSERT INTO ambientes_lectura (id_persona, ambiente_lectura)
SELECT id, 'sin dato'  
FROM public.data_total 
WHERE p405_1 = 0 AND p405_2 = 0 AND p405_3 = 0 AND p405_4 = 0 AND
      p405_5 = 0 AND p405_6 = 0 AND p405_7 = 0 AND p405_8 = 0 AND 
      p405_9 = 0 AND p405_10 = 0 AND p405_11 = 0 AND p405_12 = 0 AND p405_13 = 0;



-- BORRAMOS LA COMLUMNA CON EL NOMBRE DE LOS DEPARTAMENTOS
ALTER TABLE public.data_total
DROP COLUMN p405_1,
DROP COLUMN p405_2,
DROP COLUMN p405_3,
DROP COLUMN p405_4,
DROP COLUMN p405_5,
DROP COLUMN p405_6,
DROP COLUMN p405_7,
DROP COLUMN p405_8,
DROP COLUMN p405_9,
DROP COLUMN p405_10,
DROP COLUMN p405_11,
DROP COLUMN p405_12,
DROP COLUMN p405_13;

--------------------------------------------------------------------------------------------------------------------------------

-- Tabla de reazones de si lectura (libros, periodicos, revistas, etc)
-- columnas p406_1 a p406_9
CREATE TABLE razones_si_lectura (
    id_rz_lectura SERIAL PRIMARY KEY,
    id_persona INT NOT NULL REFERENCES data_total(id),
    razon_si_lectura VARCHAR(100) NOT NULL -- Identifcar razon de no lectura
);

-- Insertamos la data con valor de la tabla data_total
INSERT INTO razones_si_lectura (id_persona, razon_si_lectura)
SELECT id, 'Placer/entretenimiento' FROM public.data_total WHERE p406_1 = 1
UNION ALL
SELECT id, 'Estudio personal' FROM public.data_total WHERE p406_2 = 1
UNION ALL
SELECT id, 'Apoyo a otro familiar' FROM public.data_total WHERE p406_3 = 1  -- revisar data
UNION ALL
SELECT id, 'Informacion sobre sucesos cotidianos' FROM public.data_total WHERE p406_4 = 1
UNION ALL
SELECT id, 'Motivos laborales' FROM public.data_total WHERE p406_5 = 1
UNION ALL
SELECT id, 'Desarrollo personal' FROM public.data_total WHERE p406_6 = 1
UNION ALL
SELECT id, 'Motivos religiosos' FROM public.data_total WHERE p406_7 = 1
UNION ALL
SELECT id, 'Cultura general' FROM public.data_total WHERE p406_8 = 1
UNION ALL
SELECT id, 'Otras razones' FROM public.data_total WHERE p406_9 = 1;

-- Insertamos la data sin valor (util para un contraste futuro)
INSERT INTO razones_si_lectura (id_persona, razon_si_lectura)
SELECT id, 'sin data'  
FROM public.data_total 
WHERE p406_1 = 0 AND p406_2 = 0 AND p406_3 = 0 AND p406_4 = 0 AND
      p406_5 = 0 AND p406_6 = 0 AND p406_7 = 0 AND p406_8 = 0 AND p406_9 = 0;


-- BORRAMOS LA COMLUMNA CON EL NOMBRE DE LOS DEPARTAMENTOS
ALTER TABLE public.data_total
DROP COLUMN p406_1,
DROP COLUMN p406_2,
DROP COLUMN p406_3,
DROP COLUMN p406_4,
DROP COLUMN p406_5,
DROP COLUMN p406_6,
DROP COLUMN p406_7,
DROP COLUMN p406_8,
DROP COLUMN p406_9;
--------------------------------------------------------------------------------------------------------------------------------
-- Tabla de razon por la que no leyo (exclusivamente para libros)
-- columnas p410_1 a p410_10
CREATE TABLE no_lectura_libros (
    id_rz_no_lectura SERIAL PRIMARY KEY,
    id_persona INT NOT NULL REFERENCES data_total(id),
    rz_no_lectura VARCHAR(100) NOT NULL -- Identifcar razon de no lectura
);

-- Insertamos la data con valor de la tabla data_total
INSERT INTO no_lectura_libros (id_persona, rz_no_lectura)
SELECT id, 'Otras actividades culturales' FROM public.data_total WHERE p410_1 = 1
UNION ALL
SELECT id, 'Otras actividades recreativas y/o sociales' FROM public.data_total WHERE p410_2 = 1
UNION ALL
SELECT id, 'Prefiere otros formatos' FROM public.data_total WHERE p410_3 = 1
UNION ALL
SELECT id, 'Falta de tiempo' FROM public.data_total WHERE p410_4 = 1
UNION ALL
SELECT id, 'Falta de dinero' FROM public.data_total WHERE p410_5 = 1
UNION ALL
SELECT id, 'Falta de bibliotecas o centros de estudio' FROM public.data_total WHERE p410_6 = 1
UNION ALL
SELECT id, 'Falta de interes/gusto' FROM public.data_total WHERE p410_7 = 1
UNION ALL
SELECT id, 'Publicaciones en lengua no materna' FROM public.data_total WHERE p410_8 = 1
UNION ALL
SELECT id, 'Formatos no aptos para discapacitado' FROM public.data_total WHERE p410_9 = 1
UNION ALL
SELECT id, 'Otras razones' FROM public.data_total WHERE p410_10 = 1;

-- Insertamos la data sin valor (util para un contraste futuro)
INSERT INTO razones_no_lectura (id_persona, razon_no_lectura)
SELECT id, 'sin dato'  
FROM public.data_total 
WHERE p410_1 = 0 AND p410_2 = 0 AND p410_3 = 0 AND p410_4 = 0 AND p410_5 = 0 AND 
      p410_6 = 0 AND p410_7 = 0 AND p410_8 = 0 AND p410_9 = 0 AND p410_10 = 0;


-- BORRAMOS LA COMLUMNA CON EL NOMBRE DE LOS DEPARTAMENTOS
ALTER TABLE public.data_total
DROP COLUMN p410_1,
DROP COLUMN p410_2,
DROP COLUMN p410_3,
DROP COLUMN p410_4,
DROP COLUMN p410_5,
DROP COLUMN p410_6,
DROP COLUMN p410_7,
DROP COLUMN p410_8,
DROP COLUMN p410_9,
DROP COLUMN p410_10;
----------------------------------------------------------------------------------------------------------------
-- Tabla de reazones de si lectura de solo libros
-- columnas p411_1 a p411_9
CREATE TABLE si_lectura_libros (
    id_rz_si_lectura SERIAL PRIMARY KEY,
    id_persona INT NOT NULL REFERENCES data_total(id),
    si_lectura_lib VARCHAR(100) NOT NULL -- Identifcar razon de no lectura
);

-- Insertamos la data con valor de la tabla data_total
INSERT INTO si_lectura_libros (id_persona, si_lectura_lib)
SELECT id, 'Placer/entretenimiento' FROM public.data_total WHERE p411_1 = 1
UNION ALL
SELECT id, 'Estudio personal' FROM public.data_total WHERE p411_2 = 1
UNION ALL
SELECT id, 'Apoyo a otro familiar' FROM public.data_total WHERE p411_3 = 1  -- revisar data
UNION ALL
SELECT id, 'Informacion sobre sucesos cotidianos' FROM public.data_total WHERE p411_4 = 1
UNION ALL
SELECT id, 'Motivos laborales' FROM public.data_total WHERE p411_5 = 1
UNION ALL
SELECT id, 'Desarrollo personal' FROM public.data_total WHERE p411_6 = 1
UNION ALL
SELECT id, 'Motivos religiosos' FROM public.data_total WHERE p411_7 = 1
UNION ALL
SELECT id, 'Cultura general' FROM public.data_total WHERE p411_8 = 1
UNION ALL
SELECT id, 'Otras razones' FROM public.data_total WHERE p411_9 = 1;

-- Insertamos la data sin valor (util para un contraste futuro)
INSERT INTO si_lectura_libros (id_persona, si_lectura_lib)
SELECT id, 'sin data'  
FROM public.data_total 
WHERE p411_1 = 0 AND p411_2 = 0 AND p411_3 = 0 AND p411_4 = 0 AND
      p411_5 = 0 AND p411_6 = 0 AND p411_7 = 0 AND p411_8 = 0 AND p411_9 = 0;


-- BORRAMOS LA COMLUMNA CON EL NOMBRE DE LOS DEPARTAMENTOS
ALTER TABLE public.data_total
DROP COLUMN p411_1,
DROP COLUMN p411_2,
DROP COLUMN p411_3,
DROP COLUMN p411_4,
DROP COLUMN p411_5,
DROP COLUMN p411_6,
DROP COLUMN p411_7,
DROP COLUMN p411_8,
DROP COLUMN p411_9;