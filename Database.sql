
/* https://www.eurogamer.net/articles/2018-12-21-pokemon-go-type-chart-effectiveness-weaknesses */
/* https://www.pokemon.com/us/pokedex/ */


DROP TABLE IF EXISTS Pokemon;
DROP TABLE IF EXISTS SType;
DROP TABLE IF EXISTS Weakness;
DROP TABLE IF EXISTS Effective;
DROP TABLE IF EXISTS Evolve;
DROP TABLE IF EXISTS Poke_Evolve;
DROP TABLE IF EXISTS Poke_Type;

CREATE TABLE Pokemon 
(
	P_Num int,
	P_Name varchar(50),
	P_Stage int, /* the number of times evolved */ 
	P_Legendary bit, /* A legendary Pokemon is a Pokemon that there is only one of because of its importance of the plot */
		CONSTRAINT Pokemon_PK PRIMARY KEY (P_Num)
);

CREATE TABLE SType  /* The element or substance that a pokemon adapted to */
(
	PType varchar(15),
		CONSTRAINT PType_PK1 PRIMARY KEY (PType)
);

CREATE TABLE Weakness /* a type deals 1/2 damage to the other type */
(
	PType varchar(15),
	Weak varchar(15),
		CONSTRAINT PType_FK1 FOREIGN KEY (PType) REFERENCES SType(PType)
);

CREATE TABLE Effective /* a type deals 2 times more damage to the other type. !!!BUT THE TYPE OF MOVE IS EFFECTIVE AGAINST THE POKEMON AND NOT THE POKEMON TYPE!!!*/
(
	PType varchar(15),
	Effect varchar(15),
		CONSTRAINT PType_FK2 FOREIGN KEY (PType) REFERENCES SType(PType)
);


CREATE TABLE Evolve /* this Pokemon is an evolved Pokemon*/
(
	Evolve_to varchar(50),
		CONSTRAINT Evolve_PK1 PRIMARY KEY (Evolve_to)
);

CREATE TABLE Poke_Evolve /*what the Pokemon evolved from and what it evolved into*/
(
	P_Num int,
	Evolve varchar(50),
		CONSTRAINT P_Num_FK1 FOREIGN KEY (P_Num) REFERENCES Pokemon(P_Num),
		CONSTRAINT Evolve_to_FK FOREIGN KEY (Evolve) REFERENCES Evolve(Evolve_to)
);

CREATE TABLE Poke_Type /* A Pokemon can have more than one type */
(
	P_Num int,
	PType varchar(15),
		CONSTRAINT P_Num_FK2 FOREIGN KEY (P_Num) REFERENCES Pokemon(P_Num),
		CONSTRAINT PType_FK3 FOREIGN KEY (PType) REFERENCES SType(PType)
);


/* -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-*/



