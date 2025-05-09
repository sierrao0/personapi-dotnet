-- Crear la base de datos si no existe
IF DB_ID('persona_db') IS NULL
    CREATE DATABASE persona_db;

-- Seleccionar la base de datos para trabajar
USE persona_db;

-- Crear la tabla persona
CREATE TABLE persona (
    cc INT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    genero CHAR(1) NOT NULL,
    edad INT NULL,
    CONSTRAINT pk_persona PRIMARY KEY (cc),
    CONSTRAINT chk_genero CHECK (genero IN ('M', 'F'))
);

-- Crear índice en la tabla persona (clave primaria ya tiene índice implícito)
-- No se necesitan índices adicionales según el modelo

-- Crear la tabla profesion
CREATE TABLE profesion (
    id INT NOT NULL,
    nom VARCHAR(90) NOT NULL,
    des TEXT NULL,
    CONSTRAINT pk_profesion PRIMARY KEY (id)
);

-- Crear la tabla telefono
CREATE TABLE telefono (
    num VARCHAR(15) NOT NULL,
    oper VARCHAR(45) NOT NULL,
    duenio INT NOT NULL,
    CONSTRAINT pk_telefono PRIMARY KEY (num),
    CONSTRAINT fk_telefono_persona FOREIGN KEY (duenio) REFERENCES persona(cc)
);

-- Crear índice para la relación telefono_persona_k
CREATE INDEX telefono_persona_k ON telefono(duenio);

-- Crear la tabla estudios
CREATE TABLE estudios (
    id_prof INT NOT NULL,
    cc_per INT NOT NULL,
    fecha DATE NULL,
    univer VARCHAR(50) NULL,
    CONSTRAINT pk_estudios PRIMARY KEY (id_prof, cc_per),
    CONSTRAINT fk_estudios_profesion FOREIGN KEY (id_prof) REFERENCES profesion(id),
    CONSTRAINT fk_estudios_persona FOREIGN KEY (cc_per) REFERENCES persona(cc)
);