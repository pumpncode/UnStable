--- STEAMODDED HEADER
--- MOD_NAME: UnStable
--- MOD_ID: UNSTB
--- MOD_AUTHOR: [Kirbio, Ram]
--- MOD_DESCRIPTION: Assorted Mish-mash of Various Idea
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-0812d]
--- BADGE_COLOR: 41c300
--- PREFIX: unstb
----------------------------------------------
------------MOD CODE -------------------------

local unStb = SMODS.current_mod
local filesystem = NFS or love.filesystem
local path = unStb.path

--Localization Messages
local loc = filesystem.load(unStb.path..'localization.lua')()

-- Debug message

local function print(message)
    sendDebugMessage('[Unstable] - '..(tostring(message) or '???'))
end

print("Starting Unstable")

-- Index-based coordinates generation

local function get_coordinates(position, width)
    if width == nil then width = 10 end -- 10 is default for Jokers
    return {x = (position) % width, y = math.floor((position) / width)}
end

--Creates an atlas for cards to use
SMODS.Atlas {
  -- Key for code to find it with
  key = "unstb_jokers",
  -- The name of the file, for the code to pull the atlas from
  path = "unstb_jokers.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

--Atlas for extra ranks
SMODS.Atlas {
  -- Key for code to find it with
  key = "rank_ex",
  -- The name of the file, for the code to pull the atlas from
  path = "rank_ex.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

SMODS.Atlas {
  -- Key for code to find it with
  key = "rank_ex_hc",
  -- The name of the file, for the code to pull the atlas from
  path = "rank_ex.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

--Jokers
--filesystem.load(unStb.path..'joker\\joker.lua')()

--Utility

--Auto event scheduler, based on Bunco
local function event(config)
    local e = Event(config)
    G.E_MANAGER:add_event(e)
    return e
end

local function big_juice(card)
    card:juice_up(0.7)
end

local function extra_juice(card)
    card:juice_up(0.6, 0.1)
end

local function forced_message(message, card, color, delay, juice)
    if delay == true then
        delay = 0.7 * 1.25
    elseif delay == nil then
        delay = 0
    end

    event({trigger = 'before', delay = delay, func = function()

        if juice then big_juice(juice) end

        card_eval_status_text(
            card,
            'extra',
            nil, nil, nil,
            {message = message, colour = color, instant = true}
        )
        return true
    end})
end

--Joker creation wrapper, based on Bunco
local function create_joker(joker)

    -- Sprite position

    local width = 10 -- Width of the spritesheet (in Jokers)

        -- Soul sprite

        if joker.rarity == 'Legendary' then
            joker.soul = get_coordinates(joker.id) -- Calculates coordinates based on the position variable
        end

    joker.position = get_coordinates(joker.id)

    -- Sprite atlas

    if joker.type == nil then
        joker.atlas = 'unstb_jokers'
    elseif joker.type == 'Banned' then
        joker.atlas = 'unstb_jokers_banned'
    end

    if joker.rarity == 'Legendary' then
        joker.atlas = 'unstb_jokers_legend'
    end

    -- Key generation from name

    local key = string.gsub(string.lower(joker.name), '%s', '_') -- Removes spaces and uppercase letters

    -- Rarity conversion

    if joker.rarity == 'Common' then
        joker.rarity = 1
    elseif joker.rarity == 'Uncommon' then
        joker.rarity = 2
    elseif joker.rarity == 'Rare' then
        joker.rarity = 3
    elseif joker.rarity == 'Legendary' then
        joker.rarity = 4
    end

    -- Config values

    if joker.vars == nil then joker.vars = {} end

    joker.config = {extra = {}}

    for _, kv_pair in ipairs(joker.vars) do
        -- kv_pair is {a = 1}
        local k, v = next(kv_pair)
        joker.config.extra[k] = v
    end

    -- Joker creation
	SMODS.Joker{
        name = joker.name,
        key = key,

        atlas = joker.atlas,
        pos = joker.position,
        soul_pos = joker.soul,

        rarity = joker.rarity,
        cost = joker.cost,

        unlocked = true,
        --check_for_unlock = joker.check_for_unlock,
        --unlock_condition = joker.unlock_condition,
        discovered = true, --false,

        blueprint_compat = joker.blueprint,
        eternal_compat = joker.eternal,

        loc_txt = loc[key],
        process_loc_text = joker.process_loc_text,

        config = joker.custom_config or joker.config,
        loc_vars = joker.custom_vars or function(self, info_queue, card)

            -- Localization values

            local vars = {}

            for _, kv_pair in ipairs(joker.vars) do
                -- kv_pair is {a = 1}
                local k, v = next(kv_pair)
                -- k is `a`, v is `1`
                table.insert(vars, card.ability.extra[k])
            end

            return {vars = vars}
        end,

        calculate = joker.calculate,
        update = joker.update,
        remove_from_deck = joker.remove,
        add_to_deck = joker.add,
        set_ability = joker.set_ability,
        in_pool = joker.custom_in_pool or pool,

        effect = joker.effect
        }
end

--New Ranks
--TODO: Figure out how to hide these rank from the deck preview until it start crops up
SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	loc_txt = loc.ranks['Half'],
	hidden = true,

    key = '0.5',
    card_key = '0.5',
    pos = { x = 2 },
    nominal = 0.5,
    next = { 'unstb_1' },
    shorthand = '0.5',
	
	is_decimal = true,
	
	in_pool = function(self, args)
        if args and args.initial_deck then
            return false
        end
    end
}

SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	loc_txt = loc.ranks['1'],
	hidden = true,

    key = '1',
    card_key = '1',
    pos = { x = 5 },
    nominal = 1,
    next = { '2' },
    shorthand = '1',
	
	in_pool = function(self, args)
        if args and args.initial_deck then
            return false
        end
    end
}

SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	loc_txt = loc.ranks['Euler'],
	hidden = true,

    key = 'e',
    card_key = 'E',
    pos = { x = 3 },
    nominal = 2.72,
    next = { '3' },
    shorthand = 'e',
	
	is_decimal = true,
	
	in_pool = function(self, args)
        if args and args.initial_deck then
            return false
        end
    end
}

SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	loc_txt = loc.ranks['Pi'],
	hidden = true,

    key = 'Pi',
    card_key = 'P',
    pos = { x = 4 },
    nominal = 3.14,
    next = { '4' },
    shorthand = 'Pi',
	
	is_decimal = true,
	
	in_pool = function(self, args)
        if args and args.initial_deck then
            return false
        end
    end
}

SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	loc_txt = loc.ranks['Question'],
	hidden = true,

    key = '???',
    card_key = '?',
    pos = { x = 1 },
    nominal = 0,
    next = { 'unstb_???' },
    shorthand = '?',
	
	in_pool = function(self, args)
        if args and args.initial_deck then
            return false
        end
    end
}

SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',

	loc_txt = loc.ranks['21'],
	hidden = true,
	
    key = '21', -- the number or name (ex. "Jack") of your rank if it has one
    card_key = '21', -- the short key put after the suit when coding a card object (ex. for the card "H_5" the card_key is 5). this seems to usually match the shorthand
    pos = { x = 0 }, -- x position on the card atlas
    nominal = 21,  -- the number of chips this card scores
    next = { 'unstb_???' }, -- the next rank directly above it, used for Strength Tarot
    shorthand = '21', -- used for deck preview (ex. 1 of Spades)
	
	in_pool = function(self, args)
        if args and args.initial_deck then
            return false
        end
    end
}

--BlackJack + Question Mark Line Jokers

local function blackJack_evalrank(hand, bustAmount)
	--Black Jack-style total rank evaluation
	
	bustAmount = bustAmount or 21
	
	local aceCount = 0
	local rank = 0
	
	for i = 1, #hand do
		local currentCard = hand[i]
		if currentCard.config.center ~= G.P_CENTERS.m_stone and not currentCard.debuff  then
			
			if currentCard.base.value ~= 'Ace' then
				rank = rank + (SMODS.Ranks[currentCard.base.value].nominal or 0) --Supports modded ranks as well, just in case
			else
				aceCount = aceCount + 1
			end
			
		end
	end
	
	--Handle Ace rank
	while( aceCount > 0 )
	do
	   
		if rank <= bustAmount-11 then
			rank = rank + 11
		else
			rank = rank + 1
		end
		
		aceCount = aceCount - 1
	end
	
	return rank
	
end

