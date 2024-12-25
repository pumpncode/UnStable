return {
    dictionary = {
	
		--Put generic words here
	
        ['en-us'] = {

            -- Config values

            mechanic_settings = 'Mechanics Settings',
			
			config_header_rank = 'Rank',
			config_rank21 = 'Rank 21',
			config_rank_bi = 'Rank 0 and 1',
			config_rank_decimal = 'Decimal Ranks',
			
			config_header_enh = 'Enhancement',
			config_enh_custom = 'New Enhancement',
			config_enh_disenh = 'Unhancement',
			
			config_header_mechanics = 'New Mechanics',
			config_mech_upgrade = 'Edition Upgrade',
			config_mech_suitseal = 'Suit and Face Seal',
			config_mech_aux = 'Auxiliary Card',
			config_mech_music = 'Custom Music',
			config_mech_fallback = 'Fallback Spectrals',
			config_mech_fallback_desc = {'Contains same feature as Auxiliary Card, ', 'recommended to turn on if Auxiliary Card is turned off'},
			config_mech_suitseal = 'New Spectral Cards',
			
			joker_settings = 'Joker Settings',

            requires_restart = 'Requires Restart to Apply Effects',

            -- Miscellaneous
			tarot_exclaim = 'Tarot!?',
            upgrade = 'Upgrade!',
			
			no_chip = {['text'] = {[1] = 'No chips',}},
			
			decimal_rank_ability = {['text'] = {[1] = 'Can act as {C:attention}different rank{}',
												[2] = 'when played in {C:purple}Straight{} hand',
												[3] = '{C:inactive}[#1#, #2#, #3#]{}',}}
        },
    },
	
	-- Mechanics Infobox

    upgrade_edition = {
        ['en-us'] = {
            ['name'] = 'Upgrade Edition',
            ['text'] = {
                [1] = "Change the card's {C:attention}edition{}",
				[2] = "by {C:attention}1{} step from",
                [3] = '{C:inactive}(None){} -> {C:dark_edition}Foil{} ->',
				[4] = '{C:dark_edition}Hologram{} -> {C:dark_edition}Polychrome{}'
            }
        }
    },
	
	disenhancement = {
        ['en-us'] = {
            ['name'] = 'Unhancement',
            ['text'] = {
                [1] = "Enhancement that have",
				[2] = "negative effects",
                [3] = '{C:attention}(Radioactive, Biohazard, Poison){}'
            }
        }
    },
	
	suit_seal = {
		['en-us'] = {
			['label'] = 'Suit Seal',
            ['name'] = 'Suit Seal',
            ['text'] = {
				[1] = 'Makes the card also',
				[2] = 'count as {C:attention}(Respective Suit){}',
            }
        }
	},
	
	resource_tooltip = { --Actual resource card's tooltip breaks info queue
		['en-us'] = {
            ['name'] = 'Resource Card',
            ['text'] = {
                [1] = 'Has no rank, always scored.',
				[2] = 'Gives {X:mult,C:white}X5{} Mult',
				[3] = 'if the played hand has at least',
				[4] = 'one card with {C:attention}(Corresponding Suit){} suit',
				[5] = '{C:red}Destroys itself after scored{}',
				[6] = '{C:inactive}(Does not count other Resource Cards){}',
            }
        }
	},
	
	acorn_tooltip = { --Better wording for tooltip version
		['en-us'] = {
            ['name'] = 'Acorn Mark Card',
            ['text'] = {
                [1] = 'Gives {C:chips}double amount{}',
				[2] = 'of chips when in hand,',
				[3] = 'does not give any chips when scored',
            }
        }
	},
	
	poison_tooltip = { --Better wording for tooltip version
		['en-us'] = {
            ['name'] = 'Poison Card',
            ['text'] = {
				[1] = 'Gives {C:red}negative amount{} of chips,',
				[2] = 'discarded {C:attention}Poison Cards{}',
				[3] = 'go back into the deck',
            }
        }
	},
	
	-- Enhancement
	
	enh_acorn = {
		['en-us'] = {
            ['name'] = 'Acorn Mark Card',
            ['text'] = {
                [1] = 'Gives {C:chips}+#1#{} chips when in hand,',
				[2] = 'does not give any chips when scored',
            }
        }
	},
	
	enh_vintage = {
		['en-us'] = {
            ['name'] = 'Vintage Card',
            ['text'] = {
                [1] = 'Gains {C:chips}+#1#{} extra chips when scored',
				[2] = '{C:green}#2# in #3#{} chance to destroy itself',
				[3] = '{C:inactive}Chance increases by {C:green}+#4#{C:inactive} when scored{}',
            }
        }
	},
	
	enh_promo = {
		['en-us'] = {
            ['name'] = 'Promo Card',
            ['text'] = {
                [1] = 'Gives {C:gold}$#1#{} while this card stays in hand',
				[2] = 'Gains {C:gold}+$#2#{} when scored',
				[3] = '{C:green}#3# in #4#{} chance to destroy when scored',
            }
        }
	},
	
	enh_slop = {
		['en-us'] = {
            ['name'] = 'Slop Card',
            ['text'] = {
                [1] = '{C:chips}+#1#{} chips',
				[2] = 'Always scored',
				[3] = 'Random suit and rank after scored',
				[4] = 'Current: {C:attention}#3#{} of {V:1}#2#{}',
            }
        }
	},
	
	enh_resource = {
		['en-us'] = {
            ['name'] = 'Resource Card',
            ['text'] = {
                [1] = 'Has no rank, always scored.',
				[2] = 'Gives {X:mult,C:white}X#1#{} Mult',
				[3] = 'if the played hand has at least',
				[4] = 'one card with {V:1}#2#{} suit',
				[5] = '{C:red}Destroys itself after scored{}',
				[6] = '{C:inactive}(Does not count other Resource Cards){}',
            }
        }
	},
	
	--"Cursed" Enhancements
	enh_radioactive = {
		['en-us'] = {
            ['name'] = 'Radioactive Card',
            ['text'] = {
                [1] = '{C:chips}+#1#{} Chips, no rank or suit',
				[2] = 'When played, {C:green}#2# in #3#{} chance to',
				[3] = 'convert other played cards to {C:attention}Radioactive Cards{}',
				[4] = '',
				[5] = 'When held in hand, {C:green}#2# in #4#{} chance to give',
				[6] = '{X:mult,C:white}X#5#{} Mult, otherwise gives {X:mult,C:white}X#6#{} Mult',
            }
        }
	},
	
	enh_biohazard = {
		['en-us'] = {
            ['name'] = 'Biohazard Card',
            ['text'] = {
                [1] = '{X:mult,C:white}X#1#{} Mult, no rank or suit',
				[2] = 'Lose {C:red}-$#2#{} while this card stays in hand',
				[3] = 'When discarded, {C:green}#3# in #4#{} chance to turn one random',
				[4] = 'card in the deck into {C:attention}Biohazard Card{}',
            }
        }
	},
	
	enh_poison = {
		['en-us'] = {
            ['name'] = 'Poison Card',
            ['text'] = {
				[1] = '{C:red}-#1#{} Chips',
				[2] = 'Goes back into deck',
				[3] = 'when discarded',
            }
        }
	},
	
	--Suit Seals
	
	seal_spades = {
		['en-us'] = {
			['label'] = 'Spade Seal',
            ['name'] = 'Spade Seal',
            ['text'] = {
				[1] = 'This card also',
				[2] = 'counts as {V:1}#1#{}',
            }
        }
	},
	seal_hearts = {
		['en-us'] = {
			['label'] = 'Heart Seal',
            ['name'] = 'Heart Seal',
            ['text'] = {
				[1] = 'This card also',
				[2] = 'counts as {V:1}#1#{}',
            }
        }
	},
	seal_clubs = {
		['en-us'] = {
			['label'] = 'Club Seal',
            ['name'] = 'Club Seal',
            ['text'] = {
				[1] = 'This card also',
				[2] = 'counts as {V:1}#1#{}',
            }
        }
	},
	seal_diamonds = {
		['en-us'] = {
			['label'] = 'Diamond Seal',
            ['name'] = 'Diamond Seal',
            ['text'] = {
				[1] = 'This card also',
				[2] = 'counts as {V:1}#1#{}',
            }
        }
	},
	
	seal_face = {
		['en-us'] = {
			['label'] = 'Face Seal',
            ['name'] = 'Face Seal',
            ['text'] = {
				[1] = 'This card also',
				[2] = 'counts as {C:attention}face{} card',
            }
        }
	},
	
	seal_heal = {
		['en-us'] = {
			['label'] = 'Heal Seal',
            ['name'] = 'Heal Seal',
            ['text'] = {
				[1] = 'Removes {C:red}Unhancement{} from one',
				[2] = 'random card held in hand when scored.',
				[3] = 'This card also cannot be {C:red}Unhanced{}.',
            }
        }
	},
	
	-- Ranks

    ranks = {
		['21'] = '21',
		Question = '???',
		
		['0'] = '0',
		Half = 'Half',
		['1'] = '1',
		Root = 'Root 2',
		Euler = "e",
		Pi = "Pi",
	},
	
	
	--Booster Pack 
	auxpack = {
        ['en-us'] = {
            ['group_name'] = 'Expansion Pack',
            ['name'] = 'Expansion Pack',
            ['text'] = {
                [1] = 'Choose {C:attention}#1#{} of up to',
                [2] = '{C:attention}#2#{C:auxiliary} Auxiliary{} cards to',
                [3] = 'add to your consumable area'
            }
        }
    },
    auxpack_jumbo = {
        ['en-us'] = {
            ['group_name'] = 'Expansion Pack',
            ['name'] = 'Jumbo Expansion Pack',
            ['text'] = {
                [1] = 'Choose {C:attention}#1#{} of up to',
                [2] = '{C:attention}#2#{C:auxiliary} Auxiliary{} cards to',
                [3] = 'add to your consumable area'
            }
        }
    },
    auxpack_mega = {
        ['en-us'] = {
            ['group_name'] = 'Expansion Pack',
            ['name'] = 'Mega Expansion Pack',
            ['text'] = {
                [1] = 'Choose {C:attention}#1#{} of up to',
                [2] = '{C:attention}#2#{C:auxiliary} Auxiliary{} cards to',
                [3] = 'add to your consumable area'
            }
        }
    },
	
	
	-- New Consumables

    auxiliary = {
        ['en-us'] = {
            ['name'] = 'Auxiliary',
            ['collection'] = 'Auxiliary Cards',
            ['undiscovered'] = {
                ['name'] = 'Not Discovered',
                ['text'] = {
                    [1] = 'Purchase or use',
                    [2] = 'this card in an',
                    [3] = 'unseeded run to',
                    [4] = 'learn what it does'
                }
            }
        }
    },
	
	aux_spades = {
        ['en-us'] = {
            ['name'] = 'Essence of Spades',
            ['text'] = {
                [1] = 'Add {V:1}#2#{} to',
                [2] = '{C:attention}#1#{} selected cards',
                [3] = 'in your hand'
            }
        }
    },
	
	aux_hearts = {
        ['en-us'] = {
            ['name'] = 'Essence of Hearts',
            ['text'] = {
                [1] = 'Add {V:1}#2#{} to',
                [2] = '{C:attention}#1#{} selected cards',
                [3] = 'in your hand'
            }
        }
    },
	
	aux_clubs = {
        ['en-us'] = {
            ['name'] = 'Essence of Clubs',
            ['text'] = {
                [1] = 'Add {V:1}#2#{} to',
                [2] = '{C:attention}#1#{} selected cards',
                [3] = 'in your hand'
            }
        }
    },
	
	aux_diamonds = {
        ['en-us'] = {
            ['name'] = 'Essence of Diamonds',
            ['text'] = {
                [1] = 'Add {V:1}#2#{} to',
                [2] = '{C:attention}#1#{} selected cards',
                [3] = 'in your hand'
            }
        }
    },
	
	aux_face = {
        ['en-us'] = {
            ['name'] = 'Possessions',
            ['text'] = {
                [1] = 'Add a {C:attention}Face Seal{}',
                [2] = 'to {C:attention}#1#{} selected cards',
                [3] = 'in your hand'
            }
        }
    },
	
	aux_plus_two = {
        ['en-us'] = {
            ['name'] = '+2',
            ['text'] = {
                [1] = 'Creates a {C:attention}#1#{} card in',
                [2] = 'your hand with a random',
                [3] = '{C:attention}rank{} and the same {C:attention}suit{}',
                [4] = 'as the selected card'
            }
        }
    },
	
	aux_plus_four_wild = {
        ['en-us'] = {
            ['name'] = 'Wild +4',
            ['text'] = {
                [1] = 'Creates a {C:attention}#1#{} card in',
                [2] = 'your hand with a random',
                [3] = '{C:attention}suit{} and the same {C:attention}rank{}',
                [4] = 'as the selected card'
            }
        }
    },
	
	aux_inst_disc = {
        ['en-us'] = {
            ['name'] = 'The Past',
            ['text'] = {
                [1] = '{C:red}+#1#{} discards this round',
            }
        }
    },
	
	aux_inst_hsize = {
        ['en-us'] = {
            ['name'] = 'The Present',
            ['text'] = {
                [1] = '{C:attention}+#1#{} hand size this round',
            }
        }
    },
	
	aux_inst_hand = {
        ['en-us'] = {
            ['name'] = 'The Future',
            ['text'] = {
                [1] = '{C:blue}+#1#{} hands this round',
            }
        }
    },
	
	aux_seal_move = {
        ['en-us'] = {
            ['name'] = 'Seal Exchange',
            ['text'] = {
                [1] = 'Swap {C:attention}seals{} between',
                [2] = '{C:attention}2{} selected cards'
            }
        }
    },
	
	aux_conv_1 = {
        ['en-us'] = {
            ['name'] = 'All for One',
            ['text'] = {
                [1] = 'Converts rank of',
				[2] = 'up to {C:attention}#1#{} selected',
                [3] = 'cards to {C:attention}1{}'
            }
        }
    },
	
	aux_21 = {
        ['en-us'] = {
            ['name'] = 'The Twenty-One',
            ['text'] = {
                [1] = 'Select up to {C:attention}#1#{} cards',
				[2] = 'with total rank of {C:attention}21 or more{}.',
				[3] = 'Destroys all selected cards and creates one',
				[4] = '{C:attention}rank 21{} card of a random suit.',
            }
        }
    },
	
	aux_upgrade = {
        ['en-us'] = {
            ['name'] = 'Monkey Paw',
            ['text'] = {
                [1] = "{C:purple}Upgrades {C:attention}1{} selected card's {C:attention}edition{}",
				[2] = 'Turns adjacent cards into {C:attention}Poison Cards{}',
				[3] = '{C:inactive}(Loops around hand edges){}',
            }
        }
    },
	
	aux_heal = {
        ['en-us'] = {
            ['name'] = 'Heal Guardian',
            ['text'] = {
                [1] = 'Add a {C:attention}Heal Seal{}',
                [2] = 'to {C:attention}#1#{} selected',
                [3] = 'card in your hand'
            }
        }
    },
	
	aux_heal_hand = {
        ['en-us'] = {
            ['name'] = 'Heal Aura',
            ['text'] = {
                [1] = 'Heal all',
                [2] = '{C:red}Unhanced Cards{}',
                [3] = 'in your hand'
            }
        }
    },
	
	aux_lottery = {
        ['en-us'] = {
            ['name'] = 'Lottery',
            ['text'] = {
                [1] = '{C:green}#1# in #2#{} chance',
				[2] = 'to win {C:gold}$#3#{}',
            }
        }
    },
	
	aux_blank = {
        ['en-us'] = {
            ['name'] = 'Blank Card',
            ['text'] = {
                [1] = 'Does nothing..?',
            }
        }
    },
	
	aux_dark_matter = {
        ['en-us'] = {
            ['name'] = 'Dark Matter',
            ['text'] = {
                [1] = 'Permanently gain',
                [2] = '{C:dark_edition}+#1#{} Joker slot',
				[3] = '{C:red}Cannot be Negative'
            }
        }
    },
	
	aux_dark_matter_n = {
        ['en-us'] = {
            ['name'] = 'Dark Matter..?',
            ['text'] = {
                [1] = 'Permanently gain',
                [2] = '{C:red}-#1#{} Joker slot',
            }
        }
    },
	
	aux_random = {
        ['en-us'] = {
            ['name'] = 'The Question',
            ['text'] = {
                [1] = 'Creates up to {C:attention}#1#{}',
				[2] = 'random {C:auxiliary}Auxiliary{} cards',
				[3] = '{C:inactive}(Must have room)',
            }
        }
    },
	
	-- Other Consumable Additions
	
	--Tarots
	trt_time = {
        ['en-us'] = {
            ['name'] = 'Time',
            ['text'] = {
                [1] = 'Enhances {C:attention}#1#{} ',
				[2] = 'selected cards to',
				[3] = '{C:attention}Vintage Cards{}',
            }
        }
    },
	
	trt_acorn = {
        ['en-us'] = {
            ['name'] = 'The Acorn',
            ['text'] = {
                [1] = 'Enhances {C:attention}#1#{} selected',
				[2] = 'card into an',
				[3] = '{C:attention}Acorn Mark Card{}',
            }
        }
    },
	
	trt_greed = {
        ['en-us'] = {
            ['name'] = 'Greed',
            ['text'] = {
                [1] = 'Enhances {C:attention}#1#{} ',
				[2] = 'selected cards to',
				[3] = '{C:attention}Promo Cards{}',
            }
        }
    },
	
	trt_half = {
        ['en-us'] = {
            ['name'] = 'The Half',
            ['text'] = {
                [1] = 'Splits {C:attention}1{} selected {C:attention}integer-numbered rank{} card',
				[2] = 'into {C:attention}2{} cards with {C:attention}half the rank{} (rounded down).',
				[3] = 'If the initial rank is {C:attention}odd{}, also adds {C:attention}1{}',
				[4] = '{C:attention}0.5 rank{} card of the same {C:attention}enhancement{}.',
            }
        }
    },
	
	trt_knowledge = {
        ['en-us'] = {
            ['name'] = 'Knowledge',
            ['text'] = {
                [1] = 'Adds one random {C:attention}decimal-rank{} card',
				[2] = "of {C:attention}1{} selected card's suit to hand",
            }
        }
    },
	
	--Spectral
	
	spc_elixir = {
        ['en-us'] = {
            ['name'] = 'Elixir of Life',
            ['text'] = {
                [1] = 'Heal all {C:red}Unhanced Cards{} in the deck',
                [2] = 'Reduce money by half {C:inactive}(rounded up){}'
            }
        }
    },
	
	spc_vessel = {
        ['en-us'] = {
            ['name'] = 'Vessel',
            ['text'] = {
                [1] = 'Select {C:attention}2{} cards,',
				[2] = 'destroy the {C:attention}left{} card',
				[3] = 'and give the corresponding {C:red}Suit Seal{}',
				[4] = 'to the {C:attention}right{} card',
				[5] = '{C:inactive}(Drag to rearrange){}',
            }
        }
    },
	
	spc_conferment = {
        ['en-us'] = {
            ['name'] = 'Conferment',
            ['text'] = {
                [1] = 'Add a {C:attention}Face Seal{}',
				[2] = 'to {C:attention}#1#{} random cards',
				[3] = 'in your hand,',
				[4] = '{C:red}-$#2#{} {C:inactive}(no debt limit){}'
            }
        }
    },
	
	spc_amnesia = {
        ['en-us'] = {
            ['name'] = 'Amnesia',
            ['text'] = {
				[1] = 'Converts {C:attention}#1#{} random',
				[2] = 'cards in your hand',
				[3] = 'to {C:attention}Rank 0{}',
            }
        }
    },
	
	spc_altar = {
        ['en-us'] = {
            ['name'] = 'Altar',
            ['text'] = {
                [1] = 'Destroy {C:attention}#1#{} random',
				[2] = 'cards in your hand,',
				[3] = 'add {C:attention}#2#{} random {C:attention}Enhanced{}',
				[4] = '{C:attention}21s{} to your hand'
            }
        }
    },
	
	spc_contract = {
        ['en-us'] = {
            ['name'] = "Devil's Contract",
            ['text'] = {
                [1] = '{C:purple}Upgrades {C:attention}#1#{} random',
				[2] = 'card in your hand',
				[3] = 'Randomly {C:red}unhances {C:attention}#2#{}',
				[4] = 'random cards in your hand',
            }
        }
    },
	
	spc_poltergeist = {
        ['en-us'] = {
            ['name'] = "Poltergeist",
            ['text'] = {
                [1] = 'Shuffles all',
				[2] = "Jokers' {C:dark_edition}editions{}",
            }
        }
    },
	
	spc_projection = {
        ['en-us'] = {
            ['name'] = "Astral Projection",
            ['text'] = {
                [1] = 'Swap {C:dark_edition}editions{} between',
				[2] = 'the {C:attention}selected Joker{}',
				[3] = 'and the one {C:attention}to its right{}',
				[4] = '{C:green}#1# in #2#{} chance that',
				[5] = 'one of the Jokers are {C:red}destroyed{}',
            }
        }
    },
	
	spc_siphon = {
        ['en-us'] = {
            ['name'] = "Siphon",
            ['text'] = {
                [1] = 'Destroys {C:attention}1{} selected {C:attention}Joker{}',
				[2] = 'with an {C:dark_edition}edition{}',
				[3] = "Gives the {C:attention}Joker's {C:dark_edition}edition{} to",
				[4] = '{C:attention}#1#{} random card in your hand',
				[5] = '{C:inactive}({C:dark_edition}Negative{} excluded){}',
            }
        }
    },
	
	--Voucher
	v_aux1 = {
        ['en-us'] = {
            ['name'] = "Hardware Store",
            ['text'] = {
                [1] = '{C:auxiliary}Auxiliary{} cards',
				[2] = 'can be purchased',
                [3] = 'from the {C:attention}shop{}',
            }
        }
    },
	
	v_aux2 = {
        ['en-us'] = {
            ['name'] = "Heavy Duty Tools",
            ['text'] = {
                [1] = '{C:auxiliary}Auxiliary{} cards in',
				[2] = '{C:attention}Expansion Packs{} can',
				[3] = "sometimes be {C:dark_edition}Negative{}",
            }
        }
    },
	
	--Jokers
	
	lunar_calendar = {
        ['en-us'] = {
            ['name'] = 'Lunar Calendar',
            ['text'] = {
                [1] = 'Played cards with',
				[2] = '{V:1}#1#{} suit have',
				[3] = '{C:green}#2# in #3#{} chance to create a',
				[4] = "random {C:planet}Planet{} card when scored",
				[5] = '{C:inactive}(Must have room)',
				[6] = '{s:0.8}Suit changes at the end of the round',
            }
        }
    },
	
	dragon_hoard = {
        ['en-us'] = {
            ['name'] = 'Dragon Hoard',
            ['text'] = {
                [1] = 'Gives {C:mult}+#1#{} Mult for',
				[2] = 'every {C:attention}#2#{} {C:attention}consumables{}',
				[3] = 'in your {C:attention}consumable{} area',
				[4] = "{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult)",
            }
        }
    },
	
	card_dealer = {
        ['en-us'] = {
            ['name'] = 'Card Dealer',
            ['text'] = {
                [1] = '{C:chips}+#1#{} Chips per {C:attention}played{}',
				[2] = 'cards this round',
				[3] = '{C:attention}Resets{} at the end',
				[4] = 'of the round',
				[5] = "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
            }
        }
    },
	
	match_three = {
        ['en-us'] = {
            ['name'] = 'Match Three',
            ['text'] = {
                [1] = '{C:mult}+#1#{} Mult if played hand contains',
				[2] = '{C:attention}#2#{} or more adjacent cards',
				[3] = 'with the {C:attention}same base suit{}',
            }
        }
    },
	
	furry_joker = {
        ['en-us'] = {
            ['name'] = 'Furry Joker',
            ['text'] = {
                [1] = 'Played {C:attention}Wild Cards{} have',
				[2] = "{C:green}#1# in #2#{} chance to",
				[3] = "turn {C:dark_edition}Polychrome{} when scored",
            }
        }
    },
	
	luxurious_handbag = {
        ['en-us'] = {
            ['name'] = 'Luxurious Handbag',
            ['text'] = {
                [1] = '{C:attention}+#1#{} consumable slot',
				[2] = "{C:red}Raises prices{} of everything in the",
				[3] = "{C:attention}shop{} (except reroll) by {C:gold}$#2#{}",
            }
        }
    },
	
	portal = {
        ['en-us'] = {
            ['name'] = 'Portal',
            ['text'] = {
                [1] = '{C:attention}Aces{} can be used in the',
				[2] = "middle of a {C:purple}Straight{} hand",
				[3] = "{C:inactive}(Ex: 3, 2, Ace, King, Queen)",
            }
        }
    },
	
	vainglorious_joker = {
        ['en-us'] = {
            ['name'] = 'Vainglorious Joker',
            ['text'] = {
                [1] = 'Played cards with',
				[2] = '{C:attention}Suit Seal{} give',
				[3] = "{C:attention}+#1#{} Mult when scored",
            }
        }
    },
	
	acedia_joker = {
        ['en-us'] = {
            ['name'] = 'Acedia Joker',
            ['text'] = {
                [1] = 'Played cards with',
				[2] = '{C:attention}Suit Seal{} in the same',
				[3] = "{C:purple}suit category{} as the card's suit",
				[4] = "give {C:attention}+#1#{} Mult when scored",
            }
        }
    },
	
	cinnabar = {
        ['en-us'] = {
            ['name'] = 'Cinnabar',
            ['text'] = {
                [1] = 'Played cards with {C:attention}Suit Seal{} have',
				[2] = "{C:green}#1# in #2#{} chance to create respective",
				[3] = "{C:auxiliary}Seal Auxiliary{} Card when scored",
				[4] = '{C:inactive}(Must have room)',
            }
        }
    },
	
	black_jack = {
        ['en-us'] = {
            ['name'] = 'Black Jack',
            ['text'] = {
                [1] = 'This Joker gains {C:chips}Chips{} equal to {C:attention}total rank{}',
				[2] = 'of the played hand if it is under {C:attention}#1#{}.',
				[3] = 'Doubles gained chips if the {C:attention}total rank{} is exactly {C:attention}#1#{}.',
				[4] = 'Resets if the total rank is more than {C:attention}#1#{}.',
				[5] = '{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)'
            }
        }
    },
	
	what = {
        ['en-us'] = {
            ['name'] = 'What',
            ['text'] = {
                [1] = 'Played {C:attention}???{}',
				[2] = 'give {C:chips}+#1#{} Chips and',
				[3] = '{C:mult}+#2#{} Mult when scored',
            }
        }
    },
	
	floating_point_error = {
        ['en-us'] = {
            ['name'] = 'Floating-Point Error',
            ['text'] = {
                [1] = 'Every played {C:attention}Decimal Rank{} card',
                [2] = 'permanently gains {C:chips}extra chips{}',
				[3] = 'equal to its own {C:attention}rank{}',
            }
        }
    },
	
	academic_journal = {
        ['en-us'] = {
            ['name'] = 'Academic Journal',
            ['text'] = {
                [1] = 'Adds one random {C:attention}Enhanced Card{}',
				[2] = 'with {C:attention}decimal rank{} to deck if',
				[3] = 'played hand does not have a {C:attention}face{} card',
				[4] = '{C:inactive}(Once per round. Currently {C:red}#1#/#2#{C:inactive})',
            }
        }
    },
	
	engineer = {
        ['en-us'] = {
            ['name'] = 'Engineer',
            ['text'] = {
                [1] = 'Cards with {C:attention}decimal ranks{} count as',
				[2] = 'the nearest {C:attention}integer rank{} rounded up when',
				[3] = 'played in non-{C:purple}Straight{} hands',
				[4] = '{C:inactive}(EX: 3.14 -> 4)',
            }
        }
    },
	
	thesis_proposal = {
        ['en-us'] = {
            ['name'] = 'Thesis Proposal',
            ['text'] = {
                [1] = 'Retrigger all played cards',
                [2] = 'with {C:attention}decimal ranks{}',
            }
        }
    },
	
	rainbow_flag = {
        ['en-us'] = {
            ['name'] = 'Rainbow Flag',
            ['text'] = {
                [1] = 'If a hand containing {C:purple}Straight{} has',
				[2] = 'at least 1 {C:attention}decimal rank{} card,',
				[3] = "{C:green}#1# in #2#{} chance to turn",
				[4] = "one of the cards {C:dark_edition}Polychrome{}",
            }
        }
    },
	
	dummy_data = {
        ['en-us'] = {
            ['name'] = 'Dummy Data',
            ['text'] = {
                [1] = 'For each {C:attention}unscored card{}',
				[2] = '{C:green}#1# in #2#{} chance to',
				[3] = "convert its rank to {C:attention}0{}",
				[4] = "(Retains amount of Chips)",
            }
        }
    },
	
	micro_sd_card = {
        ['en-us'] = {
            ['name'] = 'Micro SD Card',
            ['text'] = {
				[1] = 'If this Joker is in the {C:attention}leftmost position{},',
                [2] = 'take all Chips from discarded base {C:attention}numbered cards{}',
				[3] = "and strip those cards' ranks to {C:attention}0{}",
				[4] = "{C:green}#1# in #2#{} chance to destroy itself at the end of round",
				[5] = "Chance increases by the amount of Chips stored",
				[6] = '{C:inactive}(Currently {C:chips}+#4#{C:inactive} Chips)',
				[7] = '{C:inactive}Status: {V:1}#5#{}',
            }
        }
    },
	
	social_experiment = {
        ['en-us'] = {
            ['name'] = 'Social Experiment',
            ['text'] = {
                [1] = 'For each played {C:attention}numbered card{},',
				[2] = 'double its Chips, give it to the next card',
				[3] = "and strip its {C:attention}rank{} to {C:attention}0{}",
            }
        }
    },
	
	power_of_one = {
        ['en-us'] = {
            ['name'] = 'Power of One',
            ['text'] = {
                [1] = 'Gives {C:mult}+#1#{} Mult for each',
				[2] = '{C:attention}1{} in your {C:attention}full deck{}',
				[3] = "{C:inactive}(Currently {C:mult}+#2#{C:inactive})",
            }
        }
    },
	
	binary_number = {
        ['en-us'] = {
            ['name'] = 'Binary Number',
            ['text'] = {
                [1] = 'If played hand contains {C:attention}4{} or fewer cards',
				[2] = 'and only consists of {C:attention}rank 0{} and {C:attention}1{} cards,',
				[3] = "create a card with {C:attention}rank{} equal",
				[4] = "to the number represented in binary",
				[5] = "({C:red}Ex:{} {C:attention}1001{} -> {C:attention}9{})",
				[6] = "{C:inactive}[Jack, Queen, King, Ace is 11-14, respectively]{}",
            }
        }
    },
	
	quintuplets = {
        ['en-us'] = {
            ['name'] = 'Quintuplets',
            ['text'] = {
                [1] = 'If the winning hand is a {C:attention}Flush Five{}',
                [2] = 'containing all {C:attention}Enhanced cards{},',
				[3] = 'create a {C:dark_edition}Negative Tag{}',
            }
        }
    },
	
	graphic_card = {
        ['en-us'] = {
            ['name'] = 'Graphic Card',
            ['text'] = {
                [1] = 'Create a {C:attention}Double Tag{}',
				[2] = 'at the end of the round',
                [3] = 'if {C:attention}#1#{} or more cards with',
				[4] = '{C:dark_edition}editions{} were scored this round',
				[5] = '{C:inactive}(Currently {C:attention}#2# {C:inactive}cards)',
            }
        }
    },
	
	connoiseur = {
        ['en-us'] = {
            ['name'] = 'Connoiseur',
            ['text'] = {
                [1] = 'Retrigger all played cards',
                [2] = 'with {C:dark_edition}editions{}',
            }
        }
    },
	
	jeweler = {
        ['en-us'] = {
            ['name'] = 'Jeweler',
            ['text'] = {
                [1] = '{C:green}#1# in #2#{} chance to downgrade',
				[2] = 'level of played {C:attention}poker hand{}',
				[3] = 'and {C:purple}upgrade{} edition',
				[4] = 'of all scored cards',
            }
        }
    },
	
	--New Enhancement Supports
	
	--Slop
	joker_diffusion = {
        ['en-us'] = {
            ['name'] = 'Joker Diffusion',
            ['text'] = {
                [1] = 'Converts {C:attention}#1#{} random {C:attention}non-enhanced{} card',
				[2] = 'in hand to {C:attention}Slop Card{} every time',
				[3] = 'a hand is played with {C:attention}unscored card{}',
            }
        }
    },
	
	nonfungible_joker = {
        ['en-us'] = {
            ['name'] = 'Non-Fungible Joker',
            ['text'] = {
                [1] = 'If a discarded hand contains',
				[2] = 'only {C:attention}#1# Slop Card{}, destroy it and',
				[3] = 'earn random amount of up to {C:gold}$#2#',
				[4] = '{s:0.8,C:red}Maximum Payout and Sell Value drops at the end of the round',
            }
        }
    },
	
	prompt = {
        ['en-us'] = {
            ['name'] = 'Prompt',
            ['text'] = {
                [1] = 'Scored {C:attention}Slop Cards{} take',
                [2] = 'the {C:attention}rank{} and {C:attention}suit{} from',
				[3] = 'other scored {C:attention}non-Slop Cards{}',
				[4] = 'instead of random (if possible)',
            }
        }
    },
	
	uninterested_primate = {
        ['en-us'] = {
            ['name'] = 'Uninterested Primate',
            ['text'] = {
                [1] = 'Gains {C:chips}+#1#{} Chips every {C:attention}#2# {C:inactive}[#6#]',
				[2] = '{C:attention}Slop Cards{} scored.',
				[3] = '{C:green}#3# in #4#{} chance this card is',
				[4] = 'destroyed at end of round',
				[5] = '{C:inactive}(Currently {C:chips}+#5# {C:inactive}Chips)',
				
            }
        }
    },
	
	lethargic_lion = {
        ['en-us'] = {
            ['name'] = 'Lethargic Lion',
            ['text'] = {
                [1] = 'Gains {X:mult,C:white}X#1#{} Mult every {C:attention}#2# {C:inactive}[#6#]',
				[2] = '{C:attention}Slop Cards{} scored.',
				[3] = '{C:green}#3# in #4#{} chance this card is',
				[4] = 'destroyed at end of round',
				[5] = '{C:inactive}(Currently {X:mult,C:white}X#5#{C:inactive} Mult)',
				
            }
        }
    },
	
	--Other Enhancement
	
	joker_island = {
        ['en-us'] = {
            ['name'] = 'Joker Island',
            ['text'] = {
                [1] = 'For every scored card',
				[2] = 'with {C:attention}rank{} {C:attention}#1#{},',
				[3] = '{C:green}#2# in #3#{} chance to add a',
				[4] = '{C:attention}Resource Card{} of the same suit to deck',
				[5] = '{s:0.8}rank changes at end of round',
            }
        }
    },
	
	--New Anti-Enhancement Stuff
	
	kaiju = {
        ['en-us'] = {
            ['name'] = 'Kaiju',
            ['text'] = {
                [1] = '{C:dark_edition}+#1#{} Joker slot',
				[2] = 'Converts one random card',
				[3] = 'into a {C:attention}Radioactive Card{} when',
				[4] = 'first hand is drawn',
            }
        }
    },
	
	poison_the_well = {
        ['en-us'] = {
            ['name'] = 'Poison the Well',
            ['text'] = {
                [1] = '{C:red}+#1#{} Discards',
				[2] = 'Converts one random card',
                [3] = 'in each discarded hand',
				[4] = 'into a {C:attention}Poison Card{}'
            }
        }
    },
	
	petri_dish = {
        ['en-us'] = {
            ['name'] = 'Petri Dish',
            ['text'] = {
                [1] = '{C:blue}+#1#{} Hands',
				[2] = '{C:green}#2# in #3#{} chance of converting',
				[3] = 'one random played card',
				[4] = 'into a {C:attention}Biohazard Card{}'
            }
        }
    },
	
	geiger_counter = {
        ['en-us'] = {
            ['name'] = 'Geiger Counter',
            ['text'] = {
                [1] = 'Gives {C:mult}+#1#{} Mult for',
				[2] = 'each {C:attention}Radioactive Card{}',
                [3] = 'in your {C:attention}full deck{}',
				[4] = "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
            }
        }
    },
	
	strych_nine = {
        ['en-us'] = {
            ['name'] = 'Strych-Nine',
            ['text'] = {
                [1] = 'Gives {C:chips}+#1#{} Chips',
				[2] = 'for each {C:attention}Poison Card{}',
                [3] = 'in your {C:attention}full deck{}',
				[4] = "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
            }
        }
    },
	
	vaccination_card = {
        ['en-us'] = {
            ['name'] = 'Vaccination Card',
            ['text'] = {
				[1] = 'Neutralize all {C:attention}Biohazard Card{} passive effects',
                [2] = 'Gives additional {X:mult,C:white}X#1#{} Mult for each',
				[3] = '{C:attention}Biohazard Card{} held in hand',
				[4] = "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
            }
        }
    },
	
	--New Enhancement Supports
	vintage_joker = {
        ['en-us'] = {
            ['name'] = 'Vintage Joker',
            ['text'] = {
				[1] = 'Scored {C:attention}Vintage Cards{} have',
                [2] = '{C:green}#1# in #2#{} chance to reduce',
				[3] = 'their destroy chance by half',
            }
        }
    },
	
	rules_errata = {
        ['en-us'] = {
            ['name'] = 'Rules Errata',
            ['text'] = {
				[1] = '{C:attention}Acorn Mark Cards{} give {C:attention}half{} of their',
                [2] = "{C:attention}rank{}'s value as Mult when scored",
            }
        }
    },
	
	auction_winner = {
        ['en-us'] = {
            ['name'] = 'Auction Winner',
            ['text'] = {
				[1] = 'If a {C:attention}Promo Card{} is',
                [2] = 'destroyed from scoring, this Joker',
                [3] = "gains {C:gold}money{} equal to",
				[4] = "the {C:gold}money{} that card gave",
                [5] = "before its destruction",
            }
        }
    },
	
	--Auxiliary Support
	
	free_trial = {
        ['en-us'] = {
            ['name'] = 'Free Trial',
            ['text'] = {
				[1] = '{C:green}#1# in #2#{} chance to create',
                [2] = "a {C:dark_edition}Negative{} random {C:auxiliary}Auxiliary{} Card",
				[3] = "when an {C:auxiliary}Auxiliary{} Card is used",
            }
        }
    },
	
	extended_warranty = {
        ['en-us'] = {
            ['name'] = 'Extended Warranty',
            ['text'] = {
				[1] = '{C:auxiliary}Auxiliary{} Cards in',
                [2] = 'your {C:attention}consumable{} area',
                [3] = "give {X:mult,C:white}X#1#{} Mult",
            }
        }
    },
	
	technician = {
        ['en-us'] = {
            ['name'] = 'Technician',
            ['text'] = {
                [1] = '{C:chips}+#1#{} Chips per',
                [2] = '{C:auxiliary}Auxiliary{} Card',
				[3] = 'used this run',
				[4] = '{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips){}',
            }
        }
    },
	
	season_pass = {
        ['en-us'] = {
            ['name'] = 'Season Pass',
            ['text'] = {
                [1] = '{C:green}#1# in #2#{} chance to create',
                [2] = "a random {C:auxiliary}Auxiliary{} Card",
				[3] = 'when discarding a {C:attention}face{} card',
				[4] = '{C:inactive}(Must have room)',
            }
        }
    },
	
	--Miscellaneous
	
	joker2 = {
        ['en-us'] = {
            ['name'] = 'Joker2',
            ['text'] = {
                [1] = '{C:mult}+#1#{} Mult',
				[2] = '{X:mult,C:white}X#2#{} Mult',
				[3] = '{C:green}#3# in #4#{} chance this',
                [4] = 'card is destroyed',
				[4] = 'at end of round',
            }
        }
    },
	
	joker_stairs = {
        ['en-us'] = {
            ['name'] = 'Joker Stairs',
            ['text'] = {
                [1] = 'Gain {C:mult}+#1#{} Mult when buying a Joker',
				[2] = 'with {C:attention}"Joker"{} in its name',
				[3] = '{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult){}',
            }
        }
    },
	
	plagiarism = {
        ['en-us'] = {
            ['name'] = 'Plagiarism',
            ['text'] = {
                [1] = 'Copies ability of',
				[2] = '{C:attention}Joker{} to the',
				[3] = 'left or right at random',
				[4] = '{s:0.8}Direction changes each hand played',
				[5] = '{C:inactive}(Currently {C:red}#1#{C:inactive})',
            }
        }
    },
	
	joker_throwing_card = {
        ['en-us'] = {
            ['name'] = 'Joker Throwing Card',
            ['text'] = {
                [1] = 'Decrease {C:attention}Blind{} size by {C:attention}#1#%{}',
				[2] = '{C:green}#2# in #3#{} chance to destroy',
				[3] = 'one of the scored cards',
				[4] = 'Increases percentage by {C:attention}#4#%{}',
				[5] = 'if a card is destroyed this way',
            }
        }
    },
	
	jackhammer = {
        ['en-us'] = {
            ['name'] = 'Jackhammer',
            ['text'] = {
                [1] = 'If the {C:attention}played hand{} has only one {C:attention}Jack{},',
				[2] = 'retrigger it {C:attention}#1#{} more times',
				[3] = 'and {C:red}destroy it{} afterward',
            }
        }
    },
	
	jack_of_all_trades = {
        ['en-us'] = {
            ['name'] = 'Jack of All Trades',
            ['text'] = {
                [1] = 'Played {C:attention}Jacks{} give',
				[2] = '{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult, ',
				[3] = '{X:mult,C:white}X#3#{} Mult, and {C:gold}$#4#',
            }
        }
    },
	
	magic_trick_card = {
        ['en-us'] = {
            ['name'] = 'Magic Trick Card',
            ['text'] = {
                [1] = 'Scored {V:1}#1#{} cards',
				[2] = 'turn into {V:2}#2#{} cards',
				[3] = '{s:0.8}On discard, flips over the Joker',
            }
        }
    },
	
	queensland = {
        ['en-us'] = {
            ['name'] = 'Queensland',
            ['text'] = {
                [1] = 'Scored {C:attention}Queens{} add',
				[2] = '{C:attention}Resource Cards{} of',
				[3] = 'the corresponding suits to deck',
				[4] = '{C:inactive}({C:red}#1#{C:inactive} times per round, {C:red}#2# left{C:inactive})',
            }
        }
    },
	
	prssj = {
        ['en-us'] = {
            ['name'] = 'Polychrome Red Seal Steel Joker',
            ['text'] = {
                [1] = '{C:green}#1# in #2#{} chance for scored {C:attention}Kings{} to {C:purple}upgrade{} edition',
				[2] = '{C:green}#1# in #3#{} chance for scored {C:attention}Kings{} to {C:attention}retrigger',
				[3] = '{C:green}#1# in #4#{} chance for {C:attention}Kings{} held in hand to give {X:mult,C:white}X#5#{} Mult',
            }
        }
    },
	
	king_of_pop = {
        ['en-us'] = {
            ['name'] = 'King of Pop',
            ['text'] = {
                [1] = 'Played {C:attention}Enhanced Kings{} have',
				[2] = '{C:green}#1# in #2#{} chance to be',
				[3] = 'destroyed and create a {C:dark_edition}Double Tag',
            }
        }
    },
	
	master_of_one = {
        ['en-us'] = {
            ['name'] = 'Master of One',
            ['text'] = {
                [1] = 'Adds one {C:attention}Enhanced Rank 1{} card',
				[2] = 'to deck when {C:attention}Blind{} is selected',
            }
        }
    },
	
	spectre = {
        ['en-us'] = {
            ['name'] = 'Spectre',
            ['text'] = {
                [1] = '{X:mult,C:white}X#1#{} Mult per {C:spectral}Spectral{}',
				[2] = 'card used this run',
				[3] = '{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult){}',
            }
        }
    },
	
	library_card = {
        ['en-us'] = {
            ['name'] = 'Library Card',
            ['text'] = {
                [1] = "For each scored card's {C:attention}singular",
				[2] = '{C:attention}suit name{} in English, give:',
				[3] = '{C:chips}+#1#{} Chips per {C:attention}Consonant',
				[4] = '{C:mult}+#2#{} Mult per {C:attention}Vowel',
				[5] = '{C:inactive}(Example: Spade = {C:chips}+15{C:inactive} Chips, {C:mult}+4{C:inactive} Mult)'
            }
        }
    },
	
	collector_album = {
        ['en-us'] = {
            ['name'] = "Collector's Album",
            ['text'] = {
                [1] = 'Jokers with {C:attention}"Card"{} in',
				[2] = 'their name each give',
				[3] = '{C:chips}+#1#{} Chips',
            }
        }
    },
	
	throwing_hands = {
        ['en-us'] = {
            ['name'] = 'Throwing Hands',
            ['text'] = {
                [1] = '{X:mult,C:white}X#1#{} Mult if poker hand is {C:attention}#3#{}',
				[2] = '{X:mult,C:white}X#2#{} Mult otherwise',
				[3] = '{s:0.8}hand changes at end of round',
            }
        }
    },
	
	imperial_bower = {
        ['en-us'] = {
            ['name'] = 'Imperial Bower',
            ['text'] = {
                [1] = '{X:mult,C:white}X#1#{} Mult if played hand',
				[2] = "contains a {C:attention}Straight{} and",
				[3] = 'has at least one {C:attention}face{} card',
            }
        }
    },
	
	the_jolly_joker = {
        ['en-us'] = {
            ['name'] = 'The "Jolly Joker"',
            ['text'] = {
                [1] = 'Gains {C:mult}+#1#{} Mult if',
				[2] = 'played hand contains a {C:attention}Pair{}',
				[3] = "{C:red}Resets{} if played hand",
				[4] = "does not contain a {C:attention}Pair{}",
				[5] = '{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)',
            }
        }
    },
	
	get_out_of_jail_free_card = {
        ['en-us'] = {
            ['name'] = 'Get Out of Jail Free Card',
            ['text'] = {
                [1] = 'Sell this Joker to',
				[2] = "win the blind instantly",
				[3] = '{C:inactive}Status: {V:1}#1#{}',
            }
        }
    },
	
	tanzaku = {
        ['en-us'] = {
            ['name'] = 'Tanzaku',
            ['text'] = {
                [1] = 'Retrigger played cards with',
                [2] = '{C:attention}seals{} {C:attention}#1#{} additional times',
				[3] = 'Amount increases by {C:attention}#2#{} for',
				[4] = 'every discarded card with a {C:attention}seal{}',
				[5] = '{s:0.8}Resets after each round',
            }
        }
    },
	
	glass_cannon = {
        ['en-us'] = {
            ['name'] = 'Glass Cannon',
            ['text'] = {
                [1] = 'Retrigger each',
                [2] = 'played {C:attention}Glass Card{}',
				[3] = '{C:red}Glass Cards are guaranteed',
				[4] = '{C:red}to break when scored',
            }
        }
    },
	
	pity_rate_drop = {
        ['en-us'] = {
            ['name'] = 'Pity Rate Drop',
            ['text'] = {
                [1] = 'When {C:attention}Blind{} is selected,',
                [2] = '{C:green}#1# in #2#{} chance to create a {C:red}Rare {C:attention}Joker{}',
				[3] = 'Chance increase by {C:green}#3#{} if no {C:attention}Joker{} created,',
				[4] = 'resets to {C:green}#4#{} otherwise',
				[5] = '{C:inactive}(Must have room)',
            }
        }
    },
	
	salmon_run = {
        ['en-us'] = {
            ['name'] = 'Salmon Run',
            ['text'] = {
                [1] = 'Each played {C:attention}7{} has a',
                [2] = '{C:green}#1# in #2#{} chance of adding a',
                [3] = 'permanent copy to deck when scored',
            }
        }
    },
	
	cool_s = {
        ['en-us'] = {
            ['name'] = 'Cool S',
            ['text'] = {
                [1] = 'Played {C:attention}8s{} become',
				[2] = 'a random {C:attention}Enhanced card{}',
            }
        }
    },
	
	memoriam_photo = {
        ['en-us'] = {
            ['name'] = 'Memoriam Photo',
            ['text'] = {
                [1] = 'When a playing card is {C:attention}destroyed{},',
				[2] = 'this Joker gains Chips equal to {C:attention}double{}',
				[3] = 'the rank of the {C:attention}destroyed card{}',
				[4] = '{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)',
            }
        }
    },
	
	schrodinger_cat = {
        ['en-us'] = {
            ['name'] = "Schrödinger's Cat",
            ['text'] = {
                [1] = 'When a playing card is {C:attention}destroyed{},',
				[2] = '{C:green}#1# in #2#{} chance to add',
				[3] = 'a copy of the card to deck',
            }
        }
    },
	
	cashback_card = {
        ['en-us'] = {
            ['name'] = 'Cashback Card',
            ['text'] = {
                [1] = 'At the end of a {C:attention}Boss Blind{},',
				[2] = 'earn {C:gold}money{} equals to the amount',
				[3] = 'of {C:attention}consumables{} used this {C:attention}Ante',
				[4] = '{C:inactive}(Currently {C:gold}$#1#{C:inactive})',
            }
        }
    },
	
	raffle = {
        ['en-us'] = {
            ['name'] = 'Raffle',
            ['text'] = {
                [1] = 'At the end of each {C:attention}shop{},',
				[2] = '{C:green}#1# in #2#{} chance to win {C:gold}$#3#',
				[3] = 'Chance increases by {C:green}#4#{}',
				[4] = 'for each purchase in the {C:attention}shop',
				[5] = '{s:0.8, C:red}Resets after exiting the shop',
            }
        }
    },
	
	ic_card = {
        ['en-us'] = {
            ['name'] = 'IC Card',
            ['text'] = {
                [1] = 'Gain {C:gold}$#1#{} to store in this Joker',
				[2] = 'every time a hand is played',
				[3] = 'When spending money, the {C:attention}balance',
				[4] = 'in this Joker is spent first',
				[5] = '{C:red}Only usable for #2# rounds',
				[6] = '{C:inactive}(Currently {C:gold}$#3#{C:inactive}, {C:red}#4# Rounds left{C:inactive}){}',
            }
        }
    },
	
	j2048 = {
        ['en-us'] = {
            ['name'] = '2048',
            ['text'] = {
                [1] = 'If played hand contains a {C:attention}Pair{} with',
				[2] = 'rank of power of two {C:attention}(2, 4, 8){},',
				[3] = 'destroy the left one and give all chips to the other',
				[4] = '{C:inactive}(Drag to rearrange){}',
            }
        }
    },
	
	j2048_ex = {
        ['en-us'] = {
            ['name'] = '2048',
            ['text'] = {
                [1] = 'If played hand contains a {C:attention}Pair{} with',
				[2] = 'rank of power of two {C:attention}(0, 1, 2, 4, 8){},',
				[3] = 'destroy the left one and give all chips to the other',
				[4] = '{C:inactive}(Drag to rearrange){}',
            }
        }
    },
	
	inductor = {
        ['en-us'] = {
            ['name'] = 'Inductor',
            ['text'] = {
                [1] = 'For every played card with the same',
				[2] = '{C:attention}rank{} and suit{C:attention}{} as another played card:',
				[3] = '{C:green}#1# in #2#{} chance to copy {C:attention}Enhancement{}',
				[4] = '{C:green}#1# in #3#{} chance to copy {C:attention}Edition{}',
				[5] = '{C:green}#1# in #4#{} chance to copy {C:attention}Seal{}',
            }
        }
    },
	
	--Decks
	
	deck_util = {
        ['en-us'] = {
            ['name'] = 'Utility Deck',
            ['text'] = {
                [1] = 'Start run with the',
				[2] = '{C:auxiliary}Hardware Store{} voucher',
                [3] = 'and {C:attention}1{} copy of {C:auxiliary}The Question{},',
                [4] = '{C:auxiliary}Auxiliary Cards{} can appear',
				[5] = 'in the {C:attention}shop{} more often',
            },
        }
    },
	
	deck_lowkey = {
        ['en-us'] = {
            ['name'] = 'Lowkey Deck',
            ['text'] = {
                [1] = 'Start run with only',
				[2] = '{C:attention}rank 0-5{} cards',
                [3] = 'and all {C:attention}decimal',
				[4] = '{C:attention}ranks{} in between',
            },
        }
    },
	
	
	--Vanilla reworked joker
	fibonacci = {
        ['en-us'] = {
            ['name'] = 'Fibonacci',
            ['text'] = {
                [1] = 'Each played {C:attention}Ace{},',
				[2] = '{C:attention}2{}, {C:attention}3{}, {C:attention}5{}, or {C:attention}8{} gives',
				[3] = '{C:mult}+#1#{} Mult when scored',
            }
        }
    },
	
	fibonacci_ex = {
        ['en-us'] = {
            ['name'] = 'Fibonacci',
            ['text'] = {
                [1] = 'Each played {C:attention}0{}, {C:attention}1{}, {C:attention}Ace{},',
				[2] = '{C:attention}2{}, {C:attention}3{}, {C:attention}5{}, {C:attention}8{}, or {C:attention}21{}',
				[3] = '{C:mult}+#1#{} Mult when scored',
            }
        }
    },
	
	odd_todd = {
        ['en-us'] = {
            ['name'] = 'Odd Todd',
            ['text'] = {
                [1] = 'Played cards with',
				[2] = '{C:attention}odd{} rank give',
				[3] = '{C:chips}+#1#{} Chips when scored',
				[4] = '{C:inactive}(A, 9, 7, 5, 3){}',
            }
        }
    },
	
	odd_todd_ex = {
        ['en-us'] = {
            ['name'] = 'Odd Todd',
            ['text'] = {
                [1] = 'Played cards with',
				[2] = '{C:attention}odd{} rank give',
				[3] = '{C:chips}+#1#{} Chips when scored',
				[4] = '{C:inactive}(21, A, 9, 7, 5, 3, 1){}',
            }
        }
    },
	
	even_steven = {
        ['en-us'] = {
            ['name'] = 'Even Steven',
            ['text'] = {
                [1] = 'Played cards with',
				[2] = '{C:attention}even{} rank give',
				[3] = '{C:mult}+#1#{} Mult when scored',
				[4] = '{C:inactive}(10, 8, 6, 4, 2){}',
            }
        }
    },
	
	even_steven_ex = {
        ['en-us'] = {
            ['name'] = 'Even Steven',
            ['text'] = {
                [1] = 'Played cards with',
				[2] = '{C:attention}even{} rank give',
				[3] = '{C:mult}+#1#{} Mult when scored',
				[4] = '{C:inactive}(10, 8, 6, 4, 2, 0){}',
            }
        }
    },
}