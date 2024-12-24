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
-- agregar una columna a data_total (cod_prov) y borrar ccpp, nombrepp
-- especificamos la primary key para nuestra tabla 
ALTER TABLE public.provincia ADD CONSTRAINT provincia_pkey PRIMARY KEY (cod_prov);

-- BORRAMOSLA COLUMNA CON EL NOMBRE DE LAS PROVINCIAS
ALTER TABLE public.data_total
DROP COLUMN nombrepp;
