-- ORACLE SQL DATABASE CREATION SCRIPT


--------------------- CREAR TABLAS INDEPENDIENTES ---------------------

-- CREAR TABLA DE pais
CREATE TABLE pais(
    IdPais CHAR(2) NOT NULL,
    nombre VARCHAR2(40) NOT NULL,
    CONSTRAINT PK_pais PRIMARY KEY (IdPais)
);
COMMENT ON COLUMN pais.IdPais IS
    'Segun ISO 3166-1. Ejemplo ''CR'' para Costa Rica, ''US'' para Estados Unidos, ''DE'' para Alemania';
COMMENT ON COLUMN pais.nombre IS
    'Nombre del pais';


-- CREAR TABLA DE IDIOMAS
CREATE TABLE idioma(
    IdIdioma CHAR(2) NOT NULL,
    nombre VARCHAR2(25) NOT NULL,
    CONSTRAINT PK_idioma PRIMARY KEY (IdIdioma)
);
COMMENT ON COLUMN idioma.IdIdioma IS
    'Segun ISO 639-1. Ejemplo ''es'' para español, ''en'' para ingles, ''fr'' para frances';
COMMENT ON COLUMN idioma.nombre IS
    'Español, Ingles, frances';


-- CREAR TABLA DE GENEROS
CREATE TABLE genero(
    IdGenero NUMBER NOT NULL,
    nombre VARCHAR2(25) NOT NULL,
    CONSTRAINT PK_genero PRIMARY KEY (IdGenero)
);
COMMENT ON COLUMN genero.nombre IS
    'Nombre del genero del video';


-- CREAR TABLA DE SAGAS
CREATE TABLE saga(
    IdSaga NUMBER NOT NULL,
    tituloGeneral VARCHAR2(50) NOT NULL,
    abstract VARCHAR2(700) NOT NULL,
    añoInicio NUMBER(4) NOT NULL,
    materialOriginal VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_saga PRIMARY KEY (IdSaga)
);
COMMENT ON COLUMN saga.materialoriginal IS
    'basada en (Novela, Cuento, Comic, Estudio, Biografia, Reportaje)';


-- CREAR TABLA DE MACROSERIES
CREATE TABLE macroserie(
    IdMacroserie NUMBER NOT NULL,
    tituloGeneral VARCHAR2(50) NOT NULL,
    abstract VARCHAR2(700) NOT NULL,
    añoInicio NUMBER(4) NOT NULL,
    materialOriginal VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_macroserie PRIMARY KEY (IdMacroserie)
);
COMMENT ON COLUMN macroserie.materialoriginal IS
    'basada en (Novela, Cuento, Comic, Estudio, Biografia, Reportaje)';


-- CREAR TABLA DE DOCUSERIES
CREATE TABLE docuserie(
    IdDocuserie NUMBER NOT NULL,
    tituloGeneral VARCHAR2(50) NOT NULL,
    abstract VARCHAR2(700) NOT NULL,
    añoInicio NUMBER(4) NOT NULL,
    materialOriginal VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_docuserie PRIMARY KEY (IdDocuserie)
);
COMMENT ON COLUMN docuserie.materialoriginal IS
    'basada en (Novela, Cuento, Comic, Estudio, Biografia, Reportaje)';


--------------------- CREAR TABLAS DEPENDIENTES 1 ---------------------

-- CREAR TABLA DE ARTISTAS
CREATE TABLE artista(
    IdArtista NUMBER NOT NULL,
    IdPais CHAR(2) NOT NULL,
    nombre VARCHAR2(25) NOT NULL,
    apellido VARCHAR2(25) NOT NULL,
    fechanacimiento DATE NOT NULL,
    sexo CHAR(1) NOT NULL,
    CONSTRAINT PK_artista PRIMARY KEY (IdArtista),
    CONSTRAINT FK_artista_pais FOREIGN KEY (IdPais) REFERENCES pais(IdPais)
);
COMMENT ON COLUMN artista.nombre IS
    'Contempla primer y segundo nombre';
COMMENT ON COLUMN artista.apellido IS
    'Contempla primer y segundo apellido';
COMMENT ON COLUMN artista.fechanacimiento IS
    'Ejemplo ''24/08/83'' (''DD/MM/YY'')';
COMMENT ON COLUMN artista.sexo IS
    'Masculino = ''M'', Femenino =''F''';