INSERT INTO Pokemon
VALUES
	(001, 'Bulbasaur'	,0, '0'),
	(002, 'Ivysaur'		,1, '0'),
	(003, 'Venusaur'	,2, '0'),
	(004, 'Charmander'	,0,	'0'),
	(005, 'Charmeleon'	,1,	'0'),
	(006, 'Charizard'	,2,	'0'),
	(007, 'Squirtle'	,0,	'0'),
	(008, 'Wartortle'	,1,	'0'),
	(009, 'Blastoise'	,2,	'0'),
	(010, 'Caterpie'	,0,	'0'),

	(011, 'Metapod'		,1,	'0'),
	(012, 'Butterfree'	,2,	'0'),
	(013, 'Weedle'		,0,	'0'),
	(014, 'Kakuna'		,1, '0'),
	(015, 'Beedrill'	,2,	'0'),
	(016, 'Pidgey'		,0,	'0'),
	(017, 'Pidgeotto'	,1,	'0'),
	(018, 'Pidgeot'		,2,	'0'),
	(019, 'Rattata'		,0,	'0'),
	(020, 'Raticate'	,1,	'0'),

	(021, 'Spearow'		,0, '0'),
	(022, 'Fearow'		,1, '0'),
	(023, 'Ekans'		,0,	'0'),
	(024, 'Arbok'		,1,	'0'),
	(025, 'Pikachu'		,0,	'0'),
	(026, 'Raichu'		,1,	'0'),
	(027, 'Sandshrew'	,0, '0'),
	(028, 'Sandslash'	,1,	'0'),
	(029, 'Nidoran (F)'	,0,	'0'),
	(030, 'Nidorina'	,1,	'0'),

	(031, 'Nidoqueen'	,2,	'0'),
	(032, 'Nidoran (M)' ,0,	'0'),
	(033, 'Nidorino'	,1,	'0'),
	(034, 'Nidoking'	,2,	'0'),
	(035, 'Clefairy'	,0,	'0'),
	(036, 'Clefable'	,1,	'0'),
	(037, 'Vulpix'		,0,	'0'),
	(038, 'Ninetales'	,1,	'0'),
	(039, 'Jigglypuff'	,0,	'0'),
	(040, 'Wigglytuff'	,1,	'0'),

	(041, 'Zubat'		,0,	'0'),
	(042, 'Golbat'		,1,	'0'),
	(043, 'Oddish'		,0, '0'),
	(044, 'Gloom'		,1, '0'),
	(045, 'Vileplume'	,2, '0'),
	(046, 'Paras'		,0, '0'),
	(047, 'Parasect'	,1, '0'),
	(048, 'Venonat'		,0, '0'),
	(049, 'Venomoth'	,1, '0'),
	(050, 'Diglett'		,0, '0'),

	(051, 'Dugtrio'		,1, '0'),
	(052, 'Meowth'		,0, '0'),
	(053, 'Persian'		,1, '0'),
	(054, 'Psyduck'		,0, '0'),
	(055, 'Golduck'		,1, '0'),
	(056, 'Mankey'		,0, '0'),
	(057, 'Primeape'	,1, '0'),
	(058, 'Growlithe'	,0, '0'),
	(059, 'Arcanine'	,1, '0'),
	(060, 'Poliwag'		,0, '0'),

	(061, 'Poliwhirl'	,1, '0'),
	(062, 'Poliwrath'	,2, '0'),
	(063, 'Abra'		,0, '0'),
	(064, 'Kadabra'		,1,	'0'),
	(065, 'Alakazam'	,2,	'0'),
	(066, 'Machop'		,0,	'0'),
	(067, 'Machoke'		,1,	'0'),
	(068, 'Machamp'		,2,	'0'),
	(069, 'Bellsprout'	,0,	'0'),
	(070, 'Weepinbell'	,1,	'0'),
	
	(071, 'Victreebel'	,2,	'0'),
	(072, 'Tentacool'	,0,	'0'),
	(073, 'Tentacruel'	,1,	'0'),
	(074, 'Geodude'		,0, '0'),
	(075, 'Graveler'	,1,	'0'),
	(076, 'Golem'		,2, '0'),
	(077, 'Ponyta'		,0, '0'),
	(078, 'Rapidash'	,1, '0'),
	(079, 'Slowpoke'	,0, '0'),
	(080, 'Slowbro'		,1,	'0'),

	(081, 'Magnemite'	,0,	'0'),
	(082, 'Magneton'	,1,	'0'),
	(083, 'Farfetchd'	,0, '0'),
	(084, 'Doduo'		,0, '0'),
	(085, 'Dodrio'		,1, '0'),
	(086, 'Seel'		,0, '0'),
	(087, 'Dewgong'		,1, '0'),
	(088, 'Grimer'		,0, '0'),
	(089, 'Muk'			,1, '0'),
	(090, 'Shellder'	,0,	'0'),

	(091, 'Cloyster'	,1, '0'),
	(092, 'Gastly'		,0, '0'),
	(093, 'Haunter'		,1, '0'),
	(094, 'Gengar'		,2, '0'),
	(095, 'Onix'		,0,	'0'),
	(096, 'Drowzee'		,0, '0'),
	(097, 'Hypno'		,1, '0'),
	(098, 'Krabby'		,0, '0'),
	(099, 'Kingler'		,1, '0'),
	(100, 'Voltrob'		,0,	'0'),

	(101, 'Electrode'	,1, '0'),
	(102, 'Exeggcute'	,0, '0'),
	(103, 'Exeggutor'	,1,	'0'),
	(104, 'Cubone'		,0, '0'),
	(105, 'Marowak'		,1, '0'),
	(106, 'Hitmonlee'	,0,	'0'),
	(107, 'Hitmonchan'	,0, '0'),
	(108, 'Lickitung'	,0,	'0'),
	(109, 'Koffing'		,0,	'0'),
	(110, 'Weezing'		,1, '0'),

	(111, 'Rhyhorn'		,0, '0'),
	(112, 'Rhydon'		,1, '0'),
	(113, 'Chansey'		,0, '0'),
	(114, 'Tangela'		,0, '0'),
	(115, 'Kangaskhan'	,0,	'0'),
	(116, 'Horsea'		,0, '0'),
	(117, 'Seadra'		,1, '0'),
	(118, 'Goldeen'		,0, '0'),
	(119, 'Seaking'		,1, '0'),
	(120, 'Staryu'		,0, '0'),

	(121, 'Starmie'		,1, '0'),
	(122, 'Mr. Mine'	,0, '0'),
	(123, 'Scyther'		,0,	'0'),
	(124, 'Jynx'		,0,	'0'),
	(125, 'Electabuzz'	,0, '0'),
	(126, 'Magmar'		,0, '0'),
	(127, 'Pinsir'		,0, '0'),
	(128, 'Tauros'		,0,	'0'),
	(129, 'Magikarp'	,0, '0'),
	(130, 'Gyarados'	,1,	'0'),

	(131, 'Lapras'		,0, '0'),
	(132, 'Ditto'		,0, '0'),
	(133, 'Eevee'		,0, '0'),
	(134, 'Vaporeon'	,1, '0'),
	(135, 'Jolteon'		,1, '0'),
	(136, 'Flareon'		,1, '0'),
	(137, 'Porygon'		,0, '0'),
	(138, 'Omanyte'		,0, '0'),
	(139, 'Omastar'		,1, '0'),
	(140, 'Kabuto'		,0, '0'),

	(141, 'Kabutops'	,1,	'0'),
	(142, 'Aerodactyl'	,0, '0'),
	(143, 'Snorlax'		,0, '0'),
	(144, 'Articuno'	,0,	'1'),
	(145, 'Zapdos'		,0,	'1'),
	(146, 'Moltres'		,0,	'1'),
	(147, 'Dratini'		,0, '0'),
	(148, 'Dragonair'	,1, '0'),
	(149, 'Dragonnite'	,2, '0'),
	(150, 'Mewtwo'		,0,	'1'),

	(151, 'Mew'			,0, '1');


