return {
    dictionary = {
	
		--Put generic words here
	
        ['en-us'] = {

            -- Config values

            

            requires_restart = '(Requires game restart)',

            -- Miscellaneous
            upgrade = 'Upgrade!'
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
				[3] = 'When discarded, turns one random',
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
	
	--Enchancements
	
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
	
	--Miscellaneous
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
	
}