-- CREAR TABLA DE CLIENTES
CREATE TABLE cliente(
    IdCliente NUMBER NOT NULL,
    IdPais CHAR(2) NOT NULL,
    nombre VARCHAR2(25) NOT NULL,
    apellido VARCHAR2(25) NOT NULL,
    correo VARCHAR2(50) NOT NULL,
    contraseña VARCHAR2(25) NOT NULL,
    telefono NUMBER NOT NULL,
    fechanacimiento DATE NOT NULL,
    fecharegistro DATE NOT NULL,
    sexo CHAR(1) NOT NULL,
    direccion VARCHAR2(100) NOT NULL,
    tipocuenta VARCHAR2(15) NOT NULL,
    CONSTRAINT PK_cliente PRIMARY KEY (IdCliente),
    CONSTRAINT FK_cliente_pais FOREIGN KEY (IdPais) REFERENCES pais(IdPais)
);
COMMENT ON COLUMN cliente.idcliente IS
    'Identificacion nacional';
COMMENT ON COLUMN cliente.nombre IS
    'Contempla primer y segundo nombre';
COMMENT ON COLUMN cliente.apellido IS
    'Contempla primer y segundo apellido';
COMMENT ON COLUMN cliente.correo IS
    'Ejemplo: ''jhidalgou@ucenfotec.ac.cr''';
COMMENT ON COLUMN cliente.contraseña IS
    'Contraseña del cliente';
COMMENT ON COLUMN cliente.telefono IS
    'Ejemplo: 87233016';
COMMENT ON COLUMN cliente.fechanacimiento IS
    'Ejemplo ''24/08/83'' (''DD/MM/YY'')';
COMMENT ON COLUMN cliente.fecharegistro IS
    'Fecha en la que se registro en la aplicacion';
COMMENT ON COLUMN cliente.sexo IS
    'Masculino = ''M'', Femenino =''F''';
COMMENT ON COLUMN cliente.direccion IS
    'Direccion exacta';
COMMENT ON COLUMN cliente.tipocuenta IS
    'Tipo de cuenta que posee el cliente. Ejemplo: ''Gratuita'', ''Premium'', ''Familiar'', ''VIP''';


-- CREAR TABLA DE PELICULAS
CREATE TABLE pelicula(
    IdPelicula NUMBER NOT NULL,
    IdPais CHAR(2) NOT NULL,
    IdSaga NUMBER,
    titulo VARCHAR2(50) NOT NULL,
    abstract VARCHAR2(700) NOT NULL,
    añoestreno NUMBER(4) NOT NULL,
    estudio VARCHAR2(25) NOT NULL,
    clasificacion VARCHAR2(5) NOT NULL,
    duracion NUMBER(3) NOT NULL,
    audioDescription NUMBER(1) NOT NULL,
    CONSTRAINT PK_pelicula PRIMARY KEY (IdPelicula),
    CONSTRAINT FK_pelicula_pais FOREIGN KEY (IdPais) REFERENCES pais(IdPais),
    CONSTRAINT FK_pelicula_saga FOREIGN KEY (IdSaga) REFERENCES saga(IdSaga)
);
COMMENT ON COLUMN pelicula.añoestreno IS
    'Ejemplo: 2018';
COMMENT ON COLUMN pelicula.clasificacion IS
    'Ejemplos: TP12+, PG';
COMMENT ON COLUMN pelicula.duracion IS
    'Duración en minutos. Ejemplo 120 min';


-- CREAR TABLA DE DOCUMENTALES
CREATE TABLE documental(
    IdDocumental NUMBER NOT NULL,
    IdPais CHAR(2) NOT NULL,
    IdDocuserie NUMBER,
    titulo VARCHAR2(50) NOT NULL,
    abstract VARCHAR2(700) NOT NULL,
    añoestreno NUMBER(4) NOT NULL,
    temporadas NUMBER(3) NOT NULL,
    clasificacion VARCHAR2(5) NOT NULL,
    audioDescription NUMBER(1) NOT NULL,
    CONSTRAINT PK_documental PRIMARY KEY (IdDocumental),
    CONSTRAINT FK_documental_pais FOREIGN KEY (IdPais) REFERENCES pais(IdPais),
    CONSTRAINT FK_documental_docuserie FOREIGN KEY (IdDocuserie) REFERENCES docuserie(IdDocuserie)
);
COMMENT ON COLUMN documental.añoestreno IS
    'Ejemplo: 2018';
COMMENT ON COLUMN documental.clasificacion IS
    'Ejemplos: TP12+, PG';


