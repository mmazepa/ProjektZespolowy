-- 1. Konfiguracja świeżo zainstalowanego PostgreSQL na lokalnym komputerze
--    - po zainstalowaniu wejdź na użytkownika postgres (sudo su postgres),
--      wykonaj komendę psql i w niej wykonaj poniższy skrypt
CREATE ROLE twoj_login WITH SUPERUSER CREATEDB CREATEROLE LOGIN;

--      jak utworzy z błędem, to spróbuj poniższego
ALTER ROLE twoj_login WITH SUPERUSER CREATEDB CREATEROLE LOGIN;
--      dla pewności wykonaj \du aby sprawdzić swoje role
--      potem komenda \q aby wyjść, i "exit", aby potem wrócić do sesji twojego użytkownika
--      teraz możesz uruchomić postgresql z uprawnieniami zbliżonymi do konta postgres (wystarczy do manipulacji tabelami)

-- 2. Tworzenie bazy danych - w konsoli wpisać "createdb baza" (do usuwania dropdb)

-- 3. Ustawianie bazy pod domyślne dane
--    - wejdź w bazę danych np. "psql baza"
--    - poniżej ustawienie hasła pod bazę danych
ALTER USER postgres WITH PASSWORD 'postgres';
--    - jak w kodzie masz parametry: nazwa bazy "baza", host "localhost", port 5432, login "postgres", hasło "postgres",
--      to baza danych powinna działać i być widoczna dla aplikacji webowej