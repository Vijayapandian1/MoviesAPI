
/****** Object:  Table [dbo].[Genres]    Script Date: 1/6/2022 3:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Genres]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GenresName] [varchar](50) NULL,
 CONSTRAINT [PK_GENRES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 1/6/2022 3:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Movies]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Movies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NULL,
	[ReleaseYear] [int] NULL,
	[RunningTime] [int] NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Movies_Genres]    Script Date: 1/6/2022 3:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Movies_Genres]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Movies_Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NULL,
	[GenreId] [int] NULL,
 CONSTRAINT [PK_Movies_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/6/2022 3:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[User_Ratings]    Script Date: 1/6/2022 3:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Ratings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User_Ratings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[MovieId] [int] NULL,
	[Rating] [numeric](3, 2) NULL,
 CONSTRAINT [PK_User_Ratings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 
GO
INSERT [dbo].[Genres] ([Id], [GenresName]) VALUES (2, N'Action')
GO
INSERT [dbo].[Genres] ([Id], [GenresName]) VALUES (6, N'Family')
GO
INSERT [dbo].[Genres] ([Id], [GenresName]) VALUES (1, N'Horror')
GO
INSERT [dbo].[Genres] ([Id], [GenresName]) VALUES (7, N'Kids')
GO
INSERT [dbo].[Genres] ([Id], [GenresName]) VALUES (3, N'Love')
GO
INSERT [dbo].[Genres] ([Id], [GenresName]) VALUES (5, N'Mystery')
GO
INSERT [dbo].[Genres] ([Id], [GenresName]) VALUES (4, N'Suspense')
GO
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 
GO
INSERT [dbo].[Movies] ([Id], [Title], [ReleaseYear], [RunningTime]) VALUES (1, N'DREAM WARRIORS', 1987, 92)
GO
INSERT [dbo].[Movies] ([Id], [Title], [ReleaseYear], [RunningTime]) VALUES (2, N'PHENOMENA', 1985, 87)
GO
INSERT [dbo].[Movies] ([Id], [Title], [ReleaseYear], [RunningTime]) VALUES (3, N'BRAM STOKER''S DRACULA', 1992, 105)
GO
INSERT [dbo].[Movies] ([Id], [Title], [ReleaseYear], [RunningTime]) VALUES (4, N'LAND OF THE DEAD ', 1992, 105)
GO
INSERT [dbo].[Movies] ([Id], [Title], [ReleaseYear], [RunningTime]) VALUES (5, N'The Photograph', 2020, 98)
GO
INSERT [dbo].[Movies] ([Id], [Title], [ReleaseYear], [RunningTime]) VALUES (6, N'Portrait of a Lady on Fire', 2019, 82)
GO
INSERT [dbo].[Movies] ([Id], [Title], [ReleaseYear], [RunningTime]) VALUES (7, N'A Star Is Born', 2018, 83)
GO
INSERT [dbo].[Movies] ([Id], [Title], [ReleaseYear], [RunningTime]) VALUES (8, N'Carol', 2015, 83)
GO
INSERT [dbo].[Movies] ([Id], [Title], [ReleaseYear], [RunningTime]) VALUES (9, N'Brokeback Mountain', 2005, 90)
GO
INSERT [dbo].[Movies] ([Id], [Title], [ReleaseYear], [RunningTime]) VALUES (10, N'The Notebook', 2004, 84)
GO
INSERT [dbo].[Movies] ([Id], [Title], [ReleaseYear], [RunningTime]) VALUES (11, N'The Vow', 2012, 87)
GO
INSERT [dbo].[Movies] ([Id], [Title], [ReleaseYear], [RunningTime]) VALUES (12, N'Anna Karenina', 2012, 84)
GO
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies_Genres] ON 
GO
INSERT [dbo].[Movies_Genres] ([Id], [MovieId], [GenreId]) VALUES (1, 1, 1)
GO
INSERT [dbo].[Movies_Genres] ([Id], [MovieId], [GenreId]) VALUES (2, 2, 1)
GO
INSERT [dbo].[Movies_Genres] ([Id], [MovieId], [GenreId]) VALUES (3, 3, 1)
GO
INSERT [dbo].[Movies_Genres] ([Id], [MovieId], [GenreId]) VALUES (4, 4, 1)
GO
INSERT [dbo].[Movies_Genres] ([Id], [MovieId], [GenreId]) VALUES (5, 1, 4)
GO
INSERT [dbo].[Movies_Genres] ([Id], [MovieId], [GenreId]) VALUES (6, 2, 4)
GO
INSERT [dbo].[Movies_Genres] ([Id], [MovieId], [GenreId]) VALUES (7, 2, 5)
GO
INSERT [dbo].[Movies_Genres] ([Id], [MovieId], [GenreId]) VALUES (8, 5, 3)
GO
INSERT [dbo].[Movies_Genres] ([Id], [MovieId], [GenreId]) VALUES (9, 6, 3)
GO
INSERT [dbo].[Movies_Genres] ([Id], [MovieId], [GenreId]) VALUES (10, 7, 3)
GO
INSERT [dbo].[Movies_Genres] ([Id], [MovieId], [GenreId]) VALUES (11, 8, 3)
GO
INSERT [dbo].[Movies_Genres] ([Id], [MovieId], [GenreId]) VALUES (12, 9, 3)
GO
INSERT [dbo].[Movies_Genres] ([Id], [MovieId], [GenreId]) VALUES (13, 10, 3)
GO
INSERT [dbo].[Movies_Genres] ([Id], [MovieId], [GenreId]) VALUES (14, 11, 3)
GO
INSERT [dbo].[Movies_Genres] ([Id], [MovieId], [GenreId]) VALUES (15, 12, 3)
GO
SET IDENTITY_INSERT [dbo].[Movies_Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([Id], [UserName]) VALUES (1, N'Ryan')
GO
INSERT [dbo].[User] ([Id], [UserName]) VALUES (2, N'John')
GO
INSERT [dbo].[User] ([Id], [UserName]) VALUES (3, N'David')
GO
INSERT [dbo].[User] ([Id], [UserName]) VALUES (4, N'Antony')
GO
INSERT [dbo].[User] ([Id], [UserName]) VALUES (5, N'Peter')
GO
INSERT [dbo].[User] ([Id], [UserName]) VALUES (6, N'Deborah')
GO
INSERT [dbo].[User] ([Id], [UserName]) VALUES (7, N'Ellis')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Ratings] ON 
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (1, 1, 1, CAST(3.70 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (2, 2, 1, CAST(3.80 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (3, 3, 1, CAST(4.20 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (4, 4, 1, CAST(4.60 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (5, 5, 1, CAST(4.70 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (6, 6, 1, CAST(2.30 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (7, 7, 1, CAST(3.10 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (8, 1, 2, CAST(4.70 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (9, 2, 2, CAST(4.20 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (10, 3, 2, CAST(4.30 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (11, 4, 2, CAST(4.10 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (12, 5, 2, CAST(4.80 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (13, 6, 2, CAST(4.10 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (14, 7, 2, CAST(3.90 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (15, 1, 3, CAST(2.20 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (16, 2, 3, CAST(2.20 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (17, 3, 3, CAST(2.30 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (18, 4, 3, CAST(3.10 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (19, 5, 3, CAST(4.10 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (20, 6, 3, CAST(2.10 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (21, 7, 3, CAST(1.90 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (22, 1, 5, CAST(3.10 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (23, 2, 5, CAST(2.90 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (24, 3, 5, CAST(3.10 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (25, 4, 5, CAST(2.90 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (26, 5, 5, CAST(3.10 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (27, 6, 5, CAST(2.90 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (28, 1, 6, CAST(4.10 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (29, 2, 6, CAST(3.90 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (30, 3, 6, CAST(4.10 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (31, 4, 6, CAST(3.90 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (32, 5, 6, CAST(4.10 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (33, 6, 6, CAST(1.90 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (34, 1, 8, CAST(4.20 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (35, 2, 8, CAST(3.30 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (36, 3, 8, CAST(4.80 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (37, 4, 8, CAST(3.60 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (38, 5, 8, CAST(4.40 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (39, 6, 8, CAST(3.90 AS Numeric(3, 2)))
GO
INSERT [dbo].[User_Ratings] ([Id], [UserId], [MovieId], [Rating]) VALUES (40, 1, 4, CAST(4.20 AS Numeric(3, 2)))
GO
SET IDENTITY_INSERT [dbo].[User_Ratings] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Genres_GenreName]    Script Date: 1/6/2022 3:59:03 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Genres]') AND name = N'IX_Genres_GenreName')
CREATE NONCLUSTERED INDEX [IX_Genres_GenreName] ON [dbo].[Genres]
(
	[GenresName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Movies_ReleaseYear]    Script Date: 1/6/2022 3:59:03 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Movies]') AND name = N'IX_Movies_ReleaseYear')
CREATE NONCLUSTERED INDEX [IX_Movies_ReleaseYear] ON [dbo].[Movies]
(
	[ReleaseYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Movies_Title]    Script Date: 1/6/2022 3:59:03 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Movies]') AND name = N'IX_Movies_Title')
CREATE NONCLUSTERED INDEX [IX_Movies_Title] ON [dbo].[Movies]
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Movies_Genres_Genres]') AND parent_object_id = OBJECT_ID(N'[dbo].[Movies_Genres]'))
ALTER TABLE [dbo].[Movies_Genres]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Genres_Genres] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Movies_Genres_Genres]') AND parent_object_id = OBJECT_ID(N'[dbo].[Movies_Genres]'))
ALTER TABLE [dbo].[Movies_Genres] CHECK CONSTRAINT [FK_Movies_Genres_Genres]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Movies_Genres_Movies]') AND parent_object_id = OBJECT_ID(N'[dbo].[Movies_Genres]'))
ALTER TABLE [dbo].[Movies_Genres]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Genres_Movies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Movies_Genres_Movies]') AND parent_object_id = OBJECT_ID(N'[dbo].[Movies_Genres]'))
ALTER TABLE [dbo].[Movies_Genres] CHECK CONSTRAINT [FK_Movies_Genres_Movies]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Ratings_Movies]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Ratings]'))
ALTER TABLE [dbo].[User_Ratings]  WITH CHECK ADD  CONSTRAINT [FK_User_Ratings_Movies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Ratings_Movies]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Ratings]'))
ALTER TABLE [dbo].[User_Ratings] CHECK CONSTRAINT [FK_User_Ratings_Movies]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Ratings_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Ratings]'))
ALTER TABLE [dbo].[User_Ratings]  WITH CHECK ADD  CONSTRAINT [FK_User_Ratings_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Ratings_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Ratings]'))
ALTER TABLE [dbo].[User_Ratings] CHECK CONSTRAINT [FK_User_Ratings_User]
GO
USE [master]
GO
ALTER DATABASE [Movies] SET  READ_WRITE 
GO
