Config = {}

Config.Needs = {
    ['hunger'] = math.random(5,10), -- other option is false
    ['thirst'] = math.random(5,10), -- other option is false
    ['refresh'] = 60,
    ['reduction'] = {
        hunger = math.random(1,3),
        thirst = math.random(2,5)
    }
}

Config.Items = {
    ['ketamine']                  = {['name'] = 'ketamine',               ['label'] = 'Ketamine Shot',     ['weight'] = 100,         ['type'] = 'item',         ['image'] = 'ketamine.png',         ['unique'] = true,     ['useable'] = true,     ['shouldClose'] = true,  ['combinable'] = nil,   ['description'] = ''},
    ['anesthetic']                = {['name'] = 'anesthetic',             ['label'] = 'Anesthetic Shot',   ['weight'] = 100,         ['type'] = 'item',         ['image'] = 'anesthetic.png',       ['unique'] = true,     ['useable'] = true,     ['shouldClose'] = true,  ['combinable'] = nil,   ['description'] = ''},
    ['meldonin']                  = {['name'] = 'meldonin',               ['label'] = 'Meldonin Shot',     ['weight'] = 100,         ['type'] = 'item',         ['image'] = 'meldonin.png',         ['unique'] = true,     ['useable'] = true,     ['shouldClose'] = true,  ['combinable'] = nil,   ['description'] = ''},
    ['adrenaline']                = {['name'] = 'adrenaline',             ['label'] = 'Adrenaline Shot',   ['weight'] = 100,         ['type'] = 'item',         ['image'] = 'adrenaline.png',       ['unique'] = true,     ['useable'] = true,     ['shouldClose'] = true,  ['combinable'] = nil,   ['description'] = ''},
    ['sj6']                       = {['name'] = 'sj6',                    ['label'] = 'SJ-6 Shot',         ['weight'] = 100,         ['type'] = 'item',         ['image'] = 'sj6.png',              ['unique'] = true,     ['useable'] = true,     ['shouldClose'] = true,  ['combinable'] = nil,   ['description'] = ''},
    ['morphine']                  = {['name'] = 'morphine',               ['label'] = 'Morphine Shot',     ['weight'] = 100,         ['type'] = 'item',         ['image'] = 'morphine.png',         ['unique'] = true,     ['useable'] = true,     ['shouldClose'] = true,  ['combinable'] = nil,   ['description'] = ''},
}