CREATE DATABASE users_system IF NOT EXISTS;

USE users_system;

CREATE TABLE customer (
    id              VARCHAR(100) NOT NULL UNIQUE PRIMARY KEY,
    companyName     VARCHAR(100) NOT NULL,
    phoneNumber     VARCHAR(50)
);

CREATE TABLE "user" (
    "userRole" VARCHAR(20) NOT NULL,
    email VARCHAR(320) NOT NULL,
    "emailVerificationCode" VARCHAR(8),
    "passwordRecoveryCode" VARCHAR(8),
    "password" TEXT NOT NULL,
    "termsAndConditionsAccepted" BOOLEAN DEFAULT FALSE,
    "customerId" VARCHAR(100) NOT NULL
);