--Black Jack
create_joker({
    name = 'Black Jack', id = 0,
    rarity = 'Common', cost = 4,
	
    blueprint = true, eternal = true,
	
	vars = {{maxRank = 21}, {chips = 0}},
	
    calculate = function(self, card, context)
		--This part handles the chip reward
		if context.joker_main then
		  return {
			chip_mod = card.ability.extra.chips,
			message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
		  }
		end
	
		--This part handles the scaling
		if context.before and context.scoring_hand and not context.blueprint then
		
			local totalRank = blackJack_evalrank(context.scoring_hand, card.ability.extra.maxRank)
		
			if totalRank < card.ability.extra.maxRank then
				card.ability.extra.chips = card.ability.extra.chips + totalRank
				
				return {
					message = 'Upgraded!',
					colour = G.C.CHIPS,
					card = card
				}
			elseif totalRank == card.ability.extra.maxRank then
				card.ability.extra.chips = card.ability.extra.chips + totalRank
				card.ability.extra.chips = card.ability.extra.chips * 2
				
				local popup_msg = 'Black Jack!'
				if card.ability.extra.maxRank ~= 21 then
					popup_msg = 'Black Jack...?'
				else
				
				end
				
				event({ trigger = 'after', delay = 0.2, func = function()
                play_sound('multhit1')
				return true end })
				
				return {
					message = popup_msg,
					colour = G.C.RED,
					card = card
				}
			else
				card.ability.extra.chips = 0
				
				event({ trigger = 'after', delay = 0.2, func = function()
                play_sound('tarot1')
				return true end })
				
				return {
					message = 'Busted...',
					colour = G.C.BLACK,
					card = card
				}
			end
			
			
		end
  end
})

--What
create_joker({
    name = 'What', id = 0,
    rarity = 'Rare', cost = 4,
	
    blueprint = true, eternal = true,
	
	vars = { {chips = 420}, {mult = 69} },
	
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card.base.value == 'unstb_???' then
				return {
				  chips = card.ability.extra.chips,
				  mult = card.ability.extra.mult,
				  card = context.other_card
				}
		end
    end
  end
})
--Decimal-line Jokers

local function is_decimal(card)
	return SMODS.Ranks[card.base.value].is_decimal
end

create_joker({
    name = 'Floating Point Error', id = 0,
    rarity = 'Uncommon', cost = 4,
	
    blueprint = true, eternal = true,
	
	--vars = { {bonus = 10}},
	
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			local currentCard = context.other_card
			if is_decimal(currentCard) then
				--big_juice(card)
			
				currentCard.ability.perma_bonus = (currentCard.ability.perma_bonus or 0) + SMODS.Ranks[currentCard.base.value].nominal
				
				event({ trigger = 'after', func = function()
				big_juice(card)
				return true end })
				
				return {
                    extra = {message = "Upgrade!", colour = G.C.CHIPS},
                    colour = G.C.CHIPS,
                    card = currentCard
                }
			end
		end
	end
})


--Enhancement-line Jokers

--Quintuplets
create_joker({
    name = 'Quintuplets', id = 0,
    rarity = 'Rare', cost = 4,
	
    blueprint = true, eternal = true,
	
	vars = {{scoring_name = ''}, {scoring_hand = {}}},
	
	custom_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_TAGS.tag_negative
    end,
	
    calculate = function(self, card, context)
		--Keep track of scoring hand
		if context.after and context.scoring_name ~= nil and context.scoring_hand and not context.blueprint then
			card.ability.extra.scoring_name = context.scoring_name
			card.ability.extra.scoring_hand = context.scoring_hand
		end
		
		if context.end_of_round and card.ability.extra.scoring_name == 'Flush Five' then
		
			local isActivated = true
			
			for i = 1, #card.ability.extra.scoring_hand do
                if card.ability.extra.scoring_hand[i].config.center == G.P_CENTERS.c_base then
					isActivated = false
					break
				end
            end
			
			if isActivated then
				if not context.blueprint then
					card.ability.extra.scoring_name = ''
				end
				
				event({	 trigger = 'after', delay = 0.3, func = function()
								add_tag(Tag('tag_negative'))
								play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
								play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
								
								return true end
						}
					)
			end
		end
	end
})

--Edition-line Jokers

--"Upgrade" function, used on card
local function edition_upgrade(card)
	local edition = (card.edition or {}).key

	if not edition then
		card:set_edition("e_foil", true, false)
	elseif edition=="e_foil" then
		card:set_edition("e_holo", true, false)
	elseif edition=="e_holo" then
		card:set_edition("e_polychrome", true, false)
	end
end

--Connoiseur
create_joker({
    name = 'Connoiseur', id = 0,
    rarity = 'Rare', cost = 4,
	
    blueprint = true, eternal = true,
	
	vars = {{ repetitions = 1 }},
	
    calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only then
		  if context.other_card.edition  then
			return {
			  message = 'Again!',
			  repetitions = card.ability.extra.repetitions,
			  -- The card the repetitions are applying to is context.other_card
			  card = context.other_card
			}
		  end
    end
  end
})

