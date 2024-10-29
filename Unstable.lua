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

--Global Table
unstb_global = {}

--Localization Messages
local loc = filesystem.load(unStb.path..'localization.lua')()
unstb_global.loc = loc

-- Debug message

local function print(message)
    sendDebugMessage('[UnStable] - '..(tostring(message) or '???'))
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

--Atlas for Suit Seals
SMODS.Atlas {
  -- Key for code to find it with
  key = "suit_seal",
  -- The name of the file, for the code to pull the atlas from
  path = "suit_seal.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

--Atlas for Booster Pack
SMODS.Atlas {
  -- Key for code to find it with
  key = "booster",
  -- The name of the file, for the code to pull the atlas from
  path = "booster.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

--Atlas for Auxiliary Cards
SMODS.Atlas {
  -- Key for code to find it with
  key = "auxiliary",
  -- The name of the file, for the code to pull the atlas from
  path = "auxiliary.png",
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

--Music

local aux_music_enable = true

SMODS.Sound({
	key = "music_aux",
	path = "music_aux.ogg",
	select_music_track = function()
		return aux_music_enable
			and ( G.pack_cards and G.pack_cards.cards and G.pack_cards.cards[1] and G.pack_cards.cards[1].ability.set == "Auxiliary")
	end,
})

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
        remove_from_deck = joker.remove_from_deck,
        add_to_deck = joker.add_to_deck,
		
        set_ability = joker.set_ability,
		set_sprites = joker.set_sprites,
		load = joker.load,
		
        in_pool = joker.custom_in_pool or pool,

        effect = joker.effect
        }
end

--Black Jack Rank Calculation
local function blackJack_evalrank(hand, bustAmount)
	--Black Jack-style total rank evaluation
	
	bustAmount = bustAmount or 21
	
	local aceCount = 0
	local rank = 0
	
	for i = 1, #hand do
		local currentCard = hand[i]
		if not (currentCard.config.center == G.P_CENTERS.m_stone or currentCard.config.center.no_rank) and not currentCard.debuff  then
			
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

--Face Seal

SMODS.Seal({
    key = "face",
    atlas = "suit_seal",
	
    pos = { x = 4, y = 0 },
    badge_colour = HEX "f59c00",
	shiny = true,
	
    weight = 0,
    config = {extra = {}},
    loc_txt = loc["seal_face"],
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    --[[calculate = function(self, card, context)

    end]]
	
	--This cannot spawn naturally at all
	in_pool = function(self, args)
        return false
    end
	})

--Hook into is_face to account for Face Seal
local card_isfaceref = Card.is_face

function Card:is_face(from_boss)
    if self.debuff and not from_boss then return end
	
	if self.seal == 'unstb_face' then
		return true
	end
	
	return card_isfaceref(self, from_boss)
end

--Suit Seals

--Global table for Suit Seals-related stuff
SuitSeal = {}

SuitSeal.suit_seal_colors = {
	Spades = HEX "603de8",
	Hearts = HEX "e83d61",
	Clubs = HEX "19b8a1",
	Diamonds = HEX "e8793d",
}

--External function to supports register more suits (especially modded) if needed
function SuitSeal.registerSealColor(suit, color)
	SuitSeal.suit_seal_colors[suit] = HEX(color)
end

--Creating an actual SMODS Seal object
function SuitSeal.initSeal(suit, atlas, posX)
	SMODS.Seal({
    key = string.lower(suit),
    atlas = atlas or "suit_seal",
	
	--Extra field for suit seal only, 
	suit_seal = suit,
	
    pos = { x = posX or 0, y = 0 },
    badge_colour = SuitSeal.suit_seal_colors[suit],
    weight = 0,
    config = {extra = {}},
    loc_txt = loc["seal_"..string.lower(suit)],
    loc_vars = function(self, info_queue, card)
        return {vars = {localize(self.suit_seal, 'suits_plural'), colours = {G.C.SUITS[self.suit_seal]}}}
    end,
	
	--This cannot spawn naturally at all
	in_pool = function(self, args)
        return false
    end
	})
end

local suit_seal_list = {"Spades", "Hearts", "Clubs", "Diamonds"}

for i = 1, #suit_seal_list do
	SuitSeal.initSeal(suit_seal_list[i], "suit_seal", i-1 )
end


--New Enhancements
 
 function get_valid_card_from_deck(seed)
    
	local res_suit = 'Spades'
	local res_rank = '2'
	
    local valid_cards = {}
    for k, v in ipairs(G.playing_cards) do
        if not v.config.center.replace_base_card  then --Excludes all cards with replace_base_card enhancements
            valid_cards[#valid_cards+1] = v
        end
    end
    if valid_cards[1] then 
        local target_card = pseudorandom_element(valid_cards, pseudoseed(seed or 'validcard'..G.GAME.round_resets.ante))
		
        res_suit = target_card.base.suit
		res_rank = target_card.base.value
    end
	
	return {suit = res_suit, rank = res_rank}
end
 
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
	pos = {x=0, y = 0},
	
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
	pos = {x=1, y = 0},
	
	
	config = {extra = { bonus_chip = 0, chip_gain_rate = 3, current_odd = 0, odd_destroy = 25, destroy_rate = 1}},
	
	loc_vars = function(self, info_queue, card)
		
		local odds_current = card.ability.extra.current_odd or 0
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
			card.ability.extra.current_odd = (card.ability.extra.current_odd or 0) + card.ability.extra.destroy_rate
			
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
		end
	end,
 }
 
 --Promo
SMODS.Enhancement {
	key = "promo",
	atlas = "unstb_back",
	pos = {x=2, y = 0},
	
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
			if not card.debuff then
				ret.dollars = card.ability.extra.gold
			end
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
            vars = { card.ability.extra.chips or 0, suit_text, localize(card.ability.extra.rank or '2', 'ranks')  ,
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
	
	set_sprites = function(self, card, front)
		local isCollection = (card.area and card.area.config.collection) or false
		
		if not isCollection and card.ability and card.ability.extra then
			local suit = (card.base and card.base.suit) or 'Spades'
			
			local pos  = {x = (self.suit_map[suit] or -1) +1, y = 0}
				
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
				local pos  = {x = (self.suit_map[suit] or -1)+1, y = 0}	
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
	
	set_sprites = function(self, card, front)
		
		local isCollection = (card.area and card.area.config.collection) or false
		
		if not isCollection and card.ability and card.ability.extra then
			local suit = (card.base and card.base.suit) or 'Spades'
			
			card.ability.extra.suit = suit
				
			local pos  = {x = (self.suit_map[suit] or -1)+2 or 1, y = 0}
				
			card.children.center:set_sprite_pos(pos)
		end
		
    end,
	
	update = function(self, card)
		if (card.VT.w <= 0 or card.ability.extra.suit == 'undefined') then
			local isCollection = (card.area and card.area.config.collection) or false
		
			if not isCollection then
				card.ability.extra.suit = card.base.suit
				card.children.center:set_sprite_pos({x = (self.suit_map[card.base.suit] or -1)+2, y = 0})
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
					if currentCard ~= card and currentCard.config.center ~= G.P_CENTERS.m_unstb_resource and currentCard:is_suit(card.ability.extra.suit) then				
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
	
	--Can spawn when Catan mode enabled
	in_pool = function(self, args)
        return G.GAME.pool_flags.catan_enabled
    end
 }
 
--"Negative" Enhancements

--Radioactive
SMODS.Enhancement {
	key = "radioactive",
	atlas = "unstb_back",
	pos = {x=3, y = 0},
	
	
	
    replace_base_card = true,
    no_suit = true,
    no_rank = true,
    always_scores = true,
	
	config = {extra = { chips = 13, odds_conv = 2, odds_mult = 3, mult_good = 2, mult_bad = 0.5 }, h_x_mult = 1},
	
	loc_vars = function(self)
        return {
            vars = { self.config.extra.chips, (G.GAME and G.GAME.probabilities.normal or 1), self.config.extra.odds_conv, self.config.extra.odds_mult, self.config.extra.mult_good, self.config.extra.mult_bad }
        }
    end,
	
	loc_txt = loc["enh_radioactive"],
    
	set_ability = function(self, card, initial, delay_sprites)
		--Set the hand multiplier the first time
		if pseudorandom('radioactive'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_mult then
			card.ability.h_x_mult = card.ability.extra.mult_good
		else
			card.ability.h_x_mult = card.ability.extra.mult_bad
		end
    end,
	
	calculate = function(self, card, context)
        if context.cardarea == G.play and not context.repetition then
            SMODS.eval_this(card, {chip_mod = card.ability.extra.chips, message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}}} )
			
			if #context.scoring_hand > 1 then
				local target = context.scoring_hand[math.random(#context.scoring_hand)]
				
				--Exclude slop card because it interacts horribly with this
				if target.config.center ~= G.P_CENTERS.m_unstb_radioactive and target.config.center.key ~= 'm_unstb_slop' and pseudorandom('radioactive'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_conv then
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
				card.ability.h_x_mult = card.ability.extra.mult_good
			else
				card.ability.h_x_mult = card.ability.extra.mult_bad
			end
			
		end
    end,
	
	--This cannot spawn naturally at all
	in_pool = function(self, args)
        return false
    end
 }
 
SMODS.Enhancement {
	key = "biohazard",
	atlas = "unstb_back",
	pos = {x=4, y = 0},
	
    replace_base_card = true,
    no_suit = true,
    no_rank = true,
    always_scores = true,
	
	config = {extra = { xmult = 0.9, h_money = 1}},
	
	loc_vars = function(self)
        return {
            vars = { self.config.extra.xmult, self.config.extra.h_money }
        }
    end,
	
	loc_txt = loc["enh_biohazard"],

	
	calculate = function(self, card, context, ret)

		if context.cardarea == G.play and not context.repetition then
			SMODS.eval_this(card, {Xmult_mod = card.ability.extra.xmult, message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}}} )
		end

		if context.discard then
			--check hand card
			local hand_card = {}
			for i = 1, #G.hand.cards do
				hand_card[G.hand.cards[i]] = true
			end
			
			--populate valid cards
			local valid_cards = {}
			for k, v in ipairs(G.playing_cards) do
				if v.config.center ~= G.P_CENTERS.m_unstb_biohazard and not hand_card[v] then --Excludes all cards with replace_base_card enhancements
					valid_cards[#valid_cards+1] = v
				end
			end
			
			if valid_cards[1] then 
				local target_card = pseudorandom_element(valid_cards, pseudoseed(seed or 'validcard'..G.GAME.round_resets.ante))
				target_card:set_ability(G.P_CENTERS.m_unstb_biohazard , nil, true)
			end
			
		end
		
		if context.cardarea == G.hand and not context.repetition then
			--Hacky way to make it grant money from hand
			if not card.debuff then
				ret.dollars = -card.ability.extra.h_money
			end
		end
    end,
	
	--This cannot spawn naturally at all
	in_pool = function(self, args)
        return false
    end
 }
 
SMODS.Enhancement {
	key = "poison",
	atlas = "unstb_back",
	pos = {x=5, y = 0},
	
    replace_base_card = false,
    no_suit = false,
    no_rank = false,
    always_scores = true,
	
	override_chip = 0,
	
	config = {extra = { chip = 0.9, h_money = 1}},
	
	loc_vars = function(self, info_queue, card)
	
		local chip = 0
		if card and card.base then
			chip = card.base.nominal
		end
	
        return {
            vars = { chip , self.config.extra.h_money }
        }
    end,
	
	loc_txt = loc["enh_poison"],
	
	--Override genere_ui so it does not display any chips
	generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
            SMODS.Enhancement.super.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,

	
	calculate = function(self, card, context, ret)

		if context.cardarea == G.play and not context.repetition then
			local totalChip = card.base.nominal
			SMODS.eval_this(card, {chip_mod = -totalChip})
			forced_message('-'..totalChip, card, G.C.RED, true) --Tried to sent color, but it got override with chips color	fsr	
		end
    end,
	
	discard_override = function(self, card, args) --Discard overridden function, injected by Lovely
		draw_card(G.hand, G.deck, args.delay, 'down', false, card)
		G.deck:shuffle('poison'..G.GAME.round_resets.ante)
	end,
	
	--This cannot spawn naturally at all
	in_pool = function(self, args)
        return false
    end
 }
 
 --Add proper tag to stone cards, nothing should change gameplay-wise
SMODS.Enhancement:take_ownership('m_stone', {
    replace_base_card = true,
    no_suit = true,
    no_rank = true,
    always_scores = true,
    }, true)
 
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
    shorthand = '21', -- used for deck preview
	
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


--Auxiliary Card

SMODS.ConsumableType{
    key = 'Auxiliary',
    primary_colour = HEX('424e54'),
    secondary_colour = HEX('00a669'),
    loc_txt = loc.auxiliary,
    collection_rows = {5, 5}
}

SMODS.UndiscoveredSprite{
    key = 'Auxiliary',
    atlas = 'auxiliary',
    pos = get_coordinates(0)
}

--Booster Pack for Auxiliary Cards
for i = 1, 4 do
    SMODS.Booster{
        key = 'aux_'..(i <= 2 and i or i == 3 and 'jumbo' or 'mega'), loc_txt = loc['auxpack'..(i <= 2 and '' or i == 3 and '_jumbo' or '_mega')],

        config = {extra = i <= 2 and 3 or 5, choose =  i <= 3 and 1 or 2},
        draw_hand = false,

        create_card = function(self, card)
            return create_card('Auxiliary', G.pack_cards, nil, nil, true, true, nil, 'aux')
            -- return {set = 'Polymino', area = G.pack_cards, skip_materialize = nil, soulable = nil, key_append = 'vir'}
        end,

        ease_background_colour = function(self)
            --ease_colour(G.C.DYN_UI.MAIN, G.C.BUNCO_VIRTUAL)
            ease_background_colour{new_colour = HEX('00a669'), special_colour = HEX('7e9999'), contrast = 2}
        end,

        pos = get_coordinates(i-1),
        atlas = 'booster',

        in_pool = function() return (pseudorandom('aux'..G.SEED) < 0.5) end
    }
end

--Original Reserve Card Button Code from MoreFluff (Credits to John Cryptid and Betmma)
G.FUNCS.can_take_card = function(e)
	if #G.consumeables.cards < G.consumeables.config.card_limit then
		  e.config.colour = G.C.GREEN
		  e.config.button = "take_card"
	else
		  e.config.colour = G.C.UI.BACKGROUND_INACTIVE
		  e.config.button = nil
	end
end

G.FUNCS.take_card = function(e)
local c1 = e.config.ref_table
G.E_MANAGER:add_event(Event({
  trigger = "after",
  delay = 0.1,
  func = function()
	c1.area:remove_card(c1)
	c1:add_to_deck()
	if c1.children.price then
	  c1.children.price:remove()
	end
	c1.children.price = nil
	if c1.children.buy_button then
	  c1.children.buy_button:remove()
	end
	c1.children.buy_button = nil
	remove_nils(c1.children)
	
	play_sound('generic1')
	
	G.consumeables:emplace(c1)
	G.GAME.pack_choices = G.GAME.pack_choices - 1
	if G.GAME.pack_choices <= 0 then
	  G.FUNCS.end_consumeable(nil, delay_fac)
	end
	return true
  end,
}))
end

local G_UIDEF_use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
	if (card.area == G.pack_cards and G.pack_cards) and card.ability.consumeable then --Add a use button
	  if card.ability.set == "Auxiliary" then
		return {
		  n = G.UIT.ROOT,
		  config = { padding = -0.1, colour = G.C.CLEAR },
		  nodes = {
			{
			  n = G.UIT.R,
			  config = {
				ref_table = card,
				r = 0.08,
				padding = 0.1,
				align = "bm",
				minw = 0.5 * card.T.w - 0.15,
				minh = 0.7 * card.T.h,
				maxw = 0.7 * card.T.w - 0.15,
				hover = true,
				shadow = true,
				colour = G.C.UI.BACKGROUND_INACTIVE,
				one_press = true,
				button = "use_card",
				func = "can_take_card",
			  },
			  nodes = {
				{
				  n = G.UIT.T,
				  config = {
					text = 'SELECT',
					colour = G.C.UI.TEXT_LIGHT,
					scale = 0.55,
					shadow = true,
				  },
				},
			  },
			},
		  },
		}
	  end
	end
	return G_UIDEF_use_and_sell_buttons_ref(card)
end

--Auxiliary Cards Code Starts Here--

--Suit Seals Addition Cards
for i = 1, #suit_seal_list do
	SMODS.Consumable{
		set = 'Auxiliary', atlas = 'auxiliary',
		key = 'aux_'..string.lower(suit_seal_list[i]), loc_txt = loc['aux_'..string.lower(suit_seal_list[i])],

		config = {extra = {count = 2, seal = 'unstb_'..string.lower(suit_seal_list[i])}},
		discovered = true,

		loc_vars = function(self, info_queue, card)
			local suit = localize(suit_seal_list[i], 'suits_singular') ..' Seal'
			local suit_color = G.C.SUITS[suit_seal_list[i]]
			
			return {vars = {card.ability.extra.count, suit, colours = {suit_color}}}
		end,

		can_use = function(self, card)
			if G.hand and (#G.hand.highlighted == card.ability.extra.count) then
				return true
			end
			return false
		end,

		use = function(self, card)
			
			event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
			
			for i = 1, #G.hand.highlighted do
			event({trigger = 'after', delay = 0.2,
				func = function()
						G.hand.highlighted[i]:set_seal(card.ability.extra.seal, nil, true)
				return true end })
			end
				
			delay(0.5)
			event({trigger = 'after', delay = 0.2,
				func = function()
					G.hand:unhighlight_all();
				return true end })
			
			
		end,

		pos = get_coordinates(i+1),
	}
end

--Face Seal Card
SMODS.Consumable{
	set = 'Auxiliary', atlas = 'auxiliary',
	key = 'aux_face', loc_txt = loc['aux_face'],

	config = {extra = {count = 2, seal = 'unstb_face'}},
	discovered = true,

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.count}}
	end,

	can_use = function(self, card)
		if G.hand and (#G.hand.highlighted == card.ability.extra.count) then
			return true
		end
		return false
	end,

	use = function(self, card)
		
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
		
		for i = 1, #G.hand.highlighted do
		event({trigger = 'after', delay = 0.2,
			func = function()
					G.hand.highlighted[i]:set_seal(card.ability.extra.seal, nil, true)
			return true end })
		end
			
		delay(0.5)
		event({trigger = 'after', delay = 0.2,
			func = function()
				G.hand:unhighlight_all();
			return true end })
		
		
	end,

	pos = get_coordinates(6),
}

-- +2
SMODS.Consumable{
	set = 'Auxiliary', atlas = 'auxiliary',
	key = 'aux_plus_two', loc_txt = loc['aux_plus_two'],

	config = {extra = {count = 2}},
	discovered = true,

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.count}}
	end,

	can_use = function(self, card)
		if G.hand and (#G.hand.highlighted == 1) then
			return true
		end
		return false
	end,

	use = function(self, card)
		
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
		
		local targetCard = G.hand.highlighted[1]
		
		event({
                trigger = 'after',
                delay = 0.7,
                func = function() 
                    local cards = {}
                    for i=1, card.ability.extra.count do
                        cards[i] = true
                        local _rank = pseudorandom_element(SMODS.Ranks, pseudoseed('aux_plus_two')) or SMODS.Ranks['2']
                        local _suit = SMODS.Suits[targetCard.base.suit]
						
                        create_playing_card({front = G.P_CARDS[(_suit.card_key)..'_'..(_rank.card_key)], center = G.P_CENTERS.c_base}, G.hand, nil, i ~= 1, {G.C.SECONDARY_SET.Spectral})
                    end
                    playing_card_joker_effects(cards)
                    return true end })
	end,

	pos = get_coordinates(1),
}

-- Wild +4
SMODS.Consumable{
	set = 'Auxiliary', atlas = 'auxiliary',
	key = 'aux_plus_four_wild', loc_txt = loc['aux_plus_four_wild'],

	config = {extra = {count = 4}},
	discovered = true,

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.count}}
	end,

	can_use = function(self, card)
		if G.hand and (#G.hand.highlighted == 1) then
			return true
		end
		return false
	end,

	use = function(self, card)
		
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
		
		local targetCard = G.hand.highlighted[1]
		
		event({
                trigger = 'after',
                delay = 0.7,
                func = function() 
                    local cards = {}
                    for i=1, card.ability.extra.count do
                        cards[i] = true
                        local _rank = SMODS.Ranks[targetCard.base.value]
                        local _suit = pseudorandom_element(SMODS.Suits, pseudoseed('aux_wild_plus_four')) or SMODS.Suits['Spades']
						
                        create_playing_card({front = G.P_CARDS[(_suit.card_key)..'_'..(_rank.card_key)], center = G.P_CENTERS.c_base}, G.hand, nil, i ~= 1, {G.C.SECONDARY_SET.Spectral})
                    end
                    playing_card_joker_effects(cards)
                    return true end })
	end,

	pos = get_coordinates(1),
}

-- In-round Instants
local function get_instant_effect(id, amount)
	if id == 3 then
		ease_hands_played(amount)
	elseif id == 1 then
		ease_discard(amount)
	elseif id == 2 then
		--Base game has this for tags, so I utilize them here
		G.hand:change_size(amount)
		G.FUNCS.draw_from_deck_to_hand(amount)
		
        G.GAME.round_resets.temp_handsize = (G.GAME.round_resets.temp_handsize or 0) + amount
	else
		forced_message("Nope!", currentCard, G.C.PURPLE, true)
	end
end

local aux_instants = {'aux_inst_disc', 'aux_inst_hsize', 'aux_inst_hand'}

for i = 1, #aux_instants do
	SMODS.Consumable{
		set = 'Auxiliary', atlas = 'auxiliary',
		key = aux_instants[i], loc_txt = loc[aux_instants[i]],

		config = {extra = {amount = 3}},
		discovered = true,

		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.amount}}
		end,

		can_use = function(self, card)
			--Only usable in-round. I can't believe it had to be checked *this much*
			return G.hand and not G.blind_select and G.STATE ~= G.STATES.ROUND_EVAL and not G.shop and not G.booster_pack
		end,

		use = function(self, card)
			
			event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
			
			event({
					trigger = 'after',
					delay = 0.2,
					func = function() 
							play_sound('generic1')
					
							get_instant_effect(i, card.ability.extra.amount)
					return true end })
		end,

		pos = get_coordinates(1),
	}
