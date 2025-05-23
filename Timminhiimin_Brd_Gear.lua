function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','PDT')
	state.Weapons:options('Swords','None','Carn','CarnDW','Trails')

	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !q gs c weapons NukeWeapons;gs c update')
	send_command('bind ^q gs c weapons Swords;gs c update')
	autows_list = {['Carn']='Mordant Rime',['CarnDW']='Mordant Rime',['DualWeapons']='Savage Blade',['Swords']='Savage Blade',['NukeWeapons']='Aeolian Edge'}
	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	--sets.weapons.Kali = {main="Kali",sub="Genmei Shield"}
	sets.weapons.Carn = {main="Carnwenhan",sub="Genmei Shield"}
	sets.weapons.CarnDW = {main="Carnwenhan",sub="Ternion Dagger +1"}
	sets.weapons.Swords = {main="Naegling",sub="Centovente"}
	sets.weapons.Trails = {main="Kartika",sub="Ternion Dagger +1"}
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {range={ name="Linos", augments={'Mag. Evasion+15','"Fast Cast"+6','INT+6 MND+6',}},
		head="Nahtirah Hat",body="Inyanga Jubbah +2",hands="Gende. Gages +1",legs="Kaykaus Tights +1",feet="Fili Cothurnes +3",
		neck="Orunmila's Torque",waist="Flume Belt +1",left_ear="Enchntr. Earring +1",right_ear="Loquac. Earring",left_ring="Kishar Ring",
		right_ring="Medada's Ring",back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Vanya Clogs"})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.BardSong = {main="Carnwenhan",sub="Genmei Shield",range={ name="Linos", augments={'Mag. Evasion+15','"Fast Cast"+6','INT+6 MND+6',}},
		head="Fili Calot +3",body="Inyanga Jubbah +2",hands="Gende. Gages +1",legs="Kaykaus Tights +1",feet="Fili Cothurnes +3",
		neck="Orunmila's Torque",waist="Flume Belt +1",left_ear="Enchntr. Earring +1",right_ear="Loquac. Earring",left_ring="Kishar Ring",
		right_ring="Medada's Ring",back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}}

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong)
	sets.precast.FC['Magic Finale'] = set_combine(sets.precast.FC.BardSong)
	sets.precast.FC['Horde Lullaby'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Horde Lullaby'].Resistant = set_combine(sets.precast.FC.BardSong)
	sets.precast.FC['Horde Lullaby'].AoE = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})
	sets.precast.FC['Horde Lullaby II'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Horde Lullaby II'].Resistant = set_combine(sets.precast.FC.BardSong)
	sets.precast.FC['Horde Lullaby II'].AoE = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Aria of Passion'] = set_combine(sets.precast.FC.BardSong,{range="Loughnashade"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +3"}
	sets.precast.JA.Troubadour = {body="Bihu Jstcorps +3"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +3"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {range={ name="Linos", augments={'Accuracy+13 Attack+13','Weapon skill damage +3%','STR+6 DEX+6',}},
		head="Nyame Helm",body="Bihu Jstcorps. +3",hands="Nyame Gauntlets",legs="Nyame Flanchard",feet="Nyame Sollerets",
		neck="Bard's Charm +2",waist="Sailfi Belt +1",left_ear="Ishvara Earring",right_ear="Moonshade Earring",left_ring="Sroda Ring",
		right_ring="Epaminondas's Ring",back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	
	sets.precast.WS['Savage Blade'] = {range={ name="Linos", augments={'Accuracy+13 Attack+13','Weapon skill damage +3%','STR+6 DEX+6',}},
		head="Nyame Helm",body="Bihu Jstcorps. +3",hands="Nyame Gauntlets",legs="Nyame Flanchard",feet="Nyame Sollerets",
		neck="Bard's Charm +2",waist="Sailfi Belt +1",left_ear="Ishvara Earring",right_ear="Moonshade Earring",left_ring="Sroda Ring",
		right_ring="Epaminondas's Ring",back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	
	sets.precast.WS['Mordant Rime'] = {range={ name="Linos", augments={'Accuracy+13 Attack+13','Weapon skill damage +3%','CHR+8',}},
		head="Nyame Helm",body="Bihu Jstcorps. +3",hands="Nyame Gauntlets",legs="Nyame Flanchard",feet="Nyame Sollerets",
		neck="Bard's Charm +2",waist="Sailfi Belt +1",left_ear="Regal Earring",right_ear="Ishvara Earring",
		left_ring="Metamor. Ring +1",right_ring="Epaminondas's Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}}
	
	sets.precast.WS['Aeolian Edge'] = {ammo="Oshasha's Treatise",head="Nyame Helm",body="Nyame Mail",hands="Nyame Gauntlets",
		legs="Nyame Flanchard",feet="Nyame Sollerets",neck="Sibyl Scarf",waist="Orpheus's Sash",left_ear="Regal Earring",
		right_ear="Moonshade Earring",left_ring="Epaminondas's Ring",right_ring="Medada's Ring",
		back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	--sets.MaxTP = {ear1="Ishvara Earring",ear2="Telos Earring",}
	--sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {range="Gjallarhorn",head="Fili Calot +3",body="Fili Hongreline +3",
		hands="Fili Manchettes +3",legs="Inyanga Shalwar +2",feet="Brioso Slippers +3",neck="Mnbw. Whistle +1",waist="Flume Belt +1",
		left_ear="Etiolation Earring",right_ear="Arete del Luna +1",left_ring="Defending Ring",right_ring="Medada's Ring",
		back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}}

	-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast.Ballad = {main="Carnwenhan",sub="Genmei Shield",range="Miracle Cheer",head="Fili Calot +3",body="Fili Hongreline +3",
		hands="Fili Manchettes +3",legs="Fili Rhingrave +3",feet="Brioso Slippers +3",neck="Mnbw. Whistle +1",waist="Flume Belt +1",
		left_ear="Etiolation Earring",right_ear="Arete del Luna +1",left_ring="Defending Ring",right_ring="Kishar Ring",
		back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}}
	
	sets.midcast.Lullaby = {main="Carnwenhan",sub="Ammurapi Shield",range="Marsyas",head="Brioso Roundlet +3",body="Fili Hongreline +3",hands="Brioso Cuffs +3",legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",neck="Mnbw. Whistle +1",waist="Acuity Belt +1",left_ear="Digni. Earring",right_ear="Regal Earring",left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}}
	sets.midcast['Horde Lullaby'] = {main="Carnwenhan",sub="Ammurapi Shield",range="Marsyas",head="Brioso Roundlet +3",body="Fili Hongreline +3",hands="Brioso Cuffs +3",legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",neck="Mnbw. Whistle +1",waist="Acuity Belt +1",left_ear="Digni. Earring",right_ear="Regal Earring",left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}}
	sets.midcast['Horde Lullaby'].Resistant = {}
	sets.midcast['Horde Lullaby'].AoE = {main="Carnwenhan",sub="Ammurapi Shield",range="Blurred Harp +1",head="Brioso Roundlet +3",body="Fili Hongreline +3",hands="Brioso Cuffs +3",legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",neck="Mnbw. Whistle +1",waist="Acuity Belt +1",left_ear="Digni. Earring",right_ear="Regal Earring",left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}}
	sets.midcast['Horde Lullaby II'] = {main="Carnwenhan",sub="Ammurapi Shield",range="Daurdabla",head="Brioso Roundlet +3",body="Fili Hongreline +3",hands="Inyanga Dastanas +2",
		legs="Inyanga Shalwar +2",feet="Bihu Slippers +3",neck="Mnbw. Whistle +1",waist="Acuity Belt +1",left_ear="Gersemi Earring",right_ear="Regal Earring",
		left_ring="Stikini Ring +1",right_ring="Stikini Ring +1",back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}}
	sets.midcast['Horde Lullaby II'].Resistant = {}
	sets.midcast['Horde Lullaby II'].AoE = {}
	
	sets.midcast.Madrigal = set_combine(sets.midcast.SongEffect,{feet="Fili Cothurnes +3"})
	
	sets.midcast.Paeon = set_combine(sets.midcast.SongEffect,{head="Brioso Roundlet +3"})
	
	sets.midcast['Fowl Aubade'] = {range="Daurdabla",head="Null Masque",body="Inyanga Jubbah +2",hands="Fili Manchettes +3",legs="Fili Rhingrave +3",
		feet="Fili Cothurnes +3",neck="Bathy Choker +1",waist="Null Belt",left_ear="Eabani Earring",right_ear="Arete del Luna +1",left_ring="Defending Ring",right_ring="Dark Ring",
		back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}}
    sets.midcast['Herb Pastoral'] = {range="Daurdabla",head="Null Masque",body="Inyanga Jubbah +2",hands="Fili Manchettes +3",legs="Fili Rhingrave +3",
		feet="Fili Cothurnes +3",neck="Bathy Choker +1",waist="Null Belt",left_ear="Eabani Earring",right_ear="Arete del Luna +1",left_ring="Defending Ring",right_ring="Dark Ring",
		back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}}
    sets.midcast['Shining Fantasia'] = {range="Daurdabla",head="Null Masque",body="Inyanga Jubbah +2",hands="Fili Manchettes +3",legs="Fili Rhingrave +3",
		feet="Fili Cothurnes +3",neck="Bathy Choker +1",waist="Null Belt",left_ear="Eabani Earring",right_ear="Arete del Luna +1",left_ring="Defending Ring",right_ring="Dark Ring",
		back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}}
    sets.midcast['Scop\'s Operetta'] = {range="Daurdabla",head="Null Masque",body="Inyanga Jubbah +2",hands="Fili Manchettes +3",legs="Fili Rhingrave +3",
		feet="Fili Cothurnes +3",neck="Bathy Choker +1",waist="Null Belt",left_ear="Eabani Earring",right_ear="Arete del Luna +1",left_ring="Defending Ring",right_ring="Dark Ring",
		back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}}
    sets.midcast['Warding Round'] = {range="Daurdabla",head="Null Masque",body="Inyanga Jubbah +2",hands="Fili Manchettes +3",legs="Fili Rhingrave +3",
		feet="Fili Cothurnes +3",neck="Bathy Choker +1",waist="Null Belt",left_ear="Eabani Earring",right_ear="Arete del Luna +1",left_ring="Defending Ring",right_ring="Dark Ring",
		back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}}
	
	sets.midcast.March = {{main="Carnwenhan",sub="Genmei Shield",range="Gjallarhorn",head="Fili Calot +3",body="Fili Hongreline +3",
		hands="Fili Manchettes +3",legs="Inyanga Shalwar +2",feet="Brioso Slippers +3",neck="Mnbw. Whistle +1",waist="Flume Belt +1",
		left_ear="Etiolation Earring",right_ear="Arete del Luna +1",left_ring="Defending Ring",right_ring="Kishar Ring",
		back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}}}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	sets.midcast['Aria of Passion'] = set_combine(sets.midcast.SongEffect,{range="Loughnashade"})
	
	sets.midcast.Minuet = {}
	
	sets.midcast.Minne = {main="Carnwenhan",sub="Genmei Shield",range="Miracle Cheer",head="Fili Calot +3",body="Fili Hongreline +3",
		hands="Fili Manchettes +3",legs="Mousai Seraweels +1",feet="Brioso Slippers +3",neck="Mnbw. Whistle +1",waist="Flume Belt +1",
		left_ear="Etiolation Earring",right_ear="Arete del Luna +1",left_ring="Defending Ring",right_ring="Kishar Ring",
		back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}}
	sets.midcast.Carol = set_combine(sets.midcast.SongEffect,{hands="Mousai Gages +1"})
	sets.midcast["Sentinel's Scherzo"] = set_combine(sets.midcast.SongEffect,{feet="Fili Cothurnes +3"}) --feet="Fili Cothurnes +3" Brioso Slippers still provides more Duration
	sets.midcast['Magic Finale'] = {}
	sets.midcast.Mazurka = set_combine(sets.midcast.SongEffect,{range="Marsyas"})
	sets.midcast.Mambo = set_combine(sets.midcast.SongEffect,{feets="Mousai Crackows +1"})
	sets.midcast.Etude = set_combine(sets.midcast.SongEffect,{head="Mousai Turban +1"})
	sets.midcast.Threnody = set_combine(sets.midcast.SongDebuff,{body="Mousai Manteel +1"})

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {main="Carnwenhan",sub="Genmei Shield",range="Gjallarhorn",head="Fili Calot +3",body="Fili Hongreline +3",
		hands="Fili Manchettes +3",legs="Inyanga Shalwar +2",feet="Brioso Slippers +3",neck="Mnbw. Whistle +1",waist="Flume Belt +1",
		left_ear="Etiolation Earring",right_ear="Arete del Luna +1",left_ring="Defending Ring",right_ring="Kishar Ring",
		back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}}

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {main="Carnwenhan",sub="Ammurapi Shield",range="Marsyas",head="Brioso Roundlet +3",body="Fili Hongreline +3",hands="Fili Manchettes +3",
		legs="Fili Rhingrave +3",feet="Brioso Slippers +3",neck="Mnbw. Whistle +1",waist="Acuity Belt +1",left_ear="Digni. Earring",
		right_ear="Fili Earring +1",left_ring="Metamor. Ring +1",right_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {main="Carnwenhan",sub="Ammurapi Shield",range="Marsyas",head="Brioso Roundlet +3",body="Fili Hongreline +3",hands="Fili Manchettes +3",
		legs="Fili Rhingrave +3",feet="Brioso Slippers +3",neck="Mnbw. Whistle +1",waist="Acuity Belt +1",left_ear="Digni. Earring",
		right_ear="Fili Earring +1",left_ring="Metamor. Ring +1",right_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {main="Carnwenhan",sub="Genmei Shield",range="Gjallarhorn",head="Fili Calot +3",body="Fili Hongreline +3",
		hands="Fili Manchettes +3",legs="Inyanga Shalwar +2",feet="Brioso Slippers +3",neck="Mnbw. Whistle +1",waist="Flume Belt +1",
		left_ear="Etiolation Earring",right_ear="Arete del Luna +1",left_ring="Defending Ring",right_ring="Medada's Ring",
		back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {main={ name="Grioavolr", augments={'"Conserve MP"+8','Mag. Acc.+3',}},
		sub="Giuoco Grip",ammo="Pemphredo Tathlum",head="Kaykaus Mitra +1",body="Kaykaus Bliaut +1",
		hands="Kaykaus Cuffs +1",legs="Kaykaus Tights +1",feet="Kaykaus Boots +1",neck="Reti Pendant",
		waist="Shinjutsu-no-Obi +1",left_ear="Calamitous Earring",right_ear="Gifted Earring",left_ring="Stikini Ring +1",
		right_ring="Mephitas's Ring +1",back="Aurist's Cape +1",}
		
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
		
	sets.midcast['Enhancing Magic'] = {main="Oranyan",sub="Giuoco Grip",ammo="Pemphredo Tathlum",head="Null Masque",
		body="Telchine Chas.",hands="Inyan. Dastanas +2",legs="Shedir Seraweels",feet="Kaykaus Boots +1",
		neck="Incanter's Torque",waist="Olympus Sash",left_ear="Mimir Earring",right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",right_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash"})

	sets.midcast.Dispel = {ammo="Pemphredo Tathlum",head="Fili Calot +3",
		body="Bihu Jstcorps. +3",hands="Fili Manchettes +3",legs="Fili Rhingrave +3",feet="Fili Cothurnes +3",
		neck="Mnbw. Whistle +1",waist="Acuity Belt +1",left_ear="Digni. Earring",right_ear="Gwati Earring",
		left_ring="Stikini Ring +1",right_ring="Metamor. Ring +1",back="Aurist's Cape +1",}
	
	sets.midcast['Elemental Magic'] = {main="Marin Staff +1",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
		head="Buremte Hat",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Medada's Ring",
		back="Toro Cape",waist="Sekhmet Corset",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	sets.midcast['Elemental Magic'].Resistant = {main="Marin Staff +1",sub="Clerisy Strap +1",ammo="Dosis Tathlum",
		head="Buremte Hat",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Medada's Ring",
		back="Toro Cape",waist="Yamabuki-no-Obi",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Fodder
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		ring1="Haoma's Ring",ring2="Haoma's Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	
	-- Resting sets
	--sets.resting = {}
	
	sets.idle = {range={ name="Linos", augments={'Mag. Evasion+15','"Fast Cast"+6','INT+6 MND+6',}},
		head="Null Masque",body="Inyanga Jubbah +2",hands="Fili Manchettes +3",legs="Fili Rhingrave +3",
		feet="Fili Cothurnes +3",neck="Bathy Choker +1",waist="Null Belt",left_ear="Eabani Earring",
		right_ear="Arete del Luna +1",left_ring="Defending Ring",right_ring="Dark Ring",
		back={ name="Intarabus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}}

	sets.idle.PDT = {main="Terra's Staff",sub="Oneiros Grip",ammo="Staunch Tathlum",
		head=empty,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flume Belt",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}
	
	-- Defense sets

	sets.defense.PDT = {main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum",
		head=empty,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flume Belt",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}

	sets.defense.MDT = {main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum",
		head=empty,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flume Belt",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}

	sets.Kiting = {}

	-- Gear for specific elemental nukes.
	sets.WindNuke = {main="Marin Staff +1"}
	sets.IceNuke = {main="Ngqoqwanb"}
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {range={ name="Linos", augments={'Accuracy+15','"Store TP"+4','Quadruple Attack +3',}},
		head="Aya. Zucchetto +2",body="Ayanmo Corazza +2",hands="Bunzi's Gloves",legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Volte Spats",neck="Bard's Charm +2",waist="Reiki Yotai",left_ear="Telos Earring",right_ear="Cessance Earring",
		left_ring="Moonlight Ring",right_ring="Moonlight Ring",
		back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}}
	sets.engaged.Acc = {range={ name="Linos", augments={'Accuracy+15','"Store TP"+4','Quadruple Attack +3',}},head="Aya. Zucchetto +2",
		body="Inyanga Jubbah +2",hands="Bunzi's Gloves",legs="Nyame Flanchard",feet="Nyame Sollerets",neck="Bard's Charm +2",
		waist="Sailfi Belt +1",left_ear="Eabani Earring",right_ear="Suppanomimi",left_ring="Moonlight Ring",right_ring="Moonlight Ring",
		back="Null Shawl",}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(10, 10)
end

	send_command('exec init.txt')