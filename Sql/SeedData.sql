INSERT INTO bookscatalog.authors (FirstName,LastName) VALUES
	 ('Ray',' Bradbury'),
	 ('Ayzek','Azimov'),
	 ('Leo','Tolstoy'),
	 ('J. R. R.','Tolkien');

INSERT INTO bookscatalog.books (Name,ImageUrl,Description,PublishDate,AuthorId) VALUES
	 ('Fahrenheit 451','https://images-na.ssl-images-amazon.com/images/I/71OFqSRFDgL.jpg','Guy Montag is a fireman. His job is to destroy the most illegal of commodities, the printed book, along with the houses in which they are hidden.','2003-12-31 01:02:03.0',1),
	 ('Robots and Empire','https://images-na.ssl-images-amazon.com/images/I/81o1JKWC6WL.jpg','Isaac Asmiov'' classic novel about the decline and fall of Solaria. Gladia Delmarres homeworld, the Spacer planet Solaria, has been abandoned - by its human population. Countless robots remain there. And when traders from Settler worlds attempt to salvage them, the robots of Solaria turn to killing...in defiance of the Three Laws of Robotics. Pax Robotica Long ago,','2001-10-22 01:02:03.0',2),
	 ('War and Peace','https://images.penguinrandomhouse.com/cover/9781400079988','Pierre Bezukhov, the illegitimate son of a count who is fighting for his inheritance and yearning for spiritual fulfillment; Prince Andrei Bolkonsky, who leaves his family behind to fight in the war against Napoleon; and Natasha Rostov, the beautiful young daughter of a nobleman who intrigues both men.','2008-07-12 01:02:03.0',3),
	 ('The Hobbit','https://prodimage.images-bn.com/pimages/9780547928227_p0_v2_s1200x630.jpg','Bilbo Baggins is a hobbit who enjoys a comfortable, unambitious life, rarely traveling any farther than his pantry or cellar. But his contentment is disturbed when the wizard Gandalf and a company of dwarves arrive on his doorstep one day to whisk him away on an adventure.','2018-02-05 01:02:03.0',4);

INSERT INTO bookscatalog.locations (Name,Country,City,Address,Phone,Email) VALUES
	 ('Central Office','Moldova','Chishinau','Arborilor 21','+373798984857383','Email.Sample@mail.com');


INSERT INTO bookscatalog.bookcategories (BookId,CategoryId) VALUES
	 (2,1),
	 (3,3),
	 (4,2);


INSERT INTO bookscatalog.categories (Name) VALUES
	 ('Fiction'),
	 ('Fantasy'),
	 ('Novels');