-- CREAR TABLA DE SERIES
CREATE TABLE serie(
    IdSerie NUMBER NOT NULL,
    IdPais CHAR(2) NOT NULL,
    IdMacroserie NUMBER,
    titulo VARCHAR2(50) NOT NULL,
    abstract VARCHAR2(700) NOT NULL,
    añoestreno NUMBER(4) NOT NULL,
    temporadas NUMBER(3) NOT NULL,
    clasificacion VARCHAR2(5) NOT NULL,
    audioDescription NUMBER(1) NOT NULL,
    CONSTRAINT PK_serie PRIMARY KEY (IdSerie),
    CONSTRAINT FK_serie_pais FOREIGN KEY (IdPais) REFERENCES pais(IdPais),
    CONSTRAINT FK_serie_macroserie FOREIGN KEY (IdMacroserie) REFERENCES macroserie(IdMacroserie)
);
COMMENT ON COLUMN serie.añoestreno IS
    'Ejemplo: 2018';
COMMENT ON COLUMN serie.clasificacion IS
    'Ejemplos: TP12+, PG';


--------------------- CREAR TABLAS DEPENDIENTES 2 ---------------------

-- CREAR TABLA DE REPRODUCCIONES DE PELICULAS
CREATE TABLE reproduccionpelicula(
    IdReproduccion NUMBER NOT NULL,
    IdCliente NUMBER NOT NULL,
    IdPelicula NUMBER NOT NULL,
    fechaInicio DATE NOT NULL,
    estado VARCHAR2(10) NOT NULL,
    ultimaPosicion NUMBER(3) NOT NULL,
    CONSTRAINT PK_reproduccion_pelicula PRIMARY KEY (IdReproduccion),
    CONSTRAINT FK_reproduccion_pelicula_pelicula FOREIGN KEY (IdPelicula) REFERENCES pelicula(IdPelicula),
    CONSTRAINT FK_reproduccion_pelicula_cliente FOREIGN KEY (IdCliente) REFERENCES cliente(IdCliente)
);
COMMENT ON COLUMN reproduccionpelicula.estado IS
    'Ejemplo: Pausado, Terminado';
COMMENT ON COLUMN reproduccionpelicula.ultimaPosicion IS
    'Medido en minutos. Ejemplo: 120';


-- CREAR TABLA DE REPRODUCCIONES DE DOCUMENTALES
CREATE TABLE reproducciondocumental(
    IdReproduccion NUMBER NOT NULL,
    IdCliente NUMBER NOT NULL,
    IdDocumental NUMBER NOT NULL,
    fechaInicio DATE NOT NULL,
    estado VARCHAR2(10) NOT NULL,
    ultimaPosicion NUMBER(3) NOT NULL,
    CONSTRAINT PK_reproduccion_documental PRIMARY KEY (IdReproduccion),
    CONSTRAINT FK_reproduccion_documental_documental FOREIGN KEY (IdDocumental) REFERENCES documental(IdDocumental),
    CONSTRAINT FK_reproduccion_documental_cliente FOREIGN KEY (IdCliente) REFERENCES cliente(IdCliente)
);
COMMENT ON COLUMN reproducciondocumental.estado IS
    'Ejemplo: Pausado, Terminado';
COMMENT ON COLUMN reproducciondocumental.ultimaPosicion IS
    'Medido en minutos. Ejemplo: 16';

-- CREAR TABLA DE REPRODUCCIONES DE SERIES
CREATE TABLE reproduccionserie(
    IdReproduccion NUMBER NOT NULL,
    IdCliente NUMBER NOT NULL,
    IdSerie NUMBER NOT NULL,
    fechaInicio DATE NOT NULL,
    estado VARCHAR2(10) NOT NULL,
    ultimaPosicion NUMBER(3) NOT NULL,
    CONSTRAINT PK_reproduccion_serie PRIMARY KEY (IdReproduccion),
    CONSTRAINT FK_reproduccion_serie_serie FOREIGN KEY (IdSerie) REFERENCES serie(IdSerie),
    CONSTRAINT FK_reproduccion_serie_cliente FOREIGN KEY (IdCliente) REFERENCES cliente(IdCliente)
);
COMMENT ON COLUMN reproduccionserie.estado IS
    'Ejemplo: Pausado, Terminado';
COMMENT ON COLUMN reproduccionserie.ultimaPosicion IS
    'Medido en minutos. Ejemplo: 16';


-- CREAR TABLA DE DESCARGAS DE PELICULAS
CREATE TABLE descargapelicula(
    IdDescarga NUMBER NOT NULL,
    IdCliente NUMBER NOT NULL,
    IdPelicula NUMBER NOT NULL,
    fechaDescarga DATE NOT NULL,
    estado VARCHAR2(15) NOT NULL,
    tamaño NUMBER NOT NULL,
    CONSTRAINT PK_descarga_pelicula PRIMARY KEY (IdDescarga),
    CONSTRAINT FK_descarga_pelicula_pelicula FOREIGN KEY (IdPelicula) REFERENCES pelicula(IdPelicula),
    CONSTRAINT FK_descarga_pelicula_cliente FOREIGN KEY (IdCliente) REFERENCES cliente(IdCliente)
);
COMMENT ON COLUMN descargapelicula.estado IS
    'Ejemplo: Descargando, pausado y finalizado';
