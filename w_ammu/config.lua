    -- G_Corporation -- wiizz -- 
  -- https://github.com/wiizzdev --
 -- https://discord.gg/VpYP58ZjmD --

config = {}

-- PRIX LABEL (pour rajouter des items => client.lua / server.lua)
config.prixarmeal1 = "~g~500$" -- label du prix du pistolet
config.prixarmeal2 = "~g~350$" -- label du prix du pétoire
config.prixarmeal3 = "~g~300$" -- label du prix du vintage
config.prixarmeab1 = "~g~100$" -- label du prix du couteau
config.prixarmeab2 = "~g~50$" -- label du prix de la batte de baseball
config.prixarmeab3 = "~g~25$" -- label du prix du poingt américain
config.prixitemac1 = "~g~50$" -- label du prix du chargeur de munitions
config.prixitemac2 = "~g~100$" -- label du prix du gilet pare-balles
config.prixitemac3 = "~g~150$" -- label du prix du parachute
config.prixppa = "~g~5000$" -- label du prix du permis de port d'arme
-- pour changer le prix réel des armes/items/PPA => server.lua

-- MARKERS (pour changer la rotation et la taille des markers => client.lua ligne 93)
config.markertype = 6 -- type de marker (https://docs.fivem.net/docs/game-references/markers/)
config.red = 255 -- couleur rouge du marker (https://htmlcolorcodes.com/fr/)
config.green = 255 -- couleur verte du marker
config.blue = 255 -- couleur bleu du marker
config.opacity = 50 -- opacité du marker

-- BLIPS / SHOPS (https://docs.fivem.net/docs/game-references/blips/)
config.blipname = "Ammunation" -- nom des blips
config.blipscale = 0.6 -- taille des blips
config.blipcolour = 0 -- couleur des blips
config.blipsprite = 110 -- logo des blips
config.blipdisplay = 4 -- 4 = visible sur la grande map et la mininimap 5 = uniquement visible sur la minimap / 7 = uniquement visible sur la grande map

-- PEDS (pour changer les coordonnées des peds => client.lua)
config.peurped = true -- les peds doivent-ils fuire quand vous avez une arme ?
config.freezeped = true -- freeze la position des peds ?
config.invincibleped = true -- faire en sortes que les peds soit invinsible ?

-- AMMUNATION/BLIPS
Config = {
    position = { -- coordonées des armureries et des blips
			{x = -662.1, 	y = -935.3, 	z = 20.83},
            {x = 810.2, 	y = -2157.3, 	z = 28.62},
            {x = 1693.13, 	y = 3759.8, 	z = 33.71},
            {x = -330.4, 	y = 6083.96, 	z = 30.45},
            {x = 252.3, 	y = -50.0, 		z = 68.94},
            {x = 22.0, 		y = -1107.2, 	z = 28.8},
            {x = 2567.6, 	y = 294.3, 		z = 107.7},
            {x = -1117.92, 	y = 2698.61, 	z = 17.55},
            {x = 842.35, 	y = -1033.86, 	z = 27.19},
    },
}