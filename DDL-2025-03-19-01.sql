CREATE TABLE "groupStatus"( --se crea tabla con el nombre "groupStatus"
    "id" UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(), --se crea columna "id" del tipo uuid restriccion not null que sera la llave primaria 
    "label" VARCHAR(50), --se crea columna "label" con el tipo de dato VARCHAR con 50 caracteres
    "editable" BOOLEAN DEFAULT(true) --se crea columna "editable" con el tipo de dato BOOLEAN con un valor por defecto verdadero
);

CREATE TABLE "groupToStatus"( --se crea tabla con el nombre "groupToStatus"
    "id" UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(), --se crea una tabla "id" del tipo uuid con restriccion not null que sera la llave primaria
    "groupId" UUID NOT NULL, --se crea la columna "groupId" del tipo UUID con restriccion not null
    "groupStatusId" UUID NOT NULL --se crea columna "groupStatusId" del tipo UUID con restriccion not null
);