COMMENT ON COLUMN descargapelicula.tamaño IS
    'Medido en Megabytes';


-- CREAR TABLA DE DESCARGAS DE DOCUMENTALES
CREATE TABLE descargadocumental(
    IdDescarga NUMBER NOT NULL,
    IdCliente NUMBER NOT NULL,
    IdDocumental NUMBER NOT NULL,
    fechaDescarga DATE NOT NULL,
    estado VARCHAR2(15) NOT NULL,
    tamaño NUMBER NOT NULL,
    CONSTRAINT PK_descarga_documental PRIMARY KEY (IdDescarga),
    CONSTRAINT FK_descarga_documental_documental FOREIGN KEY (IdDocumental) REFERENCES documental(IdDocumental),
    CONSTRAINT FK_descarga_documental_cliente FOREIGN KEY (IdCliente) REFERENCES cliente(IdCliente)
);
COMMENT ON COLUMN descargadocumental.estado IS
    'Ejemplo: Descargando, pausado y finalizado';
COMMENT ON COLUMN descargadocumental.tamaño IS
    'Medido en Megabytes';


-- CREAR TABLA DE DESCARGAS DE SERIES
CREATE TABLE descargaserie(
    IdDescarga NUMBER NOT NULL,
    IdCliente NUMBER NOT NULL,
    IdSerie NUMBER NOT NULL,
    fechaDescarga DATE NOT NULL,
    estado VARCHAR2(15) NOT NULL,
    tamaño NUMBER NOT NULL,
    CONSTRAINT PK_descarga_serie PRIMARY KEY (IdDescarga),
    CONSTRAINT FK_descarga_serie_serie FOREIGN KEY (IdSerie) REFERENCES serie(IdSerie),
    CONSTRAINT FK_descarga_serie_cliente FOREIGN KEY (IdCliente) REFERENCES cliente(IdCliente)
);
COMMENT ON COLUMN descargaserie.estado IS
    'Ejemplo: Descargando, pausado y finalizado';
COMMENT ON COLUMN descargaserie.tamaño IS
    'Medido en Megabytes';


--------------------- CREAR TABLAS DE RELACIONES M-N ---------------------

-- CREAR TABLA DE RELACION DE GENEROS Y PELICULAS
CREATE TABLE genero_pelicula(
    IdGenero NUMBER NOT NULL,
    IdPelicula NUMBER NOT NULL,
    CONSTRAINT PK_genero_pelicula PRIMARY KEY (IdGenero, IdPelicula),
    CONSTRAINT FK_genero_pelicula_genero FOREIGN KEY (IdGenero) REFERENCES genero(IdGenero),
    CONSTRAINT FK_genero_pelicula_pelicula FOREIGN KEY (IdPelicula) REFERENCES pelicula(IdPelicula)
);


-- CREAR TABLA DE RELACION DE GENEROS Y DOCUMENTALES
CREATE TABLE genero_documental(
    IdGenero NUMBER NOT NULL,
    IdDocumental NUMBER NOT NULL,
    CONSTRAINT PK_genero_documental PRIMARY KEY (IdGenero, IdDocumental),
    CONSTRAINT FK_genero_documental_genero FOREIGN KEY (IdGenero) REFERENCES genero(IdGenero),
    CONSTRAINT FK_genero_documental_documental FOREIGN KEY (IdDocumental) REFERENCES documental(IdDocumental)
);


-- CREAR TABLA DE RELACION DE GENEROS Y SERIES
CREATE TABLE genero_serie(
    IdGenero NUMBER NOT NULL,
    IdSerie NUMBER NOT NULL,
    CONSTRAINT PK_genero_serie PRIMARY KEY (IdGenero, IdSerie),
    CONSTRAINT FK_genero_serie_genero FOREIGN KEY (IdGenero) REFERENCES genero(IdGenero),
    CONSTRAINT FK_genero_serie_serie FOREIGN KEY (IdSerie) REFERENCES serie(IdSerie)
);


