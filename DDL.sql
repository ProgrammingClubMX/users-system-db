CREATE DATABASE users_system IF NOT EXISTS;

USE users_system;
CREATE TABLE customer (
    id              VARCHAR(100) NOT NULL UNIQUE PRIMARY KEY,
    companyName     VARCHAR(100) NOT NULL,
    phoneNumber     VARCHAR(50)
);

CREATE TABLE "user" (
    "userRole"                      VARCHAR(20) NOT NULL,
    email                           VARCHAR(320) NOT NULL,
    "emailVerificationCode"         VARCHAR(8),
    "passwordRecoveryCode"          VARCHAR(8),
    "password"                      TEXT NOT NULL,
    "termsAndConditionsAccepted"    BOOLEAN DEFAULT FALSE,
    "customerId"                    VARCHAR(100) NOT NULL
);

-- 1. Habilitar el tipo de dato UUID porque no está activo por defecto en Postgres
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";


-- 2. Agregar una columna id a la tabla user porque no tenía ID
ALTER TABLE "user"
    ADD COLUMN "id" UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4();


-- 3. Actualizar el tipo de dato de la tabla user en su columna customerId para prepararla para ser usada como foreign key
ALTER TABLE "user"
    ALTER COLUMN "customerId" SET DATA TYPE UUID USING (uuid_generate_v4()),
    ALTER COLUMN "customerId" SET NOT NULL,
    ALTER COLUMN "customerId" SET DEFAULT uuid_generate_v4();


-- 4. Actualizar el tipo de dato de la tabla customer en su columna id para que sea de tipo UUID
ALTER TABLE "customer"
    ALTER COLUMN "id" SET DATA TYPE UUID USING (uuid_generate_v4()),
    ALTER COLUMN "id" SET NOT NULL,
    ALTER COLUMN "id" SET DEFAULT uuid_generate_v4();

-- 5. Borrar las filas (rows) existentes en la tabla user porque tenían datos en donde va la llave foranea pero en realidad no apuntaba a ningún customer, y eso daba error
TRUNCATE TABLE "user";

-- 6. Agregar la constraint de llave foranea para conectar las tablas customer e user
ALTER TABLE "user"
    ADD CONSTRAINT user_to_customer
    FOREIGN KEY ("customerId")
    REFERENCES customer ("id");

-- 7. Corregir los nombres de columna de la tabla customer para que se respete el camel case
ALTER TABLE "customer"
    RENAME COLUMN companyname TO "companyName";

ALTER TABLE "customer"
    RENAME COLUMN phonenumber TO "phoneNumber";
