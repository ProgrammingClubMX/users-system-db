-- Se crearón tablas de grupos para el usuario
CREATE TABLE "group"(
    "id" UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
    "name" VARCHAR(350),
    "description" TEXT,
    "urlImage" TEXT
);

CREATE TABLE "userToGroup"(
    "id" UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
    "userId" UUID NOT NULL,
    "groupId" UUID NOT NULL
);

ALTER TABLE "userToGroup"
    ADD CONSTRAINT "userToGroup_to_user"
    FOREIGN kEY ("userId")
    REFERENCES "user"("id");

ALTER TABLE "userToGroup" -- altera la tabla "userToGroup"
    ADD CONSTRAINT "userToGroup_to_group" -- si la tabla existe, agrega una nueva restriccion que se va a llamar "userToGroup_to_group"
    FOREIGN KEY ("groupId") -- si no existe una restricción con el mismo nombre, convierte la columna "groupId" en una llave foránea
    REFERENCES "group"("id"); -- si lograste convertir la columna "groupId" en llave foránea, has referencia a la columna "id" de la tabla "group"
 