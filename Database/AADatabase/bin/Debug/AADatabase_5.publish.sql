﻿/*
Deployment script for AADatabase

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "AADatabase"
:setvar DefaultFilePrefix "AADatabase"
:setvar DefaultDataPath "C:\Users\rachael\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB"
:setvar DefaultLogPath "C:\Users\rachael\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

GO

GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

/*portal seed data */
INSERT INTO [portal].[configuration]([ConfigId],[AdCycle],[FeatureCycle],[ShowTechNotes],[RequireLogin]) VALUES(1,1,2,1,1)

SET IDENTITY_INSERT [portal].[AdCategories] ON 
INSERT [portal].[AdCategories] ([AdCategoryId], [Name], [SortOrder], [Description], [BannerGraphicFile], [Active]) VALUES (1, N'Promotions', 1, NULL, N'graphic.png', 1)
INSERT [portal].[AdCategories] ([AdCategoryId], [Name], [SortOrder], [Description], [BannerGraphicFile], [Active]) VALUES (2, N'Art', 2, NULL, N'graphic.png', 1)
SET IDENTITY_INSERT [portal].[AdvertisementCategories] OFF

SET IDENTITY_INSERT [portal].[Ads] ON 
INSERT [portal].[Ads] ([AdId], [Name], [Priority], [Link], [StartDate], [ExpirationDate], [ClientId], [Title], [AdCategoryId], [BannerGraphicFile], [Active]) VALUES (1, N'Retro Rocket', 1, N'http://localhost/pennyarcade/', CAST(0x0700000000005A3D0B AS DateTime2), CAST(0x070000000000C73E0B AS DateTime2), 1, N'Retro Rocket', 2, N'graphic.png', 1)
INSERT [portal].[Ads] ([AdId], [Name], [Priority], [Link], [StartDate], [ExpirationDate], [ClientId], [Title], [AdCategoryId], [BannerGraphicFile], [Active]) VALUES (2, N'Space Invaders', 1, N'http://localhost/pennyarcade/', CAST(0x0700000000005A3D0B AS DateTime2), CAST(0x070000000000C73E0B AS DateTime2), 1, N'Space Invaders', 2, N'graphic.png', 1)
SET IDENTITY_INSERT [portal].[Ads] OFF

INSERT [portal].[AdClients] ([AdClientId], [Name], [Active]) VALUES (1, N'Cyberidian', 1)

/* lookup data */
SET IDENTITY_INSERT [lookups].[AdCycles] ON 
INSERT [lookups].[AdCycles] ([AdCycleId], [Name], [Active]) VALUES (1, N'Random', 1)
INSERT [lookups].[AdCycles] ([AdCycleId], [Name], [Active]) VALUES (2, N'Priority', 1)
SET IDENTITY_INSERT [lookups].[AdCycles] OFF

SET IDENTITY_INSERT [lookups].[FeatureCycles] ON 
INSERT [lookups].[FeatureCycles] ([FeatureCycleId], [Name], [Active]) VALUES (1, N'Random', 1)
INSERT [lookups].[FeatureCycles] ([FeatureCycleId], [Name], [Active]) VALUES (2, N'Priority', 1)
SET IDENTITY_INSERT [lookups].[FeatureCycles] OFF

/* content data */
SET IDENTITY_INSERT [content].[Categories] ON 
INSERT [content].[Categories] ([CategoryId], [Name], [SortOrder], [Description], [Active], [BannerGraphicFile]) VALUES (1, N'Card Games', 1, NULL, 1, N'graphic.png')
INSERT [content].[Categories] ([CategoryId], [Name], [SortOrder], [Description], [Active], [BannerGraphicFile]) VALUES (3, N'Puzzles', 2, NULL, 1, N'graphic.png')
INSERT [content].[Categories] ([CategoryId], [Name], [SortOrder], [Description], [Active], [BannerGraphicFile]) VALUES (4, N'Casino', 3, NULL, 1, N'graphic.png')
SET IDENTITY_INSERT [content].[Categories] OFF

