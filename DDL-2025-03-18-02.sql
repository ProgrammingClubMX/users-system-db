-- Se crearón tablas de grupos para el usuario
CREATE TABLE "group"( -- crear tabla con el nombre "group"
    "id" UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(), -- se crea una tabla llamada "id" del tipo de dato UUID que debe asegurar que no esta nulo y tendra una clave primaria y en automatigo tendra un valor generado por la funcion UUID
    "name" VARCHAR(350), --se agregara una columna con el nombre "name" con un tipo de dato VARCHAR (con un maxiomo de 350 caracteres)
    "description" TEXT, --se agregara una columna con el nombre "description" con un tipo de dato TEXT
    "urlImage" TEXT --se agregara una columna con el nombre "urlImage" con un tipo de dato TEXT
);
-- esta es una tabla pivote entre el usuario grupo
CREATE TABLE "userToGroup"( --se crea una tabla con el nombre "userToGroup"
    "id" UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
    "userId" UUID NOT NULL, --se crea la columna "userId" con tipo de dato UUID con una restricción no nula (para conectar la tabla "user")
    "groupId" UUID NOT NULL --se crea la columna "groupId" con tipo de dato UUID con una restrcción no nula (para conectar la tabla "group") 
);

ALTER TABLE "userToGroup"
    ADD CONSTRAINT "userToGroup_to_user"
    FOREIGN kEY ("userId")
    REFERENCES "user"("id");

ALTER TABLE "userToGroup" -- altera la tabla "userToGroup"
    ADD CONSTRAINT "userToGroup_to_group" -- si la tabla existe, agrega una nueva restriccion que se va a llamar "userToGroup_to_group"
    FOREIGN KEY ("groupId") -- si no existe una restricción con el mismo nombre, convierte la columna "groupId" en una llave foránea
    REFERENCES "group"("id"); -- si lograste convertir la columna "groupId" en llave foránea, has referencia a la columna "id" de la tabla "group"
 