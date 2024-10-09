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

--Creates an atlas for Jokers to use
SMODS.Atlas {
  -- Key for code to find it with
  key = "unstb_jokers",
  -- The name of the file, for the code to pull the atlas from
  path = "jokers.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

SMODS.Atlas {
  -- Key for code to find it with
  key = "unstb_jokers_wip",
  -- The name of the file, for the code to pull the atlas from
  path = "jokers_wip.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

--Atlas for new enhancements

SMODS.Atlas {
  -- Key for code to find it with
  key = "unstb_back",
  -- The name of the file, for the code to pull the atlas from
  path = "back.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

SMODS.Atlas {
  -- Key for code to find it with
  key = "enh_slop",
  -- The name of the file, for the code to pull the atlas from
  path = "enh_slop.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

SMODS.Atlas {
  -- Key for code to find it with
  key = "enh_slop_hc",
  -- The name of the file, for the code to pull the atlas from
  path = "enh_slop_hc.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

SMODS.Atlas {
  -- Key for code to find it with
  key = "enh_resource",
  -- The name of the file, for the code to pull the atlas from
  path = "enh_res.png",
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
	
	--If the joker has no art, fallback to WIP sheet
	if joker.no_art then
		joker.atlas = 'unstb_jokers_wip'
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

--New Enhancements
 
--Patch get_chip_bonus to allow total chip override
local cardGetChipBonusPointer = Card.get_chip_bonus
 
function Card:get_chip_bonus()
 
	if self.config.center.override_chip then
		return self.config.center.override_chip
	end
	
	return cardGetChipBonusPointer(self)
end
 
--Acorn
SMODS.Enhancement {
	key = "acorn",
	atlas = "unstb_back",
	pos = {x=1, y = 0},
	
    replace_base_card = false,
    no_suit = false,
    no_rank = false,
    always_scores = false,
	override_chip = 0,
	
	
	config = {extra = { totalchips = 0, originalchips = 0}},
	
	loc_vars = function(self, info_queue, card)
        return {
            vars = { card.base.nominal*2 }
        }
    end,
	
	loc_txt = loc["enh_acorn"],
	
	--Override genere_ui so it does not display any chips
	generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
            SMODS.Enhancement.super.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,

	
	calculate = function(self, card, context, ret)
        if context.cardarea == G.play and not context.repetition then
            --SMODS.eval_this(card, {chip_mod = card.ability.extra.chips, message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}}} )	
			
			event({trigger = 'after', delay = 0.05,  func = function()
				play_sound('tarot2', 1, 0.4);
				return true end })
			
			forced_message("Not Allowed!", card, G.C.RED, true)				
        end
		
		if context.cardarea == G.hand and not context.repetition then
			card.ability.extra.totalchips = card.base.nominal * 2
			
			if not card.debuff then
				ret.h_chips = card.ability.extra.totalchips
			end
			
		end
    end
 }
 
--Vintage
SMODS.Enhancement {
	key = "vintage",
	atlas = "unstb_back",
	pos = {x=2, y = 0},
	
	
	config = {extra = { bonus_chip = 0, chip_gain_rate = 3, current_odd = 1, odd_destroy = 25, destroy_rate = 1}},
	
	loc_vars = function(self, info_queue, card)
		
		local odds_current = card.ability.extra.current_odd or 1
		local destroy_rate = card.ability.extra.destroy_rate
		
		if G.GAME and G.GAME.probabilities.normal then
			odds_current = odds_current * G.GAME.probabilities.normal
			destroy_rate = destroy_rate * G.GAME.probabilities.normal
		end
	
        return {
            vars = { card.ability.extra.chip_gain_rate, odds_current, card.ability.extra.odd_destroy, destroy_rate}
        }
    end,
	
	loc_txt = loc["enh_vintage"],

	
	calculate = function(self, card, context, ret)
        if context.cardarea == G.play and not context.repetition then
			card.ability.perma_bonus = (card.ability.perma_bonus or 0) + card.ability.extra.chip_gain_rate
			forced_message("Upgrade!", card, G.C.CHIPS, true)
        end
    end,
	
	after_play = function(self, card, context) 
		local isDestroy = pseudorandom('vintage'..G.SEED) < card.ability.extra.current_odd * G.GAME.probabilities.normal / card.ability.extra.odd_destroy
		
		if isDestroy then
			event({trigger = 'after', delay = 0.05,  func = function()
				play_sound('tarot2', 1, 0.4);
				return true end })
		
			forced_message("Torn...", card, G.C.BLACK, true)
			card.to_destroy = true
		else
			card.ability.extra.current_odd = (card.ability.extra.current_odd or 0) + card.ability.extra.destroy_rate
		end
	end,
 }
 
 --Promo
SMODS.Enhancement {
	key = "promo",
	atlas = "unstb_back",
	pos = {x=3, y = 0},
	
    replace_base_card = false,
    no_suit = false,
    no_rank = false,
    always_scores = false,
	
	config = {extra = { gold = 0, gold_rate = 1, odds_destroy = 8}},
	
	loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.gold, card.ability.extra.gold_rate, (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds_destroy }
        }
    end,
	
	loc_txt = loc["enh_promo"],
	
	calculate = function(self, card, context, ret)
        if context.cardarea == G.play and not context.repetition then
           card.ability.extra.gold = (card.ability.extra.gold or 0) + card.ability.extra.gold_rate
		   --card.ability.h_dollars = card.ability.extra.gold
		   
		   forced_message("Upgrade!", card, G.C.GOLD, true)	 
        end
		
		if context.cardarea == G.hand and not context.repetition then
			--Hacky way to make it grant money from hand
			ret.dollars = card.ability.extra.gold
		end
		
    end,
	
	after_play = function(self, card, context) 
		local isDestroy = pseudorandom('promo'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_destroy
		
		if isDestroy then
			event({trigger = 'after', delay = 0.05,  func = function()
				play_sound('tarot2', 1, 0.4);
				return true end })
		
			forced_message("Sold", card, G.C.ORANGE, true)
			card.to_destroy = true
		end
	end,
 }
 
 --Slop
SMODS.Enhancement {
	key = "slop",
	
	lc_atlas = "enh_slop",
	hc_atlas = "enh_slop_hc",
	
	atlas = "enh_slop",
	is_hc = false,
	
	pos = {x=0, y = 0},
	
	replace_base_card = true,
    no_suit = false,
    no_rank = false,
    always_scores = true,
	
	config = {extra = { suit = 'Spades', rank = '2', chips = 0}},
	
	loc_vars = function(self, info_queue, card)
	
		local suit_text = 'undefined'
		local suit_text_color = {}
		
		if card.ability then
			suit_text = localize(card.ability.extra.suit, 'suits_plural');
			suit_text_color = G.C.SUITS[card.ability.extra.suit]
		end
	
        return {
            vars = { card.ability.extra.chips or 0, suit_text, card.ability.extra.rank or 0 ,
			colours = {suit_text_color} }
        }
    end,
	
	loc_txt = loc["enh_slop"],
	
	suit_map = {
		Hearts = 0,
        Clubs = 1,
        Diamonds = 2,
        Spades = 3,
	},
	
	set_sprites = function(self, card, initial, delay_sprites)
		local isCollection = (card.area and card.area.config.collection) or false
		
		if not isCollection and card.ability and card.ability.extra then
			local suit = (card.base and card.base.suit) or 'Spades'
			
			local pos  = {x = self.suit_map[suit]+1 or 0, y = 0}
				
			card.children.center:set_sprite_pos(pos)
		end
		
    end,
	
	set_ability = function(self, card, initial, delay_sprites)
		if card.base then
			card.ability.extra.suit = card.base.suit or 'Hearts'
			card.ability.extra.rank = card.base.value or '2'
			card.ability.extra.chips = SMODS.Ranks[card.ability.extra.rank].nominal
		end
    end,
	
	update = function(self, card) 
	
		--Jank, supporting for high contrast texture change settings
		if G.SETTINGS.colourblind_option ~= card.atlasmode then
		
			if G.SETTINGS.colourblind_option then
				self.atlas = self.hc_atlas			
			else
				self.atlas = self.lc_atlas
			end
			card.children.center.atlas = G.ASSET_ATLAS[self.atlas]
			card.atlasmode = G.SETTINGS.colourblind_option
			
		end
	
		--Update the value for the 'wise' player who tries to change card value using tarots
		if (card.VT.w <= 0) and card.base.suit and card.base.value then
			local isCollection = (card.area and card.area.config.collection) or false
		
			if not isCollection then
				card.ability.extra.suit = card.base.suit or 'Hearts'
				card.ability.extra.rank = card.base.value or '2'
				card.ability.extra.chips = SMODS.Ranks[card.ability.extra.rank].nominal
				
				local suit = (card.base and card.base.suit) or 'Spades'
				local pos  = {x = self.suit_map[suit]+1 or 0, y = 0}	
				card.children.center:set_sprite_pos(pos)
			end
		end
    end,
	
	calculate = function(self, card, context, ret)
        if context.cardarea == G.play and not context.repetition then
			local scoredAmount = card.ability.extra.chips + card.ability.perma_bonus
			SMODS.eval_this(card, {chip_mod = scoredAmount, message = localize{type='variable',key='a_chips',vars={scoredAmount}}} )
        end
    end,
	
	after_play = function(self, card, context) 
		
		forced_message("Randomize!", card, G.C.RED, true)
		
		event({trigger = 'after', delay = 0.05,  func = function()
			card.ability.extra.suit = pseudorandom_element(SMODS.Suits, pseudoseed('slop_card')..G.SEED).key
			card.ability.extra.rank = pseudorandom_element(SMODS.Ranks, pseudoseed('slop_card')..G.SEED).key
			
			card.ability.extra.chips = SMODS.Ranks[card.base.value].nominal
			
			local suit_data = SMODS.Suits[card.ability.extra.suit]
			local suit_prefix = suit_data.card_key
			
			local targetCard = suit_prefix .. '_' ..SMODS.Ranks[card.ability.extra.rank].card_key
			
			--print(targetCard)
			
			card:set_base(G.P_CARDS[targetCard])
			
			local suit = (card.base and card.base.suit) or 'Spades'
			local pos  = {x = self.suit_map[suit]+1 or 0, y = 0}	
			card.children.center:set_sprite_pos(pos)
			
		return true end })
	end,
	
	--This cannot spawn naturally at all
	in_pool = function(self, args)
        return false
    end
 }
 
 --Resource
 SMODS.Enhancement {
	key = "resource",
	atlas = "enh_resource",
	pos = {x=0, y = 0},
	
    replace_base_card = true,
    --no_suit = false,
    no_rank = true,
    always_scores = true,
	
	config = {extra = { xmult = 5, suit = "undefined"} },
	
	loc_vars = function(self, info_queue, card)
	
		local suit_text = 'undefined'
		local suit_text_color = {}
		
		if card.ability then
			suit_text = card.ability.extra.suit;
			
			if suit_text ~= '(Corresponding Suit)' then
				suit_text = localize(card.ability.extra.suit, 'suits_singular');
				suit_text_color = G.C.SUITS[card.ability.extra.suit]
			else
				suit_text_color = G.C.ORANGE
			end
		end
	
        return {
            vars = { (card.ability and card.ability.extra.xmult) or 5, suit_text,
			colours = {suit_text_color} }
        }
    end,
	
	suit_map = {
		Hearts = 0,
        Clubs = 1,
        Diamonds = 2,
        Spades = 3,
	},
	
	loc_txt = loc["enh_resource"],
	
	set_sprites = function(self, card, initial, delay_sprites)
		
		local isCollection = (card.area and card.area.config.collection) or false
		
		if not isCollection and card.ability and card.ability.extra then
			local suit = (card.base and card.base.suit) or 'Spades'
			
			card.ability.extra.suit = suit
				
			local pos  = {x = self.suit_map[suit]+2 or 1, y = 0}
				
			card.children.center:set_sprite_pos(pos)
		end
		
    end,
	
	update = function(self, card)
		if (card.VT.w <= 0 or card.ability.extra.suit == 'undefined') then
			local isCollection = (card.area and card.area.config.collection) or false
		
			if not isCollection then
				card.ability.extra.suit = card.base.suit
				card.children.center:set_sprite_pos({x = self.suit_map[card.base.suit]+2 or 1, y = 0})
			else 
				card.ability.extra.suit = "(Corresponding Suit)"
			end
		end
    end,
	
	calculate = function(self, card, context)

        if context.cardarea == G.play and not context.repetition then
		
			
		
			local has_suit = false
			
			if context.scoring_hand then
				for i = 1, #context.scoring_hand do
					local currentCard = context.scoring_hand[i]
					if currentCard ~= card and currentCard.config.center ~= G.P_CENTERS.m_unstb_resource and currentCard.base.suit == card.ability.extra.suit then				
						has_suit = true
						break
					end
				end
			end
			
			if has_suit then
				--[[event({trigger = 'after',  func = function()
				play_sound('multhit1')
				return true end })]]
				
				SMODS.eval_this(card, {Xmult_mod = card.ability.extra.xmult, message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}}} )
				
				card.ability.extra.to_destroy = true
			else
				event({trigger = 'after', delay = 0.05,  func = function()
				play_sound('tarot2', 1, 0.4);
				return true end })

				forced_message("Invalid", card, G.C.GRAY, true)
			end
			
			return {
			  repetitions = -1,
			  card = context.other_card
			}
        end
    end,
	
	--Injected the trigger using lovely, can be used for any post-play enchantment stuff
	after_play = function(self, card, context) 
		if card.ability.extra.to_destroy then
			forced_message("Redeemed!", card, G.C.RED, true)
				
			card.to_destroy = true
		end
	end,
	
	--This cannot spawn naturally at all
	in_pool = function(self, args)
        return false
    end
 }
 
--"Negative" Enhancements

--Radioactive
SMODS.Enhancement {
	key = "radioactive",
	atlas = "unstb_back",
	pos = {x=0, y = 0},
	
	
	
    replace_base_card = true,
    no_suit = true,
    no_rank = true,
    always_scores = true,
	
	config = {extra = { chips = 13, odds_conv = 2, odds_mult = 3, mult_good = 2.5, mult_bad = 0.5 }, h_x_mult = 0.5},
	
	loc_vars = function(self)
        return {
            vars = { self.config.extra.chips, (G.GAME and G.GAME.probabilities.normal or 1), self.config.extra.odds_conv, self.config.extra.odds_mult, self.config.extra.mult_good, self.config.extra.mult_bad }
        }
    end,
	
	loc_txt = loc["enh_radioactive"],
    
	
	calculate = function(self, card, context)
        if context.cardarea == G.play and not context.repetition then
            SMODS.eval_this(card, {chip_mod = card.ability.extra.chips, message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}}} )
			
			if #context.scoring_hand > 1 then
				local target = context.scoring_hand[math.random(#context.scoring_hand)]
				
				
				if target.config.center ~= G.P_CENTERS.m_unstb_radioactive and pseudorandom('radioactive'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_conv then
					--Flipping Animation
					event({trigger = 'after', delay = 0.1, func = function() target:flip(); play_sound('card1', 1); target:juice_up(0.3, 0.3); return true end })
					
					--Changing Card Property
					
					event({trigger = 'after', delay = 0.05,  func = function()
					
						target:set_ability(G.P_CENTERS.m_unstb_radioactive)
						
						return true end })
					
					--Unflipping Animation
					event({trigger = 'after', delay = 0.1, func = function() target:flip(); play_sound('tarot2', 1, 0.6); big_juice(card); target:juice_up(0.3, 0.3); return true end })

					forced_message("Decayed!", target, G.C.RED, true)
				else
					forced_message("Safe!", card, G.C.GREEN, true)
				end
				
			end
			
			
        end
		
		if context.cardarea == G.hand and not context.repetition then
			--Xmult handling ability is built-in, so this one just checks for odds and alter it respectively.
			if pseudorandom('radioactive'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_mult then
				card.ability.h_x_mult = 2.5
			else
				card.ability.h_x_mult = 0.5
			end
			
		end
    end,
	
	--This cannot spawn naturally at all
	in_pool = function(self, args)
        return false
    end
 }
 
--New Ranks

--Pool flag wrapper function to help assist managing ranks enable / disable
function setPoolRankFlagEnable(rank, isEnable)
	if not G.GAME then return end
	
	G.GAME.pool_flags[rank] = isEnable
end

function getPoolRankFlagEnable(rank)
	return (G.GAME and G.GAME.pool_flags[rank] or false)
end

--Shared pool rank checking function
local function unstb_rankCheck(self, args)
	if args and args.initial_deck then
        return false
    end
	return getPoolRankFlagEnable(self.key)
end

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
	
	in_pool = unstb_rankCheck,
}

SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	loc_txt = loc.ranks['0'],
	hidden = true,

    key = '0',
    card_key = '0',
    pos = { x = 6 },
    nominal = 0,
    next = { 'unstb_1' },
    shorthand = '0',
	
	straight_edge = true,
	
	in_pool = unstb_rankCheck,
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
	
	in_pool = unstb_rankCheck,
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
	
	in_pool = unstb_rankCheck,
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
	
	in_pool = unstb_rankCheck,
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
	
	in_pool = unstb_rankCheck,
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
	
	in_pool = unstb_rankCheck,
}

--Change straight edge off from Ace, so it start to look at rank 0 instead
SMODS.Rank:take_ownership('Ace', {
	straight_edge = false
}, true)

-- Poker Hand Rewrite to support new ranks probably?

local function get_keys(t)
  local keys={}
  for key,_ in pairs(t) do
    table.insert(keys, key)
  end
  return keys
end

local isAllowDecimal = true

local decimalHands = {['unstb_0.5'] = {0, 1}, ['unstb_e'] = {2, 3}, ['unstb_Pi'] = {3, 4}}

function ustb_get_straight(hand)

	local ret = {}
	if #hand < (5 - (four_fingers and 1 or 0)) then return ret end
	
	local hasDecimal = false
	for i = 1, #hand do
		if decimalHands[hand[i].base.value] then
			hasDecimal = true
			break
		end
	end
	
	if hasDecimal then
		--print('Has decimal')
		return ustb_straight_decimal(hand) 
	else
		--print('do not has decimal')
		return get_straight(hand) 
	end
end

function ustb_straight_decimal(hand) 

	--TODO: Figure this out what to do later

	--Basically SMOD's implementation of straight, but w/ extra implementations to support decimal ranks

	local ret = {}
	local four_fingers = next(SMODS.find_card('j_four_fingers'))
	local can_skip = next(SMODS.find_card('j_shortcut'))
	
	if #hand < (5 - (four_fingers and 1 or 0)) then return ret end
	
	local t = {}
	local RANKS = {}
	for i = 1, #hand do
		if hand[i]:get_id() > 0 then
			local rank = hand[i].base.value	
			RANKS[rank] = RANKS[rank] or {}
			RANKS[rank][#RANKS[rank] + 1] = hand[i]
		end
	end
	
	local straight_length = 0
	local straight = false
	local skipped_rank = false
	local vals = {}
	for k, v in pairs(SMODS.Ranks) do
		if v.straight_edge then
			table.insert(vals, k)
		end
	end
	
	local init_vals = {}
	for _, v in ipairs(vals) do
		init_vals[v] = true
	end
	if not next(vals) then table.insert(vals, 'Ace') end
	
	local initial = true
	local br = false
	local end_iter = false
	local i = 0
	
	while 1 do
		end_iter = false
		if straight_length >= (5 - (four_fingers and 1 or 0)) then
			straight = true
		end
		i = i + 1
		if br or (i > #SMODS.Rank.obj_buffer + 1) then break end
		if not next(vals) then break end
		for _, val in ipairs(vals) do
			if init_vals[val] and not initial then br = true end
			if RANKS[val] then
				straight_length = straight_length + 1
				skipped_rank = false
				for _, vv in ipairs(RANKS[val]) do
					t[#t + 1] = vv
				end
				
				vals = SMODS.Ranks[val].next
				
				initial = false
				end_iter = true
				break
			end
		end
		if not end_iter then
			local new_vals = {}
			for _, val in ipairs(vals) do
				for _, r in ipairs(SMODS.Ranks[val].next) do
					table.insert(new_vals, r)
				end
			end
			vals = new_vals
			if can_skip and not skipped_rank then
				skipped_rank = true
			else
				straight_length = 0
				skipped_rank = false
				if not straight then t = {} end
				if straight then break end
			end
		end
	end
	if not straight then return ret end
	table.insert(ret, t)
	
	return ret
end

SMODS.PokerHandPart:take_ownership('_straight', {
	func = function(hand) return ustb_get_straight(hand) end
})


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
    name = 'Black Jack', id = 1, no_art = true,
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
				card.ability.extra.chips = card.ability.extra.chips + totalRank * 2
				
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
    name = 'What', id = 1, no_art = true,
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
    name = 'Floating Point Error', id = 1, no_art = true,
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

--Binary-line Jokers

create_joker({
    name = 'Social Experiment', id = 1, no_art = true,
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
	
	set_ability = function(self, card, initial, delay_sprites)
		--Enable 0 rank card in pools
		setPoolRankFlagEnable('unstb_0', true);
    end,
	
    calculate = function(self, card, context)
		
		if context.after and context.scoring_hand and #context.scoring_hand > 1 and not context.blueprint then
			local totalChipCount = 0
		
			for i = 1, #context.scoring_hand do
				if i<#context.scoring_hand and not (context.scoring_hand[i]:is_face() and context.scoring_hand[i].config.center ~= G.P_CENTERS.m_stone) then --context.scoring_hand[i].config.center ~= G.P_CENTERS.m_stone then --Check if it is not a Stone card	
					local currentCard = context.scoring_hand[i]
					
					local bonusChip = currentCard.ability.perma_bonus or 0
					
					
					local baseChip = SMODS.Ranks[currentCard.base.value].nominal
					
					if currentCard.config.center == G.P_CENTERS.m_stone then
						baseChip = 0
						bonusChip = bonusChip + 50
					end
					
					if bonusChip + baseChip > 0 then
					
						context.scoring_hand[i+1].ability.perma_bonus = (context.scoring_hand[i+1].ability.perma_bonus or 0) + (bonusChip + baseChip)*2
						
						totalChipCount = totalChipCount + bonusChip + baseChip
						
						currentCard.ability.perma_bonus = 0
						
						--Flipping Animation
						event({trigger = 'after', delay = 0.1, func = function() currentCard:flip(); play_sound('card1', 1); currentCard:juice_up(0.3, 0.3); return true end })
						
						--Changing Card Property
						
						event({trigger = 'after', delay = 0.05,  func = function()
						
							local suit_data = SMODS.Suits[currentCard.base.suit]
							local suit_prefix = suit_data.card_key
							
							currentCard:set_base(G.P_CARDS[suit_prefix .. '_unstb_0' ])
							
							--Un-stoned the stone card
							if currentCard.config.center == G.P_CENTERS.m_stone then
								currentCard:set_ability(G.P_CENTERS.c_base)
							end
							
							return true end })
						
						--Unflipping Animation
						event({trigger = 'after', delay = 0.1, func = function() currentCard:flip(); play_sound('tarot2', 1, 0.6); big_juice(card); currentCard:juice_up(0.3, 0.3); return true end })
						forced_message("Double It!", currentCard, G.C.CHIPS, true)
					end
					
				else
					if totalChipCount > 0 then
						local currentCard = context.scoring_hand[i]
						
						event({ trigger = 'after', delay = 0.2, func = function()
						big_juice(currentCard)
						play_sound('multhit1')
						return true end })
						
						forced_message("Take!", currentCard, G.C.CHIPS, true)
						
						totalChipCount = 0
					end
				end
			end
		
		end
		
    end
})

--Enhancement-line Jokers

--Quintuplets
create_joker({
    name = 'Quintuplets', id = 2,
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
    name = 'Connoiseur', id = 1, no_art = true,
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

--Inductor
create_joker({
    name = 'Inductor', id = 1,
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

--Compatibility / Tweaks / Rework Stuff

--Deck Preview UI supports for hiding modded ranks
filesystem.load(unStb.path..'/override/ui.lua')()

----------------------------------------------
------------MOD CODE END----------------------