-- CREAR TABLA DE RELACION DE ARTISTAS Y PELICULAS (REPARTO)
CREATE TABLE repartopelicula(
    IdArtista NUMBER NOT NULL,
    IdPelicula NUMBER NOT NULL,
    rol VARCHAR2(25) NOT NULL,
    CONSTRAINT PK_reparto_pelicula PRIMARY KEY (IdArtista, IdPelicula, rol),
    CONSTRAINT FK_reparto_pelicula_artista FOREIGN KEY (IdArtista) REFERENCES artista(IdArtista),
    CONSTRAINT FK_reparto_pelicula_pelicula FOREIGN KEY (IdPelicula) REFERENCES pelicula(IdPelicula)
);
COMMENT ON COLUMN repartopelicula.rol IS
    'Ejemplo: narrador, actor, director, productor';


-- CREAR TABLA DE RELACION DE ARTISTAS Y DOCUMENTALES (REPARTO)
CREATE TABLE repartodocumental(
    IdArtista NUMBER NOT NULL,
    IdDocumental NUMBER NOT NULL,
    rol VARCHAR2(25) NOT NULL,
    CONSTRAINT PK_reparto_documental PRIMARY KEY (IdArtista, IdDocumental, rol),
    CONSTRAINT FK_reparto_documental_artista FOREIGN KEY (IdArtista) REFERENCES artista(IdArtista),
    CONSTRAINT FK_reparto_documental_documental FOREIGN KEY (IdDocumental) REFERENCES documental(IdDocumental)
);
COMMENT ON COLUMN repartodocumental.rol IS
    'Ejemplo: narrador, actor, director, productor';


-- CREAR TABLA DE RELACION DE ARTISTAS Y SERIES (REPARTO)
CREATE TABLE repartoserie(
    IdArtista NUMBER NOT NULL,
    IdSerie NUMBER NOT NULL,
    rol VARCHAR2(25) NOT NULL,
    CONSTRAINT PK_reparto_serie PRIMARY KEY (IdArtista, IdSerie, rol),
    CONSTRAINT FK_reparto_serie_artista FOREIGN KEY (IdArtista) REFERENCES artista(IdArtista),
    CONSTRAINT FK_reparto_serie_serie FOREIGN KEY (IdSerie) REFERENCES serie(IdSerie)
);
COMMENT ON COLUMN repartoserie.rol IS
    'Ejemplo: narrador, actor, director, productor';


-- CREAR TABLA DE RELACION DE IDIOMAS Y PELICULAS
CREATE TABLE idioma_pelicula(
    IdIdioma CHAR(2) NOT NULL,
    IdPelicula NUMBER NOT NULL,
    tipo VARCHAR2(25) NOT NULL,
    CONSTRAINT PK_idioma_pelicula PRIMARY KEY (IdIdioma, IdPelicula, tipo),
    CONSTRAINT FK_idioma_pelicula_idioma FOREIGN KEY (IdIdioma) REFERENCES idioma(IdIdioma),
    CONSTRAINT FK_idioma_pelicula_pelicula FOREIGN KEY (IdPelicula) REFERENCES pelicula(IdPelicula)
);
COMMENT ON COLUMN idioma_pelicula.tipo IS
    'Ejemplo: original, doblado, subtitulado';


-- CREAR TABLA DE RELACION DE IDIOMAS Y DOCUMENTALES
CREATE TABLE idioma_documental(
    IdIdioma CHAR(2) NOT NULL,
    IdDocumental NUMBER NOT NULL,
    tipo VARCHAR2(25) NOT NULL,
    CONSTRAINT PK_idioma_documental PRIMARY KEY (IdIdioma, IdDocumental, tipo),
    CONSTRAINT FK_idioma_documental_idioma FOREIGN KEY (IdIdioma) REFERENCES idioma(IdIdioma),
    CONSTRAINT FK_idioma_documental_documental FOREIGN KEY (IdDocumental) REFERENCES documental(IdDocumental)
);
COMMENT ON COLUMN idioma_documental.tipo IS
    'Ejemplo: original, doblado, subtitulado';


-- CREAR TABLA DE RELACION DE IDIOMAS Y SERIES
CREATE TABLE idioma_serie(
    IdIdioma CHAR(2) NOT NULL,
    IdSerie NUMBER NOT NULL,
    tipo VARCHAR2(25) NOT NULL,
    CONSTRAINT PK_idioma_serie PRIMARY KEY (IdIdioma, IdSerie, tipo),
    CONSTRAINT FK_idioma_serie_idioma FOREIGN KEY (IdIdioma) REFERENCES idioma(IdIdioma),
    CONSTRAINT FK_idioma_serie_serie FOREIGN KEY (IdSerie) REFERENCES serie(IdSerie)
);
COMMENT ON COLUMN idioma_serie.tipo IS
    'Ejemplo: original, doblado, subtitulado';


SELECT * FROM cat;