--Jeweler
create_joker({
    name = 'Jeweler', id = 0,
    rarity = 'Uncommon', cost = 4,
	
	vars = {{odds = 4}},
	
    custom_vars = function(self, info_queue, card)
        local vars
        if G.GAME and G.GAME.probabilities.normal then
            vars = {G.GAME.probabilities.normal, card.ability.extra.odds}
        else
            vars = {1, card.ability.extra.odds}
        end
        return {vars = vars}
    end,
	
    blueprint = false, eternal = true,
	
    calculate = function(self, card, context)
		
		if context.before and not context.blueprint then
		
			if pseudorandom('jeweler'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds then
			
				forced_message("Upgrade!", card, G.C.PURPLE, true, false)
				
				local hand_name = context.scoring_name
				
				if G.GAME.hands[hand_name].level > 0 then
					level_up_hand(card, hand_name, false, -1)
				end
			
				
				
				for i = 1, #context.scoring_hand do
					local current_card = context.scoring_hand[i]
					edition_upgrade(context.scoring_hand[i])
					
					--[[event({delay = 0, trigger = 'before',
						func = function()
							edition_upgrade(current_card)
							
						return true end}
					)]]
				end
			end
		
		end
		
    end
})

--Miscellaneous

--Propagation
create_joker({
    name = 'Propagation', id = 0,
    rarity = 'Rare', cost = 4,
	
	vars = {{odds_en = 4}, {odds_ed = 8}, {odds_s = 12}},
	
    custom_vars = function(self, info_queue, card)
        local vars
        if G.GAME and G.GAME.probabilities.normal then
            vars = {G.GAME.probabilities.normal, card.ability.extra.odds_en, card.ability.extra.odds_ed, card.ability.extra.odds_s}
        else
            vars = {1, card.ability.extra.odds_en, card.ability.extra.odds_ed, card.ability.extra.odds_s}
        end
        return {vars = vars}
    end,
	
    blueprint = false, eternal = true,
	
    calculate = function(self, card, context)
		
		if context.after and context.scoring_hand and #context.scoring_hand > 1 and not context.blueprint then
			local sourceCard = {}
		
			for i = 1, #context.scoring_hand do
				if context.scoring_hand[i].config.center ~= G.P_CENTERS.m_stone then --Check if it is not a Stone card	
					if sourceCard[context.scoring_hand[i].base.value..context.scoring_hand[i].base.suit] then --targetCard exists
						
						local currentCard = context.scoring_hand[i]
						local targetCard = sourceCard[context.scoring_hand[i].base.value..context.scoring_hand[i].base.suit]
						
						
						local isCopyEnhancement = pseudorandom('prop_enh'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_en
						local isCopyEdition = pseudorandom('prop_ed'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_ed
						local isCopySeal = pseudorandom('prop_s'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_s
						
						--Extra check, if the current card and target card have the same status, don't play animation
						
						if currentCard.config.center == targetCard.config.center then
							isCopyEnhancement = false
							
						end
						if (currentCard.edition or {}).key == (targetCard.edition or {}).key then
							isCopyEdition = false
							
						end
						if currentCard.seal == targetCard.seal then
							isCopySeal = false
						end
						
						local isPlayingAnimation = isCopyEnhancement or isCopyEdition or isCopySeal
						
						if isPlayingAnimation then
							--Flipping Animation
							event({trigger = 'after', delay = 0.1, func = function() currentCard:flip(); play_sound('card1', 1); currentCard:juice_up(0.3, 0.3); return true end })
							
							--Changing Card Property
							event({trigger = 'after', delay = 0.05,  func = function()
							
							--Copy enhancement
							if isCopyEnhancement then
								currentCard:set_ability(targetCard.config.center)
							end
							
							--Copy edition
							if isCopyEdition then
								currentCard:set_edition(targetCard.edition, true, true)
							end
							
							--Copy seal
							if isCopySeal then
								currentCard:set_seal(targetCard.seal, true, true)
							end
							
							return true end })
							
							--Unflipping Animation
							event({trigger = 'after', delay = 0.1, func = function() currentCard:flip(); play_sound('tarot2', 1, 0.6); big_juice(card); currentCard:juice_up(0.3, 0.3); return true end })
							forced_message("Copied!", currentCard, G.C.RED, true)
						end
					else --set the target card to the following
						sourceCard[context.scoring_hand[i].base.value..context.scoring_hand[i].base.suit] = context.scoring_hand[i]
					end	
				end
			end
		
		end
		
    end
})
----------------------------------------------
------------MOD CODE END----------------------
