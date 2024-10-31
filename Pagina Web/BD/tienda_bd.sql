-- Crear base de datos
CREATE DATABASE IF NOT EXISTS tienda;
USE tienda;

-- Tabla Usuarios
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    contraseña VARCHAR(100) NOT NULL,
    dirección VARCHAR(255),
    rol VARCHAR(50),
    teléfono VARCHAR(20)
);

-- Tabla Productos
CREATE TABLE Productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripción TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    imagen VARCHAR(255),
    stock INT NOT NULL,
    descuento DECIMAL(5, 2)
);

-- Tabla Órdenes
CREATE TABLE Órdenes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    total DECIMAL(10, 2) NOT NULL,
    fecha DATETIME NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- Tabla Detalles_Órdenes
CREATE TABLE Detalles_Órdenes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    orden_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    descuento DECIMAL(5, 2),
    FOREIGN KEY (orden_id) REFERENCES Órdenes(id),
    FOREIGN KEY (producto_id) REFERENCES Productos(id)
);
