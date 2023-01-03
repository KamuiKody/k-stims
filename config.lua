Config = {}

Config.Needs = {
    ['hunger'] = math.random(5,10), -- other option is false
    ['thirst'] = math.random(5,10), -- other option is false
    ['reduction'] = {
        hunger = math.random(1,3),
        thirst = math.random(2,5)
    }
}

Config.Items = {
    ['ketamine']                  = {['name'] = 'ketamine',               ['label'] = 'Ketamine Shot',     ['weight'] = 100,         ['type'] = 'item',         ['image'] = 'ketamine.png',         ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,  ['combinable'] = nil,   ['description'] = ''},
    ['anesthetic']                = {['name'] = 'anesthetic',             ['label'] = 'Anesthetic Shot',   ['weight'] = 100,         ['type'] = 'item',         ['image'] = 'anesthetic.png',       ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,  ['combinable'] = nil,   ['description'] = ''},
    ['meldonin']                  = {['name'] = 'meldonin',               ['label'] = 'Meldonin Shot',     ['weight'] = 100,         ['type'] = 'item',         ['image'] = 'meldonin.png',         ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,  ['combinable'] = nil,   ['description'] = ''},
    ['adrenaline']                = {['name'] = 'adrenaline',             ['label'] = 'Adrenaline Shot',   ['weight'] = 100,         ['type'] = 'item',         ['image'] = 'adrenaline.png',       ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,  ['combinable'] = nil,   ['description'] = ''},
    ['sj6']                       = {['name'] = 'sj6',                    ['label'] = 'SJ-6 Shot',         ['weight'] = 100,         ['type'] = 'item',         ['image'] = 'sj6.png',              ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,  ['combinable'] = nil,   ['description'] = ''},
    ['morphine']                  = {['name'] = 'morphine',               ['label'] = 'Morphine Shot',     ['weight'] = 100,         ['type'] = 'item',         ['image'] = 'morphine.png',         ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,  ['combinable'] = nil,   ['description'] = ''},
    ['etg-change']                = {['name'] = 'etg-change',             ['label'] = 'eTG-change Shot',   ['weight'] = 100,         ['type'] = 'item',         ['image'] = 'etg-change.png',       ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,  ['combinable'] = nil,   ['description'] = ''},
}