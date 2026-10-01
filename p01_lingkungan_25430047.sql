CREATE DATABASE kopma_47
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

CREATE USER 'mhs_47'@'localhost'
    IDENTIFIED BY '<nama_samarannya_ini_anime_ijo>';

GRANT ALL PRIVILEGES ON kopma_47.* TO 'mhs_47'@'localhost';