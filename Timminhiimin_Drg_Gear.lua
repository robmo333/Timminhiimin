-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Weapons:options('Trishula')
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}

    select_default_macro_book()
	
	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind ^f11 gs c cycle MagicalDefenseMode')
	send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind @f7 gs c toggle AutoJumpMode')
	send_command('bind @` gs c cycle SkillchainMode')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA.Angon = {ammo="Angon",hands="Ptero. Fin. G."}
	sets.precast.JA.Jump = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Vishap Mail +2",hands="Sulevia's Gauntlets +2",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back="Brigantia's Mantle",waist="Windbuffet Belt +1",legs="Sulev. Cuisses +2",feet="Vishap Greaves +2"}
	sets.precast.JA['Ancient Circle'] = {legs="Vishap Brais +2"}
	sets.precast.JA['High Jump'] = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Vishap Mail +2",hands="Sulevia's Gauntlets +2",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back="Brigantia's Mantle",waist="Windbuffet Belt +1",legs="Sulev. Cuisses +2",feet="Vishap Greaves +2"}
	sets.precast.JA['Soul Jump'] = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Vishap Mail +2",hands="Sulevia's Gauntlets +2",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back="Brigantia's Mantle",waist="Windbuffet Belt +1",legs="Pelt. Cuissots +1",feet="Vishap Greaves +2"}
	sets.precast.JA['Spirit Jump'] = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Vishap Mail +2",hands="Sulevia's Gauntlets +2",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back="Brigantia's Mantle",waist="Windbuffet Belt +1",legs="Pelt. Cuissots +1",feet="Vishap Greaves +2"}
	sets.precast.JA['Super Jump'] = {}
	sets.precast.JA['Spirit Link'] = {head="Vishap Armet +2",hands="Lncr. Vmbrc. +1"}
	sets.precast.JA['Call Wyvern'] = {body="Ptero. Mail +1"}
	sets.precast.JA['Deep Breathing'] = {head="Ptero. Armet"}
	sets.precast.JA['Spirit Surge'] = {body="Ptero. Mail +1"}
	sets.precast.JA['Steady Wing'] = {}
	
	-- Breath sets
	sets.precast.JA['Restoring Breath'] = {back="Brigantia's Mantle"}
	sets.precast.JA['Smiting Breath'] = {back="Brigantia's Mantle"}
	sets.HealingBreath = {back="Brigantia's Mantle"}
	sets.SmitingBreath = {back="Brigantia's Mantle"}

	-- Fast cast sets for spells
	
	sets.precast.FC = {ammo="Impatiens",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Taeon Tabard",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Founder's Greaves",feet="Carmine Greaves +1"}
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	--sets.midcast.Cure = {}
	
	--sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	--sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	--sets.Self_Refresh = {waist="Gishdubar Sash"}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Taeon Tabard",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Tempus Fugit",legs="Founder's Greaves",feet="Carmine Greaves +1"}
		
	-- Put HP+ gear and the AF head to make healing breath trigger more easily with this set.
	sets.midcast.HB_Trigger = set_combine(sets.midcast.FastRecast, {head="Vishap Armet"})
	
	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {        ammo = "Knobkierrie",
        head = "Flamma Zucchetto +2",
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        ear1 = "Moonshade Earring",
        ear2 = "Sherida Earring",
        body = "Dagon Breast.",
        hands = "Sulevia's Gauntlets +2",
        ring1 = "Niqmaddu Ring",
        ring2 = "Regal Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
        waist = "Fotia Belt",
        legs = "Sulevia's Cuisses +2",
        feet = "Flamma Gambieras +2"
    }
		
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Shulmanu Collar"})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Stardiver'].SomeAcc = set_combine(sets.precast.WS.Acc, {head="Gavialis Helm"})
	sets.precast.WS['Stardiver'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Stardiver'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Drakesbane'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Drakesbane'].SomeAcc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Drakesbane'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Drakesbane'].Fodder = set_combine(sets.precast.WS.Fodder, {})


	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle =  {ammo = "Staunch Tathlum +1",
        head = "Sulevia's Mask +2",
        neck = "Loricate Torque +1",
        ear1 = "Etiolation Earring",
        ear2 = "Infused Earring",
        body = "Sulevia's Platemail +2",
        hands = "Sulevia's Gauntlets +2",
        ring1 = "Sheltered ring",
        ring2 = "Moonlight Ring",
        back = "Moonlight Cape",
        waist = "Flume Belt +1",
        legs = "Carmine Cuisses +1",
        feet = "Sulevia's Leggings +2"
	}
		
	sets.idle.Refresh = {ammo="Staunch Tathlum",
		head="Jumalik Helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Jumalik Mail",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Dark Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Amm Greaves"}

	sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
	
	-- Defense sets
	sets.defense.PDT = {ammo="Seething Bomblet +1",
		head="Sulevia's Mask +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Sulevia's Platemail +2",hands="Sulev. Gauntlets +2",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back = "Brigantia's Mantle",waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = {ammo="Seething Bomblet +1",
		head="Sulevia's Mask +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Sulevia's Platemail +2",hands="Sulev. Gauntlets +2",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back = "Brigantia's Mantle",waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Arke Cosciales",feet="Amm Greaves"}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.passive.MP = {ear2="Ethereal Earring",waist="Flume Belt"}
    sets.passive.Twilight = {head="Twilight Helm", body="Twilight Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Trishula = {main="Trishula",sub="Utu Grip"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Brutal Earring",ear2="Sherida Earring",}
	sets.AccDayWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Moonshade Earring",ear2="Sherida Earring",}
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group

	sets.engaged = {
        ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+16 Attack+16','"Store TP"+7','Accuracy+7',}},
    hands={ name="Acro Gauntlets", augments={'Accuracy+20 Attack+20','"Store TP"+5','STR+5 DEX+5',}},
    legs={ name="Ptero. Brais +3", augments={'Enhances "Strafe" effect',}},
    feet="Flam. Gambieras +2",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Petrov Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
    sets.engaged.SomeAcc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Shulmanu Collar",ear1="Brutal Earring",ear2="Sherida Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Regal Ring",ring2="Niqmaddu Ring",
		back="Brigantia's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
	sets.engaged.Acc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Shulmanu Collar",ear1="Digni. Earring",ear2="Telos Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Ramuh Ring +1",ring2="Niqmaddu Ring",
		back="Brigantia's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.FullAcc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Shulmanu Collar",ear1="Zennaroi Earring",ear2="Telos Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Brigantia's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Fodder = {ammo="Seething Bomblet +1",
		head="Sulevia's Mask +2",neck="Dgn. Collar +2",ear1="Telos Earring",ear2="Cessance Earring",
		body="Sulevia's Platemail +2",hands="Sulev. Gauntlets +2",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}

    sets.engaged.AM = {}
    sets.engaged.AM.SomeAcc = {}
	sets.engaged.AM.Acc = {}
    sets.engaged.AM.FullAcc = {}
    sets.engaged.AM.Fodder = {}
	
    sets.engaged.PDT = {}
    sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
    sets.engaged.FullAcc.PDT = {}
    sets.engaged.Fodder.PDT = {}
	
    sets.engaged.AM.PDT = {}
    sets.engaged.AM.SomeAcc.PDT = {}
	sets.engaged.AM.Acc.PDT = {}
    sets.engaged.AM.FullAcc.PDT = {}
    sets.engaged.AM.Fodder.PDT = {}
		
	--[[ Melee sets for in Adoulin, which has an extra 2% Haste from Ionis.
	
    sets.engaged.Adoulin = {}
    sets.engaged.Adoulin.SomeAcc = {}
	sets.engaged.Adoulin.Acc = {}
    sets.engaged.Adoulin.FullAcc = {}
    sets.engaged.Adoulin.Fodder = {}

    sets.engaged.Adoulin.AM = {}
    sets.engaged.Adoulin.AM.SomeAcc = {}
	sets.engaged.Adoulin.AM.Acc = {}
    sets.engaged.Adoulin.AM.FullAcc = {}
    sets.engaged.Adoulin.AM.Fodder = {}
	
    sets.engaged.Adoulin.PDT = {}
    sets.engaged.Adoulin.SomeAcc.PDT = {}
	sets.engaged.Adoulin.Acc.PDT = {}
    sets.engaged.Adoulin.FullAcc.PDT = {}
    sets.engaged.Adoulin.Fodder.PDT = {}
	
    sets.engaged.Adoulin.AM.PDT = {}
    sets.engaged.Adoulin.AM.SomeAcc.PDT = {}
	sets.engaged.Adoulin.AM.Acc.PDT = {}
    sets.engaged.Adoulin.AM.FullAcc.PDT = {}
    sets.engaged.Adoulin.AM.Fodder.PDT = {}
	]]

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 7)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 12)
    elseif player.sub_job == 'BLU' then
        set_macro_page(1, 7)
    else
        set_macro_page(1, 7)
    end
end