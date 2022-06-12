Config = {
    Menu = {
        Letale = {
            {label = "Pistolet", name = 'weapon_pistol', price = 100},
            {label = "Pétoire", name = 'weapon_snspistol', price = 150},
            {label = "Vintage", name = 'weapon_vintagepistol', price = 200},
        },
        Blanche = {
            {label = "Batte", name = 'weapon_bat', price = 20},
            {label = "Couteau", name = 'weapon_knife', price = 50},
            {label = "Poing Américain", name = 'weapon_knuckle', price = 75},
        },
        Equipement = {
            {label = "Chargeur", name = 'clip', price = 10},
            {label = "Kevlar", name = 'kevlar', price = 50},
        },
        Activer = {
            PaiementBanque = true, -- mettre 'false' pour payer uniquement en liquide
            Letale = true,
            Blanche = true,
            Equipement = true,
        },
    },
    Position = {
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
    Peds = {
        Name = 's_m_y_ammucity_01',
        Position = {
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
    },
    Blips = {
        Activer = true,
        Sprite = 110,
        Color = 1,
        Scale = 0.6,
        Name = "Ammunation",
    },
}