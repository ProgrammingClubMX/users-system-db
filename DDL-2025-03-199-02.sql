CREATE TABLE "groupTags"( --se crea una tabla llamada ""groupTags"
    "id" UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(), --se crea una columna llamada "id" con el tipo de dato UUID con restricion NOT NULL  que sera la llave primaria de la tabla "groupTag"
    "tag" VARCHAR(50) --se crea columna "tag" con el tipo de dato VARCHAR con 50 caracteres
);

CREATE TABLE "groupToTags"( --se crea una tabla llamada "groupToTags"
    "id" UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),--se crea una columna llamada "id" con el tipo de dato UUID con restriccion NOT NULL que sera la llave primaria de la tabla "grouptoTag"
    "groupId" UUID NOT NULL, --se crea columna "groupId" del tipo de dato UUID con restricción NOT NULL
    "groupTagId" UUID NOT NULL --se crea columna "groupTagId" del tipo de dato UUID con restricción NOT NULL
); 

ALTER TABLE "groupToTags"
    ADD CONSTRAINT "groupToTags_to_group"
    FOREIGN KEY ("groupId")
    REFERENCES "group"("id");

ALTER TABLE "groupToTags"
    ADD CONSTRAINT "groupToTags_to_groupTags"
    FOREIGN KEY ("groupTagId")
    REFERENCES "groupTags"("id");
