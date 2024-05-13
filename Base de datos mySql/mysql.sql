-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS BaseDeDatosLenguaDeSenas;
USE BaseDeDatosLenguaDeSenas;

-- Creación de la tabla de Usuarios
CREATE TABLE Usuarios (
    UsuarioID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    CorreoElectronico VARCHAR(100) UNIQUE,
    Contrasena VARCHAR(255),
    FotoDePerfil VARCHAR(255),
    Edad INT,
    Pais VARCHAR(50),
    Region VARCHAR(50),
    LenguaNativa VARCHAR(50),
    NivelDeLenguaDeSenas VARCHAR(50),
    Intereses TEXT
);

-- Creación de la tabla de Lecciones
CREATE TABLE Lecciones (
    LeccionID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID INT,
    Video VARCHAR(255),
    Guion TEXT,
    Transcripcion TEXT,
    EjerciciosInteractivos TEXT,
    Juegos TEXT,
    Historias TEXT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID) ON DELETE CASCADE
);

-- Creación de la tabla de Progreso del Estudiante
CREATE TABLE ProgresoEstudiante (
    ProgresoID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID INT,
    LeccionID INT,
    LeccionCompletada BOOLEAN,
    PuntajesDePruebas FLOAT,
    Fortalezas TEXT,
    Debilidades TEXT,
    MetasPersonalizadas TEXT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID) ON DELETE CASCADE,
    FOREIGN KEY (LeccionID) REFERENCES Lecciones(LeccionID) ON DELETE CASCADE
);

-- Creación de la tabla de Recursos
CREATE TABLE Recursos (
    RecursoID INT AUTO_INCREMENT PRIMARY KEY,
    LeccionID INT,
    Tipo ENUM('Signo', 'Gramatica', 'Cultura'),
    Contenido TEXT,
    URLVideo VARCHAR(255),
    Descripcion TEXT,
    Ejemplos TEXT,
    FOREIGN KEY (LeccionID) REFERENCES Lecciones(LeccionID) ON DELETE SET NULL
);

-- Creación de la tabla de Diccionario de Señas
CREATE TABLE DiccionarioSenas (
    SenaID INT AUTO_INCREMENT PRIMARY KEY,
    Palabra VARCHAR(100),
    Imagen VARCHAR(255),
    Video VARCHAR(255),
    Definicion TEXT,
    EjemplosDeUso TEXT
);

-- Creación de una tabla de unión para Lecciones y DiccionarioSenas
CREATE TABLE LeccionesSenas (
    LeccionID INT,
    SenaID INT,
    PRIMARY KEY (LeccionID, SenaID),
    FOREIGN KEY (LeccionID) REFERENCES Lecciones(LeccionID) ON DELETE CASCADE,
    FOREIGN KEY (SenaID) REFERENCES DiccionarioSenas(SenaID) ON DELETE CASCADE
);