SET IDENTITY_INSERT [content].[Games] ON 
INSERT [content].[Games] ([GameId], [Name], [Link], [Description], [Graphic400x200], [Graphic200x100], [Graphic100x100], [TechNotes], [Developer], [Featured], [Priority], [Title], [Active]) VALUES (1, N'Go Fish', N'http://localhost/pennyarcade/', NULL, NULL, N'graphic.png', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [content].[Games] ([GameId], [Name], [Link], [Description], [Graphic400x200], [Graphic200x100], [Graphic100x100], [TechNotes], [Developer], [Featured], [Priority], [Title], [Active]) VALUES (2, N'Go Fish - Multiplayer', N'http://localhost/pennyarcade/', NULL, NULL, N'graphic.png', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [content].[Games] ([GameId], [Name], [Link], [Description], [Graphic400x200], [Graphic200x100], [Graphic100x100], [TechNotes], [Developer], [Featured], [Priority], [Title], [Active]) VALUES (3, N'Crazy 8', N'http://localhost/pennyarcade/', NULL, NULL, N'graphic.png', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [content].[Games] ([GameId], [Name], [Link], [Description], [Graphic400x200], [Graphic200x100], [Graphic100x100], [TechNotes], [Developer], [Featured], [Priority], [Title], [Active]) VALUES (4, N'Halloween Slider 1', N'http://localhost/pennyarcade/', NULL, NULL, N'graphic.png', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [content].[Games] ([GameId], [Name], [Link], [Description], [Graphic400x200], [Graphic200x100], [Graphic100x100], [TechNotes], [Developer], [Featured], [Priority], [Title], [Active]) VALUES (5, N'Halloween Slider 2', N'http://localhost/pennyarcade/', NULL, NULL, N'graphic.png', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [content].[Games] ([GameId], [Name], [Link], [Description], [Graphic400x200], [Graphic200x100], [Graphic100x100], [TechNotes], [Developer], [Featured], [Priority], [Title], [Active]) VALUES (6, N'Halloween Jigsaw Puzzle', N'http://localhost/pennyarcade/', NULL, NULL, N'graphic.png', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [content].[Games] ([GameId], [Name], [Link], [Description], [Graphic400x200], [Graphic200x100], [Graphic100x100], [TechNotes], [Developer], [Featured], [Priority], [Title], [Active]) VALUES (7, N'Cat Jigsaw Puzzle', N'http://localhost/pennyarcade/', NULL, NULL, N'graphic.png', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [content].[Games] ([GameId], [Name], [Link], [Description], [Graphic400x200], [Graphic200x100], [Graphic100x100], [TechNotes], [Developer], [Featured], [Priority], [Title], [Active]) VALUES (8, N'Black Jack', N'http://localhost/pennyarcade/', NULL, NULL, N'graphic.png', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [content].[Games] ([GameId], [Name], [Link], [Description], [Graphic400x200], [Graphic200x100], [Graphic100x100], [TechNotes], [Developer], [Featured], [Priority], [Title], [Active]) VALUES (9, N'Roulette', N'http://localhost/pennyarcade/', NULL, NULL, N'graphic.png', NULL, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [content].[Games] OFF


INSERT INTO [content].[GameCategories] ([CategoryId],[GameId],[Active]) VALUES (1,1,1)
INSERT INTO [content].[GameCategories] ([CategoryId],[GameId],[Active]) VALUES (1,2,1)
INSERT INTO [content].[GameCategories] ([CategoryId],[GameId],[Active]) VALUES (1,3,1)
INSERT INTO [content].[GameCategories] ([CategoryId],[GameId],[Active]) VALUES (2,4,1)
INSERT INTO [content].[GameCategories] ([CategoryId],[GameId],[Active]) VALUES (2,5,1)
INSERT INTO [content].[GameCategories] ([CategoryId],[GameId],[Active]) VALUES (2,6,1)
INSERT INTO [content].[GameCategories] ([CategoryId],[GameId],[Active]) VALUES (2,7,1)
INSERT INTO [content].[GameCategories] ([CategoryId],[GameId],[Active]) VALUES (3,8,1)
INSERT INTO [content].[GameCategories] ([CategoryId],[GameId],[Active]) VALUES (3,9,1)
GO

GO
PRINT N'Update complete.';


GO
