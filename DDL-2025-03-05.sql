CREATE TABLE profile(
    id              UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
    fullName        TEXT NOT NULL,
    phoneNumber     VARCHAR(50)
);

--corregir el nombre de las columnas
ALTER TABLE profile RENAME COLUMN "fullname" TO "fullName";
ALTER TABLE profile RENAME COLUMN "phonenumber" TO "phoneNumber";

ALTER TABLE "profile"
    ADD COLUMN "userId" UUID NOT NULL DEFAULT uuid_generate_v4();

ALTER TABLE "profile"
    ADD CONSTRAINT profile_to_user
        FOREIGN KEY ("userId")
        REFERENCES "user" ("id");
