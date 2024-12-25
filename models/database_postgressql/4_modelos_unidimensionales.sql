-- GENERALES
 ----------------------------------------------------
-- Nombre columna: dominio
-- Tabla dominio_geografico
CREATE TABLE public.dominio_geografico (
    id_dominio integer PRIMARY KEY,
    dominio VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.dominio_geografico VALUES 
(0, 'Valores Nulos'), (1, 'Costa Norte'), (2, 'Costa Centro'), (3, 'Costa Sur'), (4, 'Sierra Norte'), (5, 'Sierra Centro'), (6, 'Sierra Sur'), (7, 'Selva'), (8, 'Lima Metropolitana');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_dominio_geografico
FOREIGN KEY (dominio)
REFERENCES public.dominio_geografico (id_dominio);

 
 ----------------------------------------------------
-- Nombre columna: estrato
-- Tabla estrato_geografico
CREATE TABLE public.estrato_geografico (
    id_estrato integer PRIMARY KEY,
    estrato VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.estrato_geografico VALUES 
(0, 'Valores Nulos'), (1, 'De 500 000 a más habitantes.'), (2, 'De 100 000 a 499 999 habitantes.'), (3, 'De 50 000 a 99 999 habitantes.'), (4, 'De 20 000 a 49 999 habitantes.'), (5, 'De 2 000 a 19 999 habitantes.'), (6, 'De 500 a 1 999 habitantes.'), (7, 'Área de Empadronamiento Rural (AER) Compuesto'), (8, 'Área de Empadronamiento Rural (AER) Simple');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_estrato_geografico
FOREIGN KEY (estrato)
REFERENCES public.estrato_geografico (id_estrato);

 
 ----------------------------------------------------
-- Nombre columna: estratosocio
-- Tabla estrato_social
CREATE TABLE public.estrato_social (
    id_estratosocio integer PRIMARY KEY,
    estratosocio VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.estrato_social VALUES 
(0, 'Valores Nulos'), (1, 'Estrato Alto'), (2, 'Estrato Medio Alto'), (3, 'Estrato Medio'), (4, 'Estrato Medio Bajo'), (5, 'Estrato Bajo'), (6, 'Rural');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_estrato_social
FOREIGN KEY (estratosocio)
REFERENCES public.estrato_social (id_estratosocio);

 
-- CARACTERISTICAS DE LOS MIEMBROS
 ----------------------------------------------------
-- Nombre columna: p209
-- Tabla sexo
CREATE TABLE public.sexo (
    id_p209 integer PRIMARY KEY,
    p209 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.sexo VALUES 
(0, 'Valores Nulos'), (1, 'Hombre'), (2, 'Mujer');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_sexo
FOREIGN KEY (p209)
REFERENCES public.sexo (id_p209);

 
-- ETNICIDAD
 ----------------------------------------------------
-- Nombre columna: p301
-- Tabla lengua_materna
CREATE TABLE public.lengua_materna (
    id_p301 integer PRIMARY KEY,
    p301 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.lengua_materna VALUES 
(0, 'Valores Nulos'), (1, 'Quechua?'), (2, 'Aimara?'), (3, 'Ashaninka?'), (4, 'Awajun / Aguaruna?'), (5, 'Shipibo-Konibo?'), (6, 'Shawi / Chayahuita?'), (7, 'Matsigenka/Machiguenga?'), (8, 'Achuar?'), (9, 'Otra lengua indígena u originaria?'), (10, ' Castellano?'), (11,'Portugués?'), (12, ' Inglés?'), (13, 'Otra lengua extranjera?'), (14, ' NO ESCUCHA/NI HABLA'), (15, ' LENGUA DE SEÑAS PERUANA');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_lengua_materna
FOREIGN KEY (p301)
REFERENCES public.lengua_materna (id_p301);

 
 ----------------------------------------------------
-- Nombre columna: p303
-- Tabla identidad_cultural
CREATE TABLE public.identidad_cultural (
    id_p303 integer PRIMARY KEY,
    p303 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.identidad_cultural VALUES 
(0, 'Valores Nulos'), (1, 'Quechua?'), (2, 'Aimara?'), (3, 'Nativo o indígena de la Amazonía?'), (4, 'Perteneciente o parte de otro pueblo indigena originario?'), (5, 'Negro/moreno/zambo,mulato/Pueblo Afroperuano o Afrodescendiente?'), (6, 'Blanco?'), (7, 'Mestizo?'), (8, 'Otro?'), (9, 'NO SABE/ NO RESPONDE');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_identidad_cultural
FOREIGN KEY (p303)
REFERENCES public.identidad_cultural (id_p303);

 
 ----------------------------------------------------
-- Nombre columna: p304
-- Tabla pertenecia_indigena
CREATE TABLE public.pertenecia_indigena (
    id_p304 integer PRIMARY KEY,
    p304 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.pertenecia_indigena VALUES 
(0, 'Valores Nulos'), (1, 'Sí'), (2, 'No'), (3, 'No sabe');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_pertenecia_indigena
FOREIGN KEY (p304)
REFERENCES public.pertenecia_indigena (id_p304);

 
-- EDUCACION
 ----------------------------------------------------
-- Nombre columna: p306
-- Tabla nivel_educativo
CREATE TABLE public.nivel_educativo (
    id_p306 integer PRIMARY KEY,
    p306 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.nivel_educativo VALUES 
(0, 'Valores Nulos'), (1, 'Sin nivel'), (2, 'Educación Inicial'), (3, 'Primaria incompleta'), (4, 'Primaria completa'), (5, 'Secundaria incompleta'), (6, 'Secundaria completa'), (7, 'Básica Especial'), (8, 'Superior no universitaria incompleta'), (9, 'Superior no universitaria completa'), (10, ' Superior universitaria incompleta'), (11, ' Superior universitaria completa'), (12, ' Maestría/Doctorado');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_nivel_educativo
FOREIGN KEY (p306)
REFERENCES public.nivel_educativo (id_p306);

 
 ----------------------------------------------------
-- Nombre columna: p306_c
-- Tabla centro_estatal_privado
CREATE TABLE public.centro_estatal_privado (
    id_p306_c integer PRIMARY KEY,
    p306_c VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.centro_estatal_privado VALUES 
(0, 'Valores Nulos'), (1, 'Estatal'), (2, 'No estatal');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_centro_estatal_privado
FOREIGN KEY (p306_c)
REFERENCES public.centro_estatal_privado (id_p306_c);

 
 ----------------------------------------------------
-- Nombre columna: p307_1
-- Tabla escritura_castellano
CREATE TABLE public.escritura_castellano (
    id_p307_1 integer PRIMARY KEY,
    p307_1 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.escritura_castellano VALUES 
(0, 'Valores Nulos'), (1, 'Sí'), (2, 'No');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_escritura_castellano
FOREIGN KEY (p307_1)
REFERENCES public.escritura_castellano (id_p307_1);

 
 ----------------------------------------------------
-- Nombre columna: p307_2
-- Tabla escritura_castell_cartilla
CREATE TABLE public.escritura_castell_cartilla (
    id_p307_2 integer PRIMARY KEY,
    p307_2 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.escritura_castell_cartilla VALUES 
(0, 'Valores Nulos'), (1, 'Sí'), (2, 'No'), (3, 'No se aplicó cartilla');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_escritura_castell_cartilla
FOREIGN KEY (p307_2)
REFERENCES public.escritura_castell_cartilla (id_p307_2);

 
 ----------------------------------------------------
-- Nombre columna: p308_1
-- Tabla escritura_indigena
CREATE TABLE public.escritura_indigena (
    id_p308_1 integer PRIMARY KEY,
    p308_1 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.escritura_indigena VALUES 
(0, 'Valores Nulos'), (1, 'Sí'), (2, 'No');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_escritura_indigena
FOREIGN KEY (p308_1)
REFERENCES public.escritura_indigena (id_p308_1);

 
-- CAP. ECONOMICA Y DISCAPACIDAD
 ----------------------------------------------------
-- Nombre columna: p315_1
-- Tabla probl_vision
CREATE TABLE public.probl_vision (
    id_p315_1 integer PRIMARY KEY,
    p315_1 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.probl_vision VALUES 
(0, 'Valores Nulos'), (1, 'Sí'), (2, 'No');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_probl_vision
FOREIGN KEY (p315_1)
REFERENCES public.probl_vision (id_p315_1);

 
 ----------------------------------------------------
-- Nombre columna: p315_2
-- Tabla probl_auditivos
CREATE TABLE public.probl_auditivos (
    id_p315_2 integer PRIMARY KEY,
    p315_2 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.probl_auditivos VALUES 
(0, 'Valores Nulos'), (1, 'Sí'), (2, 'No');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_probl_auditivos
FOREIGN KEY (p315_2)
REFERENCES public.probl_auditivos (id_p315_2);

 
 ----------------------------------------------------
-- Nombre columna: p315_3
-- Tabla probl_comunicacion
CREATE TABLE public.probl_comunicacion (
    id_p315_3 integer PRIMARY KEY,
    p315_3 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.probl_comunicacion VALUES 
(0, 'Valores Nulos'), (1, 'Sí'), (2, 'No');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_probl_comunicacion
FOREIGN KEY (p315_3)
REFERENCES public.probl_comunicacion (id_p315_3);

 
 ----------------------------------------------------
-- Nombre columna: p315_4
-- Tabla probl_motrices
CREATE TABLE public.probl_motrices (
    id_p315_4 integer PRIMARY KEY,
    p315_4 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.probl_motrices VALUES 
(0, 'Valores Nulos'), (1, 'Sí'), (2, 'No');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_probl_motrices
FOREIGN KEY (p315_4)
REFERENCES public.probl_motrices (id_p315_4);

 
 ----------------------------------------------------
-- Nombre columna: p315_5
-- Tabla probl_comprension
CREATE TABLE public.probl_comprension (
    id_p315_5 integer PRIMARY KEY,
    p315_5 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.probl_comprension VALUES 
(0, 'Valores Nulos'), (1, 'Sí'), (2, 'No');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_probl_comprension
FOREIGN KEY (p315_5)
REFERENCES public.probl_comprension (id_p315_5);

 
 ----------------------------------------------------
-- Nombre columna: p315_6
-- Tabla probl_relacionarse
CREATE TABLE public.probl_relacionarse (
    id_p315_6 integer PRIMARY KEY,
    p315_6 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.probl_relacionarse VALUES 
(0, 'Valores Nulos'), (1, 'Sí'), (2, 'No');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_probl_relacionarse
FOREIGN KEY (p315_6)
REFERENCES public.probl_relacionarse (id_p315_6);

 
-- PRACTICAS LECTORAS
 ----------------------------------------------------
-- Nombre columna: p401_1
-- Tabla lectura_digital
CREATE TABLE public.lectura_digital (
    id_p401_1 integer PRIMARY KEY,
    p401_1 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.lectura_digital VALUES 
(0, 'Valores Nulos'), (1, 'Sí'), (2, 'No');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_lectura_digital
FOREIGN KEY (p401_1)
REFERENCES public.lectura_digital (id_p401_1);

 
 ----------------------------------------------------
-- Nombre columna: p401
-- Tabla frec_lectura_digital
CREATE TABLE public.frec_lectura_digital (
    id_p401 integer PRIMARY KEY,
    p401 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.frec_lectura_digital VALUES 
(0, 'Valores Nulos'), (1, 'Diariamente?'), (2, 'Varias veces a la semana?'), (3, 'Una vez a la semana?'), (4, 'Una vez al mes?'), (5, 'Una vez cada tres meses?'), (6, 'Por lo menos una vez al año?');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_frec_lectura_digital
FOREIGN KEY (p401)
REFERENCES public.frec_lectura_digital (id_p401);

 
 ----------------------------------------------------
-- Nombre columna: p402
-- Tabla lectura_impresa
CREATE TABLE public.lectura_impresa (
    id_p402 integer PRIMARY KEY,
    p402 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.lectura_impresa VALUES 
(0, 'Valores Nulos'), (1, 'Sí'), (2, 'No');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_lectura_impresa
FOREIGN KEY (p402)
REFERENCES public.lectura_impresa (id_p402);

 
 ----------------------------------------------------
-- Nombre columna: p403
-- Tabla frec_lectura_impresa
CREATE TABLE public.frec_lectura_impresa (
    id_p403 integer PRIMARY KEY,
    p403 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.frec_lectura_impresa VALUES 
(0, 'Valores Nulos'), (1, 'Diariamente?'), (2, 'Varias veces a la semana?'), (3, 'Una vez a la semana?'), (4, 'Una vez al mes?'), (5, 'Una vez cada tres meses?'), (6, 'Por lo menos una vez al año?');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_frec_lectura_impresa
FOREIGN KEY (p403)
REFERENCES public.frec_lectura_impresa (id_p403);

 
-- PRACTICAS LECTORAS 2
 ----------------------------------------------------
-- Nombre columna: p407_1_1
-- Tabla frec_comucacion_lecturas
CREATE TABLE public.frec_comucacion_lecturas (
    id_p407_1_1 integer PRIMARY KEY,
    p407_1_1 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.frec_comucacion_lecturas VALUES 
(0, 'Valores Nulos'), (1, 'Diariamente'), (2, 'Varias veces a la semana'), (3, 'Una vez a la semana'), (4, 'Una vez al mes'), (5, 'Una vez cada tres meses'), (6, 'Por lo menos una vez al año');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_frec_comucacion_lecturas
FOREIGN KEY (p407_1_1)
REFERENCES public.frec_comucacion_lecturas (id_p407_1_1);

 
 ----------------------------------------------------
-- Nombre columna: p407_2
-- Tabla interes_lector
CREATE TABLE public.interes_lector (
    id_p407_2 integer PRIMARY KEY,
    p407_2 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.interes_lector VALUES 
(0, 'Valores Nulos'), (1, 'Sí'), (2, 'No');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_interes_lector
FOREIGN KEY (p407_2)
REFERENCES public.interes_lector (id_p407_2);

 
 ----------------------------------------------------
-- Nombre columna: p407_2_1
-- Tabla frec_interes_lector
CREATE TABLE public.frec_interes_lector (
    id_p407_2_1 integer PRIMARY KEY,
    p407_2_1 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.frec_interes_lector VALUES 
(0, 'Valores Nulos'), (1, 'Diariamente'), (2, 'Varias veces a la semana'), (3, 'Una vez a la semana'), (4, 'Una vez al mes'), (5, 'Una vez cada tres meses'), (6, 'Por lo menos una vez al año');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_frec_interes_lector
FOREIGN KEY (p407_2_1)
REFERENCES public.frec_interes_lector (id_p407_2_1);

 
 ----------------------------------------------------
-- Nombre columna: p407_3_1
-- Tabla frec_escritura
CREATE TABLE public.frec_escritura (
    id_p407_3_1 integer PRIMARY KEY,
    p407_3_1 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.frec_escritura VALUES 
(0, 'Valores Nulos'), (1, 'Diariamente'), (2, 'Varias veces a la semana'), (3, 'Una vez a la semana'), (4, 'Una vez al mes'), (5, 'Una vez cada tres meses'), (6, 'Por lo menos una vez al año');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_frec_escritura
FOREIGN KEY (p407_3_1)
REFERENCES public.frec_escritura (id_p407_3_1);

 
 ----------------------------------------------------
-- Nombre columna: p407_4_1
-- Tabla frec_participacion_lectura
CREATE TABLE public.frec_participacion_lectura (
    id_p407_4_1 integer PRIMARY KEY,
    p407_4_1 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.frec_participacion_lectura VALUES 
(0, 'Valores Nulos'), (1, 'Diariamente'), (2, 'Varias veces a la semana'), (3, 'Una vez a la semana'), (4, 'Una vez al mes'), (5, 'Una vez cada tres meses'), (6, 'Por lo menos una vez al año');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_frec_participacion_lectura
FOREIGN KEY (p407_4_1)
REFERENCES public.frec_participacion_lectura (id_p407_4_1);

 
-- LECTURA DE LIBROS
-- LECTURA DE LIBROS 2
 ----------------------------------------------------
-- Nombre columna: p415
-- Tabla lib_pay_free
CREATE TABLE public.lib_pay_free (
    id_p415 integer PRIMARY KEY,
    p415 VARCHAR(100)
);

-- Valores para insercion
INSERT INTO public.lib_pay_free VALUES 
(0, 'Valores Nulos'), (1, 'Sí'), (2, 'No');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_lib_pay_free
FOREIGN KEY (p415)
REFERENCES public.lib_pay_free (id_p415);