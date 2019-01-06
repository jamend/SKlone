INSERT [dbo].[AllianceRelationTypes] ([RelationType], [Name], [AttackGainBonus], [AttackStrengthBonus], [DefenceStrengthBonus]) VALUES (0, N'Normal', 1, 0, 0)
GO
INSERT [dbo].[AllianceRelationTypes] ([RelationType], [Name], [AttackGainBonus], [AttackStrengthBonus], [DefenceStrengthBonus]) VALUES (1, N'War', 1.2, 0.1, 0)
GO
INSERT [dbo].[AllianceRelationTypes] ([RelationType], [Name], [AttackGainBonus], [AttackStrengthBonus], [DefenceStrengthBonus]) VALUES (2, N'Peace', 1, 0, 0)
GO
INSERT [dbo].[AllianceRelationTypes] ([RelationType], [Name], [AttackGainBonus], [AttackStrengthBonus], [DefenceStrengthBonus]) VALUES (3, N'Nap', 1, 0, 0)
GO
INSERT [dbo].[AllianceRelationTypes] ([RelationType], [Name], [AttackGainBonus], [AttackStrengthBonus], [DefenceStrengthBonus]) VALUES (4, N'Allied', 1, 0, 0)
GO
INSERT [dbo].[PlanetTypes] ([PlanetType], [PlanetTypeName], [PopulationFactor], [ResearchFactor], [ReturnTimeFactor], [IncomeFactor], [PowerProducedFactor], [PowerNeededFactor], [DefenceFactor], [AttackFactor], [ProbeFactor], [MilitaryCostFactor]) VALUES (0, N'Ice Lands', 0.9, 1, 1, 1.25, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[PlanetTypes] ([PlanetType], [PlanetTypeName], [PopulationFactor], [ResearchFactor], [ReturnTimeFactor], [IncomeFactor], [PowerProducedFactor], [PowerNeededFactor], [DefenceFactor], [AttackFactor], [ProbeFactor], [MilitaryCostFactor]) VALUES (1, N'Grass Lands', 1.25, 1, 1, 1, 1, 1, 0.9, 1, 1, 1)
GO
INSERT [dbo].[PlanetTypes] ([PlanetType], [PlanetTypeName], [PopulationFactor], [ResearchFactor], [ReturnTimeFactor], [IncomeFactor], [PowerProducedFactor], [PowerNeededFactor], [DefenceFactor], [AttackFactor], [ProbeFactor], [MilitaryCostFactor]) VALUES (2, N'Astro-Station', 1, 0.3, 1, 1, 1, 1, 1, 0.95, 1, 1)
GO
INSERT [dbo].[PlanetTypes] ([PlanetType], [PlanetTypeName], [PopulationFactor], [ResearchFactor], [ReturnTimeFactor], [IncomeFactor], [PowerProducedFactor], [PowerNeededFactor], [DefenceFactor], [AttackFactor], [ProbeFactor], [MilitaryCostFactor]) VALUES (3, N'Acidic Aura', 1, 1, 0.6, 1, 1, 1.1, 1, 1, 1, 1)
GO
INSERT [dbo].[PlanetTypes] ([PlanetType], [PlanetTypeName], [PopulationFactor], [ResearchFactor], [ReturnTimeFactor], [IncomeFactor], [PowerProducedFactor], [PowerNeededFactor], [DefenceFactor], [AttackFactor], [ProbeFactor], [MilitaryCostFactor]) VALUES (4, N'Fire Blaze', 1, 1, 1, 0.95, 1, 1, 1, 1.22, 1, 1)
GO
INSERT [dbo].[PlanetTypes] ([PlanetType], [PlanetTypeName], [PopulationFactor], [ResearchFactor], [ReturnTimeFactor], [IncomeFactor], [PowerProducedFactor], [PowerNeededFactor], [DefenceFactor], [AttackFactor], [ProbeFactor], [MilitaryCostFactor]) VALUES (5, N'Jagged Lava', 1, 1.2, 1, 1, 1, 0, 1, 1, 1, 1)
GO
INSERT [dbo].[PlanetTypes] ([PlanetType], [PlanetTypeName], [PopulationFactor], [ResearchFactor], [ReturnTimeFactor], [IncomeFactor], [PowerProducedFactor], [PowerNeededFactor], [DefenceFactor], [AttackFactor], [ProbeFactor], [MilitaryCostFactor]) VALUES (6, N'Misty Phantom', 1, 1.1, 1, 1, 1, 1, 1.25, 1, 1, 1)
GO
INSERT [dbo].[PlanetTypes] ([PlanetType], [PlanetTypeName], [PopulationFactor], [ResearchFactor], [ReturnTimeFactor], [IncomeFactor], [PowerProducedFactor], [PowerNeededFactor], [DefenceFactor], [AttackFactor], [ProbeFactor], [MilitaryCostFactor]) VALUES (7, N'Shadow Lands', 1, 1, 1, 1, 1, 1, 1, 0.95, 1.25, 1)
GO
INSERT [dbo].[PlanetTypes] ([PlanetType], [PlanetTypeName], [PopulationFactor], [ResearchFactor], [ReturnTimeFactor], [IncomeFactor], [PowerProducedFactor], [PowerNeededFactor], [DefenceFactor], [AttackFactor], [ProbeFactor], [MilitaryCostFactor]) VALUES (8, N'Gaseous Waste', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[PlanetTypes] ([PlanetType], [PlanetTypeName], [PopulationFactor], [ResearchFactor], [ReturnTimeFactor], [IncomeFactor], [PowerProducedFactor], [PowerNeededFactor], [DefenceFactor], [AttackFactor], [ProbeFactor], [MilitaryCostFactor]) VALUES (9, N'Dense Jungle', 1, 1, 1, 1, 1, 1, 1, 1, 0.85, 1.2)
GO
INSERT [dbo].[Publics] ([PublicID], [PublicName], [Password], [AL], [AAL], [Dev], [Hadmin], [Admin], [War], [Peace], [Networth], [Rank]) VALUES (1, N'Universal', N'public', 0, 0, 0, 0, 0, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[RaceTypes] ([RaceType], [RaceTypeName], [PopulationFactor], [ResearchFactor], [ReturnTimeFactor], [IncomeFactor], [PowerProducedFactor], [PowerNeededFactor], [DefenceFactor], [AttackFactor], [ProbeFactor]) VALUES (0, N'Terran', 0.12, 0, 0.1, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[RaceTypes] ([RaceType], [RaceTypeName], [PopulationFactor], [ResearchFactor], [ReturnTimeFactor], [IncomeFactor], [PowerProducedFactor], [PowerNeededFactor], [DefenceFactor], [AttackFactor], [ProbeFactor]) VALUES (1, N'Xivornai', -0.05, -0.2, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[RaceTypes] ([RaceType], [RaceTypeName], [PopulationFactor], [ResearchFactor], [ReturnTimeFactor], [IncomeFactor], [PowerProducedFactor], [PowerNeededFactor], [DefenceFactor], [AttackFactor], [ProbeFactor]) VALUES (2, N'Gistrami', 0, 0.07, 0, 0, 0, 0, 0, 0.12, 0)
GO
INSERT [dbo].[RaceTypes] ([RaceType], [RaceTypeName], [PopulationFactor], [ResearchFactor], [ReturnTimeFactor], [IncomeFactor], [PowerProducedFactor], [PowerNeededFactor], [DefenceFactor], [AttackFactor], [ProbeFactor]) VALUES (3, N'Mafielven', 0, 0, 0, 0, 0, -0.17, 0, -0.05, 0)
GO
INSERT [dbo].[Sectors] ([SectorOpen], [Galaxy], [Sector], [GalaxySector], [SectorName], [SectorMessage], [AllianceID], [PublicID], [GroupSignUp], [GroupPassword], [AllianceWait]) VALUES (1, 1, 1, N'1 : 1', N'Welcome to SKlone', N'Welcome to SKlone', 0, 1, 0, N'sklone', 0)
GO
INSERT [dbo].[Sectors] ([SectorOpen], [Galaxy], [Sector], [GalaxySector], [SectorName], [SectorMessage], [AllianceID], [PublicID], [GroupSignUp], [GroupPassword], [AllianceWait]) VALUES (1, 1, 2, N'1 : 2', N'Welcome to SKlone', N'Welcome to SKlone', 0, 1, 0, N'sklone', 0)
GO
INSERT [dbo].[Sectors] ([SectorOpen], [Galaxy], [Sector], [GalaxySector], [SectorName], [SectorMessage], [AllianceID], [PublicID], [GroupSignUp], [GroupPassword], [AllianceWait]) VALUES (1, 1, 3, N'1 : 3', N'Welcome to SKlone', N'Welcome to SKlone', 0, 1, 0, N'sklone', 0)
GO
INSERT [dbo].[Sectors] ([SectorOpen], [Galaxy], [Sector], [GalaxySector], [SectorName], [SectorMessage], [AllianceID], [PublicID], [GroupSignUp], [GroupPassword], [AllianceWait]) VALUES (1, 1, 4, N'1 : 4', N'Welcome to SKlone', N'Welcome to SKlone', 0, 1, 0, N'sklone', 0)
GO
INSERT [dbo].[Sectors] ([SectorOpen], [Galaxy], [Sector], [GalaxySector], [SectorName], [SectorMessage], [AllianceID], [PublicID], [GroupSignUp], [GroupPassword], [AllianceWait]) VALUES (1, 1, 5, N'1 : 5', N'Welcome to SKlone', N'Welcome to SKlone', 0, 1, 0, N'sklone', 0)
GO
INSERT [dbo].[Sectors] ([SectorOpen], [Galaxy], [Sector], [GalaxySector], [SectorName], [SectorMessage], [AllianceID], [PublicID], [GroupSignUp], [GroupPassword], [AllianceWait]) VALUES (1, 1, 6, N'1 : 6', N'Welcome to SKlone', N'Welcome to SKlone', 0, 1, 0, N'sklone', 0)
GO
INSERT [dbo].[Sectors] ([SectorOpen], [Galaxy], [Sector], [GalaxySector], [SectorName], [SectorMessage], [AllianceID], [PublicID], [GroupSignUp], [GroupPassword], [AllianceWait]) VALUES (1, 1, 7, N'1 : 7', N'Welcome to SKlone', N'Welcome to SKlone', 0, 1, 0, N'sklone', 0)
GO
INSERT [dbo].[Sectors] ([SectorOpen], [Galaxy], [Sector], [GalaxySector], [SectorName], [SectorMessage], [AllianceID], [PublicID], [GroupSignUp], [GroupPassword], [AllianceWait]) VALUES (1, 1, 8, N'1 : 8', N'Welcome to SKlone', N'Welcome to SKlone', 0, 1, 0, N'sklone', 0)
GO
INSERT [dbo].[Sectors] ([SectorOpen], [Galaxy], [Sector], [GalaxySector], [SectorName], [SectorMessage], [AllianceID], [PublicID], [GroupSignUp], [GroupPassword], [AllianceWait]) VALUES (1, 1, 9, N'1 : 9', N'Welcome to SKlone', N'Welcome to SKlone', 0, 1, 0, N'sklone', 0)
GO
INSERT [dbo].[Sectors] ([SectorOpen], [Galaxy], [Sector], [GalaxySector], [SectorName], [SectorMessage], [AllianceID], [PublicID], [GroupSignUp], [GroupPassword], [AllianceWait]) VALUES (1, 1, 10, N'1 : 10', N'Welcome to SKlone', N'Welcome to SKlone', 0, 1, 0, N'sklone', 0)
GO
INSERT [dbo].[Sectors] ([SectorOpen], [Galaxy], [Sector], [GalaxySector], [SectorName], [SectorMessage], [AllianceID], [PublicID], [GroupSignUp], [GroupPassword], [AllianceWait]) VALUES (1, 1, 11, N'1 : 11', N'Welcome to SKlone', N'Welcome to SKlone', 0, 1, 0, N'sklone', 0)
GO
INSERT [dbo].[Sectors] ([SectorOpen], [Galaxy], [Sector], [GalaxySector], [SectorName], [SectorMessage], [AllianceID], [PublicID], [GroupSignUp], [GroupPassword], [AllianceWait]) VALUES (1, 1, 12, N'1 : 12', N'Welcome to SKlone', N'Welcome to SKlone', 0, 1, 0, N'sklone', 0)
GO
INSERT [dbo].[Sectors] ([SectorOpen], [Galaxy], [Sector], [GalaxySector], [SectorName], [SectorMessage], [AllianceID], [PublicID], [GroupSignUp], [GroupPassword], [AllianceWait]) VALUES (1, 1, 13, N'1 : 13', N'Welcome to SKlone', N'Welcome to SKlone', 0, 1, 0, N'sklone', 0)
GO
INSERT [dbo].[Sectors] ([SectorOpen], [Galaxy], [Sector], [GalaxySector], [SectorName], [SectorMessage], [AllianceID], [PublicID], [GroupSignUp], [GroupPassword], [AllianceWait]) VALUES (1, 1, 14, N'1 : 14', N'Welcome to SKlone', N'Welcome to SKlone', 0, 1, 0, N'sklone', 0)
GO
INSERT [dbo].[Sectors] ([SectorOpen], [Galaxy], [Sector], [GalaxySector], [SectorName], [SectorMessage], [AllianceID], [PublicID], [GroupSignUp], [GroupPassword], [AllianceWait]) VALUES (1, 1, 15, N'1 : 15', N'Welcome to SKlone', N'Welcome to SKlone', 0, 1, 0, N'sklone', 0)
GO
INSERT [dbo].[Sectors] ([SectorOpen], [Galaxy], [Sector], [GalaxySector], [SectorName], [SectorMessage], [AllianceID], [PublicID], [GroupSignUp], [GroupPassword], [AllianceWait]) VALUES (1, 1, 16, N'1 : 16', N'Welcome to SKlone', N'Welcome to SKlone', 0, 1, 0, N'sklone', 0)
GO
INSERT [dbo].[Sectors] ([SectorOpen], [Galaxy], [Sector], [GalaxySector], [SectorName], [SectorMessage], [AllianceID], [PublicID], [GroupSignUp], [GroupPassword], [AllianceWait]) VALUES (1, 1, 17, N'1 : 17', N'Welcome to SKlone', N'Welcome to SKlone', 0, 1, 0, N'sklone', 0)
GO
INSERT [dbo].[Sectors] ([SectorOpen], [Galaxy], [Sector], [GalaxySector], [SectorName], [SectorMessage], [AllianceID], [PublicID], [GroupSignUp], [GroupPassword], [AllianceWait]) VALUES (1, 1, 18, N'1 : 18', N'Welcome to SKlone', N'Welcome to SKlone', 0, 1, 0, N'sklone', 0)
GO
INSERT [dbo].[Sectors] ([SectorOpen], [Galaxy], [Sector], [GalaxySector], [SectorName], [SectorMessage], [AllianceID], [PublicID], [GroupSignUp], [GroupPassword], [AllianceWait]) VALUES (1, 1, 19, N'1 : 19', N'Welcome to SKlone', N'Welcome to SKlone', 0, 1, 0, N'sklone', 0)
GO
INSERT [dbo].[Sectors] ([SectorOpen], [Galaxy], [Sector], [GalaxySector], [SectorName], [SectorMessage], [AllianceID], [PublicID], [GroupSignUp], [GroupPassword], [AllianceWait]) VALUES (1, 1, 20, N'1 : 20', N'Welcome to SKlone', N'Welcome to SKlone', 0, 1, 0, N'sklone', 0)
GO
INSERT [dbo].[UnitPowerCost] ([UnitType], [PowerCost]) VALUES (0, 0.7)
GO
INSERT [dbo].[UnitPowerCost] ([UnitType], [PowerCost]) VALUES (1, 0.7)
GO
INSERT [dbo].[UnitPowerCost] ([UnitType], [PowerCost]) VALUES (2, 0.7)
GO
INSERT [dbo].[UnitPowerCost] ([UnitType], [PowerCost]) VALUES (3, 0.7)
GO
INSERT [dbo].[UnitPowerCost] ([UnitType], [PowerCost]) VALUES (4, 0.7)
GO
INSERT [dbo].[UnitPowerCost] ([UnitType], [PowerCost]) VALUES (5, 1.4)
GO
INSERT [dbo].[UnitPowerCost] ([UnitType], [PowerCost]) VALUES (6, 1.4)
GO
INSERT [dbo].[UnitPowerCost] ([UnitType], [PowerCost]) VALUES (7, 0.7)
GO
INSERT [dbo].[UnitPowerCost] ([UnitType], [PowerCost]) VALUES (8, 0.7)
GO
INSERT [dbo].[UnitPowerCost] ([UnitType], [PowerCost]) VALUES (9, 0.7)
GO
INSERT [dbo].[UnitPowerCost] ([UnitType], [PowerCost]) VALUES (10, 0.7)
GO
INSERT [dbo].[UnitPowerCost] ([UnitType], [PowerCost]) VALUES (11, 0.7)
GO
INSERT [dbo].[ServerStatus] ([Offline], [SignupsOpen], [NotStarted], [StartDate], [EndGame], [EndDate], [MaxPlayers]) VALUES (0, 1, 0, CAST(N'2004-05-01T00:00:00.000' AS DateTime), 0, CAST(N'1900-04-29T23:00:00.000' AS DateTime), 500)
GO