INSERT INTO Evolve
VALUES
	('Ivysaur'),('Venusaur'),
	('Charmeleon'),('Charizard'),
	('Wartortle'),('Blastoise'),
	('Metapod'),('Butterfree'),
	('Kakuna'),('Beedrill'),
	('Pidgeotto'),('Pidgeot'),
	('Raticate'),
	('Fearow'),
	('Arbok'),
	('Raichu'),
	('Sandslash'),
	('Nidorina'),('Nidoqueen'),
	('Nidorino'),('Nidoking'),
	('Clefable'),
	('Ninetales'),
	('Wigglytuff'),
	('Golbat'),
	('Gloom'),('Vileplume'),
	('Parasect'),
	('Venomoth'),
	('Dugtrio'),
	('Persian'),
	('Golduck'),
	('Primeape'),
	('Arcanine'),
	('Poliwhirl'),('Poliwrath'),
	('Kadabra'),('Alakazam'),
	('Machoke'),('Machamp'),
	('Weepinbell'),('Victreebel'),
	('Tentacruel'),
	('Graveler'),('Golem'),
	('Rapidash'),
	('Slowbro'),
	('Magneton'),
	('Dodrio'),
	('Dewgong'),
	('Muk'),
	('Cloyster'),
	('Haunter'),('Gengar'),
	('Hypno'),
	('Kingler'),
	('Electrode'),
	('Exeggutor'),
	('Marowak'),
	('Weezing'),
	('Rhydon'),
	('Seadra'),
	('Seaking'),
	('Starmie'),
	('Gyarados'),
	('Vaporeon'),('Jolteon'),('Flareon'),
	('Omastar'),
	('Kabutops'),
	('Dragonair'),('Dragonite')
	;
	

