--  Crear SCHEMA Para mover las tablas de la plataforma interna y evitar que colisionen con los nombres de las tablas del modulo de usuarios
CREATE SCHEMA "internal_platform";
GRANT USAGE ON SCHEMA internal_platform TO anon, authenticated, service_role;
GRANT ALL ON ALL TABLES IN SCHEMA internal_platform TO anon, authenticated, service_role;
GRANT ALL ON ALL ROUTINES IN SCHEMA internal_platform TO anon, authenticated, service_role;
GRANT ALL ON ALL SEQUENCES IN SCHEMA internal_platform TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA internal_platform GRANT ALL ON TABLES TO anon, authenticate
--  Mover las tablas internas al schema internal_platform
ALTER TABLE public."customer" SET SCHEMA internal_platform;
ALTER TABLE public."user" SET SCHEMA internal_platform;
ALTER TABLE public."profile" SET SCHEMA internal_platform;
