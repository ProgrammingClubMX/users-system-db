-- Se creó una tabla de "profile"
CREATE TABLE "profile"(
    "id" UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
    "properties" JSON,
    "urlPicture" TEXT,
    "idUser" UUID NOT NULL
);
-- Se agrego una llave foranea para conectar la tabla user con su profile
ALTER TABLE "profile"
    ADD CONSTRAINT user_to_profile
    FOREIGN KEY("idUser")
    REFERENCES "user"(id); 