INSERT INTO SType
VALUES 
	('Normal'), ('Fire'), ('Water'), ('Grass'), ('Electric'), ('Ice'), ('Fighting'), ('Poison'), ('Ground'), ('Flying'), ('Psychic'), ('Bug'), ('Rock'), ('Ghost'), ('Dragon'), ('Fairy'), ('Nothing');


INSERT INTO Poke_Type
VALUES
	(001, 'Grass'),(001, 'Poison'),
	(002, 'Grass'),(002, 'Poison'),
	(003, 'Grass'),(003, 'Poison'),
	(004, 'Fire'),
	(005, 'Fire'),
	(006, 'Fire'),(006, 'Flying'),
	(007, 'Water'),
	(008, 'Water'),
	(009, 'Water'),
	(010, 'Bug'),

	(011, 'Bug'),
	(012, 'Bug'),(012, 'Flying'),
	(013, 'Bug'),(013, 'Poison'),
	(014, 'Bug'),(014, 'Poison'),
	(015, 'Bug'),(015, 'Poison'),
	(016, 'Normal'),(016, 'Flying'),
	(017, 'Normal'),(017, 'Flying'),
	(018, 'Normal'),(018, 'Flying'),
	(019, 'Normal'),
	(020, 'Normal'),

	(021, 'Normal'),(021, 'Flying'),
	(022, 'Normal'),(022, 'Flying'),
	(023, 'Poison'),
	(024, 'Poison'),
	(025, 'Electric'),
	(026, 'Electric'),
	(027, 'Ground'),
	(028, 'Ground'),
	(029, 'Poison'),
	(030, 'Poison'),

	(031, 'Poison'),(031, 'Ground'),
	(032, 'Poison'),
	(033, 'Poison'),
	(034, 'Poison'),(034, 'Ground'),
	(035, 'Fairy'),
	(036, 'Fairy'),
	(037, 'Fire'),
	(038, 'Fire'),
	(039, 'Normal'),(039, 'Fairy'),
	(040, 'Normal'),(040, 'Fairy'),

	(041, 'Poison'),(041, 'Flying'),
	(042, 'Poison'),(042, 'Flying'),
	(043, 'Grass'),(043, 'Poison'),
	(044, 'Grass'),(044, 'Poison'),
	(045, 'Grass'),(045, 'Poison'),
	(046, 'Grass'),(046, 'Bug'),
	(047, 'Grass'),(047, 'Bug'),
	(048, 'Bug'),(048, 'Poison'),
	(049, 'Bug'),(049, 'Poison'),
	(050, 'Ground'),

	(051, 'Ground'),
	(052, 'Normal'),
	(053, 'Normal'),
	(054, 'Water'),
	(055, 'Water'),
	(056, 'Fighting'),
	(057, 'Fighting'),
	(058, 'Fire'),
	(059, 'Fire'),
	(060, 'Water'),

	(061, 'Water'),
	(062, 'Water'),(062, 'Fighting'),
	(063, 'Psychic'),
	(064, 'Psychic'),
	(065, 'Psychic'),
	(066, 'Fighting'),
	(067, 'Fighting'),
	(068, 'Fighting'),
	(069, 'Grass'),(069, 'Poison'),
	(070, 'Grass'),(070, 'Poison'),

	(071, 'Grass'),(071, 'Poison'),
	(072, 'Water'),(072, 'Poison'),
	(073, 'Water'),(073, 'Poison'),
	(074, 'Rock'),(074, 'Ground'),
	(075, 'Rock'),(075, 'Ground'),
	(076, 'Rock'),(076, 'Ground'),
	(077, 'Fire'),
	(078, 'Fire'),
	(079, 'Water'),(079, 'Psychic'),
	(080, 'Water'),(080, 'Psychic'),

	(081, 'Electric'),
	(082, 'Electric'),
	(083, 'Normal'),(083, 'Flying'),
	(084, 'Normal'),(084, 'Flying'),
	(085, 'Normal'),(085, 'Flying'),
	(086, 'Water'),
	(087, 'Water'),(087, 'Ice'),
	(088, 'Poison'),
	(089, 'Poison'),
	(090, 'Water'),

	(091, 'Water'),(091, 'Ice'),
	(092, 'Ghost'),(092, 'Poison'),
	(093, 'Ghost'),(093, 'Poison'),
	(094, 'Ghost'),(094, 'Poison'),
	(095, 'Rock'),(095, 'Ground'),
	(096, 'Psychic'),
	(097, 'Psychic'),
	(098, 'Water'),
	(099, 'Water'),
	(100, 'Electric'),

	(101, 'Electric'),
	(102, 'Grass'),(102, 'Psychic'),
	(103, 'Grass'),(103, 'Psychic'),
	(104, 'Ground'),
	(105, 'Ground'),
	(106, 'Fighting'),
	(107, 'Fighting'),
	(108, 'Normal'),
	(109, 'Poison'),
	(110, 'Poison'),

	(111, 'Ground'),(111, 'Rock'),
	(112, 'Ground'),(112, 'Rock'),
	(113, 'Normal'),
	(114, 'Grass'),
	(115, 'Normal'),
	(116, 'Water'),
	(117, 'Water'),
	(118, 'Water'),
	(119, 'Water'),
	(120, 'Water'),

	(121, 'Water'),(121, 'Psychic'),
	(122, 'Fairy'),(122, 'Psychic'),
	(123, 'Bug'),(123, 'Flying'),
	(124, 'Ice'),(124, 'Psychic'),
	(125, 'Electric'),
	(126, 'Fire'),
	(127, 'Bug'),
	(128, 'Normal'),
	(129, 'Water'),
	(130, 'Flying'),(130, 'Water'),

	(131, 'Water'),(131, 'Ice'),
	(132, 'Normal'),
	(133, 'Normal'),
	(134, 'Water'),
	(135, 'Electric'),
	(136, 'Fire'),
	(137, 'Normal'),
	(138, 'Rock'),(138, 'Water'),
	(139, 'Rock'),(139, 'Water'),
	(140, 'Rock'),(140, 'Water'),

	(141, 'Rock'),(141, 'Water'),
	(142, 'Rock'),(142, 'Flying'),
	(143, 'Normal'),
	(144, 'Flying'),(144, 'Ice'),
	(145, 'Flying'),(145, 'Electric'),
	(146, 'Flying'),(146, 'Fire'),
	(147, 'Dragon'),
	(148, 'Dragon'),
	(149, 'Dragon'),(149, 'Flying'),
	(150, 'Psychic'),

	(151, 'Psychic');

