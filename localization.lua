return {
    dictionary = {
	
		--Put generic words here
	
        ['en-us'] = {

            -- Config values

            

            requires_restart = '(Requires game restart)',

            -- Miscellaneous
			tarot_exclaim = 'Tarot!?',
            upgrade = 'Upgrade!',
			
			decimal_rank_ability = {['text'] = {[1] = 'Can act as {C:attention}different rank{}',
												[2] = 'when played in {C:purple}Straight{} hand',
												[3] = '{C:inactive}[#1#, #2#, #3#]{}',}}
        },
    },
	
	-- Enhancement
	
	enh_acorn = {
		['en-us'] = {
            ['name'] = 'Acorn Mark Card',
            ['text'] = {
                [1] = 'Give {C:chips}+#1#{} chips when in hand',
				[2] = 'Does not give any chips when scored',
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
                [1] = 'Gives {C:gold}$#1#{} when in hand',
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
				[2] = 'Give {X:mult,C:white}X#1#{} Mult',
				[3] = 'if the played hand has at least',
				[4] = 'one card with {V:1}#2#{} suit',
				[5] = '{C:red}Destroy itself after scored{}',
				[6] = '{C:inactive}(Does not count another Resource Card){}',
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
				[3] = 'convert other played cards to {C:attention}Radioactive Card{}',
				[4] = '',
				[5] = 'When held in hand, {C:green}#2# in #4#{} chance to give',
				[6] = '{X:mult,C:white}X#5#{} Mult, otherwise give {X:mult,C:white}X#6#{} Mult',
            }
        }
	},
	
	enh_biohazard = {
		['en-us'] = {
            ['name'] = 'Biohazard Card',
            ['text'] = {
                [1] = '{X:mult,C:white}X#1#{} Mult, no rank or suit',
				[2] = 'Lose {C:red}-$#2#{} on hand',
				[3] = 'When discarded, {C:green}#3# in #4#{} chance to turns one random',
				[4] = 'card in the deck into {C:attention}Biohazard Card{}',
            }
        }
	},
	
	enh_poison = {
		['en-us'] = {
            ['name'] = 'Poison Card',
            ['text'] = {
				[1] = '{C:red}-#1#{} chips',
				[2] = 'Discarded {C:attention}Poison Cards{}',
				[3] = 'goes back into the deck',
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
				[2] = 'counts as {C:attention}face card{}',
            }
        }
	},
	
	seal_heal = {
		['en-us'] = {
			['label'] = 'Heal Seal',
            ['name'] = 'Heal Seal',
            ['text'] = {
				[1] = 'Removes {C:red}Disenhancement{} from one',
				[2] = 'of random cards held in hand when scored.',
				[3] = 'This card also cannot be {C:red}Disenhanced{}.',
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
		Euler = "e",
		Pi = "Pi",
	},
	
	
	--Booster Pack 
	auxpack = {
        ['en-us'] = {
            ['group_name'] = 'Auxiliary Pack',
            ['name'] = 'Auxiliary Pack',
            ['text'] = {
                [1] = 'Choose {C:attention}#1#{} of up to',
                [2] = '{C:attention}#2#{C:green} Auxiliary{} cards to',
                [3] = 'be used immediately'
            }
        }
    },
    auxpack_jumbo = {
        ['en-us'] = {
            ['group_name'] = 'Auxiliary Pack',
            ['name'] = 'Jumbo Auxiliary Pack',
            ['text'] = {
                [1] = 'Choose {C:attention}#1#{} of up to',
                [2] = '{C:attention}#2#{C:green} Auxiliary{} cards to',
                [3] = 'be used immediately'
            }
        }
    },
    auxpack_mega = {
        ['en-us'] = {
            ['group_name'] = 'Auxiliary Pack',
            ['name'] = 'Mega Auxiliary Pack',
            ['text'] = {
                [1] = 'Choose {C:attention}#1#{} of up to',
                [2] = '{C:attention}#2#{C:green} Auxiliary{} cards to',
                [3] = 'be used immediately'
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
                [1] = 'Adds {V:1}#2#{} onto',
                [2] = '{C:attention}#1#{} selected cards.'
            }
        }
    },
	
	aux_hearts = {
        ['en-us'] = {
            ['name'] = 'Essence of Hearts',
            ['text'] = {
                [1] = 'Adds {V:1}#2#{} onto',
                [2] = '{C:attention}#1#{} selected cards.'
            }
        }
    },
	
	aux_clubs = {
        ['en-us'] = {
            ['name'] = 'Essence of Clubs',
            ['text'] = {
                [1] = 'Adds {V:1}#2#{} onto',
                [2] = '{C:attention}#1#{} selected cards.'
            }
        }
    },
	
	aux_diamonds = {
        ['en-us'] = {
            ['name'] = 'Essence of Diamonds',
            ['text'] = {
                [1] = 'Adds {V:1}#2#{} onto',
                [2] = '{C:attention}#1#{} selected cards.'
            }
        }
    },
	
	aux_face = {
        ['en-us'] = {
            ['name'] = 'Possessions',
            ['text'] = {
                [1] = 'Adds {C:attention}Face Seal{} onto',
                [2] = '{C:attention}#1#{} selected cards.'
            }
        }
    },
	
	aux_plus_two = {
        ['en-us'] = {
            ['name'] = '+2',
            ['text'] = {
                [1] = 'Adds {C:attention}#1#{} cards of any ranks',
                [2] = 'with same suit of selected card to hand'
            }
        }
    },
	
	aux_plus_four_wild = {
        ['en-us'] = {
            ['name'] = 'Wild +4',
            ['text'] = {
                [1] = 'Adds {C:attention}#1#{} cards of any suits',
                [2] = 'with same rank of selected card to hand'
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
                [1] = 'Swaps {C:attention}seal{} between two selected cards',
            }
        }
    },
	
	aux_conv_1 = {
        ['en-us'] = {
            ['name'] = 'All for One',
            ['text'] = {
                [1] = 'Selects up to {C:attention}#1#{} cards',
				[2] = 'to converts into rank 1',
            }
        }
    },
	
	aux_21 = {
        ['en-us'] = {
            ['name'] = 'The Twenty-One',
            ['text'] = {
                [1] = 'Selects up to {C:attention}#1#{} cards',
				[2] = 'with total ranks of {C:attention}21 or more{}.',
				[3] = 'Destroys all selected cards and gets one',
				[4] = '{C:attention}rank 21{} card of a random suit.',
            }
        }
    },
	
	aux_upgrade = {
        ['en-us'] = {
            ['name'] = 'Monkey Paw',
            ['text'] = {
                [1] = 'Selects {C:attention}1{} card to {C:attention}upgrade edition{}',
				[2] = 'Turns adjacent cards into {C:attention}Poison Card{}',
				[3] = '{C:inactive}(Loops around){}',
            }
        }
    },
	
	aux_heal = {
        ['en-us'] = {
            ['name'] = 'Heal Guardian',
            ['text'] = {
                [1] = 'Adds {C:attention}Heal Seal{} onto',
                [2] = '{C:attention}#1#{} selected cards.'
            }
        }
    },
	
	aux_heal_hand = {
        ['en-us'] = {
            ['name'] = 'Heal Aura',
            ['text'] = {
                [1] = 'Heal all {C:attention}Disenhanced Cards{}',
                [2] = 'holding in hand'
            }
        }
    },
	
	-- Other Consumable Additions
	
	--Tarots
	trt_time = {
        ['en-us'] = {
            ['name'] = 'The Time',
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
                [1] = 'Enhances {C:attention}#1#{} ',
				[2] = 'selected cards to',
				[3] = '{C:attention}Acorn Mark Cards{}',
            }
        }
    },
	
	trt_greed = {
        ['en-us'] = {
            ['name'] = 'The Greed',
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
                [1] = 'Splits the {C:attention}integer-numbered rank{} cards',
				[2] = 'into two cards with {C:attention}half a rank{} (rounded down)',
				[3] = 'If the initial rank is {C:attention}odd{},',
				[4] = 'adds one {C:attention}0.5 rank{} card {C:attention}of the same enhancement{} as well',
            }
        }
    },
	
	trt_knowledge = {
        ['en-us'] = {
            ['name'] = 'The Knowledge',
            ['text'] = {
                [1] = 'Adds one random {C:attention}decimal-rank{} card',
				[2] = 'of the selected suit to hand',
            }
        }
    },
	
	--Spectral
	
	spc_elixir = {
        ['en-us'] = {
            ['name'] = 'Elixir of Life',
            ['text'] = {
                [1] = 'Heal all {C:attention}Disenhanced Cards{} in the deck',
                [2] = 'Reduce money by half {C:inactive}(rounded up){}'
            }
        }
    },
	
	spc_vessel = {
        ['en-us'] = {
            ['name'] = 'Vessel',
            ['text'] = {
                [1] = 'Selects {C:attention}2{} card,',
				[2] = 'destroy the {C:attention}left{} card',
				[3] = 'and gives corresponding {C:red}Suit Seal{}',
				[4] = 'to the {C:attention}right{} card',
				[5] = '{C:inactive}(Drags to rearrange){}',
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
				[2] = 'cards in your hand,',
				[3] = 'converts {C:attention}#2#{} random',
				[4] = 'cards in your hand into',
				[5] = '{C:attention}random {C:red}DisEnhancement{}',
            }
        }
    },
	
	spc_poltergeist = {
        ['en-us'] = {
            ['name'] = "Poltergeist",
            ['text'] = {
                [1] = 'Shuffles all',
				[2] = "Joker's {C:dark_edition}edition{}",
            }
        }
    },
	
	spc_projection = {
        ['en-us'] = {
            ['name'] = "Astral Projection",
            ['text'] = {
                [1] = 'Swap {C:dark_edition}editions{} between',
				[2] = 'the {C:attention}selected Joker{}',
				[3] = 'and the one {C:attention}on the right{}',
				[4] = '{C:green}#1# in #2#{} chance that',
				[5] = 'one of the Jokers are {C:red}destroyed{}',
            }
        }
    },
	
	spc_siphon = {
        ['en-us'] = {
            ['name'] = "Siphon",
            ['text'] = {
                [1] = 'Destroy a selected {C:attention}Joker{}',
				[2] = 'with {C:dark_edition}edition{}',
				[3] = "Gives the {C:attention}Joker's {C:dark_edition}edition{} to",
				[4] = '{C:attention}#1#{} random card in your hand',
				[5] = '{C:inactive}({C:dark_edition}Negative{} excluded){}',
            }
        }
    },
	
	--Jokers
	
	black_jack = {
        ['en-us'] = {
            ['name'] = 'Black Jack',
            ['text'] = {
                [1] = 'This Joker gains {C:chips}Chips{} equals to total rank',
				[2] = 'of the played hand if it is under {C:attention}#1#{}.',
				[3] = 'Doubled the amount of gained chips if the total rank is exactly {C:attention}#1#{}.',
				[4] = 'Resets if the total rank is more than {C:attention}#1#{}.',
				[5] = '{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)'
            }
        }
    },
	
	what = {
        ['en-us'] = {
            ['name'] = 'What',
            ['text'] = {
                [1] = 'Each played {C:attention}???{}',
				[2] = 'gives {C:chips}+#1#{} Chips and',
				[3] = '{C:mult}+#2#{} Mult when scored',
            }
        }
    },
	
	floating_point_error = {
        ['en-us'] = {
            ['name'] = 'Floating-Point Error',
            ['text'] = {
                [1] = 'Scored cards with {C:attention}Decimal Rank{}',
				[2] = 'Gains {C:chips}extra chips{} equal to its own {C:attention}rank{}',
            }
        }
    },
	
	dummy_data = {
        ['en-us'] = {
            ['name'] = 'Dummy Data',
            ['text'] = {
                [1] = 'For each {C:attention}unscored cards{}',
				[2] = '{C:green}#1# in #2#{} chance to',
				[3] = "Converts rank to {C:attention}0{}",
				[4] = "(Retains amount of chips)",
            }
        }
    },
	
	micro_sd_card = {
        ['en-us'] = {
            ['name'] = 'Micro SD Card',
            ['text'] = {
				[1] = 'If this Joker is in the {C:attention}leftmost position{}',
                [2] = 'take all {C:chips}chips{} from discarded base {C:attention}numbered cards{}',
				[3] = "Strips card's rank to {C:attention}0{}",
				[4] = "{C:green}#1# in #2#{} chance to destroy itself at the end of round",
				[5] = "Chance increases by the amount of chip stored",
				[6] = '{C:inactive}(Currently {C:chips}+#4#{C:inactive} Chips)',
				[7] = '{C:inactive}Status: {V:1}#5#{}',
            }
        }
    },
	
	social_experiment = {
        ['en-us'] = {
            ['name'] = 'Social Experiment',
            ['text'] = {
                [1] = 'For each {C:attention}Numbered Cards{},',
				[2] = 'Double all chips and give it to next card',
				[3] = "Strips card's rank to {C:attention}0{}",
            }
        }
    },
	
	power_of_one = {
        ['en-us'] = {
            ['name'] = 'Power of One',
            ['text'] = {
                [1] = 'Gains {C:mult}+#1#{} Mult for each',
				[2] = '{C:attention}1{} in your {C:attention}full deck{}',
				[3] = "{C:inactive}(Currently {C:mult}+#2#{C:inactive})",
            }
        }
    },
	
	binary_number = {
        ['en-us'] = {
            ['name'] = 'Binary Number',
            ['text'] = {
                [1] = 'If the {C:attention}full played hand{} only have {C:attention}four or less{} cards',
				[2] = 'and only consists of {C:attention}rank 0{} and {C:attention}1{} cards',
				[3] = "Creates a card with rank equal",
				[4] = "to number represented in binary",
				[5] = "({C:red}Ex:{} {C:attention}1001{} -> {C:attention}9{})",
				[6] = "{C:inactive}[Jack, Queen, King, Ace is 11-14, respectively]{}",
            }
        }
    },
	
	quintuplets = {
        ['en-us'] = {
            ['name'] = 'Quintuplets',
            ['text'] = {
                [1] = 'If the winning hand is {C:attention}Flush Five{}',
                [2] = 'with all {C:attention}Enhanced cards{},',
				[3] = 'Create {C:dark_edition}Negative Tag{}',
            }
        }
    },
	
	
	connoiseur = {
        ['en-us'] = {
            ['name'] = 'Connoiseur',
            ['text'] = {
                [1] = 'Retrigger all',
                [2] = 'played cards with {C:attention}editions{}',
            }
        }
    },
	
	jeweler = {
        ['en-us'] = {
            ['name'] = 'Jeweler',
            ['text'] = {
                [1] = '{C:green}#1# in #2#{} chance to downgrade',
				[2] = 'level of played {C:attention}poker hand{}',
				[3] = 'and {C:attention}upgrade{} edition',
				[4] = 'of all scored cards',
            }
        }
    },
	
	--New Enhancement Supports
	
	joker_island = {
        ['en-us'] = {
            ['name'] = 'Joker Island',
            ['text'] = {
                [1] = 'For every played card',
				[2] = 'with rank {C:attention}#1#{}',
				[3] = '{C:green}#2# in #3#{} chance to create',
				[4] = 'a new {C:attention}Resource Card{} of the same scored suit',
            }
        }
    },
	
	--New Anti-Enhancement Stuff
	
	kaiju = {
        ['en-us'] = {
            ['name'] = 'Kaiju',
            ['text'] = {
                [1] = '{C:dark_edition}+#1#{} Joker Slot',
				[2] = 'Turns one random card',
				[3] = 'into {C:attention}Radioactive Card{} when',
				[4] = 'first hand is drawn',
            }
        }
    },
	
	poison_the_well = {
        ['en-us'] = {
            ['name'] = 'Poison the Well',
            ['text'] = {
                [1] = '{C:red}+#1#{} Discards',
				[2] = 'Turns one random card in each discarded hand',
				[3] = 'into {C:attention}Poison Card{}'
            }
        }
    },
	
	petri_dish = {
        ['en-us'] = {
            ['name'] = 'Petri Dish',
            ['text'] = {
                [1] = '{C:blue}+#1#{} Hands',
				[2] = '{C:green}#2# in #3#{} chance of turning',
				[3] = 'one random played card',
				[4] = 'into {C:attention}Biohazard Card{}'
            }
        }
    },
	
	geiger_counter = {
        ['en-us'] = {
            ['name'] = 'Geiger Counter',
            ['text'] = {
                [1] = 'Gives {C:mult}+#1#{} Mult for each',
				[2] = '{C:attention}Radioactive Card{} in your {C:attention}full deck{}',
				[3] = "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
            }
        }
    },
	
	strych_nine = {
        ['en-us'] = {
            ['name'] = 'Strych-Nine',
            ['text'] = {
                [1] = 'Gives {C:chips}+#1#{} Chips for each',
				[2] = '{C:attention}Poison Card{} in your {C:attention}full deck{}',
				[3] = "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
            }
        }
    },
	
	vaccination_card = {
        ['en-us'] = {
            ['name'] = 'Vaccination Card',
            ['text'] = {
				[1] = 'Neutralize all {C:attention}Biohazard Card{} passive effects',
                [2] = 'Gives additional {X:mult,C:white}x#1#{} Mult for each',
				[3] = '{C:attention}Biohazard Card{} held in hand.',
				[4] = "{C:inactive}(Currently {X:mult,C:white}x#2#{C:inactive} Mult)",
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
				[3] = 'the destroyed chance by half',
            }
        }
    },
	
	rules_errata = {
        ['en-us'] = {
            ['name'] = 'Rules Errata',
            ['text'] = {
				[1] = '{C:attention}Acorn Mark Cards{} give {C:attention}half{} of a',
                [2] = "rank's value as Mult when scored",
            }
        }
    },
	
	auction_winner = {
        ['en-us'] = {
            ['name'] = 'Auction Winner',
            ['text'] = {
				[1] = 'If {C:attention}Promo Card{} is destroyed after scored',
                [2] = "gains {C:gold}money{} equals to amount the card",
				[3] = "gives before breaks",
            }
        }
    },
	
	--Miscellaneous
	
	joker2 = {
        ['en-us'] = {
            ['name'] = 'Joker2',
            ['text'] = {
                [1] = '{C:mult}+#1#{} Mult',
				[2] = '{X:mult,C:white}x#2#{} Mult',
				[3] = '{C:green}#3# in #4#{} chance of destroying itself',
				[4] = 'at the end of round',
            }
        }
    },
	
	joker_stairs = {
        ['en-us'] = {
            ['name'] = 'Joker Stairs',
            ['text'] = {
                [1] = 'Gain {C:mult}+#1#{} Mult when buying a joker',
				[2] = 'with {C:attention}"Joker"{} in the name.',
				[3] = '{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult){}',
            }
        }
    },
	
	jackhammer = {
        ['en-us'] = {
            ['name'] = 'Jackhammer',
            ['text'] = {
                [1] = 'If the {C:attention}scoring hand{} has only one {C:attention}Jack{}',
				[2] = 'retrigger it {C:attention}#1#{} more times ',
				[3] = 'and {C:red}destroy it{} afterward',
            }
        }
    },
	
	spectre = {
        ['en-us'] = {
            ['name'] = 'Spectre',
            ['text'] = {
                [1] = '{X:mult,C:white}x#1#{} Mult per {C:spectral}Spectral{}',
				[2] = 'card used this run',
				[3] = '{C:inactive}(Currently {X:mult,C:white}x#2#{C:inactive} Mult){}',
            }
        }
    },
	
	throwing_hands = {
        ['en-us'] = {
            ['name'] = 'Throwing Hands',
            ['text'] = {
                [1] = '{X:mult,C:white}x#1#{} Mult if the played hand is {C:attention}#3#{}',
				[2] = '{X:mult,C:white}x#2#{} Mult otherwise',
				[3] = '{C:inactive}(Hand changes at the end of round){}',
            }
        }
    },
	
	salmon_run = {
        ['en-us'] = {
            ['name'] = 'Salmon Run',
            ['text'] = {
                [1] = '{C:green}#1# in #2#{} chance of',
				[2] = 'duplicating any scored {C:attention}7{}',
            }
        }
    },
	
	j2048 = {
        ['en-us'] = {
            ['name'] = '2048',
            ['text'] = {
                [1] = 'If played hand contains {C:attention}Pair{} of rank ',
				[2] = 'with power of two {C:attention}(2, 4, 8){}',
				[3] = 'destroy the left one and gives all chips to another',
				[4] = '{C:inactive}(Drag to rearrange){}',
            }
        }
    },
	
	j2048_ex = {
        ['en-us'] = {
            ['name'] = '2048',
            ['text'] = {
                [1] = 'If played hand contains {C:attention}Pair{} of rank ',
				[2] = 'with power of two {C:attention}(0, 1, 2, 4, 8){}',
				[3] = 'destroy the left one and gives all chips to another',
				[4] = '{C:inactive}(Drag to rearrange){}',
            }
        }
    },
	
	inductor = {
        ['en-us'] = {
            ['name'] = 'Inductor',
            ['text'] = {
                [1] = 'For every played card with',
				[2] = 'the same rank and suits',
				[3] = '{C:green}#1# in #2#{} chance to copy {C:attention}Enhancement{}',
				[4] = '{C:green}#1# in #3#{} chance to copy {C:attention}Edition{}',
				[5] = '{C:green}#1# in #4#{} chance to copy {C:attention}Seal{}',
            }
        }
    },
	
	
	--Vanilla reworked joker
	fibonacci = {
        ['en-us'] = {
            ['name'] = 'Fibonacci',
            ['text'] = {
                [1] = 'Each played {C:attention}Ace{},',
				[2] = '{C:attention}2{}, {C:attention}3{}, {C:attention}5{}, or {C:attention}8{} gives',
				[3] = 'gives {C:mult}+#1#{} Mult when scored',
            }
        }
    },
	
	fibonacci_ex = {
        ['en-us'] = {
            ['name'] = 'Fibonacci',
            ['text'] = {
                [1] = 'Each played {C:attention}0{}, {C:attention}1{}, {C:attention}Ace{},',
				[2] = '{C:attention}2{}, {C:attention}3{}, {C:attention}5{}, {C:attention}8{}, or {C:attention}21{}',
				[3] = 'gives {C:mult}+#1#{} Mult when scored',
            }
        }
    },
	
	odd_todd = {
        ['en-us'] = {
            ['name'] = 'Odd Todd',
            ['text'] = {
                [1] = 'Played cards with',
				[2] = '{C:attention}odd{} rank gives',
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
				[2] = '{C:attention}odd{} rank gives',
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
				[2] = '{C:attention}even{} rank gives',
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
				[2] = '{C:attention}even{} rank gives',
				[3] = '{C:mult}+#1#{} Mult when scored',
				[4] = '{C:inactive}(10, 8, 6, 4, 2, 0){}',
            }
        }
    },
}