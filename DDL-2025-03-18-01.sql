-- Se crearon tablas de rol de usuario 
CREATE TABLE "role"(
    "id" UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
    "label" VARCHAR (50)
);

CREATE TABLE "userToRole"(
    "id" UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
    "userId" UUID NOT NULL,
    "roleId" UUID NOT NULL
);

-- relaciones de tablas de roles a usuarios
ALTER TABLE "userToRole"
    ADD CONSTRAINT "userToRole_to_user"
    FOREIGN KEY ("userId")
    REFERENCES "user" ("id");

ALTER TABLE "userToRole"
    ADD CONSTRAINT "userToRole_to_role"
    FOREIGN KEY ("roleId")
    REFERENCES "role" ("id");
