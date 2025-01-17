/*  Query extraccion de data

Esta query extra los datos principales de la base de datos que generamos al principio del proyecto, se selecciono 
los datos que se creen mas relevantes para una clusterizacion. Ademas se aprovecho el formato de los datos (usa cada cateria)
para tener una mejor comprension sobre de que trata cada variable a diferencia de la data original que solo constaba de 1's y 0's

Esto posteriormente se puede abordar realizando un enconder de datos, almacenando el proceso y no tener problemas futuros

*/

SELECT 
    dt.id,                                              -- id encuestado
    dom.dominio AS Dom_Geografico,                     -- 1.
    est_soc.estratosocio AS Estrato_Socioeconomico,    -- 2.
	dt.p314 as ingresos_prom,
    sx.p209 AS genero,                                 -- 3.
    dt.p210_a AS edad,                                 -- Edad
    CASE                                                -- Segmentacion Socioeconomica
        WHEN p210_a BETWEEN 1 AND 24 THEN 'Educación Universitaria (< 24 años)'
        WHEN p210_a BETWEEN 25 AND 34 THEN 'Consolidación Profesional (25 a 34 años)'
        WHEN p210_a BETWEEN 35 AND 49 THEN 'Responsabilidades Familiares y Laborales (35 a 49 años)'
        WHEN p210_a BETWEEN 50 AND 100 THEN 'Actividades Culturales y Recreativas (> 49 años)'
        ELSE 'Fuera de rango'
    END AS seg_sociocultural,
    len_mat.p301 AS len_materna,                      	-- 6.
    COALESCE(sl.conteo_idiomas, 0) AS cantidad_idiomas,-- 7. Cantidad de idiomas hablados
	idt_cult.p303 as ident_cutural,					-- 8.
	prt_indg.p304 as perten_indigena,					-- 9.
	nv_educ.p306 as nivl_educativo,					-- 10.
	ct_educ.p306_c as centro_educativo,				-- 11.
	esc_indg.p308_1 as escrit_indigena,				-- 12.
	pb_vis.p315_1 as problema_vision,					-- 13.
	pb_audi.p315_2 as problema_auditivo,				-- 14.
	pb_comun.p315_3 as problema_comunicacion,			-- 15.
	pb_motr.p315_4 as problema_motriz,					-- 16.
	pb_compr.p315_5 as problema_comprension,			-- 17.	
	lec_digit.p401_1 as lectu_digital,					-- 18.
	fr_lec_digit.p401 as frecuencia_lectura_digital,	-- 19.
	lec_impresa.p402 as lectu_impresa,					-- 20.
	fr_lect_impresa.p403 as frecuencia_lectura_impresa, -- 21.
	COALESCE(rzn_no_lect.conteo_not_rzn, 0) AS cont_razon_no_lect,	-- 22.
	COALESCE(rzn_si_lect.conteo_si_rzn,0) as cont_razon_si_lect,	-- 23.
	COALESCE(amb_lect.conteo_ambientes,0) AS cont_ambientes,		-- 24.
	int_lect.p407_2 as interes_lect,					-- 25.
	cont_gener.conteo_gen as conteo_generos_lib,		-- 26.
	obt_libs.obt_lib as conteo_obtencion_lib			-- 27.
FROM 
    data_total AS dt
	
JOIN dominio_geografico AS dom                        -- 1.
    ON dt.dominio = dom.id_dominio
	
JOIN estrato_social AS est_soc                        -- 2.
    ON dt.estrato = est_soc.id_estratosocio
	
JOIN sexo AS sx                                       -- 3.
    ON dt.p209 = sx.id_p209

JOIN lengua_materna AS len_mat                        -- 6.
    ON dt.p301 = len_mat.id_p301
	
LEFT JOIN (											   -- 7. Selecciona incluso los valores sin dato 
    SELECT 
        id_persona, 
        COUNT(*) AS conteo_idiomas
    FROM 
        speak_leng
    GROUP BY 
        id_persona
	) AS sl
    ON dt.id = sl.id_persona
	
JOIN identidad_cultural as idt_cult				   -- 8.
	ON dt.p303 = idt_cult.id_p303

JOIN pertenecia_indigena as prt_indg				   -- 9.
	ON dt.p304 = prt_indg.id_p304 

JOIN nivel_educativo as nv_educ					   -- 10.
	ON dt.p306 = nv_educ.id_p306

JOIN centro_estatal_privado as ct_educ				   -- 11.
	ON dt.p306_c = ct_educ.id_p306_c

JOIN escritura_indigena as esc_indg				   -- 12.
	ON dt.p308_1 = esc_indg.id_p308_1

JOIN probl_vision as pb_vis							   -- 13.
	ON dt.p315_1 = pb_vis.id_p315_1

JOIN probl_auditivos as pb_audi					   -- 14.
	ON dt.p315_2 = pb_audi.id_p315_2

JOIN probl_comunicacion as pb_comun				   -- 15.
	ON dt.p315_3 = pb_comun.id_p315_3

JOIN probl_motrices as pb_motr						   -- 16.
	ON dt.p315_4 = pb_motr.id_p315_4

JOIN probl_comprension as pb_compr					   -- 17.
	ON dt.p315_5 = pb_compr.id_p315_5

JOIN lectura_digital as lec_digit					   -- 18.	
	ON dt.p401_1 = lec_digit.id_p401_1

JOIN frec_lectura_digital as fr_lec_digit			   -- 19.
	ON dt.p401 = fr_lec_digit.id_p401

JOIN lectura_impresa as lec_impresa				   -- 20.
	ON dt.p402 = lec_impresa.id_p402

JOIN frec_lectura_impresa as fr_lect_impresa		   -- 21.
	ON dt.p403 = fr_lect_impresa.id_p403

LEFT JOIN (											   -- 22. 
    SELECT 
        id_persona, 
        COUNT(*) AS conteo_not_rzn
    FROM 
        razones_no_lectura
    GROUP BY 
        id_persona
	) AS rzn_no_lect
    ON dt.id = rzn_no_lect.id_persona

LEFT JOIN (											   -- 23. 
	SELECT 
		id_persona,
		COUNT(*) as conteo_si_rzn
	FROM 
		razones_si_lectura
	GROUP BY 
		id_persona
	) AS rzn_si_lect
	ON dt.id = rzn_si_lect.id_persona
	
LEFT JOIN (											   -- 24.
	SELECT
		id_persona,
		COUNT(*) as conteo_ambientes
	FROM 
		ambientes_lectura
	GROUP BY
		id_persona
	) AS amb_lect
	ON dt.id = amb_lect.id_persona

JOIN interes_lector as int_lect					  -- 25.
	ON dt.p407_2 = int_lect.id_p407_2

LEFT JOIN (											  -- 26.
	SELECT 
		id_persona,
		COUNT(*) as conteo_gen
	FROM 
		generos_tipos_libros
	GROUP BY 
		id_persona
	) as cont_gener
	ON dt.id = cont_gener.id_persona

LEFT JOIN (											  -- 27.
	SELECT 
		id_persona,
		COUNT(*) as obt_lib
	FROM 
		obtencion_libros
	GROUP BY 
		id_persona
	) as obt_libs
	ON dt.id = obt_libs.id_persona
	;




	
/* Datos Extra para concatenacion (id's repetidos ya que son tablas normalizadas)

SELECT * FROM razones_no_lectura;
SELECT * FROM ambientes_lectura;
SELECT * FROM razones_si_lectura;

*/
	


