CREATE TABLE "user" (
    id UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(320) NOT NULL,
    "emailVerificationCode" VARCHAR(8),
    "passwordRecoveryCode" VARCHAR(8),
    password TEXT NOT NULL,
    "termsAndConditionsAccepted" BOOLEAN DEFAULT FALSE,
    "customerId" UUID NOT NULL
);

