-- 1. CREACIÓN DE BASE DE DATOS Y USO
CREATE DATABASE IF NOT EXISTS comercio;
-- Voy a utilizar la base de datos renombrada
USE comercio;

-- 2. CREACIÓN DE TABLAS INDEPENDIENTES
CREATE TABLE IF NOT EXISTS clientes(
    id_cliente INT UNIQUE NOT NULL PRIMARY KEY,
    Nombre_cliente VARCHAR(30) NOT NULL,
    Nombredos_cliente VARCHAR(30) NULL,
    Apellido_cliente VARCHAR(30) NOT NULL,
    Apellidos_cliente VARCHAR(30) NULL
);

CREATE TABLE IF NOT EXISTS productos(
    id_producto INT UNIQUE NOT NULL PRIMARY KEY,
    Nombre_producto VARCHAR(30) NOT NULL,
    Marca VARCHAR(30) NULL,
    Precio DECIMAL(10,2) NOT NULL
);

-- 3. CREACIÓN DE LA TABLA DEPENDIENTE (FACTURAS/PEDIDOS)
-- Esta tabla relaciona Clientes y Productos, como se ve en tu diagrama (entidad PEDIDO).
CREATE TABLE IF NOT EXISTS facturas(
    id_factura INT UNIQUE NOT NULL PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    Fecha DATE NOT NULL,
    Valor_total DECIMAL(10,2),

    CONSTRAINT fkfactura_cliente FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
    CONSTRAINT fkfactura_producto FOREIGN KEY (id_producto) REFERENCES productos (id_producto)
);


-- 4. INSERCIÓN DE DATOS (INSERT INTO)
-- A. Insertar Clientes
INSERT INTO clientes (id_cliente, Nombre_cliente, Apellido_cliente) VALUES
(101, 'Ana', 'Pérez'),
(102, 'Juan', 'García'),
(103, 'Sofía', 'Rodríguez');

-- B. Insertar Productos
INSERT INTO productos (id_producto, Nombre_producto, Marca, Precio) VALUES
(1, 'Laptop X', 'TechCorp', 999.99),
(2, 'Mouse Pro', 'Logi', 25.00),
(3, 'Monitor 4K', 'ViewSonic', 350.50);

-- C. Insertar Facturas/Pedidos (usando IDs existentes de Clientes y Productos)
INSERT INTO facturas (id_factura, id_cliente, id_producto, Fecha, Valor_total) VALUES
(5001, 101, 1, '2025-11-01', 999.99), -- Ana compra Laptop X
(5002, 102, 2, '2025-11-01', 25.00),  -- Juan compra Mouse Pro
(5003, 101, 3, '2025-11-02', 350.50), -- Ana compra Monitor 4K
(5004, 103, 2, '2025-11-03', 25.00);  -- Sofía compra Mouse Pro