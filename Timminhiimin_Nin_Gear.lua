-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','SomeAcc','Full','Fodder','WTF')
    state.HybridMode:options('Normal','Evasion','PDT')
    state.RangedMode:options('Normal','Acc')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Full','Fodder','WTF')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Heishi','HeishiTer','Naegling','Dagger','Kikoku','ProcDagger','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana','ProcKatana','ProcClub','ProcStaff','None')
	state.Stance = M{['description']='Stance','None','Yonin','Innin'}
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None','SuppaBrutal','DWEarrings','DWMax'}
	
	gear.wsd_jse_back = {name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.da_jse_back = {name="Andartia's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	
	send_command('bind ^` input /ja "Innin" <me>')
    send_command('bind !` input /ja "Yonin" <me>')
	send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	
	utsusemi_cancel_delay = .4
	utsusemi_ni_cancel_delay = .1
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    sets.Enmity = {ammo="Paeapua",
        head="Dampening Tam",neck="Unmoving Collar +1",ear1="Friomisi Earring",ear2="Trux Earring",
        body="Emet Harness +1",hands="Kurys Gloves",ring1="Petrov Ring",ring2="Vengeful Ring",
        back="Moonlight Cape",waist="Goading Belt",legs=gear.herculean_dt_legs,feet="Amm Greaves"}
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {} --legs="Mochizuki Hakama"
    sets.precast.JA['Futae'] = {hands="Hattori Tekko +2"}
    sets.precast.JA['Sange'] = {} --legs="Mochizuki Chainmail"
	sets.precast.JA['Provoke'] = sets.Enmity
	sets.precast.JA['Warcry'] = sets.Enmity

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",head={ name="Herculean Helm", augments={'Accuracy+28','"Waltz" potency +11%',}},
		hands={name="Herculean Gloves", augments={'Attack+13','"Waltz" potency +11%','DEX+5',}},
		legs={name="Herculean Trousers", augments={'"Waltz" potency +11%','DEX+5','Attack+14',}},
		feet={ name="Herculean Boots", augments={'"Waltz" potency +11%','VIT+10','Accuracy+10',}},ring1="Asklepan Ring",ring2="Valseur's Ring",
        }
	
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Zennaroi Earring",ear2="Telos Earring",
        body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Andartia's Mantle",waist="Olseni Belt",legs="Mummu Kecks +2",feet=gear.herculean_acc_feet}

    sets.precast.Flourish1 = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Gwati Earring",ear2="Digni. Earring",
        body="Mekosu. Harness",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Andartia's Mantle",waist="Olseni Belt",legs="Hattori Hakama +2",feet=gear.herculean_acc_feet}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Sapience Orb",head={name="Herculean Helm", augments={'"Fast Cast"+6','MND+10','Mag. Acc.+5','"Mag.Atk.Bns."+9',}},
    body={name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}},hands="Leyline Gloves",
    legs={name="Herculean Trousers", augments={'Mag. Acc.+11','"Fast Cast"+6','STR+2','"Mag.Atk.Bns."+8',}},feet={name="Herculean Boots", augments={'"Fast Cast"+6',}},
    neck="Orunmila's Torque",waist="Sailfi Belt +1",left_ear="Loquac. Earring",right_ear="Enchntr. Earring +1",left_ring="Medada's Ring",
    right_ring="Weather. Ring",back={ name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Mag. Evasion+15',}}}
		
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {feet="Hattori Kyahan +3"})
	
    -- Snapshot for ranged
    sets.precast.RA = {legs="Nahtirah Trousers"}
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {    ammo="Oshasha's Treatise",head="Hachiya Hatsuburi +3",body="Nyame Mail",hands="Nyame Gauntlets",legs="Mochizuki hakama +3",feet="Hattori Kyahan +3",
    neck="Fotia Gorget",waist="Fotia Belt",left_ear="Ishvara Earring",right_ear="Moonshade Earring",left_ring="Epaminondas's Ring",right_ring="Regal Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {head="Dampening Tam","Ken. Samue",legs="Hiza. Hizayoroi +2",ear2="Telos Earring"})
    sets.precast.WS.Full = set_combine(sets.precast.WS, {ammo="Yamarang",head="Ynglinga Sallet",neck="Moonbeam Nodowa",ear1="Zennaroi Earring",ear2="Telos Earring",body="Mummu Jacket +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet=gear.herculean_acc_feet})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})
	
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Blade: Chi'] = {ammo="Seeth. Bomblet +1",head="Mochi. Hatsuburi +3",body={ name="Nyame Mail", augments={'Path: B',}},hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs="Mochi. Hakama +3",feet="Adhe. Gamashes +1",neck="Fotia Gorget",waist="Orpheus's Sash",left_ear="Moonshade Earring",right_ear="Lugra Earring +1",left_ring="Epaminondas's Ring",
		right_ring="Gere Ring",back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	sets.precast.WS['Blade: Chi'].someACC = {ammo="Seeth. Bomblet +1",head="Mochi. Hatsuburi +3",body={ name="Nyame Mail", augments={'Path: B',}},hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs="Mochi. Hakama +3",feet="Adhe. Gamashes +1",neck="Fotia Gorget",waist="Orpheus's Sash",left_ear="Moonshade Earring",right_ear="Friomisi Earring",left_ring="Epaminondas's Ring",
		right_ring="Gere Ring",back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	sets.precast.WS['Blade: Chi'].Full = {ammo="Seeth. Bomblet +1",head="Mochi. Hatsuburi +3",body={ name="Nyame Mail", augments={'Path: B',}},hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},feet="Hattori Kyahan +3",neck="Ninja Nodowa +2",waist="Orpheus's Sash",left_ear="Moonshade Earring",right_ear="Hattori Earring +1",
		left_ring="Epaminondas's Ring",right_ring="Gere Ring",back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	sets.precast.WS['Blade: Chi'].Fodder = set_combine(sets.precast.WS['Blade: Chi'], {})
	sets.precast.WS['Blade: Chi'].WTF = {ammo="Seeth. Bomblet +1",head="Mochi. Hatsuburi +3",body={ name="Nyame Mail", augments={'Path: B',}},hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Hattori Kyahan +3",neck="Ninja Nodowa +2",waist="Orpheus's Sash",left_ear="Moonshade Earring",right_ear="Hattori Earring +1",left_ring="Epaminondas's Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	
    sets.precast.WS['Blade: Ei'] = {ammo="Seeth. Bomblet +1",head="Mochi. Hatsuburi +3",body="Gyve Doublet",hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},neck="Sibyl Scarf",waist="Orpheus's Sash",left_ear="Moonshade Earring",right_ear="Friomisi Earring",left_ring="Epaminondas's Ring",right_ring="Archon Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Ei'].SomeAcc = {ammo="Seeth. Bomblet +1",head="Mochi. Hatsuburi +3",body="Gyve Doublet",hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},neck="Sibyl Scarf",waist="Orpheus's Sash",left_ear="Moonshade Earring",right_ear="Friomisi Earring",left_ring="Epaminondas's Ring",right_ring="Archon Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Ei'].Full =  {ammo="Seeth. Bomblet +1",head="Mochi. Hatsuburi +3",body="Gyve Doublet",hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},neck="Sibyl Scarf",waist="Orpheus's Sash",left_ear="Moonshade Earring",right_ear="Friomisi Earring",left_ring="Epaminondas's Ring",right_ring="Archon Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	sets.precast.WS['Blade: Ei'].Fodder = set_combine(sets.precast.WS['Blade: Ei'], {})
	sets.precast.WS['Blade: Ei'].WTF = {ammo="Seeth. Bomblet +1",head="Mochi. Hatsuburi +3",body="Gyve Doublet",hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},neck="Sibyl Scarf",waist="Orpheus's Sash",left_ear="Friomisi Earring",right_ear="Novio Earring",left_ring="Epaminondas's Ring",right_ring="Archon Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}

	sets.precast.WS['Blade: Hi'] = {ammo="Yetshila +1",head="Ken. Jinpachi +1",body="Ken. Samue +1",hands="Ryuo Tekko +1",legs="Mochi. Hakama +3",feet="Hattori Kyahan +3",neck="Ninja Nodowa +2",
		waist="Gerdr Belt +1",left_ear="Odr Earring",right_ear="Lugra Earring +1",left_ring="Begrudging Ring",right_ring="Regal Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Hi'].SomeAcc = {ammo="Yetshila +1",head="Ken. Jinpachi +1",body="Ken. Samue +1",hands="Hattori Tekko +2",legs="Mochi. Hakama +3",feet="Hattori Kyahan +3",neck="Ninja Nodowa +2",
		waist="Gerdr Belt +1",left_ear="Odr Earring",right_ear="Lugra Earring +1",left_ring="Ilabrat Ring",right_ring="Regal Ring",
		back={ name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Hi'].Full = {ammo="Yetshila +1",head="Hachiya Hatsu. +3",body="Ken. Samue +1",hands="Malignance Gloves",legs="Mochi. Hakama +3",feet="Hattori Kyahan +3",neck="Ninja Nodowa +2",
		waist="Sailfi Belt +1",left_ear="Odr Earring",right_ear="Hattori Earring +1",left_ring="Epaminondas's Ring",right_ring="Sroda Ring",
		back={ name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}}
	sets.precast.WS['Blade: Hi'].Fodder = set_combine(sets.precast.WS['Blade: Hi'], {})
	sets.precast.WS['Blade: Hi'].WTF = {ammo="Yetshila +1",head="Hachiya Hatsu. +3",body="Malignance Tabard",hands="Malignance Gloves",legs="Mochi. Hakama +3",feet="Hattori Kyahan +3",neck="Ninja Nodowa +2",waist="Gerdr Belt +1",
		left_ear="Odr Earring",right_ear="Hattori Earring +1",left_ring="Epaminondas's Ring",right_ring="Regal Ring",back={ name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}}

    sets.precast.WS['Blade: Jin'] = {ammo="Yetshila +1",head="Adhemar Bonnet +1",body="Ken. Samue +1",hands="Ryuo Tekko +1",legs="Mpaca's Hose",feet="Adhe. Gamashes +1",neck="Fotia Gorget",waist="Fotia Belt",
		left_ear="Moonshade Earring",left_ring="Begrudging Ring",right_ring="Gere Ring",back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Jin'].SomeAcc = {ammo="Yetshila +1",head="Adhemar Bonnet +1",body="Ken. Samue +1",hands="Ryuo Tekko +1",legs="Mpaca's Hose",feet="Adhe. Gamashes +1",neck="Fotia Gorget",waist="Fotia Belt",
		left_ear="Moonshade Earring",left_ring="Begrudging Ring",right_ring="Gere Ring",back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Jin'].Full = {ammo="Yetshila +1",head="Adhemar Bonnet +1",body="Ken. Samue +1",hands="Adhemar Wrist. +1",legs="Mpaca's Hose",feet="Ken. Sune-Ate +1",neck="Ninja Nodowa +2",
		waist="Fotia Belt",left_ear="Lugra Earring +1",right_ear="Hattori Earring +1",left_ring="Sroda Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	sets.precast.WS['Blade: Jin'].Fodder = set_combine(sets.precast.WS['Blade: Jin'], {})
	sets.precast.WS['Blade: Jin'].WTF = {ammo="Yetshila +1",head="Mpaca's Cap",body="Ken. Samue +1",hands="Ryuo Tekko +1",legs="Tatena. Haidate +1",feet="Ken. Sune-Ate +1",neck="Ninja Nodowa +2",waist="Fotia Belt",
		left_ear="Odr Earring",right_ear="Hattori Earring +1",left_ring="Regal Ring",right_ring="Gere Ring",back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
  
	sets.precast.WS['Blade: Kamu'] = {ammo="Seeth. Bomblet +1",head="Adhemar Bonnet +1",body="Mpaca's Doublet",hands="Adhemar Wrist. +1",legs="Mpaca's Hose",feet="Hattori Kyahan +3",
		neck="Ninja Nodowa +2",waist="Sailfi Belt +1",left_ear="Lugra Earring +1",right_ear="Hattori Earring +1",left_ring="Epona's Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Kamu'].SomeAcc = {ammo="Crepuscular Pebble",head="Hachiya Hatsu. +3",body="Ken. Samue +1",hands="Adhemar Wrist. +1",legs="Mpaca's Hose",feet="Malignance Boots",neck="Ninja Nodowa +2",
		waist="Sailfi Belt +1",left_ear="Lugra Earring +1",right_ear="Hattori Earring +1",left_ring="Sroda Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Kamu'].Full =  {ammo="Crepuscular Pebble",head="Hachiya Hatsu. +3",body="Ken. Samue +1",hands="Adhemar Wrist. +1",legs="Mpaca's Hose",feet="Malignance Boots",neck="Ninja Nodowa +2",
		waist="Sailfi Belt +1",left_ear="Lugra Earring +1",right_ear="Hattori Earring +1",left_ring="Sroda Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	sets.precast.WS['Blade: Kamu'].Fodder = set_combine(sets.precast.WS['Blade: Kamu'], {})
	sets.precast.WS['Blade: Kamu'].WTF = {ammo="Crepuscular Pebble",head="Ken. Jinpachi +1",body="Ken. Samue +1",hands="Malignance Gloves",legs="Tatena. Haidate +1",feet="Hattori Kyahan +3",neck="Ninja Nodowa +2",
		waist="Sailfi Belt +1",left_ear="Lugra Earring +1",right_ear="Hattori Earring +1",left_ring="Epona's Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	
    sets.precast.WS['Blade: Ku'] = {ammo="Seeth. Bomblet +1",head="Adhemar Bonnet +1",body="Agony Jerkin +1",hands="Mochizuki Tekko +3",legs="Tatena. Haidate +1",feet="Hattori Kyahan +3",neck="Fotia Gorget",
		waist="Fotia Belt",left_ear="Lugra Earring +1",right_ear="Mache Earring +1",left_ring="Regal Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Ku'].SomeAcc = {ammo="Seeth. Bomblet +1",head="Adhemar Bonnet +1",body="Agony Jerkin +1",hands="Mochizuki Tekko +3",legs="Tatena. Haidate +1",feet="Hattori Kyahan +3",neck="Fotia Gorget",
		waist="Fotia Belt",left_ear="Lugra Earring +1",right_ear="Mache Earring +1",left_ring="Regal Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Ku'].Full =  {ammo="Crepuscular Pebble",head="Hachiya Hatsu. +3",body="Malignance Tabard",hands="Malignance Gloves",legs="Samnuha Tights",feet="Hattori Kyahan +3",
		neck="Ninja Nodowa +2",waist="Fotia Belt",left_ear="Lugra Earring +1",right_ear="Hattori Earring +1",left_ring="Sroda Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	sets.precast.WS['Blade: Ku'].Fodder = set_combine(sets.precast.WS['Blade: Ku'], {})
	sets.precast.WS['Blade: Ku'].WTF = {ammo="Crepuscular Pebble",head="Ken. Jinpachi +1",body="Malignance Tabard",hands="Malignance Gloves",legs="Tatena. Haidate +1",feet="Hattori Kyahan +3",neck="Ninja Nodowa +2",
		waist="Fotia Belt",left_ear="Lugra Earring +1",right_ear="Hattori Earring +1",left_ring="Sroda Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	
	sets.precast.WS['Blade: Metsu'] = {ammo="Aurgelmir Orb +1",head="Hachiya Hatsu. +3",body="Agony Jerkin +1",hands="Hattori Tekko +2",legs="Mochi. Hakama +3",feet="Hattori Kyahan +3",
		neck="Ninja Nodowa +2",waist="Sailfi Belt +1",left_ear="Lugra Earring +1",right_ear="Mache Earring +1",left_ring="Regal Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Metsu'].SomeAcc = {ammo="Aurgelmir Orb +1",head="Hachiya Hatsu. +3",body="Agony Jerkin +1",hands="Hattori Tekko +2",legs="Mochi. Hakama +3",feet="Hattori Kyahan +3",
		neck="Ninja Nodowa +2",waist="Sailfi Belt +1",left_ear="Lugra Earring +1",right_ear="Mache Earring +1",left_ring="Regal Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Metsu'].Full =  {ammo="Crepuscular Pebble",head="Hachiya Hatsu. +3",body="Malignance Tabard",hands="Malignance Gloves",legs="Mochi. Hakama +3",feet="Hattori Kyahan +3",
		neck="Ninja Nodowa +2",waist="Fotia Belt",left_ear="Lugra Earring +1",right_ear="Hattori Earring +1",left_ring="Epaminondas's Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}	
	sets.precast.WS['Blade: Metsu'].Fodder = set_combine(sets.precast.WS['Blade Metsu'], {})	
	sets.precast.WS['Blade: Metsu'].WTF = {ammo="Crepuscular Pebble",head="Hachiya Hatsu. +3",body="Malignance Tabard",hands="Malignance Gloves",legs="Mochi. Hakama +3",feet="Hattori Kyahan +3",neck="Ninja Nodowa +2",
		waist="Fotia Belt",left_ear="Odr Earring",right_ear="Hattori Earring +1",left_ring="Epaminondas's Ring",right_ring="Regal Ring",back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
	
	sets.precast.WS['Blade: Retsu'] = {ammo="Seeth. Bomblet +1",head="Adhemar Bonnet +1",body="Mpaca's Doublet",hands="Adhemar Wrist. +1",legs="Tatena. Haidate +1",feet="Hattori Kyahan +3",neck="Fotia Gorget",
		waist="Sailfi Belt +1",left_ear="Lugra Earring +1",right_ear="Mache Earring +1",left_ring="Regal Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Retsu'].SomeAcc = {ammo="Seeth. Bomblet +1",head="Adhemar Bonnet +1",body="Mpaca's Doublet",hands="Adhemar Wrist. +1",legs="Tatena. Haidate +1",feet="Hattori Kyahan +3",neck="Rep. Plat. Medal",
		waist="Sailfi Belt +1",left_ear="Lugra Earring +1",right_ear="Mache Earring +1",left_ring="Regal Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Retsu'].Full =  {ammo="Crepuscular Pebble",head="Ken. Jinpachi +1",body="Malignance Tabard",hands="Adhemar Wrist. +1",legs="Samnuha Tights",feet="Ken. Sune-Ate +1",neck="Ninja Nodowa +2",
		waist="Sailfi Belt +1",left_ear="Lugra Earring +1",right_ear="Hattori Earring +1",left_ring="Epona's Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}	
	sets.precast.WS['Blade: Retsu'].Fodder = set_combine(sets.precast.WS['Blade: Retsu'], {})
	sets.precast.WS['Blade: Retsu'].WTF = {ammo="Crepuscular Pebble",head="Ken. Jinpachi +1",body="Malignance Tabard",hands="Malignance Gloves",legs="Samnuha Tights",feet="Hattori Kyahan +3",neck="Ninja Nodowa +2",
		waist="Sailfi Belt +1",left_ear="Lugra Earring +1",right_ear="Hattori Earring +1",left_ring="Epona's Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
   
    sets.precast.WS['Blade: Shun'] = {ammo="Aurgelmir Orb +1",head="Ken. Jinpachi +1",body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},hands="Adhemar Wrist. +1",legs="Tatena. Haidate +1",
		feet="Hattori Kyahan +3",neck="Fotia Gorget",waist="Fotia Belt",left_ear="Lugra Earring +1",right_ear="Hattori Earring +1",left_ring="Regal Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Shun'].SomeAcc = {ammo="Aurgelmir Orb +1",head="Mpaca's Cap",body="Malignance Tabard",hands="Malignance Gloves",legs="Samnuha Tights",feet="Hattori Kyahan +3",neck="Fotia Gorget",waist="Fotia Belt",
		left_ear="Lugra Earring +1",right_ear="Hattori Earring +1",left_ring="Regal Ring",right_ring="Gere Ring",back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Shun'].Full = {ammo="Crepuscular Pebble",head="Ken. Jinpachi +1",body="Malignance Tabard",hands="Malignance Gloves",legs="Samnuha Tights",feet="Ken. Sune-Ate +1",neck="Ninja Nodowa +2",
		waist="Fotia Belt",left_ear="Lugra Earring +1",right_ear="Hattori Earring +1",left_ring="Regal Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
	sets.precast.WS['Blade: Shun'].Fodder = set_combine(sets.precast.WS['Blade: Shun'], {})
	sets.precast.WS['Blade: Shun'].WTF = {ammo="Crepuscular Pebble",head="Ken. Jinpachi +1",body="Malignance Tabard",hands="Malignance Gloves",legs="Samnuha Tights",feet="Ken. Sune-Ate +1",neck="Ninja Nodowa +2",
		waist="Fotia Belt",left_ear="Lugra Earring +1",right_ear="Hattori Earring +1",left_ring="Ilabrat Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
   
    sets.precast.WS['Blade: Teki'] = {ammo="Seeth. Bomblet +1",head="Mochi. Hatsuburi +3",body={ name="Nyame Mail", augments={'Path: B',}},hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs="Mochi. Hakama +3",feet="Hattori Kyahan +3",
		neck="Fotia Gorget",waist="Orpheus's Sash",left_ear="Moonshade Earring",right_ear="Lugra Earring +1",left_ring="Epaminondas's Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Teki'].SomeAcc = {ammo="Seeth. Bomblet +1",head="Mochi. Hatsuburi +3",body={ name="Nyame Mail", augments={'Path: B',}},hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs="Mochi. Hakama +3",feet="Hattori Kyahan +3",
		neck="Fotia Gorget",waist="Orpheus's Sash",left_ear="Moonshade Earring",right_ear="Lugra Earring +1",left_ring="Epaminondas's Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Teki'].Full =  {ammo="Seeth. Bomblet +1",head="Mochi. Hatsuburi +3",body="Gyve Doublet",hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs="Mochi. Hakama +3",feet="Hattori Kyahan +3",
		neck="Fotia Gorget",waist="Orpheus's Sash",left_ear="Lugra Earring +1",right_ear="Hattori Earring +1",left_ring="Epaminondas's Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	sets.precast.WS['Blade: Teki'].Fodder = set_combine(sets.precast.WS['Blade: Teki'], {})
	sets.precast.WS['Blade: Teki'].WTF = {ammo="Seeth. Bomblet +1",head="Mochi. Hatsuburi +3",body={ name="Nyame Mail", augments={'Path: B',}},hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},feet="Hattori Kyahan +3",neck="Ninja Nodowa +2",waist="Orpheus's Sash",left_ear="Moonshade Earring",right_ear="Hattori Earring +1",
		left_ring="Epaminondas's Ring",right_ring="Gere Ring",back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
   
    sets.precast.WS['Blade: Ten'] = {ammo="Seeth. Bomblet +1",head="Hachiya Hatsu. +3",body="Agony Jerkin +1",hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs="Mochi. Hakama +3",feet="Hattori Kyahan +3",neck="Rep. Plat. Medal",
		waist="Sailfi Belt +1",left_ear="Lugra Earring +1",right_ear="Ishvara Earring",left_ring="Epaminondas's Ring",right_ring="Regal Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Ten'].SomeAcc = {ammo="Seeth. Bomblet +1",head="Hachiya Hatsu. +3",body="Agony Jerkin +1",hands="Mochizuki Tekko +3",legs="Mochi. Hakama +3",feet="Hattori Kyahan +3",neck="Rep. Plat. Medal",
		waist="Sailfi Belt +1",left_ear="Lugra Earring +1",right_ear="Ishvara Earring",left_ring="Epaminondas's Ring",right_ring="Regal Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Ten'].Full =  {ammo="Crepuscular Pebble",head="Hachiya Hatsu. +3",body="Malignance Tabard",hands="Malignance Gloves",legs="Mochi. Hakama +3",feet="Hattori Kyahan +3",neck="Ninja Nodowa +2",
		waist="Sailfi Belt +1",left_ear="Lugra Earring +1",right_ear="Hattori Earring +1",left_ring="Epaminondas's Ring",right_ring="Sroda Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	sets.precast.WS['Blade: Ten'].Fodder = set_combine(sets.precast.WS['Blade: Ten'], {})
	sets.precast.WS['Blade: Ten'].WTF = {ammo="Crepuscular Pebble",head="Hachiya Hatsu. +3",body="Malignance Tabard",hands="Malignance Gloves",legs="Mochi. Hakama +3",feet="Hattori Kyahan +3",neck="Ninja Nodowa +2",
		waist="Sailfi Belt +1",left_ear="Lugra Earring +1",right_ear="Hattori Earring +1",left_ring="Epaminondas's Ring",right_ring="Sroda Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	
	sets.precast.WS['Blade: To'] = {ammo="Seeth. Bomblet +1",head="Mochi. Hatsuburi +3",body={ name="Nyame Mail", augments={'Path: B',}},hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs="Mochi. Hakama +3",
		feet="Hattori Kyahan +3",neck="Fotia Gorget",waist="Orpheus's Sash",left_ear="Lugra Earring +1",right_ear="Moonshade Earring",left_ring="Epaminondas's Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: To'].SomeAcc = {ammo="Seeth. Bomblet +1",head="Mochi. Hatsuburi +3",body={ name="Nyame Mail", augments={'Path: B',}},hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs="Mochi. Hakama +3",
		feet="Hattori Kyahan +3",neck="Fotia Gorget",waist="Orpheus's Sash",left_ear="Lugra Earring +1",right_ear="Moonshade Earring",left_ring="Epona's Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: To'].Full =  {ammo="Seeth. Bomblet +1",head="Mochi. Hatsuburi +3",body="Gyve Doublet",hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Hattori Kyahan +3",neck="Ninja Nodowa +2",waist="Orpheus's Sash",left_ear="Moonshade Earring",right_ear="Hattori Earring +1",left_ring="Epona's Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	sets.precast.WS['Blade: To'].Fodder = set_combine(sets.precast.WS['Blade: To'], {})
	sets.precast.WS['Blade: To'].WTF = {ammo="Seeth. Bomblet +1",head="Mochi. Hatsuburi +3",body={ name="Nyame Mail", augments={'Path: B',}},hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Hattori Kyahan +3",neck="Ninja Nodowa +2",waist="Orpheus's Sash",left_ear="Moonshade Earring",right_ear="Hattori Earring +1",left_ring="Epona's Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	
	sets.precast.WS['Blade: Yu'] = {ammo="Oshasha's Treatise",head="Mochi. Hatsuburi +3",body="Gyve Doublet",hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs="Gyve Trousers",feet="Adhe. Gamashes +1",
		neck="Sibyl Scarf",waist="Orpheus's Sash",left_ear="Novio Earring",right_ear="Friomisi Earring",left_ring="Epaminondas's Ring",right_ring="Dingir Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Yu'].SomeAcc = {ammo="Oshasha's Treatise",head="Mochi. Hatsuburi +3",body="Gyve Doublet",hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs="Gyve Trousers",feet="Adhe. Gamashes +1",
		neck="Sibyl Scarf",waist="Orpheus's Sash",left_ear="Novio Earring",right_ear="Friomisi Earring",left_ring="Epaminondas's Ring",right_ring="Dingir Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Yu'].Full =  {ammo="Oshasha's Treatise",head="Mochi. Hatsuburi +3",body="Gyve Doublet",hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs="Gyve Trousers",feet="Adhe. Gamashes +1",
		neck="Sibyl Scarf",waist="Orpheus's Sash",left_ear="Novio Earring",right_ear="Friomisi Earring",left_ring="Epaminondas's Ring",right_ring="Dingir Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
    sets.precast.WS['Blade: Yu'].Fodder = set_combine(sets.precast.WS['Blade: Yu'], {})
	sets.precast.WS['Blade: Yu'].WTF = {ammo="Oshasha's Treatise",head="Mochi. Hatsuburi +3",body="Gyve Doublet",hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs="Gyve Trousers",feet="Adhe. Gamashes +1",
		neck="Sibyl Scarf",waist="Orpheus's Sash",left_ear="Novio Earring",right_ear="Friomisi Earring",left_ring="Epaminondas's Ring",right_ring="Dingir Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
	
	sets.precast.WS['Savage Blade'] = {ammo="Seeth. Bomblet +1",head={ name="Nyame Helm", augments={'Path: B',}},body="Agony Jerkin +1",hands="Mochizuki Tekko +3",legs="Mochi. Hakama +3",feet="Hattori Kyahan +3",neck="Rep. Plat. Medal",
		waist="Sailfi Belt +1",left_ear="Lugra Earring +1",right_ear="Moonshade Earring",left_ring="Regal Ring",right_ring="Gere Ring",back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	sets.precast.WS['Savage Blade'].someAcc = {ammo="Seeth. Bomblet +1",head={ name="Nyame Helm", augments={'Path: B',}},body="Agony Jerkin +1",hands="Mochizuki Tekko +3",legs="Mochi. Hakama +3",feet="Hattori Kyahan +3",neck="Rep. Plat. Medal",
		waist="Sailfi Belt +1",left_ear="Lugra Earring +1",right_ear="Moonshade Earring",left_ring="Regal Ring",right_ring="Gere Ring",back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	sets.precast.WS['Savage Blade'].Full = {ammo="Crepuscular Pebble",head="Hachiya Hatsu. +3",body="Malignance Tabard",hands="Malignance Gloves",legs="Mochi. Hakama +3",feet="Hattori Kyahan +3",neck="Ninja Nodowa +2",waist="Sailfi Belt +1",
		left_ear="Moonshade Earring",right_ear="Hattori Earring +1",left_ring="Epaminondas's Ring",right_ring="Sroda Ring",back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {})
	sets.precast.WS['Savage Blade'].WTF = {ammo="Seeth. Bomblet +1",head="Hachiya Hatsu. +3",body="Hattori Ningi +3",hands="Malignance Gloves",legs="Mochi. Hakama +3",feet="Hattori Kyahan +3",neck="Ninja Nodowa +2",waist="Sailfi Belt +1",
		left_ear="Moonshade Earring",right_ear="Hattori Earring +1",left_ring="Regal Ring",right_ring="Sroda Ring",back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	
	sets.precast.WS['Evisceration'] = {ammo="Yetshila +1",head="Ken. Jinpachi +1",body="Ken. Samue +1",hands="Ken. Tekko +1",legs="Mpaca's Hose",feet="Ken. Sune-Ate +1",neck="Fotia Gorget",waist="Fotia Belt",left_ear="Odr Earring",
		right_ear="Moonshade Earring",left_ring="Regal Ring",right_ring="Begrudging Ring",back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
	sets.precast.WS['Evisceration'].someAcc	= {ammo="Yetshila +1",head="Adhemar Bonnet +1",body="Ken. Samue +1",hands="Ken. Tekko +1",legs="Ken. Hakama +1",feet="Adhe. Gamashes +1",neck="Fotia Gorget",waist="Fotia Belt",left_ear="Odr Earring",
		right_ear="Lugra Earring +1",left_ring="Regal Ring",right_ring="Ilabrat Ring",back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
	sets.precast.WS['Evisceration'].Full = {ammo="Yetshila +1",head="Adhemar Bonnet +1",body="Ken. Samue +1",hands="Ryuo Tekko +1",legs="Samnuha Tights",feet="Ken. Sune-Ate +1",neck="Ninja Nodowa +2",waist="Fotia Belt",
		left_ear="Odr Earring",right_ear="Hattori Earring +1",left_ring="Regal Ring",right_ring="Gere Ring",back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}	
	sets.precast.WS['Evisceration'].Fodder = set_combine(sets.precast.WS['Evisceration'], {})	
	sets.precast.WS['Evisceration'].WTF = {ammo="Yetshila +1",head="Ken. Jinpachi +1",body="Malignance Tabard",hands="Ryuo Tekko +1",legs="Samnuha Tights",feet="Ken. Sune-Ate +1",neck="Ninja Nodowa +2",waist="Fotia Belt",
		left_ear="Odr Earring",right_ear="Hattori Earring +1",left_ring="Regal Ring",right_ring="Ilabrat Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
	
    sets.precast.WS['Aeolian Edge'] = {ammo="Oshasha's Treatise",head="Mochi. Hatsuburi +3",body="Gyve Doublet",hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs="Gyve Trousers",feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Sibyl Scarf",waist="Orpheus's Sash",left_ear="Friomisi Earring",right_ear="Moonshade Earring",left_ring="Epaminondas's Ring",right_ring="Dingir Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
	sets.precast.WS['Aeolian Edge'].someAcc = {ammo="Oshasha's Treatise",head="Mochi. Hatsuburi +3",body="Gyve Doublet",hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs="Gyve Trousers",feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Sibyl Scarf",waist="Orpheus's Sash",left_ear="Friomisi Earring",right_ear="Moonshade Earring",left_ring="Epaminondas's Ring",right_ring="Dingir Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
	sets.precast.WS['Aeolian Edge'].Full = {ammo="Oshasha's Treatise",head="Mochi. Hatsuburi +3",body="Gyve Doublet",hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs="Gyve Trousers",feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Sibyl Scarf",waist="Orpheus's Sash",left_ear="Friomisi Earring",right_ear="Moonshade Earring",left_ring="Epaminondas's Ring",right_ring="Dingir Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
	sets.precast.WS['Aeolian Edge'].Fodder = set_combine(sets.precast.WS['Aeolian Edge'], {})
	sets.precast.WS['Aeolian Edge'].WTF = {ammo="Oshasha's Treatise",head="Mochi. Hatsuburi +3",body="Gyve Doublet",hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs="Gyve Trousers",feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Sibyl Scarf",waist="Orpheus's Sash",left_ear="Friomisi Earring",right_ear="Moonshade Earring",left_ring="Epaminondas's Ring",right_ring="Dingir Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}}
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {ammo="Sapience Orb",head={name="Herculean Helm", augments={'"Fast Cast"+6','MND+10','Mag. Acc.+5','"Mag.Atk.Bns."+9',}},
    body={name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}},hands="Leyline Gloves",
    legs={name="Herculean Trousers", augments={'Mag. Acc.+11','"Fast Cast"+6','STR+2','"Mag.Atk.Bns."+8',}},feet={name="Herculean Boots", augments={'"Fast Cast"+6',}},
    neck="Orunmila's Torque",waist="Sailfi Belt +1",left_ear="Loquac. Earring",right_ear="Enchntr. Earring +1",left_ring="Medada's Ring",
    right_ring="Weather. Ring",back={ name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Mag. Evasion+15',}}}

    sets.midcast.ElementalNinjutsu = {ammo="Ghastly Tathlum +1",head="Mochi. Hatsuburi +3",
    body="Gyve Doublet",hands={name="Herculean Gloves", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+3%','Mag. Acc.+5','"Mag.Atk.Bns."+15',}},
    legs="Gyve Trousers",feet="Mochi. Kyahan +3",neck="Sibyl Scarf",waist="Orpheus's Sash",
    left_ear="Friomisi Earring",right_ear="Novio Earring",left_ring="Medada's Ring",right_ring="Metamor. Ring +1",
	back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}}
		
    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {})
	
	sets.MagicBurst = {ammo="Ghastly Tathlum +1",head="Mochi. Hatsuburi +3",body="Nyame Mail",hands="Nyame Gauntlets",
		legs="Nyame Flanchard",feet="Mochi. Kyahan +3",neck="Warder's Charm +1",waist="Orpheus's Sash",
		left_ear="Novio Earring",right_ear="Friomisi Earring",left_ring="Metamor. Ring +1",right_ring="Mujin Band",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}}
	
	sets.element.Earth = {}

    sets.midcast.NinjutsuDebuff = {ammo="Dosis Tathlum",
        head="Dampening Tam",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Digni. Earring",
        body="Mekosu. Harness",hands="Mochizuki Tekko +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back="Andartia's Mantle",waist="Chaac Belt",legs="Rawhide Trousers",feet="Mochi. Kyahan +3"}

    sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
	
    sets.midcast.Utsusemi = set_combine(sets.midcast.NinjutsuBuff, {back="Andartia's Mantle",feet="Hattori Kyahan +3"})

    sets.midcast.RA = {
        head="Dampening Tam",neck="Combatant's Torque",ear1="Clearview Earring",
        body="Mekosu. Harness",hands="Buremte Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
        back="Andartia's Mantle",waist="Chaac Belt",legs="Nahtirah Trousers",feet="Mummu Gamash. +2"}
		
    sets.midcast.RA.Acc = {
        head="Dampening Tam",neck="Combatant's Torque",ear1="Clearview Earring",
        body="Mekosu. Harness",hands="Buremte Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
        back="Andartia's Mantle",waist="Chaac Belt",legs="Nahtirah Trousers",feet="Mummu Gamash. +2"}

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {}

    -- Idle sets
    sets.idle = {ammo="Date Shuriken",head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",
    legs="Malignance Tights",feet="Malignance Boots",
    neck="Loricate Torque +1",waist="Platinum Moogle Belt",left_ear="Arete del Luna +1",right_ear="Eabani Earring",
    left_ring="Defending Ring",right_ring="Archon Ring",back="Moonlight Cape",}

    sets.idle.PDT = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs=gear.herculean_dt_legs,feet=gear.herculean_dt_feet}
		
    sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})
		
    sets.idle.Weak = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs=gear.herculean_dt_legs,feet=gear.herculean_dt_feet}
    
    -- Defense sets
    sets.defense.Evasion = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Combatant's Torque",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Apate Ring",
        back="Andartia's Mantle",waist="Shetal Stone",legs="Nahtirah Trousers",feet=gear.herculean_dt_feet}

    sets.defense.PDT = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs=gear.herculean_dt_legs,feet=gear.herculean_dt_feet}

    sets.defense.MDT = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape +1",waist="Engraved Belt",legs=gear.herculean_dt_legs,feet="Ahosi Leggings"}
		
	sets.defense.MEVA = {ammo="Yamarang",
		head="Dampening Tam",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Mekosu. Harness",hands="Leyline Gloves",ring1="Vengeful Ring",Ring2="Purity Ring",
		back="Toro Cape",waist="Engraved Belt",legs="Samnuha Tights",feet="Ahosi Leggings"}


    sets.Kiting = {feet="Danzo Sune-Ate"}
	sets.DuskKiting = {feet="Hachiya Kyahan +2"}
	sets.DuskIdle = {}
	sets.DayIdle = {}
	sets.NightIdle = {}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Date Shuriken",head="Ryuo Somen +1",body="Malignance Tabard",hands="Malignance Gloves",legs="Mochi. Hakama +3",feet="Malignance Boots",neck="Ninja Nodowa +2",
		waist="Reiki Yotai",left_ear="Suppanomimi",right_ear="Dedition Earring",left_ring="Defending Ring",right_ring="Moonlight Ring",back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}}
    sets.engaged.SomeAcc = {ammo="Date Shuriken",head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",
		legs="Malignance Tights",feet="Malignance Boots",
		neck="Ninja Nodowa +2",waist="Sailfi Belt +1",left_ear="Telos Earring",right_ear="Dedition. Earring",left_ring="Gere Ring",
		right_ring="Epona's Ring",back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}}
    sets.engaged.Full = {ammo="Date Shuriken",head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",legs="Malignance Tights",feet="Malignance Boots",
		neck="Ninja Nodowa +2",waist="Windbuffet Belt +1",left_ear="Dedition Earring",right_ear="Brutal Earring",left_ring="Defending Ring",right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}}
	sets.engaged.Fodder = {ammo="Date Shuriken",head="Malignance Chapeau",body="Malignance Tabard",hands="Adhemar Wrist. +1",legs="Samnuha Tights",feet="Malignance Boots",neck="Ninja Nodowa +2",waist="Sailfi Belt +1",
		left_ear="Telos Earring",right_ear="Dedition Earring",left_ring="Epona's Ring",right_ring="Gere Ring",back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}}
	sets.engaged.WTF = {ammo="Date Shuriken",head="Malignance Chapeau",body="Hattori Ningi +3",hands="Malignance Gloves",legs="Mpaca's Hose",feet="Malignance Boots",neck="Ninja Nodowa +2",waist="Windbuffet Belt +1",
		left_ear="Odnowa Earring +1",right_ear="Balder Earring +1",right_ring="Epona's Ring",left_ring="Gere Ring",back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}}
		
    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Migawari = {body="Hattori Ningi +3"}
    sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff.Yonin = {legs="Hattori Hakama +2"} --
    sets.buff.Innin = {head="Hattori Zukin +3"}
	sets.buff.Futae = {hands="Hattori tekko +2"}
	
    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	
	-- Weapons sets
	sets.weapons.Heishi = {main="Heishi Shorinken",sub="Kunimitsu"}
	sets.weapons.HeishiTer = {main="Heishi Shorinken",sub="Ternion Dagger +1"}
	sets.weapons.Dagger = {main="Tauret",sub="Ternion Dagger +1"}
	sets.weapons.ProcDagger = {main="Chicken Knife II",sub=empty}
	sets.weapons.ProcSword = {main="Save the Queen II",sub=empty}
	sets.weapons.ProcGreatSword = {main="Lament",sub=empty}
	sets.weapons.ProcScythe = {main="Hoe",sub=empty}
	sets.weapons.ProcPolearm = {main="Pitchfork +1",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Zanmato +1",sub=empty}
	sets.weapons.ProcKatana = {main="Kunai",sub=empty}
	sets.weapons.ProcClub = {main="Kitty Rod",sub=empty}
	sets.weapons.ProcStaff = {main="Aquilo's Staff",sub=empty}
	sets.weapons.Naegling = {main="Naegling", sub="Kunimitsu"}
	sets.weapons.Kikoku = {main="Kikoku",sub="Kunai"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 15)
    elseif player.sub_job == 'RNG' then
        set_macro_page(1, 15)
    elseif player.sub_job == 'RDM' then
        set_macro_page(1, 15)
    else
        set_macro_page(1, 15)
    end
end