end

--Seal Swap
SMODS.Consumable{
	set = 'Auxiliary', atlas = 'auxiliary',
	key = 'aux_seal_move', loc_txt = loc['aux_seal_move'],

	config = {extra = {}},
	discovered = true,

	loc_vars = function(self, info_queue, card)
		return {vars = {}}
	end,

	can_use = function(self, card)
		if G.hand and (#G.hand.highlighted == 2) then
			return true
		end
		return false
	end,

	use = function(self, card)
		local card_l_seal = G.hand.highlighted[1].seal
		
		--Animation code mostly ported from basegame tarot
		
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
			
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end })
        end
        delay(0.2)
		
		--Handle the conversion
		event({trigger = 'after',delay = 0.1,func = function()
                    G.hand.highlighted[1]:set_seal(G.hand.highlighted[2].seal, true, true)
					 G.hand.highlighted[2]:set_seal(card_l_seal, true, true)
                    return true end })
		
		for i=1, #G.hand.highlighted do
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end })
        end
        event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end })
        delay(0.5)
	end,

	pos = get_coordinates(1),
}

--All for One
SMODS.Consumable{
	set = 'Auxiliary', atlas = 'auxiliary',
	key = 'aux_conv_1', loc_txt = loc['aux_conv_1'],

	config = {extra = {count = 3}},
	discovered = true,

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.count}}
	end,
	
	add_to_deck = function(self, card, from_debuff)
		--Enable rank 1 card in pools
		if not from_debuff then
			setPoolRankFlagEnable('unstb_1', true);
		end
    end,

	can_use = function(self, card)
		if G.hand and (#G.hand.highlighted >= 1) and (#G.hand.highlighted <= card.ability.extra.count) then
			return true
		end
		return false
	end,

	use = function(self, card)
		--Animation code mostly ported from basegame tarot
		
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
			
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end })
        end
        delay(0.2)
		
		--Handle the conversion
		for i=1, #G.hand.highlighted do
		event({trigger = 'after',delay = 0.1,func = function()
                    SMODS.change_base(G.hand.highlighted[i], G.hand.highlighted[i].base.suit, 'unstb_1')
                    return true end })
		end
		
		for i=1, #G.hand.highlighted do
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end })
        end
        event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end })
        delay(0.5)
	end,

	pos = get_coordinates(1),
}

