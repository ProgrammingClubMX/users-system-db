CREATE TABLE "userStatus" (
  "id" UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
  "label" VARCHAR (50),
  "editable" BOOLEAN DEFAULT (true)
);

CREATE TABLE "userToStatus" (
  "id" UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4 (),
   "userId" UUID NOT NULL,
   "statusId" UUID NOT NULL 
);
-- relacionar tablas 
ALTER TABLE "userToStatus"
  ADD CONSTRAINT "userToStatus_to_userStatus"
  FOREIGN KEY ("statusId")
  REFERENCES "userStatus" ("id");

ALTER TABLE "userToStatus"
  ADD CONSTRAINT "userToStatus_to_user"
  FOREIGN KEY ("userId")
  REFERENCES "user" ("id");
