-- Setup vars that are user-dependent.
function user_setup()
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','DTLite','PDT','Reraise')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder','Proc')
    state.RangedMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT','PDTReraise')
	state.MagicalDefenseMode:options('MDT','MDTReraise')
	state.ResistDefenseMode:options('MEVA')
    state.IdleMode:options('Normal', 'Reraise')
	state.Weapons:options('Dojikiri','ProcWeapon','Bow')

	gear.ws_jse_back = {name="Smertrios's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	gear.stp_jse_back = {name="Smertrios's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
    -- Additional local binds
    send_command('bind ^` input /ja "Hasso" <me>')
    send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind !backspace input /ja "Third Eye" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !@^` gs c cycle Stance')
	send_command('bind !r gs c weapons ProcWeapon;gs c set WeaponskillMode Proc;gs c update')
	send_command('bind ^r gs c weapons Default;gs c set WeaponskillMode Normal;gs c update')
	send_command('bind ^q gs c weapons Bow;gs c update')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA.Meditate = {head="Wakido Kabuto +3",hands="Sakonji Kote +1",back=gear.ws_jse_back}
    sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto +3"}
    sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote +1"}
	sets.precast.JA['Sekkanoki'] = {hands="Kasuga Kote +1"}
	sets.precast.JA['Sengikori'] = {feet="Kas. Sune-Ate +1"}
	
    sets.precast.Step = {}
    sets.precast.JA['Violent Flourish'] = {}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Sapience Orb",legs="Limbo Trousers",neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Loquacious Earring",hands="Leyline Gloves",ring1="Medada's Ring",ring2="Prolix Ring"}
	   
    -- Ranged snapshot gear
    sets.precast.RA = {}
	   
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}
   
	
	sets.precast.WS.Proc = {ammo="Hasty Pinion +1",
        head="Flam. Zucchetto +2",neck="Moonbeam Nodowa",ear1="Zennaroi Earring",ear2="Telos Earring",
        body="Tartarus Platemail",hands="Flam. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.stp_jse_back,waist="Olseni Belt",legs="Wakido Haidate +3",feet="Flam. Gambieras +2"}
	
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Tachi: Fudo'] = {}
    	
    --Kasuga hands and feet Sakonji Body
	sets.precast.WS['Tachi: Shoha'] = {ammo="Crepuscular Pebble",head="Mpaca's Cap",body="Nyame Mail",hands="Nyame Gauntlets",legs="Mpaca's Hose",
		feet="Nyame Sollerets",neck="Sam. Nodowa +2",waist="Sailfi Belt +1",left_ear="Moonshade Earring",right_ear="Thrud Earring",
		left_ring="Sroda Ring",right_ring="Niqmaddu Ring",
		back=gear.ws_jse_back}
    
    sets.precast.WS['Tachi: Rana'] = {}
    
    sets.precast.WS['Tachi: Kasha'] = {}
    
    sets.precast.WS['Tachi: Gekko'] = {}
    
    sets.precast.WS['Tachi: Yukikaze'] = {}
    
    sets.precast.WS['Tachi: Ageha'] = {}
		
    sets.precast.WS['Tachi: Hobaku'] = {}
	
	--Sakonji Body and Schere Earring
    sets.precast.WS['Tachi: Jinpu'] = {ammo="Knobkierrie",head="Nyame Helm",body="Nyame Mail",hands="Nyame Gauntlets",
		legs="Nyame Flanchard",feet="Nyame Sollerets",neck="Sam. Nodowa +2",waist="Orpheus's Sash",left_ear="Friomisi Earring",
		right_ear="Moonshade Earring",left_ring="Epaminondas's Ring",right_ring="Niqmaddu Ring",
		back=gear.ws_jse_back}

    --Sakonji Body
	sets.precast.WS['Tachi: Koki'] = {ammo="Knobkierrie",head="Nyame Helm",body="Nyame Mail",hands="Nyame Gauntlets",
		legs="Nyame Flanchard",feet="Nyame Sollerets",neck="Sam. Nodowa +2",waist="Fotia Belt",left_ear="Thrud Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Weather. Ring",right_ring="Niqmaddu Ring",
		back=gear.ws_jse_back}
	
	sets.precast.WS['Apex Arrow'] = {}
		
    
		
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Loess Barbuta +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Tartarus Platemail",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
        back="Moonlight Cape",waist="Tempus Fugit",legs="Wakido Haidate +3",feet="Amm Greaves"}
		
    -- Specific spells
    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
	
		
    -- Ranged gear
    sets.midcast.RA = {
        head="Flam. Zucchetto +2",neck="Ocachi Gorget",ear1="Clearview Earring",ear2="Neritic Earring",
        body="Kyujutsugi",hands="Buremte Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
        back="Buquwik Cape",waist="Flax Sash",legs="Wakido Haidate +3",feet="Waki. Sune-Ate +1"}

    sets.midcast.RA.Acc = {
        head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Clearview Earring",ear2="Neritic Earring",
        body="Kyujutsugi",hands="Buremte Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
        back="Buquwik Cape",waist="Flax Sash",legs="Wakido Haidate +3",feet="Waki. Sune-Ate +1"}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	
	sets.Kiting = {feet="Danzo Sune-ate"}

    sets.Reraise = {}
	
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {}
	
    sets.idle = {ammo="Staunch Tathlum +1",head="Null Masque",body="Nyame Mail",hands="Nyame Gauntlets",legs="Nyame Flanchard",
		feet="Nyame Sollerets",neck="Loricate Torque +1",waist="Ioskeha Belt +1",left_ear="Odnowa Earring +1",
		right_ear="Tuisto Earring",left_ring="Defending Ring",right_ring="Gelatinous Ring +1",back="Moonlight Cape",}
		
    --sets.idle.Reraise = set_combine(sets.idle, sets.Reraise)

    --sets.idle.Weak = 
		
    --sets.idle.Weak.Reraise = 
	
	sets.DayIdle = {}
	sets.NightIdle = {}
    
    -- Defense sets
    sets.defense.PDT = {ammo="Staunch Tathlum",
        head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Tartarus Platemail",hands="Wakido Kote +3",ring1="Defending Ring",ring2="Patricius Ring",
        back="Moonlight Cape",waist="Ioskeha Belt",legs="Wakido Haidate +3",feet="Amm Greaves"}

    sets.defense.PDTReraise = set_combine(sets.defense.PDT, sets.Reraise)
		
    sets.defense.MDT = {ammo="Staunch Tathlum",
        head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Tartarus Platemail",hands="Wakido Kote +3",ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonlight Cape",waist="Flax Sash",legs="Wakido Haidate +3",feet="Amm Greaves"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, sets.Reraise)
	
    sets.defense.MEVA = {ammo="Staunch Tathlum",
        head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Tartarus Platemail",hands="Leyline Gloves",ring1="Vengeful Ring",Ring2="Purity Ring",
        back="Moonlight Cape",waist="Flax Sash",legs="Wakido Haidate +3",feet="Amm Greaves"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    -- Delay 450 GK, 25 Save TP => 65 Store TP for a 5-hit (25 Store TP in gear)
    sets.engaged = {ammo="Aurgelmir Orb +1",head="Flam. Zucchetto +2",body={ name="Valorous Mail", augments={'Accuracy+16 Attack+16','"Store TP"+7','Accuracy+7',}},
		hands="Tatena. Gote +1",legs="Tatena. Haidate +1",feet="Ryuo Sune-Ate +1",neck="Moonlight Nodowa",waist="Sweordfaetels +1",
		left_ear="Dedition Earring",right_ear="Kasuga Earring +2",left_ring="Niqmaddu Ring",right_ring="Chirich Ring +1",back=gear.stp_jse_back}
    	
 
   
   
	-- Weapons sets
	sets.weapons.Dojikiri = {main="Dojikiri Yasutsuna",sub="Utu Grip"}
	sets.weapons.ProcWeapon = {main="Norifusa +1",sub="Bloodrain Strap"}
	sets.weapons.Bow = {main="Norifusa +1",sub="Utu Grip",range="Cibitshavore",ammo="Eminent Arrow"}
	
	-- Buff sets
	sets.Cure_Received = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}
	sets.buff.Hasso = {hands="Wakido Kote +3"}
	sets.buff['Third Eye'] = {} --legs="Sakonji Haidate +3"
    sets.buff.Sekkanoki = {hands="Kasuga Kote +1"}
    sets.buff.Sengikori = {feet="Kas. Sune-Ate +1"}
    sets.buff['Meikyo Shisui'] = {feet="Sak. Sune-Ate +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(3, 1)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'NIN' then
        set_macro_page(10, 1)
    elseif player.sub_job == 'THF' then
        set_macro_page(2, 1)
    else
        set_macro_page(1, 1)
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
					windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
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