--The Twenty-One
SMODS.Consumable{
	set = 'Auxiliary', atlas = 'auxiliary',
	key = 'aux_21', loc_txt = loc['aux_21'],

	config = {extra = {count = 5}},
	discovered = true,

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.count}}
	end,
	
	add_to_deck = function(self, card, from_debuff)
		--Enable rank 21 card in pools
		if not from_debuff then
			setPoolRankFlagEnable('unstb_21', true);
		end
    end,

	can_use = function(self, card)
		if G.hand and (#G.hand.highlighted >= 1) and (#G.hand.highlighted <= card.ability.extra.count) and blackJack_evalrank(G.hand.highlighted, 21)>=21 then
			return true
		end
		return false
	end,

	use = function(self, card)
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
		
		--Populate removed cards
		local destroyed_cards = {}
		for i = 1, #G.hand.highlighted do destroyed_cards[#destroyed_cards+1] = G.hand.highlighted[i] end
		
		--Destroy Selected Card
		event({
                trigger = 'after',
                delay = 0.1,
                func = function() 
                    for i=#destroyed_cards, 1, -1 do
                        local c = destroyed_cards[i]
                        if c.ability.name == 'Glass Card' then 
                            c:shatter()
                        else
                            c:start_dissolve(nil, i == #destroyed_cards)
                        end
                    end
                    return true end })
		--Adds Card
		event({
                trigger = 'after',
                delay = 0.7,
                func = function() 
                    local cards = {true}
					local _rank = SMODS.Ranks['unstb_21']
					local _suit = pseudorandom_element(SMODS.Suits, pseudoseed('aux_21')) or SMODS.Suits['Spades']
					
					create_playing_card({front = G.P_CARDS[(_suit.card_key)..'_'..(_rank.card_key)], center = G.P_CENTERS.c_base}, G.hand, nil, i ~= 1, {G.C.SECONDARY_SET.Spectral})
                    playing_card_joker_effects(cards)
                    return true end })
					
		--Call joker calculations for post-destroyed stuff
		delay(0.3)
        for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:calculate_joker({remove_playing_cards = true, removed = destroyed_cards})
        end
	end,

	pos = get_coordinates(1),
}

--Monkey Paw
SMODS.Consumable{
	set = 'Auxiliary', atlas = 'auxiliary',
	key = 'aux_upgrade', loc_txt = loc['aux_upgrade'],

	config = {extra = {}},
	discovered = true,

	loc_vars = function(self, info_queue, card)
	
		info_queue[#info_queue+1] = G.P_CENTERS['m_unstb_poison']
	
		return {vars = {}}
	end,

	can_use = function(self, card)
		if G.hand and (#G.hand.highlighted == 1) then
			return true
		end
		return false
	end,

	use = function(self, card)
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
			
		local selected_card = G.hand.highlighted[1]
		local selected_index
			
		local poisoned_card = {}
		
		--look for two adjacent cards in hand
		for i=1, #G.hand.cards do
			if G.hand.cards[i] == selected_card then
				selected_index = i
			end
		end
		
		print(selected_index)
		
		--Cover edge cases
		
		local handCount = #G.hand.cards
		
		if handCount >=3 then --If the hand has 3 cards or more, pick two adjacent cards to poison
			if selected_index>1 then
				poisoned_card[1] = G.hand.cards[selected_index-1]
			else
				poisoned_card[1] = G.hand.cards[handCount]
			end
			
			if selected_index<handCount then
				poisoned_card[2] = G.hand.cards[selected_index+1]
			else
				poisoned_card[2] = G.hand.cards[1]
			end
		elseif #G.hand.cards ==2 then --If the hand has only 2 cards, only one other card can be poisoned
			if selected_index == 1 then
				poisoned_card[1] = G.hand.cards[2]
			else
				poisoned_card[1] = G.hand.cards[1]
			end
		end
		
		for i=1, #poisoned_card do
            local percent = 1.15 - (i-0.999)/(#poisoned_card-0.998)*0.3
            event({trigger = 'after',delay = 0.15,func = function() poisoned_card[i]:flip();play_sound('card1', percent);poisoned_card[i]:juice_up(0.3, 0.3);return true end })
        end
        delay(0.2)
		
		--Handle the conversion
		event({trigger = 'after',delay = 0.1,func = function()
                    edition_upgrade(selected_card)
                    return true end })
		for i=1, #poisoned_card do
		event({trigger = 'after',delay = 0.1,func = function()
                    poisoned_card[i]:set_ability(G.P_CENTERS.m_unstb_poison)
                    return true end })
		end
		
		for i=1, #poisoned_card do
            local percent = 0.85 + (i-0.999)/(#poisoned_card-0.998)*0.3
            event({trigger = 'after',delay = 0.15,func = function() poisoned_card[i]:flip();play_sound('tarot2', percent, 0.6);poisoned_card[i]:juice_up(0.3, 0.3);return true end })
        end
        event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end })
        delay(0.5)
		
		
	end,

	pos = get_coordinates(1),
}


-------- Joker Code Starts Here ------

--BlackJack + Question Mark Line Jokers

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

local chipsAbilityMatch = {
	m_stone = 50,
	m_unstb_resource = 0,
	m_unstb_radioactive = 13,
	m_unstb_biohazard = 0
}

create_joker({
    name = 'Dummy Data', id = 6,
    rarity = 'Uncommon', cost = 4,
	
	vars = {{odds = 2}, {unscored_card = {}}},
	
    custom_vars = function(self, info_queue, card)
		return {vars = {G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds}}
    end,
	
    blueprint = false, eternal = true,
	
	add_to_deck = function(self, card, from_debuff)
		--Enable rank 0 card in pools
		if not from_debuff then
			setPoolRankFlagEnable('unstb_0', true);
			setPoolRankFlagEnable('unstb_1', true);
		end
    end,
	
    calculate = function(self, card, context)
		if context.before and context.scoring_hand and not context.blueprint then
			card.ability.extra.unscored_card = {}
			for k, v in pairs(context.full_hand) do
				local unscoring = true
				for _k,_v in pairs(context.scoring_hand) do
					if v == _v then
						unscoring = false
						break
					end
				end
				
				if unscoring and not v.debuff then
					card.ability.extra.unscored_card[#card.ability.extra.unscored_card+1] = v
				end
			end
		end
		
		if context.after and not context.blueprint then
			for i = 1, #card.ability.extra.unscored_card do
			
				local isTurning = pseudorandom('dummy'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds
				if isTurning then
					local currentCard = card.ability.extra.unscored_card[i]
					
					currentCard.ability.perma_bonus = (currentCard.ability.perma_bonus or 0) + SMODS.Ranks[currentCard.base.value].nominal
					
					--Flipping Animation
					event({trigger = 'after', delay = 0.1, func = function() currentCard:flip(); play_sound('card1', 1); currentCard:juice_up(0.3, 0.3); return true end })
					
					--Changing Card Property
					
					event({trigger = 'after', delay = 0.05,  func = function()
					
						local suit_data = SMODS.Suits[currentCard.base.suit]
						local suit_prefix = suit_data.card_key
						
						currentCard:set_base(G.P_CARDS[suit_prefix .. '_unstb_0' ])
						
						--Un-stoned the stone card
						if currentCard.config.center.key == 'm_unstb_slop' or chipsAbilityMatch[currentCard.config.center.key] then
							currentCard:set_ability(G.P_CENTERS.c_base)
						end
						
						return true end })
					
					--Unflipping Animation
					event({trigger = 'after', delay = 0.1, func = function() currentCard:flip(); play_sound('tarot2', 1, 0.6); big_juice(card); currentCard:juice_up(0.3, 0.3); return true end })
					forced_message("Zero!", currentCard, G.C.GRAY, true)
				end
			end
		end
	end
})

create_joker({
    name = 'Micro SD Card', id = 4,
    rarity = 'Uncommon', cost = 4,
	
	vars = {{odds_current = 0}, {odds_destroy = 512}, {stored_chips = 0}},
	
    custom_vars = function(self, info_queue, card)
	
		local activate_text = 'Inactive'
		local activate_color = G.C.RED
		if G.jokers and G.jokers.cards[1] == card then
			activate_text = 'Active'
			activate_color = G.C.GREEN
		end
	
		return {vars = {G.GAME and G.GAME.probabilities.normal * card.ability.extra.odds_current or 0, card.ability.extra.odds_destroy, G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.stored_chips, activate_text,
				colours = {activate_color} }}
    end,
	
    blueprint = true, eternal = true,
	
	--Set sprites and hitbox
	
	set_sprites = function(self, card, front)
        local w_scale, h_scale = 41/71, 59/95
        card.children.center.scale.y = card.children.center.scale.y * h_scale
        card.children.center.scale.x = card.children.center.scale.x * h_scale
    end,
	
	set_ability = function(self, card, initial, delay_sprites)
        local w_scale, h_scale = 41/71, 59/95
        card.T.h = card.T.h * h_scale
        card.T.w = card.T.w * w_scale
    end,
	
	load = function(self, card, initial, delay_sprites)
        local w_scale, h_scale = 41/71, 59/95
        card.T.h = card.T.h * h_scale
        card.T.w = card.T.w * w_scale
    end,
	
	add_to_deck = function(self, card, from_debuff)
		--Enable rank 0 card in pools
		setPoolRankFlagEnable('unstb_0', true);
		setPoolRankFlagEnable('unstb_1', true);
	end,
	
    calculate = function(self, card, context)
		--This part handles the chip reward
		if context.joker_main then
		  return {
			chip_mod = card.ability.extra.stored_chips,
			message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.stored_chips } }
		  }
		end
	
		--The scaling part is not copyable by Blueprint
		if context.discard and not context.blueprint then
			
			--Check if the joker is on the leftmost slot
			if G.jokers.cards[1] == card then
				local currentCard = context.other_card
				
				--Not debuffed, and isn't face card, and is base card
				if not currentCard:is_face() and not currentCard.debuff and currentCard.config.center == G.P_CENTERS.c_base then
					
					local bonusChip = currentCard.ability.perma_bonus or 0
					local baseChip = SMODS.Ranks[currentCard.base.value].nominal
					
					local totalChip = baseChip + bonusChip
					
					if totalChip>0 then
						card.ability.extra.stored_chips = (card.ability.extra.stored_chips or 0) + totalChip
						
						card.ability.extra.odds_current = (card.ability.extra.odds_current or 0) + totalChip
						
						--Change card
						event({trigger = 'after', delay = 0.02,  func = function()
								
							local suit_data = SMODS.Suits[currentCard.base.suit]
							local suit_prefix = suit_data.card_key
							
							currentCard:juice_up(0.3, 0.3);
							currentCard:set_base(G.P_CARDS[suit_prefix .. '_unstb_0' ])
							
							return true end })
						
						return {
							message = localize { type = 'variable', key = 'a_chips', vars = { totalChip } },
							colour = G.C.CHIPS,
							card = card
						}
					end
				end
			end
			
		end
		
		--End of round check, make sure it's checked absolutely once per round
		if context.end_of_round and not context.other_card and not context.repetition and not context.game_over and not context.blueprint then
			if pseudorandom('sdcard'..G.SEED) < G.GAME.probabilities.normal * card.ability.extra.odds_current / card.ability.extra.odds_destroy then
				event({func = function()
							
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						
						--Destroy Card
						event({trigger = 'after', delay = 0.3,  func = function()
							
							G.jokers:remove_card(card)
							card:remove()
							card = nil
							return true end })
						
						return true end })
				return {
				  message = 'Corrupted...',
				  colour = G.C.BLACK
				}
			else
				return {
				  message = 'Safe!'
				}
			end
		end
	end
})

create_joker({
    name = 'Social Experiment', id = 1, no_art = true,
    rarity = 'Rare', cost = 4,
	
    blueprint = false, eternal = true,
	
	add_to_deck = function(self, card, from_debuff)
		--Enable rank 0 card in pools
		setPoolRankFlagEnable('unstb_0', true);
		setPoolRankFlagEnable('unstb_1', true);
    end,
	
    calculate = function(self, card, context)
		
		if context.after and context.scoring_hand and #context.scoring_hand > 1 and not context.blueprint then
			local totalChipCount = 0
		
			for i = 1, #context.scoring_hand do
				if i<#context.scoring_hand and not (context.scoring_hand[i]:is_face() and not (context.scoring_hand[i].config.center.key == 'm_unstb_slop' or context.scoring_hand[i].config.center.no_rank)) then --context.scoring_hand[i].config.center ~= G.P_CENTERS.m_stone then --Check if it is not a Stone card	
					local currentCard = context.scoring_hand[i]
					
					local bonusChip = currentCard.ability.perma_bonus or 0
					
					
					local baseChip = SMODS.Ranks[currentCard.base.value].nominal
					
					if currentCard.config.center.key == 'm_unstb_slop' then
						baseChip = 0
						bonusChip = bonusChip + currentCard.ability.extra.chips				
					elseif chipsAbilityMatch[currentCard.config.center.key] then
						baseChip = 0
						bonusChip = bonusChip + chipsAbilityMatch[currentCard.config.center.key]
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
							--print(currentCard.config.center.key)
							--print(chipsAbilityMatch[currentCard.config.center.key])
							if currentCard.config.center.key == 'm_unstb_slop' or chipsAbilityMatch[currentCard.config.center.key] then
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

create_joker({
    name = 'Power of One', id = 13,
    rarity = 'Uncommon', cost = 4,
	
    blueprint = true, eternal = true,
	
	vars = {{mult_rate = '2'}, {mult = '0'}},
	
	custom_vars = function(self, info_queue, card)
        
		--Check the number of 1 in the deck
		local one_count=0
		if (G.playing_cards) then
			for _, v in pairs(G.playing_cards) do
				if v.base.value == 'unstb_1' then one_count = one_count + 1 end
			end
			return { vars = {card.ability.extra.mult_rate, one_count*card.ability.extra.mult_rate}}
		else
			return { vars = {card.ability.extra.mult_rate, 0}}
		end 
    end,
	
	
    calculate = function(self, card, context)
		--Main context
		if context.joker_main then
			local one_count=0
			for _, v in pairs(G.playing_cards) do
				if v.base.value == 'unstb_1' then one_count = one_count + 1 end
			end
			
			card.ability.extra.mult = one_count*card.ability.extra.mult_rate
		
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
		
    end,
	
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one rank 1 card
		for _, v in pairs(G.playing_cards) do
			if v.base.value == 'unstb_1' then return true end
		end
		return false
		
    end
})

local binary_rank = {'unstb_0', 'unstb_1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace', 'unstb_???'}

create_joker({
    name = 'Binary Number', id = 5,
    rarity = 'Uncommon', cost = 4,
	
    blueprint = true, eternal = true,
	
	vars = {},
	
	
    calculate = function(self, card, context)
		--Main context
		if context.after then
			local hand = context.full_hand
			
			--Parse the hand and check if it's eligible in one go
			
			--Ineligible hand
			if #hand > 4 then return end
			
			local is_binary = true
			local final_rank = 0
			local suit_list = {}
			
			for i=1, #hand do
				local rank = hand[i].base.value
				
				if rank == 'unstb_1' then
					final_rank = final_rank + 2 ^ (#hand-i)
					suit_list[#suit_list+1] = hand[1].base.suit
				elseif rank == 'unstb_0' then
					--Do nothing, really
					suit_list[#suit_list+1] = hand[1].base.suit
				else
					is_binary = false
					break
				end
			end
			
			--If the hand is binary number, create card accordingly
			if is_binary then
				
				local target_rank = binary_rank[final_rank+1] or 'unstb_???'
				
				print(final_rank)
				print(target_rank)
				
				--Create Card
				event({func = function()
								local rank = SMODS.Ranks[target_rank].card_key
								local suit = SMODS.Suits[pseudorandom_element(suit_list, pseudoseed('binary')..G.SEED)].card_key
								
								local _card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, G.P_CARDS[suit..'_'..rank], G.P_CENTERS.c_base, {playing_card = G.playing_card})
								
								
								--Juice up the Joker
								card:juice_up(0.3, 0.3)
								
								_card:start_materialize({G.C.SECONDARY_SET.Enhanced})
								G.play:emplace(_card)
								table.insert(G.playing_cards, _card)
								
								return true end
						})
				
				event({func = function()
					G.deck.config.card_limit = G.deck.config.card_limit + 1
					return true end
					})
				
				delay(1)

				event({func = function()
					draw_card(G.play,G.deck, 90,'up', nil)  
					return true end
					})
					
				playing_card_joker_effects({true})
			end
			
		end
		
    end,
	
	custom_in_pool = function(self, args)
		--If rank 0 and 1 is unlocked this run
		return getPoolRankFlagEnable('unstb_0') and getPoolRankFlagEnable('unstb_1')
		
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
		
		if context.end_of_round and not context.other_card and not context.repetition and not context.game_over and card.ability.extra.scoring_name == 'Flush Five' then
		
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
				
				event({	 trigger = 'after', delay = 0.5, func = function()
								card:juice_up(0.3, 0.3)
				
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

--New Enhancements Support Stuff

--New global function to get a random eligible suit and rank from the deck without rank-overrides enhancements getting in the way
--Code based on Castle from base game
function get_valid_card_from_deck(seed)
    
	local res_suit = 'Spades'
	local res_rank = '2'
	
    local valid_cards = {}
    for k, v in ipairs(G.playing_cards) do
        if not v.config.center.replace_base_card  then --Excludes all cards with replace_base_card enhancements
            valid_cards[#valid_cards+1] = v
        end
    end
    if valid_cards[1] then 
        local target_card = pseudorandom_element(valid_cards, pseudoseed(seed or 'validcard'..G.GAME.round_resets.ante))
		
        res_suit = target_card.base.suit
		res_rank = target_card.base.value
    end
	
	return {suit = res_suit, rank = res_rank}
end

create_joker({
    name = 'Joker Island', id = 7,
    rarity = 'Uncommon', cost = 4,
	
	vars = {{target_rank = 2}, {odds_ticket = 6}},
	
    custom_vars = function(self, info_queue, card)
        return {vars = {localize(card.ability.extra.target_rank, 'ranks'), G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds_ticket}}
    end,
	
    blueprint = false, eternal = true,
	
	set_ability = function(self, card, initial, delay_sprites)
		--Random possible rank
		local rank = '2'
		if G.playing_cards then
			rank = get_valid_card_from_deck('jokerisland'..G.SEED).rank --pseudorandom_element(G.playing_cards, pseudoseed('jokerisland')..G.SEED).base.value
		end
		
		card.ability.extra.target_rank = rank
    end,
	
	add_to_deck = function(self, card, from_debuff)
		if not G.GAME.pool_flags.catan_enabled then
			G.GAME.pool_flags.catan_enabled = true
		end
	end,
	
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			local currentCard = context.other_card
			if currentCard.base.value == card.ability.extra.target_rank and not currentCard.config.center.no_rank then
				
				local isActivated = pseudorandom('jokerisland'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_ticket
				
				if isActivated then
					event({func = function()
									local rank = pseudorandom_element(SMODS.Ranks, pseudoseed('jokerisland')..G.SEED).card_key
									local suit = SMODS.Suits[currentCard.base.suit].card_key
									
									local _card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, G.P_CARDS[suit..'_'..rank], G.P_CENTERS.m_unstb_resource, {playing_card = G.playing_card})
									
									_card:start_materialize({G.C.SECONDARY_SET.Enhanced})
									G.play:emplace(_card)
									table.insert(G.playing_cards, _card)
									
									return true end
							})

					event({func = function()
						G.deck.config.card_limit = G.deck.config.card_limit + 1
						draw_card(G.play,G.deck, 90,'up', nil)  
						return true end
						})
						
					playing_card_joker_effects({true})
				end
			end
		end
		
		if context.end_of_round and not context.other_card and not context.repetition and not context.game_over and not context.blueprint then
			card.ability.extra.target_rank = get_valid_card_from_deck('jokerisland'..G.SEED).rank --pseudorandom_element(G.playing_cards, pseudoseed('jokerisland')..G.SEED).base.value --pseudorandom_element(SMODS.Ranks, pseudoseed('jokerisland')..G.SEED).key
			return{
				message = "Randomize"
			}
		end
    end
})

--New Anti-Enhancement Stuff

create_joker({
    name = 'Kaiju', id = 1, no_art = true,
    rarity = 'Uncommon', cost = 4,
	
	vars = {{add_slot = 3}},
	
    custom_vars = function(self, info_queue, card)
	
		info_queue[#info_queue+1] = G.P_CENTERS['m_unstb_radioactive']
	
        return {vars = {card.ability.extra.add_slot}}
    end,
	
    blueprint = false, eternal = true,
	
	add_to_deck = function(self, card, from_debuff)
		if not G.GAME.pool_flags.radioactive_enabled then
			G.GAME.pool_flags.radioactive_enabled = true
		end
		
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.add_slot
	end,
	
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.add_slot
	end,
	
    calculate = function(self, card, context)
		if context.first_hand_drawn then
			event({delay = 0.4, trigger = 'after',
						func = function()
							local eligible_list={}
							for i=1, #G.hand.cards do
								if G.hand.cards[i].config.center ~= G.P_CENTERS.m_unstb_radioactive then table.insert(eligible_list,G.hand.cards[i]) end
							end
							if #eligible_list>0 then
								local enhanced_card = pseudorandom_element(eligible_list, pseudoseed('kaiju'..G.SEED))
								enhanced_card:set_ability(G.P_CENTERS.m_unstb_radioactive , nil, true)
								play_sound('tarot1')
								enhanced_card:juice_up()
							end
							
						return true end}
					)
		end
    end
})

create_joker({
    name = 'Poison the Well', id = 1, no_art = true,
    rarity = 'Uncommon', cost = 4,
	
	vars = {{discard_size = 3}},
	
    custom_vars = function(self, info_queue, card)
	
		info_queue[#info_queue+1] = G.P_CENTERS['m_unstb_poison']
	
        return {vars = {card.ability.extra.discard_size}}
    end,
	
    blueprint = false, eternal = true,
	
	add_to_deck = function(self, card, from_debuff)
		if not G.GAME.pool_flags.poison_enabled then
			G.GAME.pool_flags.poison_enabled = true
		end
		
		 G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discard_size
		 ease_discard(3)
	end,
	
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discard_size
		ease_discard(-3)
	end,
	
    calculate = function(self, card, context)
		if context.pre_discard and not context.blueprint then
			local target_card = pseudorandom_element(G.hand.highlighted, pseudoseed(seed or 'poisonwell'..G.GAME.round_resets.ante))
			
			event({trigger = 'after',  func = function()
							play_sound('generic1')
							target_card:juice_up(0.3, 0.3);
							target_card:set_ability(G.P_CENTERS.m_unstb_poison , nil, true)
							
							return true end })
		end
    end
})

create_joker({
    name = 'Petri Dish', id = 0, no_art = true,
    rarity = 'Uncommon', cost = 4,
	
	vars = {{adds_hand = 3}, {odds = 2}},
	
    custom_vars = function(self, info_queue, card)
	
		info_queue[#info_queue+1] = G.P_CENTERS['m_unstb_biohazard']
	
        return {vars = {card.ability.extra.adds_hand, 1, card.ability.extra.odds}}
    end,
	
    blueprint = false, eternal = true,
	
	add_to_deck = function(self, card, from_debuff)
		if not G.GAME.pool_flags.biohazard_enabled then
			G.GAME.pool_flags.biohazard_enabled = true
		end
		
		 G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.adds_hand
		 ease_hands_played(3)
	end,
	
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.adds_hand
		ease_hands_played(-3)
	end,
	
    calculate = function(self, card, context)
		if context.after and not context.blueprint then
			if pseudorandom('petridish'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds then
				local target_card = pseudorandom_element(context.full_hand, pseudoseed(seed or 'petridishtarget'..G.SEED))
			
				event({trigger = 'after',  func = function()
								play_sound('generic1')
								target_card:juice_up(0.3, 0.3);
								target_card:set_ability(G.P_CENTERS.m_unstb_biohazard)
								
								return true end })

				forced_message("Infected", target_card, G.C.RED, true)
			end
		end
    end
})

--Miscellaneous

-- Joker 2

create_joker({
    name = 'Joker2', id = 11,
    rarity = 'Common', cost = 4,
	
	vars = {{mult = 4}, {xmult = 2}, {odds_destroy = 4}},
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.mult, card.ability.extra.xmult, G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds_destroy}}
    end,
	
    blueprint = true, eternal = true,
	
    calculate = function(self, card, context)
		
		--Main context
		if context.joker_main then
		
			--Add mult first
			SMODS.eval_this(card, {mult_mod = card.ability.extra.mult, message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}}} )
		
			--Then Xmult
			return {
				Xmult_mod = card.ability.extra.xmult,
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
			}
		end
		
		--End of round check, make sure it's checked absolutely once per round
		if context.end_of_round and not context.other_card and not context.repetition and not context.game_over and not context.blueprint then
			if pseudorandom('joker2'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_destroy then
				event({func = function()
							
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						
						--Destroy Card
						event({trigger = 'after', delay = 0.3,  func = function()
							
							G.jokers:remove_card(card)
							card:remove()
							card = nil
							return true end })
						
						return true end })
				return {
				  message = 'Flopped',
				  colour = G.C.ORANGE
				}
			else
				return {
				  message = 'Safe!',
				  colour = G.C.GREEN
				}
			end
		end
    end
})

-- Joker Stairs
create_joker({
    name = 'Joker Stairs', id = 12,
    rarity = 'Uncommon', cost = 4,
	
	vars = {{mult_rate = 4}, {mult = 0}},
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.mult_rate, card.ability.extra.mult}}
    end,
	
    blueprint = true, eternal = true,
	
    calculate = function(self, card, context)
		--Shop
		if context.buying_card and context.card ~= card then
			--get name
			local jokerName = string.lower(localize{type = 'name_text', key = context.card.config.center.key, set = 'Joker'})
			
			if string.match(jokerName, "joker") then
				--print("Joker Stair Triggered!")
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_rate
				   event({
					func = function()
							big_juice(card)
							forced_message("Upgraded!", card, G.C.MULT, true)
							--card_eval_status_text(card,'extra',nil, nil, nil,{message = "Upgraded", colour = G.C.MULT, instant = true})
							return true end})
			end
		end
		
		--Main context
		if context.joker_main then
			if card.ability.extra.mult > 0 then
				return {
					mult_mod = card.ability.extra.mult,
					message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
				}
			end
		end
		
    end
})

--Spectre
create_joker({
    name = 'Spectre', id = 9,
    rarity = 'Uncommon', cost = 4,
	
	vars = {{xmult_rate = 0.25}, {xmult = 1}},
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.xmult_rate, card.ability.extra.xmult}}
    end,
	
    blueprint = true, eternal = true,
	
	set_ability = function(self, card, initial, delay_sprites)
		if G.GAME and G.GAME.consumeable_usage_total then
			card.ability.extra.xmult = 1 + G.GAME.consumeable_usage_total.spectral * card.ability.extra.xmult_rate
		else
			card.ability.extra.xmult = 1
		end
    end,
	
    calculate = function(self, card, context)
		
		--Upgrades
		if context.using_consumeable and not context.blueprint then
                if context.consumeable.ability.set == "Spectral" then
				   card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_rate
				   event({
					func = function()
							big_juice(card)
							forced_message("Upgraded!", card, G.C.MULT, true)
							--card_eval_status_text(card,'extra',nil, nil, nil,{message = "Upgraded", colour = G.C.MULT, instant = true})
							return true end})
				end
		end
		
		--Main context
		if context.joker_main then
			return {
				Xmult_mod = card.ability.extra.xmult,
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
			}
		end
		
    end
})

local function get_random_hand(current_hand, seed)
	local _poker_hands = {}
	
	--Populate list
    for k, v in pairs(G.GAME.hands) do
        if v.visible then _poker_hands[#_poker_hands+1] = k end
    end
       
	local new_hand = nil
    while not new_hand do
        new_hand = pseudorandom_element(_poker_hands, pseudoseed(seed or 'rand_hand'))
        if new_hand == current_hand then new_hand = nil end
    end
	
	return new_hand
end

--Throwing Hands
create_joker({
    name = 'Throwing Hands', id = 8,
    rarity = 'Rare', cost = 4,
	
	vars = {{target_hand = 'High Card'}, {xmult_bad = 0.5}, {xmult_good = 5}},
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.xmult_good, card.ability.extra.xmult_bad, card.ability.extra.target_hand}}
    end,
	
    blueprint = true, eternal = true,
	
	set_ability = function(self,card, initial, delay_sprites)
	
		--Random Poker Hand
        card.ability.extra.target_hand = get_random_hand(card.ability.extra.target_hand, 'throwinghands'..G.SEED)
    end,
	
    calculate = function(self, card, context)
		
		if context.joker_main and context.scoring_name ~= nil and context.scoring_hand then
		
			local xmult = card.ability.extra.xmult_bad
		
			if context.scoring_name == card.ability.extra.target_hand then
				xmult = card.ability.extra.xmult_good
			end
		
			return {
				Xmult_mod = xmult,
				message = localize { type = 'variable', key = 'a_xmult', vars = { xmult } }
			}
		end
		
		if context.end_of_round and not (context.individual or context.repetition or context.blueprint) then
            card.ability.extra.target_hand = get_random_hand(card.ability.extra.target_hand, 'throwinghands'..G.SEED)
			
            return {
                message = card.ability.extra.target_hand
            }
        end
    end
})

--Salmon Run
create_joker({
    name = 'Salmon Run', id = 10,
    rarity = 'Rare', cost = 4,
	
	vars = {{odds = 7}},
	custom_vars = function(self, info_queue, card)
		return {vars = {G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds}}
    end,
	
    blueprint = true, eternal = true,
	
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			local currentCard = context.other_card
			
			if not currentCard.config.center.no_rank and currentCard.base.value == '7' then
				local isActivated = pseudorandom('salmonrun'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds
				
				if isActivated then
					event({func = function()
									--Copy Card
									local _card = copy_card(currentCard, nil, nil, G.playing_card)
									_card:start_materialize({G.C.SECONDARY_SET.Enhanced})
									G.play:emplace(_card)
									table.insert(G.playing_cards, _card)
									
									return true end
							})

					event({func = function()
						G.deck.config.card_limit = G.deck.config.card_limit + 1
						draw_card(G.play,G.deck, 90,'up', nil)  
						return true end
						})
						
					playing_card_joker_effects({true})
				end
			end
		end
    end
})

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
				if not (context.scoring_hand[i].config.center == G.P_CENTERS.m_stone or context.scoring_hand[i].config.center.replace_base_card) then --Check if it is not a Stone card or have any weird enhancement
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

--Reworked Vanilla Joker to support new features
filesystem.load(unStb.path..'/override/vanilla_joker.lua')()

--Suits, supports for Suit Seals, a lot of suit-based Joker, and modded suits support for Smeared
filesystem.load(unStb.path..'/override/suits.lua')()


----------------------------------------------
------------MOD CODE END----------------------
