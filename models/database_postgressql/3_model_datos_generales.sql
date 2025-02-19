-- MODIFICACIONES DEL SECTOR DE DATOS GENERALES
----------------------------------------------------------------
-- 1. CREACION DE TABLA DEPARTAMENTOS
CREATE TABLE public.departamento AS
SELECT DISTINCT ccdd , nombredd 
FROM  public.data_total
ORDER BY ccdd;

-- especificamos la primary key para nuestra tabla 
ALTER TABLE public.departamento ADD CONSTRAINT departamento_pkey PRIMARY KEY (ccdd);

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_ccdd
FOREIGN KEY (ccdd)
REFERENCES public.departamento (ccdd);

-- BORRAMOS LA COMLUMNA CON EL NOMBRE DE LOS DEPARTAMENTOS
ALTER TABLE public.data_total DROP COLUMN nombredd;

----------------------------------------------------------------

-- 2. CREACIO DE TABLA PROVINCIAS 
CREATE TABLE public.provincia AS
SELECT DISTINCT CONCAT(ccpp,'0',ccdd) as cod_prov , nombrepp
FROM public.data_total
ORDER BY cod_prov;

-- especificamos la primary key para nuestra tabla 
ALTER TABLE public.provincia ADD CONSTRAINT provincia_pkey PRIMARY KEY (cod_prov);

-- agregar una columna a data_total (cod_prov) y borrar ccpp, nombrepp
ALTER TABLE public.data_total ADD COLUMN cod_prov VARCHAR(10);

-- agregamos datos a la columna cod_prov (valores unicos por provincia)
UPDATE public.data_total
SET cod_prov = CONCAT(ccpp,'0',ccdd);

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_cod_prov
FOREIGN KEY (cod_prov)
REFERENCES public.provincia (cod_prov);

-- BORRAMOSLA COLUMNA CON EL NOMBRE DE LAS PROVINCIAS y ccpp
ALTER TABLE public.data_total
DROP COLUMN ccpp;

ALTER TABLE public.data_total
DROP COLUMN nombrepp;

---------------------------------------------------------------

-- 3. DISTRITO
CREATE TABLE public.distrito AS
SELECT DISTINCT ubigeo, nombredi
FROM public.data_total
ORDER BY ubigeo;

-- especificamos la primary key para nuestra tabla 
ALTER TABLE public.distrito ADD CONSTRAINT distrito_pkey PRIMARY KEY (ubigeo);

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_distrito
FOREIGN KEY (ubigeo)
REFERENCES public.distrito (ubigeo);

-- Borramos la columna con el nombre de los distritos
ALTER TABLE public.data_total
DROP COLUMN nombredi;

---------------------------------------------------------------
/*
-- 4. AGREGAR TABLA DOMINIO GEOGRAFICO
CREATE TABLE public.dominio_geografico (
	dominio_pk integer PRIMARY KEY,
	dominio_geografico varchar(25)
	);

-- INSERTAR LOS DATOS DE DOMINIO GEOGRAFICO 
INSERT INTO public.dominio_geografico VALUES
(1, 'Costa Norte'),
(2, 'Costa Centro'),
(3, 'Costa Sur'),
(4, 'Sierra Norte'),
(5, 'Sierra Centro'),
(6, 'Sierra Sur'),
(7, 'Selva'),
(8, 'Lima Metropolitana');

-- creamos la fk
ALTER TABLE public.data_total
ADD CONSTRAINT fk_dominio
FOREIGN KEY (dominio)
REFERENCES public.dominio_geografico (dominio_pk);
*/