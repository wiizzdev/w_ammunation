Config = {
    UtiliserCarteBancaire = true,
    NomItemCarte = 'cartebancaire',
    Ammunation = {
        ActiverLetale = true,
        ActiverBlanche = true,
        ActiverAccess = true,
        List = {
            Letale = { -- /!\ doit forcément être une arme
                {label = "Pistolet", name = 'weapon_pistol', price = 300},
                {label = "Pétoire", name = 'weapon_snspistol', price = 400},
                {label = "Vintage", name = 'weapon_vintagepistol', price = 500},
            },
            Blanche = { -- /!\ doit forcément être une arme
                {label = "Couteau", name = 'weapon_knife', price = 100},
                {label = "Batte de Baseball", name = 'weapon_bat', price = 50},
                {label = "Poingt Américain", name = 'weapon_knuckle', price = 25},
            },
            Access = { -- /!\ doit forcément être un item
                {label = "Chargeur", name = 'clip', price = 100},
                {label = "Kevlar", name = 'kevlar', price = 300},
            },
        },
        Pos = {
            {x = -662.1, 	y = -935.3, 	z = 21.83},
            {x = 810.2, 	y = -2157.3, 	z = 29.62},
            {x = 1693.13, 	y = 3759.8, 	z = 34.71},
            {x = -330.4, 	y = 6083.96, 	z = 31.45},
            {x = 252.3, 	y = -50.0, 		z = 69.94},
            {x = 22.0, 		y = -1107.2, 	z = 29.8},
            {x = 2567.6, 	y = 294.3, 		z = 108.7},
            {x = -1117.92, 	y = 2698.61, 	z = 18.55},
            {x = 842.35, 	y = -1033.86, 	z = 28.19},
        },
        PedsName = 's_m_y_ammucity_01',
        PedsAnim = true,
        PedsList = {
            {x = 22.45,     y = -1105.41,  z = 28.8,    h = 153.96},
            {x = 253.84,    y = -50.55,    z = 68.94,   h = 63.701},
            {x = 2567.61,   y = 292.61,    z = 107.63,  h = 352.785},
            {x = -331.62,   y = 6085.03,   z = 30.45,   h = 222.123},
            {x = 1691.95,   y = 3760.71,   z = 33.71,   h = 221.985},
            {x = -662.07,   y = -933.52,   z = 20.83,   h = 176.542},
            {x = 810.26,    y = -2159.03,  z = 28.62,   h = 354.409},
            {x = -1119.05,  y = 2699.78,   z = 17.55,   h = 219.927},
            {x = 842.5,     y = -1035.3,   z = 27.19,   h = 357.605},
        },
        ActiverBlips = true,
        BlipsName = "Ammunation",
        BlipsId = 110,
        BlipsColor = 1,
        BlipsScale = 0.6,
        PPA = {
            Activer = true,
            Price = 5000,
        }
    }
}
