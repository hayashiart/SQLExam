--Question 1
--Exo 1 Nom et année de naissance des artistes nés avant 1950.
SELECT * FROM artiste WHERE annéeNaiss < 1950;

--Question 2
--Exo 2 Titre de tous les drames.
SELECT titre, genre FROM film WHERE genre='Drame';

--Question 3
--Exo 3 Quels rôles a joué Bruce Willis.
SELECT
CONCAT(prénom, ' ', nom) AS nomTotal,
 nomRôle
FROM artiste
INNER JOIN role ON artiste.idArtiste=role.idActeur
WHERE prénom='Bruce' AND nom='Willis'
;

--Question 4
--Exo 4 Qui est le réalisateur de Memento.

SELECT prénom,
nom,
titre
FROM artiste
INNER JOIN film ON artiste.idArtiste=film.idRéalisateur
WHERE titre='Memento';

--Question 5
--Exo 5 Quelles sont les notes obtenues par le film Fargo

SELECT 
titre,
note
FROM notation
INNER JOIN film ON notation.idFilm=film.idFilm
WHERE titre='Fargo';

--Question 6
--Exo 6 Qui a joué le rôle de Chewbacca?

SELECT 
nomRôle,
CONCAT(prénom, ' ', nom) AS nomTotal
FROM role
INNER JOIN artiste ON artiste.idArtiste=role.idActeur
WHERE nomRôle='Chewbacca';

--Question 7
--Exo 7 Dans quels films Bruce Willis a-t-il joué le rôle de John McClane
?

SELECT
titre,
prénom,
nom,
nomRôle
FROM artiste
INNER JOIN role ON artiste.idArtiste=role.idActeur
INNER JOIN film ON film.idFilm = role.idFilm
WHERE nomRôle='John McClane'
;

--Question 8
--Exo 8 Nom des acteurs de 'Sueurs froides'

SELECT
titre,
prénom,
nom,
nomRôle
FROM film
INNER JOIN role ON film.idFilm=role.idFilm
INNER JOIN artiste ON artiste.idArtiste=role.idActeur
WHERE titre='Sueurs froides'
;

--Question 9
--Exo 9 Quelles sont les films notés par l'internaute Prénom 0 Nom0

SELECT
prénom,
nom,
titre
note
FROM film
INNER JOIN notation ON notation.idFilm= film.idFilm
INNER JOIN internaute ON internaute.email=notation.email
WHERE nom='Nom0'
;

--Question 10
--Exo 10 Films dont le réalisateur est Tim Burton, et l’un des acteurs
Johnny Depp.

SELECT
titre,
artiste.prénom,
artiste.nom
FROM artiste
INNER JOIN film ON film.idRéalisateur=artiste.idArtiste
WHERE artiste.nom='Burton' AND artiste.prénom='Tim'
;

--Question 11
--Exo 11 Titre des films dans lesquels a joué ́Woody Allen. Donner aussi le rôle.

SELECT
titre,
artiste.prénom,
artiste.nom,
nomRôle
FROM artiste
INNER JOIN film ON film.idRéalisateur=artiste.idArtiste
INNER JOIN role ON role.idActeur=artiste.idArtiste
WHERE artiste.nom='Allen' AND artiste.prénom='Woody'
;

--Question 12
--Exo 12 Quel metteur en scène a tourné dans ses propres films ? Donner le nom, le rôle et le titre des films.

SELECT
titre,
artiste.prénom,
artiste.nom,
nomRôle
FROM artiste
INNER JOIN film ON film.idRéalisateur=artiste.idArtiste
INNER JOIN role ON role.idActeur=artiste.idArtiste
WHERE role.idActeur=film.idRéalisateur
;

--Question 13
--Exo 13 Titre des films de Quentin Tarantino dans lesquels il n’a pas joué

SELECT
titre,
artiste.prénom,
artiste.nom,
nomRôle
FROM artiste
INNER JOIN film ON film.idRéalisateur=artiste.idArtiste
INNER JOIN role ON role.idActeur=artiste.idArtiste
WHERE artiste.prénom='Quentin' AND  role.idActeur!=film.idRéalisateur
;

--Question 14
--Exo 14 Quel metteur en scène a tourné ́en tant qu’acteur ? Donner le
--nom, le rôle et le titre des films dans lesquels cet artiste a joué.

SELECT
titre,
artiste.prénom,
artiste.nom,
nomRôle
FROM artiste
INNER JOIN film ON film.idRéalisateur=artiste.idArtiste
INNER JOIN role ON role.idActeur=artiste.idArtiste
WHERE role.idActeur=film.idRéalisateur
;

--Question 15
--Exo 15 Donnez les films de Hitchcock sans James Stewart

SELECT
titre,
artiste.prénom,
artiste.nom
FROM film
INNER JOIN artiste ON artiste.idArtiste=film.idRéalisateur
INNER JOIN role ON role.idActeur=artiste.idArtiste
WHERE artiste.nom='Hitchcock' AND role.idActeur.prénom != 'James'
;

--Question 16
--Exo 16 Dans quels films le réalisateur a-t-il le même prénom que l’un
--des interprètes ? (titre, nom du réalisateur, nom de l’interprète). Le
--réalisateur et l’interprète ne doivent pas être la même personne.


--Question 17
--Exo 17 Les films sans rôle

SELECT
titre,
COUNT(nomRôle) AS count
FROM film
INNER JOIN role ON role.idFilm=film.idFilm
GROUP BY titre
ORDER BY count ASC
;

--Question 18
--Exo 18 Quelles sont les films non notés par l'internaute Prénom1 Nom1