INSERT INTO Poke_Evolve
VALUES
	(001, 'Ivysaur'),(002, 'Venusaur'),
	(004, 'Charmeleon'),(005, 'Charizard'),
	(007, 'Wartortle'),(008, 'Blastoise'),
	(010, 'Metapod'), (011, 'Butterfree'),
	(013, 'Kakuna'), (014, 'Beedrill'),
	(016, 'Pidgeotto'), (017, 'Pidgeot'),
	(019, 'Raticate'),
	(021, 'Fearow'),
	(023, 'Arbok'),
	(025, 'Raichu'),
	(027, 'Sandslash'),
	(029, 'Nidorina'),(030, 'Nidoqueen'),
	(032, 'Nidorino'),(033, 'Nidoking'),
	(035, 'Clefable'),
	(037, 'Ninetales'),
	(039, 'Wigglytuff'),
	(041, 'Golbat'),
	(043, 'Gloom'),(044, 'Vileplume'),
	(046, 'Parasect'),
	(048, 'Venomoth'),
	(050, 'Dugtrio'),
	(052, 'Persian'),
	(054, 'Golduck'),
	(056, 'Primeape'),
	(058, 'Arcanine'),
	(060, 'Poliwhirl'),(061, 'Poliwrath'),
	(063, 'Kadabra'),(064, 'Alakazam'),
	(066, 'Machoke'),(067, 'Machamp'),
	(069, 'Weepinbell'),(070, 'Victreebel'),
	(072, 'Tentacruel'),
	(074, 'Graveler'), (075, 'Golem'),
	(077, 'Rapidash'),
	(079, 'Slowbro'),
	(081, 'Magneton'),
	(084, 'Dodrio'),
	(086, 'Dewgong'),
	(088, 'Muk'),
	(090, 'Cloyster'),
	(092, 'Haunter'),(093, 'Gengar'),
	(096, 'Hypno'),
	(098, 'Kingler'),
	(100, 'Electrode'),
	(102, 'Exeggutor'),
	(109, 'Weezing'),
	(111, 'Rhydon'),
	(116, 'Seadra'),
	(118, 'Seaking'),
	(120, 'Starmie'),
	(129, 'Gyarados'),
	(133, 'Vaporeon'),(133,'Jolteon'),(133, 'Flareon'),
	(138, 'Omastar'),
	(140, 'Kabutops'),
	(147, 'Dragonair'),(148, 'Dragonite');

	
