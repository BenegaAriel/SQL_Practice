-- Creacion de la Tabla bna que contiene los valores diarios de dolar del banco nacion compra y venta desde Enero-2013 --

CREATE TABLE bna (
	bna_id serial,
	fecha DATE,
	bna_compra DECIMAL(5,2),
	bna_venta DECIMAL(5,2),
	PRIMARY KEY(bna_id)
);

-- Importar el archivo .csv --

-- Ver todas las columnas que tiene la tabla bna, pero limitado a los 10 pimero registros --

SELECT * FROM bna
ORDER BY fecha DESC
LIMIT 10;




-- Creacion de la Tabla blue que contiene los valores diarios de dolar blue compra y venta desde Enero-2013 --

CREATE TABLE blue (
	blue_id serial,
	fecha DATE,
	blue_compra DECIMAL(5,2),
	blue_venta DECIMAL(5,2),
	PRIMARY KEY(blue_id)
);


-- Ver todas las columnas que tiene la tabla blue, pero limitado a los 10 pimero registros --

SELECT * FROM blue
ORDER BY fecha DESC
LIMIT 10;




-- Creacion de la Tabla uva que contiene los valores diarios de Unidad de Valor Adquisitivo (UVA) --

CREATE TABLE uva (
	uva_id serial,
	fecha DATE,
	valor_uva DECIMAL(5,2),
	PRIMARY KEY(uva_id)
);

-- Importar el archivo .csv --


-- Ver todas las columnas que tiene la tabla, pero limitado a los 10 pimero registros --

SELECT * FROM uva
ORDER BY fecha DESC
LIMIT 10;


-- Seleccionar solo los valores del dia 10 de cada mes --
-- Las personas que tiene hipoteca en Banco Nacion calculan sus cuotas con los valores del dia 10 --

SELECT fecha, valor_uva FROM uva 
WHERE EXTRACT(DAY FROM fecha) = 10;
