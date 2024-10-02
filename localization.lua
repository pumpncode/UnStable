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
	
	-- Ranks

    ranks = {
		['21'] = '21',
		Question = '???',
		
		Half = '0.5',
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
				[3] = 'Doubled the total amount of chips if the total rank is exactly {C:attention}#1#{}.',
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
                [1] = 'Bleh',
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
	
	--Miscellaneous
	propagation = {
        ['en-us'] = {
            ['name'] = 'Propagation',
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