INSERT INTO Weakness 
VALUES 
	('Normal', 'Rock'),
	('Normal', 'Ghost'),

	('Fire', 'Rock'),
	('Fire', 'Fire'),
	('Fire', 'Water'),
	('Fire', 'Dragon'),

	('Water', 'Water'),
	('Water', 'Grass'),
	('Water', 'Dragon'),

	('Grass', 'Fire'),
	('Grass', 'Flying'),
	('Grass', 'Poison'),
	('Grass', 'Bug'),
	('Grass', 'Dragon'),

	('Electric', 'Ground'),
	('Electric', 'Grass'),
	('Electric', 'Electric'),
	('Electric', 'Dragon'),

	('Ice', 'Fire'),
	('Ice', 'Water'),
	('Ice', 'Ice'),

	('Fighting', 'Flying'),
	('Fighting', 'Poison'),
	('Fighting', 'Psychic'),
	('Fighting', 'Bug'),
	('Fighting', 'Ghost'),
	('Fighting', 'Fairy'),
	
	('Poison', 'Poison'),
	('Poison', 'Ground'),
	('Poison', 'Rock'),
	('Poison', 'Ghost'),

	('Ground', 'Flying'),
	('Ground', 'Bug'),
	('Ground', 'Grass'),

	('Flying', 'Rock'),
	('Flying', 'Electric'),

	('Psychic', 'Psychic'),

	('Bug', 'Fighting'),
	('Bug', 'Flying'),
	('Bug', 'Poison'),
	('Bug', 'Ghost'),
	('Bug', 'Fire'),
	('Bug', 'Fairy'),

	('Rock', 'Fighting'),
	('Rock', 'Ground'),

	('Ghost', 'Normal'),

	('Dragon', 'Fairy'),
	
	('Fairy', 'Poison'),
	('Fairy', 'Fire')
	;

