function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Fodder','Normal')
	state.HybridMode:options('Normal','DTLite','PDT','MDT')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','HighAcc','FullAcc','Fodder')
    state.CastingMode:options('Normal','Resistant','Fodder','Proc')
    state.IdleMode:options('Normal','Sphere','PDT','DTHippo')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('MagicWeapons','Tizona','Naegling','Tizalmace','MeleeClubs','BS')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','MP','SuppaBrutal','DWEarrings','DWMax'}

	gear.da_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
	gear.stp_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	gear.crit_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
	gear.wsd_jse_back = {name="Rosmerta's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.mab_jse_back = {name="Rosmerta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}

	gear.obi_cure_waist = "Luminary Sash"
	gear.obi_nuke_waist = "Eschan Stone"

	-- Additional local binds
	send_command('bind ^` input /ja "Chain Affinity" <me>')
	send_command('bind @` input /ja "Efflux" <me>')
	send_command('bind !` input /ja "Burst Affinity" <me>')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
	send_command('bind @backspace input /ja "Convergence" <me>')
    send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind @f10 gs c toggle LearningMode')
	send_command('bind ^@!` gs c cycle MagicBurstMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !@^f7 gs c toggle AutoWSMode')
	--send_command('bind !r gs c weapons MagicWeapons;gs c update')
	send_command('bind @q gs c weapons MaccWeapons;gs c update')
	send_command('bind ^q gs c weapons Almace;gs c update')
	send_command('bind !q gs c weapons HybridWeapons;gs c update')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {feet="Hashi. Basmak +2"}
	sets.buff['Chain Affinity'] = {feet="Assim. Charuqs"}
	sets.buff.Convergence = {head="Luh. Keffiyeh +3"}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs +3"}
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {back=gear.da_jse_back,legs="Hashishin Tayt +2"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {hands="Luh. Bazubands"}


	-- Waltz set (chr and vit)
	sets.precast.Waltz = {legs="Dashing Subligar"}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Falcon Eye",
					head="Dampening Tam",neck="Combatant's Torque",ear1="Regal Earring",ear2="Telos Earring",
					body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
					back=gear.da_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet=gear.herculean_acc_feet}

	sets.precast.Flourish1 = {ammo="Falcon Eye",
			       head="Jhakri Coronal +2",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Digni. Earring",
                   body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
			       back="Cornflower Cape",waist="Olseni Belt",legs="Jhakri Slops +2",feet=" Hashishin basmak +2"}

	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Sapience Orb",head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body={ name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+10','Mag. Acc.+7','"Fast Cast"+1',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Orunmila's Torque",waist="Witful Belt",left_ear="Enchntr. Earring +1",right_ear="Loquac. Earring",
    left_ring="Medada's Ring",right_ring="Weather. Ring",back="Perimede Cape",}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {body="Passion Jacket"})

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan +2"})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Ginsen",
				  head="Lilitu Headpiece",neck="Fotia Gorget",ear1="Cessance Earring",ear2="Brutal Earring",
                  body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},hands="Jhakri Cuffs +2",ring1="Epona's Ring",ring2="Apate Ring",
				  back=gear.da_jse_back,waist="Fotia Belt",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.precast.WS.Fodder = {ammo="Ginsen",
				  head="Lilitu Headpiece",neck="Fotia Gorget",ear1="Cessance Earring",ear2="Brutal Earring",
                  body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},hands="Jhakri Cuffs +2",ring1="Epona's Ring",ring2="Apate Ring",
				  back=gear.da_jse_back,waist="Fotia Belt",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = {ammo="Aurgelmir Orb +1",head={ name="Luh. Keffiyeh +3", augments={'Enhances "Convergence" effect',}},
    body={ name="Luhlaza Jubbah +3", augments={'Enhances "Enchainment" effect',}},
    hands={ name="Luh. Bazubands +3", augments={'Enhances "Azure Lore" effect',}},
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet={ name="Luhlaza Charuqs +3", augments={'Enhances "Diffusion" effect',}},
    neck="Fotia Gorget",waist="Fotia Belt",left_ear="Brutal Earring",right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    left_ring="Epona's Ring",right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	sets.precast.WS['Requiescat'].Fodder = set_combine(sets.precast.WS['Requiescat'], {})

	sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {head="Jhakri Coronal +2",ear1="Regal Earring",body="Jhakri Robe +2",ring2="Rufescent Ring",legs="Jhakri Slops +2",feet=" Hashishin basmak +2"})
	sets.precast.WS['Realmrazer'].Fodder = set_combine(sets.precast.WS['Realmrazer'], {})

	sets.precast.WS['Chant du Cygne'] = {ammo="Aurgelmir Orb +1",head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
		body="Abnoba Kaftan",hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs="Samnuha Tights",feet={ name="Herculean Boots", augments={'Accuracy+15','Crit.hit rate+5','DEX+8',}},
		neck={ name="Mirage Stole +2", augments={'Path: A',}},waist="Fotia Belt",left_ear="Mache Earring +1",right_ear="Odr Earring",
		left_ring="Epona's Ring",right_ring="Begrudging Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}}
	sets.precast.WS['Chant du Cygne'].Fodder = set_combine(sets.precast.WS['Chant du Cygne'], {})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS['Expiacion'], {})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {})

	sets.precast.WS['Vorpal Blade'] = set_combine(sets.precast.WS, {head="Adhemar Bonnet +1",ear1="Cessance Earring", ear2="Brutal Earring",ring2="Begrudging Ring",back=gear.crit_jse_back,feet="Thereoid Greaves"})
	sets.precast.WS['Vorpal Blade'].Fodder = set_combine(sets.precast.WS['Vorpal Blade'], {})

	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS, {ammo="Crepuscular pebble",head="Nyame Helm",neck="Mirage Stole +2",ear1="Moonshade Earring",
		ear2="Ishvara Earring",body="Assim. Jubbah +3",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Sroda Ring",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},waist="Sailfi Belt +1",legs="Luhlaza Shalwar +3",feet="Nyame Sollerets"})
	sets.precast.WS['Expiacion'].Fodder = set_combine(sets.precast.WS['Expiacion'], {})

	sets.precast.WS['Sanguine Blade'] = {ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Pixie Hairpin +1",body={ name="Nyame Mail", augments={'Path: B',}},hands="Jhakri Cuffs +2",
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},neck="Sibyl Scarf",waist="Orpheus's Sash",
    left_ear="Friomisi Earring",right_ear="Regal Earring",left_ring="Archon Ring",
    right_ring="Epaminondas's Ring",back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}}

	sets.precast.WS['Flash Nova'] = {ammo="Pemphredo Tathlum",
			         head="Jhakri Coronal +2",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		             body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
			         back=gear.mab_jse_back,waist="Yamabuki-no-Obi",legs="Jhakri Slops +2",feet=" Hashishin basmak +2"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	sets.AccMaxTP = {ear1="Regal Earring",ear2="Telos Earring"}

	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Sapience Orb",
		head="Carmine Mask +1",neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Loquacious Earring",
		body="Taeon Tabard",hands="Leyline Gloves",ring1="Medada's Ring",ring2="Weatherspoon Ring",
		back="Perimede Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Carmine Greaves +1"}

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --

	sets.midcast['Blue Magic'].Physical = {ammo="Aurgelmir Orb +1",
    head={ name="Luh. Keffiyeh +3", augments={'Enhances "Convergence" effect',}},
    body={ name="Luhlaza Jubbah +3", augments={'Enhances "Enchainment" effect',}},
    hands={ name="Luh. Bazubands +3", augments={'Enhances "Azure Lore" effect',}},
    legs={ name="Herculean Trousers", augments={'Attack+30','Weapon skill damage +5%','STR+5',}},
    feet={ name="Luhlaza Charuqs +3", augments={'Enhances "Diffusion" effect',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},waist="Prosilio Belt +1",
    left_ear="Tati Earring +1",right_ear="Tati Earring +1",left_ring="Shukuyu Ring",right_ring="Ifrit Ring +1",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}

	sets.midcast['Blue Magic'].Physical.Resistant = {ammo="Aurgelmir Orb +1",
    head={ name="Luh. Keffiyeh +3", augments={'Enhances "Convergence" effect',}},
    body={ name="Luhlaza Jubbah +3", augments={'Enhances "Enchainment" effect',}},
    hands={ name="Luh. Bazubands +3", augments={'Enhances "Azure Lore" effect',}},
    legs={ name="Herculean Trousers", augments={'Attack+30','Weapon skill damage +5%','STR+5',}},
    feet={ name="Luhlaza Charuqs +3", augments={'Enhances "Diffusion" effect',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},waist="Prosilio Belt +1",
    left_ear="Tati Earring +1",right_ear="Tati Earring +1",left_ring="Shukuyu Ring",right_ring="Ifrit Ring +1",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}

	sets.midcast['Blue Magic'].Physical.Fodder = {aammo="Aurgelmir Orb +1",
    head={ name="Luh. Keffiyeh +3", augments={'Enhances "Convergence" effect',}},
    body={ name="Luhlaza Jubbah +3", augments={'Enhances "Enchainment" effect',}},
    hands={ name="Luh. Bazubands +3", augments={'Enhances "Azure Lore" effect',}},
    legs={ name="Herculean Trousers", augments={'Attack+30','Weapon skill damage +5%','STR+5',}},
    feet={ name="Luhlaza Charuqs +3", augments={'Enhances "Diffusion" effect',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},waist="Prosilio Belt +1",
    left_ear="Tati Earring +1",right_ear="Tati Earring +1",left_ring="Shukuyu Ring",right_ring="Ifrit Ring +1",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}

	sets.midcast['Blue Magic'].PhysicalAcc = {ammo="Aurgelmir Orb +1",
    head={ name="Luh. Keffiyeh +3", augments={'Enhances "Convergence" effect',}},
    body={ name="Luhlaza Jubbah +3", augments={'Enhances "Enchainment" effect',}},
    hands={ name="Luh. Bazubands +3", augments={'Enhances "Azure Lore" effect',}},
    legs={ name="Herculean Trousers", augments={'Attack+30','Weapon skill damage +5%','STR+5',}},
    feet={ name="Luhlaza Charuqs +3", augments={'Enhances "Diffusion" effect',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},waist="Prosilio Belt +1",
    left_ear="Tati Earring +1",right_ear="Tati Earring +1",left_ring="Shukuyu Ring",right_ring="Ifrit Ring +1",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}

	sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})
	sets.midcast['Blue Magic'].PhysicalAcc.Fodder = sets.midcast['Blue Magic'].Fodder

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalStr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalDex.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalDex.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalVit.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalVit.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalInt.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalInt.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalChr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalChr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalHP.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalHP.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})


	-- Magical Spells --

	sets.midcast['Blue Magic'].Magical = {ammo="Ghastly Tathlum +1",head="Hashishin Kavuk +2",body="Hashishin Mintan +2",
		hands="Hashi. Bazu. +2",legs="Luhlaza Shalwar +3",feet=" Hashishin basmak +2",neck="Sibyl Scarf",
		waist="Orpheus's Sash",left_ear="Friomisi Earring",right_ear="Regal Earring",left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Medada's Ring",back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}}
					 
	sets.midcast['Blue Magic'].Magical.Proc = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Helios Jacket",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Carmine Greaves +1"}
					 
	sets.midcast['Blue Magic'].Magical.Resistant = {ammo="Ghastly Tathlum +1",head="Hashishin Kavuk +2",body="Hashishin Mintan +2",
		hands="Hashi. Bazu. +2",legs="Luhlaza Shalwar +3",feet=" Hashishin basmak +2",neck="Sibyl Scarf",
		waist="Orpheus's Sash",left_ear="Friomisi Earring",right_ear="Regal Earring",left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Medada's Ring",back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}}

	sets.midcast['Blue Magic'].Magical.Fodder = {ammo="Ghastly Tathlum +1",head="Hashishin Kavuk +2",body="Hashishin Mintan +2",
		hands="Hashi. Bazu. +2",legs="Luhlaza Shalwar +3",feet=" Hashishin basmak +2",neck="Sibyl Scarf",
		waist="Orpheus's Sash",left_ear="Friomisi Earring",right_ear="Regal Earring",left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Medada's Ring",back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}}

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {neck="Sanctity Necklace",ring1="Stikini Ring +1",ring2="Stikini Ring"})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = {ammo="Ghastly Tathlum +1",head="Hashishin Kavuk +2",body="Hashishin Mintan +2",
		hands="Hashi. Bazu. +2",legs="Luhlaza Shalwar +3",feet=" Hashishin basmak +2",neck="Sibyl Scarf",
		waist="Orpheus's Sash",left_ear="Friomisi Earring",right_ear="Regal Earring",left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Medada's Ring",back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}}

	sets.midcast['Enfeebling Magic'] = {ammo="Pemphredo Tathlum",
			        head="Carmine Mask +1",neck="Incanter's Torque",ear1="Regal Earring",ear2="Digni. Earring",
				    body="Jhakri Robe +2",hands="Hashishin Bazubands +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
					back=gear.mab_jse_back,waist="Luminary Sash",legs="Psycloth Lappas",feet="Skaoi Boots"}

	sets.midcast['Dark Magic'] = {ammo="Pemphredo Tathlum",
			        head="Pixie Pinion +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
				    body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
					back=gear.mab_jse_back,waist="Luminary Sash",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}

	sets.midcast['Enhancing Magic'] = {ammo="Pemphredo Tathlum",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Mendicant's Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Perimede Cape",waist="Olympus Sash",legs="Lengo Pants",feet="Carmine Greaves +1"}

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif",waist="Gishdubar Sash"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	sets.midcast['Divine Magic'] = {ammo="Pemphredo Tathlum",
			        head="Jhakri Coronal +1",neck="Incanter's Torque",ear1="Regal Earring",ear2="Digni. Earring",
				    body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring +1",ring2="Stikini Ring",
					back=gear.mab_jse_back,waist="Luminary Sash",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}

	sets.midcast['Elemental Magic'] = {ammo="Pemphredo Tathlum",
					 head=gear.herculean_nuke_head,neck="Sanctity Necklace",ear1="Regal Earring",ear2="Friomisi Earring",
					 body="Amalric Doublet +1",hands="Hashishin Bazubands +2",ring1="Shiva Ring +1",ring2="Acumen Ring",
				     back=gear.mab_jse_back,waist="Eschan Stone",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}

	sets.midcast['Elemental Magic'].Resistant = {ammo="Pemphredo Tathlum",
					 head=gear.herculean_nuke_head,neck="Sanctity Necklace",ear1="Regal Earring",ear2="Friomisi Earring",
					 body="Amalric Doublet +1",hands="Hashishin Bazubands +2",ring1="Shiva Ring +1",ring2="Acumen Ring",
				     back=gear.mab_jse_back,waist="Eschan Stone",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}
	sets.element.Earth = {neck="Quanpur Necklace"}
	sets.element.Light = {ring2="Weatherspoon Ring"}

	sets.midcast.Cure = {ammo="Hydrocera",
					head="Carmine Mask",neck="Phalaina Locket",ear1="Regal Earring",ear2="Mendi. Earring",
			        body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Haoma's Ring",
			        back="Solemnity Cape",waist="Luminary Sash",legs="Gyve Trousers",feet="Skaoi Boots"}

	-- Breath Spells --

	sets.midcast['Blue Magic'].Breath = {ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +3",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Digni. Earring",
		body="Assim. Jubbah +3",hands="Luh. Bazubands +3",ring1="Kunaji Ring",ring2="Meridian Ring",
		back="Cornflower Cape",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs +3"}

	-- Physical Added Effect Spells most notably "Stun" spells --

	sets.midcast['Blue Magic'].Stun = {main="Iris",sub="Iris",ammo="Pemphredo Tathlum",
			       head="Jhakri Coronal +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
                   body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
			       back="Cornflower Cape",waist="Luminary Sash",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}

	sets.midcast['Blue Magic'].Stun.Resistant = {main="Iris",sub="Iris",ammo="Falcon Eye",
			       head="Jhakri Coronal +2",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
                   body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring +1",
			       back="Cornflower Cape",waist="Olseni Belt",legs="Jhakri Slops +2",feet=" Hashishin basmak +2"}

	sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

	-- Other Specific Spells --

	sets.midcast['Blue Magic']['White Wind'] = {ammo="Falcon Eye",
					head="Carmine Mask +1",neck="Phalaina Locket",ear1="Etiolation Earring",ear2="Loquac. Earring",
			        body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Kunaji Ring",ring2="Etana Ring",
			        back="Moonlight Cape",waist="Luminary Sash",legs="Gyve Trousers",feet="Skaoi Boots"}
					
	sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

	sets.midcast['Blue Magic'].Healing = {ammo="Hydrocera",
					head="Carmine Mask",neck="Phalaina Locket",ear1="Regal Earring",ear2="Mendi. Earring",
			        body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Kunaji Ring",ring2="Haoma's Ring",
			        back="Solemnity Cape",waist="Gishdubar Sash",legs="Gyve Trousers",feet="Despair Greaves"}

	--Overwrite certain spells with these peices even if the day matches, because of resource inconsistancies.
	
	sets.midcast['Blue Magic'].SkillBasedBuff = {ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +3",neck="Mirage Stole +2",ear1="Gifted Earring",ear2="Hashi. Earring +1",
		body="Assim. Jubbah +3",hands="Rawhide Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Cornflower Cape",waist="Witful Belt",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs +3"}

	sets.midcast['Blue Magic'].Buff = {ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +3",neck="Mirage Stole +2",ear1="Gifted Earring",ear2="Hashi. Earring +1",
		body="Assim. Jubbah +3",hands="Rawhide Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Cornflower Cape",waist="Witful Belt",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs +3"}

	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {waist="Gishdubar Sash"})

	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {})

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands="Assim. Bazu. +3"}

	-- Resting sets
	sets.resting = {main="Bolelabunga",sub="Genmei Shield",ammo="Falcon Eye",
			      head="Rawhide Mask",neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Ethereal Earring",
			      body="Jhakri Robe +2",hands=gear.herculean_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
			      back="Bleating Mantle",waist="Flume Belt",legs="Lengo Pants",feet=gear.herculean_refresh_feet}

	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum +1",head="Malignance Chapeau",body="Hashishin Mintan +2",hands="Hashi. Bazu. +2",
    legs="Hashishin Tayt +2",feet="Malignance Boots",
    neck="Loricate Torque +1",waist="Flume Belt +1",left_ear="Infused Earring",right_ear="Ethereal Earring",left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",back="Moonlight Cape"}

	

	sets.idle.PDT = {ammo="Staunch Tathlum +1",
				head=gear.herculean_refresh_head,neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Genmei Earring",
		        body="Ayanmo Corazza +2",hands=gear.herculean_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
				back="Moonlight Cape",waist="Flume Belt +1",legs=gear.herculean_dt_legs,feet=gear.herculean_dt_feet}

	sets.idle.DTHippo = set_combine(sets.idle.PDT, {legs="Carmine Cuisses +1",feet="Hippo. Socks +1"})

	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
				head="Dampening Tam",neck="Loricate Torque +1",ear1="Suppanomimi", ear2="Brutal Earring",
		        body="Ayanmo Corazza +2",hands="Assim. Bazu. +3",ring1="Defending Ring",ring2="Dark Ring",
				back="Moonlight Cape",waist="Windbuffet Belt +1",legs=gear.herculean_dt_legs,feet=gear.herculean_dt_feet}

	sets.defense.MDT = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum",
				head="Dampening Tam",neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Sanare Earring",
		        body="Ayanmo Corazza +2",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
				back="Engulfer Cape +1",waist="Flax Sash",legs="Hagondes Pants +1",feet="Ahosi Leggings"}

    sets.defense.MEVA = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum",
        head="Amalric Coif +1",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Hashishin Mintan +2",hands="Leyline Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
        back=gear.mab_jse_back,waist="Luminary Sash",legs="Telchine Braconi",feet="Ahosi Leggings"}

	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

	sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.MP = {waist="Flume Belt +1",ear1="Suppanomimi", ear2="Ethereal Earring"}
    sets.MP_Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},waist="Reiki Yotai",legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Assault = {ring1="Balrahn's Ring"}
	
	-- Weapons sets
	sets.weapons.Tizalmace = {main="Tizona",sub="Almace"}
	sets.weapons.MeleeClubs = {main="Nehushtan",sub="Nehushtan"}
	sets.weapons.Tizona = {main="Tizona",sub="Thibron"}
	sets.weapons.Naegling = {main="Naegling",sub="Thibron"}
	sets.weapons.MagicWeapons = {main="Bunzi's Rod",sub="Maxentius"}
	sets.weapons.BS = {main="Save the queen II",sub="Chicken Knife II"}	
	-- Engaged sets

	sets.engaged = {ammo="Aurgelmir Orb +1",head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",
    legs="Malignance Tights",feet="Malignance Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},waist="Reiki Yotai",left_ear="Suppanomimi",right_ear="Telos Earring",
    left_ring="Epona's Ring",right_ring="Defending Ring",back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}}

	sets.engaged.AM = {ammo="Aurgelmir Orb +1",head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",
    legs="Malignance Tights",feet="Malignance Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},waist="Reiki Yotai",left_ear="Suppanomimi",right_ear="Telos Earring",
    left_ring="Epona's Ring",right_ring="Defending Ring",back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}}

	sets.engaged.Fodder = {ammo="Aurgelmir Orb +1",head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+28','"Triple Atk."+4','Attack+6',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Suppanomimi",right_ear="Telos Earring",left_ring="Chirich Ring +1",right_ring="Chirich Ring +1",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}}

	sets.engaged.Fodder.AM = {ammo="Aurgelmir Orb +1",head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+28','"Triple Atk."+4','Attack+6',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Suppanomimi",right_ear="Telos Earring",left_ring="Chirich Ring +1",right_ring="Chirich Ring +1",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}}



	--sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",legs="Gyve Trousers",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	--sets.Self_Healing_Club = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	--sets.Self_Healing_DWClub = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	--sets.Healing_Club = {}
	--sets.Healing_DWClub = {}
	--sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	--sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
	--sets.MagicBurst = {body="Samnuha Coat",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Locus Ring"}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(1, 9)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 9)
	elseif player.sub_job == 'WAR' then
		set_macro_page(1, 9)
	elseif player.sub_job == 'RUN' then
		set_macro_page(1, 9)
	elseif player.sub_job == 'THF' then
		set_macro_page(1, 9)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 9)
	else
		set_macro_page(1, 9)
	end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not areas.Cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()

				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.chat.input('/ma "Yoran-Oran (UC)" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.chat.input('/ma "Koru-Moru" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.chat.input('/ma "Qultada" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.chat.input('/ma "Ulmia" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.chat.input('/ma "Selh\'teus" <me>')
					tickdelay = (framerate * 3)
					return true
				else
					return false
				end
			end
		end
	end
	return false
end