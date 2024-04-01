-- Creación de DB
CREATE DATABASE alkewalletdb;

USE alkewalletdb;

-- Creación de tablas
CREATE TABLE Usuario (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(40) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    money_balance DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Moneda (
    currency_id INT PRIMARY KEY AUTO_INCREMENT,
    currency_name VARCHAR(50) NOT NULL,
    currency_symbol VARCHAR(10) NOT NULL
);

CREATE TABLE Transaccion (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    sender_user_id INT,
    receiver_user_id INT,
    importe DECIMAL(10, 2) NOT NULL,
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    currency_id INT,
    FOREIGN KEY (sender_user_id) REFERENCES Usuario(user_id),
    FOREIGN KEY (receiver_user_id) REFERENCES Usuario(user_id),
    FOREIGN KEY (currency_id) REFERENCES Moneda(currency_id)
);

-- Insertar datos en tabla Usuario

INSERT INTO Usuario(user_name, email, password, money_balance)
VALUES ("Laura", "laura22@gmail.com", "laura2355$", 10500),
       ("Juan", "juan@example.com", "juAnP@ssw0rd", 7500),
       ("María", "maria@example.com", "m@r1aP@ss", 12000),
       ("Pedro", "pedro@example.com", "p3dr0P@ss", 8500);
       
-- Insertar datos en tabla Moneda

INSERT INTO Moneda(currency_name, currency_symbol )
VALUES("Peso Chileno", "CLP"),
      ("Dolar", "USD");

-- Insertar datos en tabla Transaccion

INSERT INTO Transaccion(sender_user_id, receiver_user_id, importe, currency_id)
VALUES (1, 2, 100000.00, 1),
(1, 2, 800000.00, 1),
(2,4,200000,2),
(2,3,200000,2);

-- --------------- Consultas SQL -------------------------

-- Consulta para obtener el nombre de la moneda elegida por un usuario
SELECT U.user_name, M.currency_name
FROM Transaccion T
JOIN Usuario U ON T.sender_user_id = U.user_id
JOIN Moneda M ON T.currency_id = M.currency_id
WHERE U.user_name = 'Laura';


-- Consulta para obtener todas las transacciones registradas

SELECT * FROM transaccion;

-- Consulta para obtener todas las transacciones realizadas por un usuario específico

SELECT * FROM alkewalletdb.transaccion
WHERE sender_user_id = 2 OR receiver_user_id = 2;


-- Sentencia DML para modificar el campo correo electrónico de un usuario específico
UPDATE Usuario 
SET email = "new_email@gmail.com"
WHERE user_id = 2;

SELECT * FROM Usuario;

-- Sentencia para eliminar los datos de una transacción (eliminado de la fila completa)
DELETE FROM Transaccion
WHERE transaction_id = 6;

SELECT * FROM alkewalletdb.usuario;