INSERT INTO Effective 
VALUES 
	('Normal', 'Nothing'),

	('Fire', 'Bug'),
	('Fire', 'Grass'),
	('Fire', 'Ice'),

	('Water', 'Ground'),
	('Water', 'Rock'),
	('Water', 'Fire'),

	('Grass', 'Ground'),
	('Grass', 'Rock'),
	('Grass', 'Water'),

	('Electric', 'Flying'),
	('Electric', 'Water'),

	('Ice', 'Flying'),
	('Ice', 'Ground'),
	('Ice', 'Grass'),
	('Ice', 'Dragon'),

	('Fighting', 'Normal'),
	('Fighting', 'Rock'),
	('Fighting', 'Ice'),

	('Poison', 'Grass'),
	('Poison', 'Fairy'),
	
	('Ground', 'Posion'),
	('Ground', 'Rock'),
	('Ground', 'Fire'),
	('Ground', 'Electric'),

	('Flying', 'Fighting'),
	('Flying', 'Bug'),
	('Flying', 'Grass'),
	
	('Psychic', 'Fighting'),
	('Psychic', 'Poison'),

	('Bug', 'Grass'),
	('Bug', 'Psychic'),
	
	('Rock', 'Flying'),
	('Rock', 'Bug'),
	('Rock', 'Fire'),
	('Rock', 'Ice'),
	
	('Ghost', 'Ghost'),
	('Ghost', 'Psychic'),
	
	('Dragon', 'Dragon'),
	
	('Fairy', 'Fighting'),
	('Fairy', 'Dragon');

	/*-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-*/
	/* Execute twice if you get an error*/

	SELECT Pokemon.P_Name Pokemon, Poke_Type.PType Type 
	FROM Pokemon
	INNER JOIN Poke_Type ON Pokemon.P_Num = Poke_Type.P_Num;
	/* Shows the user what all the pokemon types */
	
	SELECT Pokemon.P_Name Pokemon, Poke_Evolve.Evolve Evolves_Into 
	FROM Pokemon
	INNER JOIN Poke_Evolve ON Pokemon.P_Num = Poke_Evolve.P_Num;
	/* Shows the user what the Pokemon evolves into, if the pokemon can evolve*/
	
	
	SELECT Pokemon.P_Name, Poke_Type.PType 
	FROM Pokemon
	LEFT JOIN Poke_Type ON Pokemon.P_Num = Poke_Type.P_Num
	WHERE PType = 'Grass' 
	ORDER BY Pokemon.P_Num;
	/* looking at all the pokemons that are grass types */
	


	SELECT Pokemon.P_Name Pokemon, Pokemon.P_Legendary Legendary , Poke_Type.PType
	FROM Pokemon, Poke_Type
	WHERE P_Legendary = '1' AND Pokemon.P_Num = Poke_Type.P_Num ;
	/* view all the Legendary pokemon in Generation 1 and what types they are*/

	
	
	SELECT SType.PType Type, Weakness.Weak Weak_To	
	FROM Weakness
	INNER JOIN SType ON Weakness.PType = SType.PType;
	/* Shows what types are Weak to */

	
	SELECT Pokemon.P_Name Pokemon, Poke_Type.PType Pokemon_Type, Weakness.Weak Weak_to 
	FROM Pokemon, Poke_Type, Weakness
	WHERE Poke_Type.PType = Weakness.PType AND Poke_Type.P_Num = Pokemon.P_Num
	AND Pokemon.P_Legendary = '0' 
	AND (	Pokemon.P_Name = 'Alakazam' OR
			Pokemon.P_Name = 'Jolteon' OR
			Pokemon.P_Name = 'Tauros' OR
			Pokemon.P_Name = 'Gyarados' OR
			Pokemon.P_Name = 'Gengar' OR
			Pokemon.P_Name = 'Ninetales');

	/*This is a scenario, lets say you have your team of 6 to fight another team, with no legendarys. 
	This Statement shows the user all the types their pokemon is Weak to. As you can see your team has 
	a weakness to Grass, Electric, Dragon, Poison, Ground, Rock, Ghost, Eletric, Normal, and Psychic.
	So this means that your pokemon is fine to fight against Water and Fire types at first glance.*/
