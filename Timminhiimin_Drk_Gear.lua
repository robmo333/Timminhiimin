function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','DTLite')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
	state.Weapons:options('Caladbolg','Anguta', 'Apocalypse', 'Club', 'Savage', 'Prime')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}

	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
    send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind @` gs c cycle SkillchainMode')
	
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA['Diabolic Eye'] = {hands="Fallen's Finger Gauntlets +3"}
	sets.precast.JA['Arcane Circle'] = {feet="Ig. Sollerets +2"}
	sets.precast.JA['Souleater'] = {head="Ig. Burgonet +3"}
	sets.precast.JA['Weapon Bash'] = {hands="Ig. Gauntlets +2"}
	sets.precast.JA['Nether Void'] = {legs="Heathen's Flanchard +1"}
	sets.precast.JA['Blood Weapon'] = {body="Fallen's Cuirass +3"}
	sets.precast.JA['Dark Seal'] = {head="Fallen's Burgeonet +1"}
	sets.precast.JA['Last Resort'] = {back="Ankou's Mantle"}
                   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
                   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
           
	sets.precast.Step = {}
	
	sets.precast.Flourish1 = {}
		   
	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Sapience Orb",
		head="Carmine Mask +1",neck="Orunmila's Torque",ear1="Malignance Earring",ear2="Loquacious Earring",
		body="Fallen's Cuirass +3",hands="Leyline Gloves",ring1="Weather. Ring",ring2="Kishar Ring",
		back="Moonlight Cape",waist="Ioskeha Belt +1",legs="Eschite Cuisses",feet="Odyssean Greaves"}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
		
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum +1",
		head="Carmine Mask +1",neck="Orunmila's Torque",ear1="Malignance Earring",ear2="Loquacious Earring",
		body="Fallen's Cuirass +3",hands="Leyline Gloves",ring1="Weather. Ring",ring2="Kishar Ring",
		back="Moonlight Cape",waist="Ioskeha Belt +1",legs="Eschite Cuisses",feet="Odyssean Greaves"}
                   
	-- Specific spells
 
	sets.midcast['Dark Magic'] = {ammo="Pemphredo Tathlum",
		head="Ig. burgonet +3",neck="Erra Pendant",ear1="Gwati Earring",ear2="Digni. Earring",
		body="Carmine Scale Mail +1",hands="Fallen's Finger Gauntlets +3",ring1="Evanescence Ring",ring2="Archon Ring",
		back="Niht Mantle",waist="Casso Sash",legs="Eschite Cuisses",feet="Ratri Sollerets +1"}
           
	sets.midcast['Enfeebling Magic'] = {ammo="Pemphredo Tathlum",
		head="Ig. burgonet +3",neck="Erra Pendant",ear1="Gwati Earring",ear2="Digni. Earring",
		body="Carmine Scale Mail +1",hands="Fallen's Finger Gauntlets +3",ring1="Evanescence Ring",ring2="Archon Ring",
		back="Niht Mantle",waist="Casso Sash",legs="Eschite Cuisses",feet="Ratri Sollerets +1"}
		   
	sets.midcast['Dread Spikes'] = {ammo="Egoist's Tathlum",
		head="Ratri Sallet +1",neck="Sanctity Necklace",ear1="Odnowa Earring +1",ear2="Eabani Earring",
		body="Heathen's Cuirass +1",hands="Ratri Gadlings +1",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Eschan Stone",legs="Ratri Cuisses +1",feet="Ratri Sollerets +1"}
		
	sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {back="Chuparrosa Mantle",head="Ig. burgonet +3",
         ring1="Kishar Ring",})
           
	sets.midcast.Stun = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Gwati Earring",ear2="Digni. Earring",
		body="Fallen's Cuirass +3",hands="Fallen's Finger Gauntlets +3",ring1="Stikini Ring +1",ring2="Stikini Ring",
		back="Niht Mantle",waist="Eschan Stone",legs="Eschite Cuisses",feet="Flam. Gambieras +2"}
                   
	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {main="Misanthropy",ear1="Hirudinea Earring",head="Fallen's Burgeonet +1",back="Niht Mantle",
		waist="Austerity Belt +1",})
		
                   
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Impact = set_combine(sets.midcast['Dark Magic'], {head=empty,body="Twilight Cloak"})
	
	--sets.midcast.Cure = {}
	
	--sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	--sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	--sets.Self_Refresh = {waist="Gishdubar Sash"}
						                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Knobkierrie",
		head="Nyame Helm",neck="Fotia Gorget",ear1="Thrud Earring",ear2="Moonshade Earring",
		body="Ignominy Cuirass +3",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Epaminondas's Ring",
		back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}},
		waist="Fotia Belt",legs="Fallen's Flanchard +3",feet="Sulev. Leggings +2"}

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})
	
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
    sets.precast.WS['Catastrophe'] = {ammo="Knobkierrie",
		head="Nyame Helm",neck="Abyssal Beads +2",ear1="Thrud Earring",ear2="Heath. Earring +1",
		body="Ignominy Cuirass +3",hands="Nyame Gauntlets",ring1="Sroda Ring",ring2="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}},
		waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sulev. Leggings +2"}
    sets.precast.WS['Catastrophe'].SomeAcc = set_combine(sets.precast.WS['Catastrophe'], {}) 
    sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS['Catastrophe'], {}) 
    sets.precast.WS['Catastrophe'].FullAcc = set_combine(sets.precast.WS['Catastrophe'], {}) 
    sets.precast.WS['Catastrophe'].Fodder = set_combine(sets.precast.WS['Catastrophe'], {}) 
	
	sets.precast.WS['Insurgency'] = set_combine(sets.precast.WS['Entropy'], {}) 
	sets.precast.WS['Insurgency'].SomeAcc = set_combine(sets.precast.WS['Entropy'], {}) 
    sets.precast.WS['Insurgency'].Acc = set_combine(sets.precast.WS['Entropy'], {}) 
    sets.precast.WS['Insurgency'].FullAcc = set_combine(sets.precast.WS['Entropy'], {}) 
    sets.precast.WS['Insurgency'].Fodder = set_combine(sets.precast.WS['Entropy'], {}) 
	
    sets.precast.WS['Torcleaver'] = {ammo="Knobkierrie",
		head="Nyame Helm",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Heath. Earring +1",
		body="Ignominy Cuirass +3",hands="Nyame Gauntlets",ring1="Sroda Ring",ring2="Epaminondas's Ring",
		back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}},
		waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sulev. Leggings +2"}
    sets.precast.WS['Torcleaver'].SomeAcc = set_combine(sets.precast.WS['Torcleaver'], {})
    sets.precast.WS['Torcleaver'].Acc = set_combine(sets.precast.WS['Torcleaver'], {})
    sets.precast.WS['Torcleaver'].FullAcc = set_combine(sets.precast.WS['Torcleaver'], {})
    sets.precast.WS['Torcleaver'].Fodder = set_combine(sets.precast.WS['Torcleaver'], {})

    sets.precast.WS['Entropy'] = {ammo="Crepuscular Pebble",
		head="Sakpata's Helm",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Heath. Earring +1",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Sroda Ring",ring2="Epaminondas's Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
		waist="Fotia Belt",legs="Sakpata's Cuisses",feet="Sulev. Leggings +2"}
    sets.precast.WS['Entropy'].SomeAcc = set_combine(sets.precast.WS['Entropy'], {})
    sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS['Entropy'], {})
    sets.precast.WS['Entropy'].FullAcc = set_combine(sets.precast.WS['Entropy'], {})
    sets.precast.WS['Entropy'].Fodder = set_combine(sets.precast.WS['Entropy'], {})
	
	sets.precast.WS['Cross Reaper'] = set_combine(sets.precast.WS['Catastrophe'], {})
	sets.precast.WS['Cross Reaper'].SomeAcc = set_combine(sets.precast.WS['Catastrophe'], {})
    sets.precast.WS['Cross Reaper'].Acc = set_combine(sets.precast.WS['Catastrophe'], {})
    sets.precast.WS['Cross Reaper'].FullAcc = set_combine(sets.precast.WS['Catastrophe'], {})
    sets.precast.WS['Cross Reaper'].Fodder = set_combine(sets.precast.WS['Catastrophe'], {})
	
	sets.precast.WS['Quietus'] = set_combine(sets.precast.WS['Catastrophe'], {})
	sets.precast.WS['Quietus'].SomeAcc = set_combine(sets.precast.WS['Catastrophe'], {})
    sets.precast.WS['Quietus'].Acc = set_combine(sets.precast.WS['Catastrophe'], {})
    sets.precast.WS['Quietus'].FullAcc = set_combine(sets.precast.WS['Catastrophe'], {})
    sets.precast.WS['Quietus'].Fodder = set_combine(sets.precast.WS['Catastrophe'], {})	
	
	sets.precast.WS['Spiral Hell'] = set_combine(sets.precast.WS['Catastrophe'], {})
	sets.precast.WS['Spiral Hell'].SomeAcc = set_combine(sets.precast.WS['Catastrophe'], {})
    sets.precast.WS['Spiral Hell'].Acc = set_combine(sets.precast.WS['Catastrophe'], {})
    sets.precast.WS['Spiral Hell'].FullAcc = set_combine(sets.precast.WS['Catastrophe'], {})
    sets.precast.WS['Spiral Hell'].Fodder = set_combine(sets.precast.WS['Catastrophe'], {})	
	     
    sets.precast.WS['Resolution'] = {ammo="Crepuscular Pebble",
		head="Sakpata's Helm",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Heath. Earring +1",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
		waist="Fotia Belt",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
    sets.precast.WS['Resolution'].SomeAcc = set_combine(sets.precast.WS['Resolution'], {}) 
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'], {})
    sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS['Resolution'], {})
    sets.precast.WS['Resolution'].Fodder = set_combine(sets.precast.WS['Resolution'], {})

	sets.precast.WS['Shockwave'] = {ammo="Knobkierrie",
		head="Sakpata's Helm",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Heath. Earring +1",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
		waist="Fotia Belt",legs="Sakpata's Cuisses",feet="Sulev. Leggings +2"}
	sets.precast.WS['Shockwave'].SomeAcc = set_combine(sets.precast.WS['Shockwave'], {})
	sets.precast.WS['Shockwave'].Acc = set_combine(sets.precast.WS['Shockwave'], {})
	sets.precast.WS['Shockwave'].FullAcc = set_combine(sets.precast.WS['Shockwave'], {})
	sets.precast.WS['Shockwave'].Fodder = set_combine(sets.precast.WS['Shockwave'], {})

	sets.precast.WS['Savage Blade'] = {ammo="Knobkierrie",
		head="Nyame Helm",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Heath. Earring +1",
		body="Ignominy Cuirass +3",hands="Nyame Gauntlets",ring1="Sroda Ring",ring2="Epaminondas's Ring",
		back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}},
		waist="Sailfi Belt +1",legs="Fallen's Flanchard +3",feet="Sulev. Leggings +2"}
    sets.precast.WS['Savage Blade'].SomeAcc = set_combine(sets.precast.WS['Savage Blade'], {}) 
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'], {})
	sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS['Savage Blade'], {})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {})
	
     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {}
           
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear2="Lugra Earring +1",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Thrud Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Brutal Earring",ear2="Moonshade Earring",}
     
            -- Idle sets
           
    sets.idle = {ammo="Staunch Tathlum +1",
		head="Sakpata's Helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Defending Ring",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Sakpata's Leggings"}
		
    sets.idle.PDT = {ammo="Staunch Tathlum +1",
		head="Sulevia's Mask +2",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Sulevia's Platemail +2",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Moonlight Ring +1",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Sulev. Leggings +2"}

	sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
           
    -- Defense sets
	sets.defense.PDT = {ammo="Seething Bomblet +1",
		head="Sakpata's Helm",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
		waist="Ioskeha Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = {ammo="Seething Bomblet +1",
		head="Sulevia's Mask +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Sulevia's Platemail +2",hands="Sulev. Gauntlets +2",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
		waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.defense.MEVA = {ammo="Seething Bomblet +1",
		head="Sulevia's Mask +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Sulevia's Platemail +2",hands="Sulev. Gauntlets +2",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
		waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
     
	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.passive.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
     
	-- Engaged sets
	sets.engaged = {ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",neck="Lissome Necklace",ear1="Telos Earring",ear2="Cessance Earring",
		body=gear.valorous_stp_body,hands="Sulev. Gauntlets +2",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
		waist="Sailfi belt +1",legs=gear.odyssean_stp_legs,feet="Flam. Gambieras +2"}
    sets.engaged.SomeAcc = {ammo="Aurgelmir Orb +1",
		head="Sakpata's Helm",neck="Abyssal bead necklace +2",ear1="Telos Earring",ear2="Cessance Earring",
		body="Sakpata's breastplate",hands="Sakpata's Gauntlets",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
		waist="Sailfi belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
	sets.engaged.Acc = {ammo={ name="Aurgelmir Orb +1"}, head="Sulevia's Mask +2", body="Dagon Breast.",
		hands="Sakpata's Gauntlets", legs="Sulev. Cuisses +2", feet="Sakpata's Leggings", neck="Subtlety Spec.",
		waist={ name="Sailfi belt +1"}, left_ear="Digni. Earring", right_ear="Telos Earring",
		left_ring="Chirich Ring +1", right_ring="Chirich Ring +1", back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}}
    sets.engaged.FullAcc = {ammo="Seething Bomblet +1",
		head="Sulevia's Mask +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Sulevia's Platemail +2",hands="Sulev. Gauntlets +2",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
		waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
    sets.engaged.Fodder = {ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",neck="Lissome Necklace",ear1="Telos Earring",ear2="Cessance Earring",
		body=gear.valorous_stp_body,hands="Sulev. Gauntlets +2",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
		waist="Ioskeha Belt +1",legs=gear.odyssean_stp_legs,feet="Flam. Gambieras +2"}
		
	sets.engaged.PDT = {ammo="Seething Bomblet +1",
		head="Sulev. Mask +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Sulev. Platemail +2",hands="Sulev. Gauntlets +2",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
		waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
	sets.engaged.SomeAcc.PDT = {ammo="Seething Bomblet +1",
		head="Sulev. Mask +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Sulev. Platemail +2",hands="Sulev. Gauntlets +2",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
		waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
	sets.engaged.Acc.PDT = {ammo="Seething Bomblet +1",
		head="Sulev. Mask +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Sulev. Platemail +2",hands="Sulev. Gauntlets +2",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
		waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
	sets.engaged.FullAcc.PDT = {ammo="Seething Bomblet +1",
		head="Sulev. Mask +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Sulev. Platemail +2",hands="Sulev. Gauntlets +2",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
		waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
	sets.engaged.Fodder.PDT = {ammo="Seething Bomblet +1",
		head="Sulev. Mask +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Sulev. Platemail +2",hands="Sulev. Gauntlets +2",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
		waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
		
	sets.engaged.DTLite = {ammo="Aurgelmir Orb +1",
		head="Sakpata's Helm",neck="Abyssal bead necklace +2",ear1="Telos Earring",ear2="Cessance Earring",
		body="Sakpata's breastplate",hands="Sakpata's Gauntlets",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
		waist="Sailfi belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}	
--[[
    sets.engaged.Adoulin = {}
	sets.engaged.SomeAcc.Adoulin = {}
	sets.engaged.Acc.Adoulin = {}
	sets.engaged.FullAcc.Adoulin = {}
	sets.engaged.Fodder.Adoulin = {}
	
	
	sets.engaged.PDT.Adoulin = {}
	sets.engaged.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Acc.PDT.Adoulin = {}
	sets.engaged.FullAcc.PDT.Adoulin = {}
	sets.engaged.Fodder.PDT.Adoulin = {}
	
	sets.engaged.MDT = {}
	sets.engaged.SomeAcc.MDT = {}
	sets.engaged.Acc.MDT = {}
	sets.engaged.FullAcc.MDT = {}
	sets.engaged.Fodder.MDT = {}
	
	sets.engaged.MDT.Adoulin = {}
	sets.engaged.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Acc.MDT.Adoulin = {}
	sets.engaged.FullAcc.MDT.Adoulin = {}
	sets.engaged.Fodder.MDT.Adoulin = {}
	
            -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
            -- sets if more refined versions aren't defined.
            -- If you create a set with both offense and defense modes, the offense mode should be first.
            -- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Liberator melee sets
    sets.engaged.Liberator = {}
	sets.engaged.Liberator.SomeAcc = {}
	sets.engaged.Liberator.Acc = {}
	sets.engaged.Liberator.FullAcc = {}
	sets.engaged.Liberator.Fodder = {}
	
    sets.engaged.Liberator.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.Adoulin = {}
	sets.engaged.Liberator.Acc.Adoulin = {}
	sets.engaged.Liberator.FullAcc.Adoulin = {}
	sets.engaged.Liberator.Fodder.Adoulin = {}
	
    sets.engaged.Liberator.AM = {}
	sets.engaged.Liberator.SomeAcc.AM = {}
	sets.engaged.Liberator.Acc.AM = {}
	sets.engaged.Liberator.FullAcc.AM = {}
	sets.engaged.Liberator.Fodder.AM = {}
	
    sets.engaged.Liberator.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.Adoulin.AM = {}

	sets.engaged.Liberator.PDT = {}
	sets.engaged.Liberator.SomeAcc.PDT = {}
	sets.engaged.Liberator.Acc.PDT = {}
	sets.engaged.Liberator.FullAcc.PDT = {}
	sets.engaged.Liberator.Fodder.PDT = {}
	
	sets.engaged.Liberator.PDT.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Liberator.Acc.PDT.Adoulin = {}
	sets.engaged.Liberator.FullAcc.PDT.Adoulin = {}
	sets.engaged.Liberator.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Liberator.PDT.AM = {}
	sets.engaged.Liberator.SomeAcc.PDT.AM = {}
	sets.engaged.Liberator.Acc.PDT.AM = {}
	sets.engaged.Liberator.FullAcc.PDT.AM = {}
	sets.engaged.Liberator.Fodder.PDT.AM = {}
	
	sets.engaged.Liberator.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Liberator.MDT = {}
	sets.engaged.Liberator.SomeAcc.MDT = {}
	sets.engaged.Liberator.Acc.MDT = {}
	sets.engaged.Liberator.FullAcc.MDT = {}
	sets.engaged.Liberator.Fodder.MDT = {}
	
	sets.engaged.Liberator.MDT.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Liberator.Acc.MDT.Adoulin = {}
	sets.engaged.Liberator.FullAcc.MDT.Adoulin = {}
	sets.engaged.Liberator.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Liberator.MDT.AM = {}
	sets.engaged.Liberator.SomeAcc.MDT.AM = {}
	sets.engaged.Liberator.Acc.MDT.AM = {}
	sets.engaged.Liberator.FullAcc.MDT.AM = {}
	sets.engaged.Liberator.Fodder.MDT.AM = {}
	
	sets.engaged.Liberator.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.MDT.Adoulin.AM = {}
	
-- Apocalypse melee sets
    sets.engaged.Apocalypse = {}
	sets.engaged.Apocalypse.SomeAcc = {}
	sets.engaged.Apocalypse.Acc = {}
	sets.engaged.Apocalypse.FullAcc = {}
	sets.engaged.Apocalypse.Fodder = {}
	
    sets.engaged.Apocalypse.Adoulin = {}
	sets.engaged.Apocalypse.SomeAcc.Adoulin = {}
	sets.engaged.Apocalypse.Acc.Adoulin = {}
	sets.engaged.Apocalypse.FullAcc.Adoulin = {}
	sets.engaged.Apocalypse.Fodder.Adoulin = {}
	
    sets.engaged.Apocalypse.AM = {}
	sets.engaged.Apocalypse.SomeAcc.AM = {}
	sets.engaged.Apocalypse.Acc.AM = {}
	sets.engaged.Apocalypse.FullAcc.AM = {}
	sets.engaged.Apocalypse.Fodder.AM = {}
	
    sets.engaged.Apocalypse.Adoulin.AM = {}
	sets.engaged.Apocalypse.SomeAcc.Adoulin.AM = {}
	sets.engaged.Apocalypse.Acc.Adoulin.AM = {}
	sets.engaged.Apocalypse.FullAcc.Adoulin.AM = {}
	sets.engaged.Apocalypse.Fodder.Adoulin.AM = {}

	sets.engaged.Apocalypse.PDT = {}
	sets.engaged.Apocalypse.SomeAcc.PDT = {}
	sets.engaged.Apocalypse.Acc.PDT = {}
	sets.engaged.Apocalypse.FullAcc.PDT = {}
	sets.engaged.Apocalypse.Fodder.PDT = {}
	
	sets.engaged.Apocalypse.PDT.Adoulin = {}
	sets.engaged.Apocalypse.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Apocalypse.Acc.PDT.Adoulin = {}
	sets.engaged.Apocalypse.FullAcc.PDT.Adoulin = {}
	sets.engaged.Apocalypse.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Apocalypse.PDT.AM = {}
	sets.engaged.Apocalypse.SomeAcc.PDT.AM = {}
	sets.engaged.Apocalypse.Acc.PDT.AM = {}
	sets.engaged.Apocalypse.FullAcc.PDT.AM = {}
	sets.engaged.Apocalypse.Fodder.PDT.AM = {}
	
	sets.engaged.Apocalypse.PDT.Adoulin.AM = {}
	sets.engaged.Apocalypse.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Apocalypse.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Apocalypse.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Apocalypse.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Apocalypse.PDT.Charge = {}
	sets.engaged.Apocalypse.SomeAcc.PDT.Charge = {}
	sets.engaged.Apocalypse.Acc.PDT.Charge = {}
	sets.engaged.Apocalypse.FullAcc.PDT.Charge = {}
	sets.engaged.Apocalypse.Fodder.PDT.Charge = {}
	
	sets.engaged.Apocalypse.PDT.Adoulin.Charge = {}
	sets.engaged.Apocalypse.SomeAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Apocalypse.Acc.PDT.Adoulin.Charge = {}
	sets.engaged.Apocalypse.FullAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Apocalypse.Fodder.PDT.Adoulin.Charge = {}
	
	sets.engaged.Apocalypse.PDT.Charge.AM = {}
	sets.engaged.Apocalypse.SomeAcc.PDT.Charge.AM = {}
	sets.engaged.Apocalypse.Acc.PDT.Charge.AM = {}
	sets.engaged.Apocalypse.FullAcc.PDT.Charge.AM = {}
	sets.engaged.Apocalypse.Fodder.PDT.Charge.AM = {}
	
	sets.engaged.Apocalypse.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Apocalypse.SomeAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Apocalypse.Acc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Apocalypse.FullAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Apocalypse.Fodder.PDT.Adoulin.Charge.AM = {}

	sets.engaged.Apocalypse.MDT = {}
	sets.engaged.Apocalypse.SomeAcc.MDT = {}
	sets.engaged.Apocalypse.Acc.MDT = {}
	sets.engaged.Apocalypse.FullAcc.MDT = {}
	sets.engaged.Apocalypse.Fodder.MDT = {}
	
	sets.engaged.Apocalypse.MDT.Adoulin = {}
	sets.engaged.Apocalypse.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Apocalypse.Acc.MDT.Adoulin = {}
	sets.engaged.Apocalypse.FullAcc.MDT.Adoulin = {}
	sets.engaged.Apocalypse.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Apocalypse.MDT.AM = {}
	sets.engaged.Apocalypse.SomeAcc.MDT.AM = {}
	sets.engaged.Apocalypse.Acc.MDT.AM = {}
	sets.engaged.Apocalypse.FullAcc.MDT.AM = {}
	sets.engaged.Apocalypse.Fodder.MDT.AM = {}
	
	sets.engaged.Apocalypse.MDT.Adoulin.AM = {}
	sets.engaged.Apocalypse.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Apocalypse.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Apocalypse.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Apocalypse.Fodder.MDT.Adoulin.AM = {}
	
-- Ragnarok melee sets
    sets.engaged.Ragnarok = {}
	sets.engaged.Ragnarok.SomeAcc = {}
	sets.engaged.Ragnarok.Acc = {}
	sets.engaged.Ragnarok.FullAcc = {}
	sets.engaged.Ragnarok.Fodder = {}
	
    sets.engaged.Ragnarok.Adoulin = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin = {}
	sets.engaged.Ragnarok.Acc.Adoulin = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin = {}
	sets.engaged.Ragnarok.Fodder.Adoulin = {}
	
    sets.engaged.Ragnarok.AM = {}
	sets.engaged.Ragnarok.SomeAcc.AM = {}
	sets.engaged.Ragnarok.Acc.AM = {}
	sets.engaged.Ragnarok.FullAcc.AM = {}
	sets.engaged.Ragnarok.Fodder.AM = {}
	
    sets.engaged.Ragnarok.Adoulin.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.AM = {}
	sets.engaged.Ragnarok.Acc.Adoulin.AM = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.AM = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.AM = {}

	sets.engaged.Ragnarok.PDT = {}
	sets.engaged.Ragnarok.SomeAcc.PDT = {}
	sets.engaged.Ragnarok.Acc.PDT = {}
	sets.engaged.Ragnarok.FullAcc.PDT = {}
	sets.engaged.Ragnarok.Fodder.PDT = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Ragnarok.PDT.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.AM = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Ragnarok.PDT.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Charge = {}
	sets.engaged.Ragnarok.Acc.PDT.Charge = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Charge = {}
	sets.engaged.Ragnarok.Fodder.PDT.Charge = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Charge = {}
	
	sets.engaged.Ragnarok.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Charge.AM = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Charge.AM = {}

	sets.engaged.Ragnarok.MDT = {}
	sets.engaged.Ragnarok.SomeAcc.MDT = {}
	sets.engaged.Ragnarok.Acc.MDT = {}
	sets.engaged.Ragnarok.FullAcc.MDT = {}
	sets.engaged.Ragnarok.Fodder.MDT = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Ragnarok.MDT.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.AM = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.AM = {}
]]--
	--Extra Special Sets
	
	sets.buff.Souleater = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.latent_refresh = {waist="Fucho-no-Obi"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Caladbolg = {main="Caladbolg",sub="Utu Grip"}
	sets.weapons.Anguta = {main="Anguta",sub="Utu Grip"}
	sets.weapons.Apocalypse = {main="Apocalypse",sub="Utu Grip"}
	sets.weapons.Club = {main="Loxotic Mace +1", sub="Blurred Shield +1"}
	sets.weapons.Savage = {main="Naegling", sub="Blurred Shield +1"}
	sets.weapons.Prime = {main="Foenaria", sub="Utu Grip"}
	
    end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 7)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 7)
    elseif player.sub_job == 'DNC' then
        set_macro_page(1, 7)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 7)
    else
        set_macro_page(1, 7)
    end
end