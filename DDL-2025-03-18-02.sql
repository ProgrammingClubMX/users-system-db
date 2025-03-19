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


