--- STEAMODDED HEADER
--- MOD_NAME: More Fluff
--- MOD_ID: MoreFluff
--- MOD_AUTHOR: [notmario]
--- MOD_DESCRIPTION: Adds 30 jokers. wow

----------------------------------------------
------------MOD CODE -------------------------

--Support of custom seals--

local config = {
    black = false,
    silver = false,
    green = false
}


local seals = {
    "Gold",
    "Red",
    "Blue",
    "Purple"
}

if config.black then
    table.insert(seals, "Black")
end 
if config.green then
    table.insert(seals, "Green")
end
if config.silver then
    table.insert(seals, "Silver")
end


function SMODS.INIT.MoreFluff()

    sendDebugMessage("morefluff incorporated")

    local localization = {
        mf_brainrot = {
            name = "Brainrot",
            text = {
                "When {C:attention}Blind{} is selected,",
                "destroy the leftmost Joker",
                "and permanently add {C:attention}5x",
                "its sell value to these {C:blue}Chips",
                "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
            }
        },
        mf_triangle = {
            name = "Triangle Joker",
            text = {
                "Gains {C:chips}+#2#{} Chips and",
                "increase Chips gained",
                "by {C:chips}1{} if played hand has",
                "exactly {C:attention}3{} cards",
                "{C:inactive}(Currently {C:chips}#1#{C:inactive} Chips)"
            }
        },
        mf_boxofhands = {
            name = "Box of Hands",
            text = {
                "Sell this card to gain {C:blue}5{} hands",
                "only for the current round",
                "{C:inactive}(No effect outside of a round)"
            }
        },
        mf_hallofmirrors = {
            name = "Hall of Mirrors",
            text = {
                "{C:attention}+2{} hand size for",
                "each {C:attention}6{} scored in",
                "the current round",
                "{C:inactive}(Currently {C:attention}+#1#{C:inactive} cards)"
            }
        },
        mf_rosetinted = {
            name = "Rose-Tinted Glasses",
            text = {
                "If {C:attention}first hand{} of round is",
                "a single {C:attention}2{}, destroy it and",
                "create a free {C:attention}#1#{}",
            }
        },
        mf_impostor = {
            name = "Impostor",
            text = {
                "{X:mult,C:white} X2 {} Mult if the",
                "played hand has",
                "exactly one {C:red}red{} card"
            }
        },
        mf_glitterbomb = {
            name = "Glitter Bomb",
            text = {
                "Sell this card to",
                "give all held cards",
                "a random {C:attention}Enhancement{}"
            }
        },
        mf_basepaulcard = {
            name = "Basepaul Card",
            text = {
                "{X:mult,C:white} X1.25 {} Mult. {X:mult,C:white} X12.5 {} Mult",
                "instead for {C:red}Paul{}",
                "{C:inactive}(Who's Paul?)"
            }
        },
        mf_jester = {
            name = "Jester",
            text = {
                "{C:chips,s:1.1}+40{} Chips"
            }
        },
        mf_lollipop = {
            name = "Lollipop",
            text = {
                "{X:mult,C:white} X#1# {} Mult",
                "{X:mult,C:white} -X#2# {} Mult per",
                "round played"
            }
        },
        mf_spiraljoker = {
            name = "Spiral Joker",
            text = {
                "{C:mult}+(10+7cos(pi/8 x {C:attention}$${C:mult})){} Mult",
                "{C:inactive}({C:attention}$${C:inactive} is your current money)",
                "{C:inactive}(Currently gives {C:mult}+#1#{C:inactive} Mult)"
            }
        },
        mf_luckycharm = {
            name = "Lucky Charm",
            text = {
                "{C:green}#1# in #3#{} chance",
                "for {C:mult}+#2#{} Mult",
                "{C:green}#1# in #5#{} chance",
                "to win {C:money}$#4#",
                "at end of round"
            }
        },
        mf_stylemeter = {
            name = "Style Meter",
            text = {
                "Earn {C:money}$3{} at end",
                "of round for each",
                "{C:attention}Blind{} skipped this run",
                "{C:inactive}(Currently {C:money}$#1#{C:inactive})"
            }
        },
        mf_bloodpact = {
            name = "Blood Pact",
            text = {
                "{X:mult,C:white} X5 {} Mult",
                "Destroyed if you play",
                "a non-{C:hearts}Hearts{} card"
            }
        },
        mf_moneyprinter = {
            name = "Money Printer",
            text = {
                "Earn {C:money}$2{} for each",
                "played numbered card",
                "that is a digit of",
                "your current money",
                "{C:inactive}(Ace = 1, 10 = 0)"
            }
        },
        mf_sealthedeal = {
            name = "Seal the Deal",
            text = {
                "After you play a winning hand,",
                "add a random {C:attention}Seal{} to",
                "one of the played cards",
            }
        },
        mf_particleaccelerator = {
            name = "Particle Accelerator",
            text = {
                "Gains {X:mult,C:white} X1 {} Mult if played",
                "hand has only {C:attention}1{} card,",
                "otherwise gives {X:mult,C:white} X#1# {} Mult",
                "and resets to {X:mult,C:white} X1 {} Mult"
            }
        },
        mf_clownfish = {
            name = "Clownfish",
            text = {
                "{C:attention}Enhanced{} cards",
                "score {C:chips}+10{} more Chips",
                "and {C:mult}+4{} more Mult",
                "when scored"
            }
        },
        mf_balatromods = {
            name = "Balatro Mods (Working 2024)",
            text = {
                "If {C:attention}first hand{} of round",
                "has only {C:attention}1{} card, spend",
                "{C:attention}$2{} to give it a",
                "random {C:attention}Enhancement{}",
            }
        },
        mf_treasuremap = {
            name = "Treasure Map",
            text = {
                "After {C:attention}3{} rounds,",
                "sell this card to",
                "earn {C:money}$18{}",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}/3)"
            },
        },
        mf_expansionpack = {
            name = "Expansion Pack",
            text = {
                "When {C:attention}Blind{} is selected,",
                "create {C:attention}1 {C:dark_edition}modded{C:attention} Joker",
                "{C:inactive}(Must have room)"
            },
        },
        mf_fived = {
            name = "5D Joker with Multiverse Time Travel",
            text = {
                "{C:attention}-1{} Ante and is destroyed if",
                "you defeat the {C:attention}Blind",
                "by {C:attention}10x{} or more"
            },
        },
        mf_teacup = {
            name = "Teacup",
            text = {
                "Upgrade the level of",
                "each {C:attention}played hand{}",
                "for the next {C:attention}#1#{} hands",
            },
        },
        mf_whiteboard = {
            name = "Whiteboard",
            text = {
                "{X:red,C:white} X2 {} Mult for each",
                "empty hand space",
                "after {C:attention}3{} cards"
            },
        },
        mf_mspaint = {
            name = "MS Paint Joker",
            text = {
                "{C:attention}+4{} hand size",
                "for the first hand",
                "of each blind"
            },
        },
        mf_hugejoker = {
            name = "Huge Joker",
            text = {
                "{X:red,C:white} X3 {} Mult,",
                "{C:attention}-2{} hand size"
            },
        },
        mf_miner = {
            name = "Miner",
            text = {
                "Gain a {C:green}D6 Tag{}",
                "when {C:attention}Boss Blind",
                "is selected",
            },
        },
        mf_recycling = {
            name = "Recycling",
            text = {
                "Create a random {C:planet}Planet{}",
                "or {C:tarot}Tarot{} card",
                "when any {C:attention}Booster{}",
                "{C:attention}Pack{} is skipped",
                "{C:inactive}(Must have room)"
            },
        },
        mf_hollow = {
            name = "Hollow Joker",
            text = {
                "{C:attention}-1{} hand size",
                "{C:mult}+10{} Mult per hand",
                "size below {C:attention}9"
            },
        },
        mf_tonersoup = {
            name = "I Sip Toner Soup",
            text = {
                "Create a {C:tarot}Tarot{} card",
                "when a hand is played",
                "Destroyed when blind",
                "is defeated",
                "{C:inactive}(Must have room)"
            },
        },
        -- mf_pixeljoker = {
        --     name = "Pixel Joker",
        --     text = {
        --         "funny idea,"
        --     },
        -- },
        -- mf_e = {
        --     name = "Specific Alphabet Joker",
        --     text = {
        --         "Each {C:attention}letter E{} used inside",
        --         "joker descriptions",
        --         "{C:mult}increments the multiplier{}",
        --         "{C:inactive}(Result: {C:mult}#1#{C:inactive})"
        --     },
        -- },
    }
    init_localization()

    --[[SMODS.Joker:new(
        name, slug,
        config,
        spritePos, loc_txt,
        rarity, cost, unlocked, discovered, blueprint_compat, eternal_compat
    )
    ]]
       --
    local jokers = {
        mf_brainrot = SMODS.Joker:new(
            "Brainrot", "",
            { config = { chips = 0 }},
            { }, "",
            2, 6, true, true, true, true
        ),
        mf_triangle = SMODS.Joker:new(
            "Triangle Joker", "",
            { extra = { chips = 1, chip_mod = 2 }},
            { }, "",
            3, 7, true, true, true, true
        ),
        mf_boxofhands = SMODS.Joker:new(
            "Box of Hands", "",
            { },
            { }, "",
            2, 6, true, true, false, true
        ),
        mf_hallofmirrors = SMODS.Joker:new(
            "Hall of Mirrors", "",
            { config = { h_size = 0 } },
            { }, "",
            2, 7, true, true, false, true
        ),
        mf_rosetinted = SMODS.Joker:new(
            "Rose-Tinted Glasses", "",
            { },
            { }, "",
            3, 7, true, true, false, true
        ),
        mf_impostor = SMODS.Joker:new(
            "Impostor", "",
            { },
            { }, "",
            2, 6, true, true, true, true
        ),
        mf_glitterbomb = SMODS.Joker:new(
            "Glitter Bomb", "",
            { },
            { }, "",
            3, 14, true, true, false, true
        ),
        mf_basepaulcard = SMODS.Joker:new(
            "Basepaul Card", "",
            { },
            { }, "",
            1, 6, true, true, true, true
        ),
        mf_jester = SMODS.Joker:new(
            "Jester", "",
            { },
            { }, "",
            1, 2, true, true, true, true
        ),
        mf_lollipop = SMODS.Joker:new(
            "Lollipop", "",
            { Xmult = 1.75, extra = 0.15 },
            { }, "",
            1, 6, true, true, true, false
        ),
        mf_spiraljoker = SMODS.Joker:new(
            "Spiral Joker", "",
            { },
            { }, "",
            1, 5, true, true, true, true
        ),
        mf_luckycharm = SMODS.Joker:new(
            "Lucky Charm", "",
            { },
            { }, "",
            1, 6, true, true, true, true
        ),
        mf_stylemeter = SMODS.Joker:new(
            "Style Meter", "",
            { },
            { }, "",
            2, 6, true, true, false, true
        ),
        mf_bloodpact = SMODS.Joker:new(
            "Blood Pact", "",
            { },
            { }, "",
            3, 9, true, true, true, false
        ),
        mf_moneyprinter = SMODS.Joker:new(
            "Money Printer", "",
            { },
            { }, "",
            1, 5, true, true, false, true
        ),
        mf_sealthedeal = SMODS.Joker:new(
            "Seal the Deal", "",
            { },
            { }, "",
            2, 6, true, true, true, true
        ),
        mf_particleaccelerator = SMODS.Joker:new(
            "Particle Accelerator", "",
            { Xmult = 1 },
            { }, "",
            3, 7, true, true, true, true
        ),
        mf_clownfish = SMODS.Joker:new(
            "Clownfish", "",
            { },
            { }, "",
            1, 6, true, true, false, true
        ),
        mf_balatromods = SMODS.Joker:new(
            "Balatro Mods", "",
            { },
            { }, "",
            1, 3, true, true, false, true
        ),
        mf_treasuremap = SMODS.Joker:new(
            "Treasure Map", "",
            { extra = 0 },
            { }, "",
            1, 4, true, true, false, true
        ),
        mf_expansionpack = SMODS.Joker:new(
            "Expansion Pack", "",
            { },
            { }, "",
            1, 5, true, true, true, true
        ),
        mf_fived = SMODS.Joker:new(
            "5D Joker with Multiverse Time Travel", "",
            { },
            { }, "",
            3, 10, true, true, false, false
        ),
        mf_teacup = SMODS.Joker:new(
            "Teacup", "",
            { extra = 4 },
            { }, "",
            2, 5, true, true, true, false
        ),
        mf_whiteboard = SMODS.Joker:new(
            "Whiteboard", "",
            { },
            { }, "",
            2, 6, true, true, true, true
        ),
        mf_mspaint = SMODS.Joker:new(
            "MS Paint Joker", "",
            { config = { h_size = 0 } },
            { }, "",
            1, 5, true, true, false, true
        ),
        mf_hugejoker = SMODS.Joker:new(
            "Huge Joker", "",
            { },
            { }, "",
            2, 8, true, true, true, true
        ),
        mf_miner = SMODS.Joker:new(
            "Miner", "",
            { },
            { }, "",
            1, 5, true, true, false, true
        ),
        mf_recycling = SMODS.Joker:new(
            "Recycling", "",
            { },
            { }, "",
            2, 5, true, true, true, true
        ),
        mf_hollow = SMODS.Joker:new(
            "Hollow Joker", "",
            { },
            { }, "",
            1, 4, true, true, true, true
        ),
        mf_tonersoup = SMODS.Joker:new(
            "I Sip Toner Soup", "",
            { extra = 3 },
            { }, "",
            2, 8, true, true, true, false
        ),
        -- mf_pixeljoker = SMODS.Joker:new(
        --     "Pixel Joker", "",
        --     { },
        --     { }, "",
        --     2, 8, true, true, true, true
        -- ),
        -- mf_e = SMODS.Joker:new(
        --     "E Joker", "",
        --     { extra = 0 },
        --     { }, "",
        --     2, 6, true, true, true, true
        -- ),
    }
    -- Blacklist individual Jokers here
    local jokerBlacklists = {
    }
    local no_art_yet = {
    }

    for k, v in pairs(jokers) do
        if not jokerBlacklists[k] then
            v.slug = "j_" .. k
            v.loc_txt = localization[k]
            v.spritePos = { x = 0, y = 0 }
            v.mod = "MoreFluff"
            v:register()
            if k == "mf_hugejoker" then
                -- this one uses the default sprite
            elseif k == "mf_pixel" then
                SMODS.Sprite:new(v.slug, SMODS.findModByID("MoreFluff").path, v.slug..".png", 2, 2, "asset_atli")
                :register()
            elseif no_art_yet[k] ~= true then
                SMODS.Sprite:new(v.slug, SMODS.findModByID("MoreFluff").path, v.slug..".png", 71, 95, "asset_atli")
                :register()
            else
                SMODS.Sprite:new(v.slug, SMODS.findModByID("MoreFluff").path, "j_mf_missing.png", 71, 95, "asset_atli")
                :register()
            end
        end
    end

    -- delayed until it's compatible.
    -- SMODS.Sprite:new("centers", SMODS.findModByID("MoreFluff").path, "Enhancers.png", 71, 95, "asset_atli")
    -- :register()
    
    -- SMODS.Deck:new("Gros Michel Deck", "b_gros_michel", { gros_michel = true }, { x = 0, y = 5 }, {
    --     name = "Gros Michel Deck",
    --     text = {
    --         "Start with {C:attention}Gros Michel"
    --     }
    -- })
    -- :register()

    SMODS.Jokers.j_mf_brainrot.calculate = function(self, context)
        if context.first_hand_drawn and not context.blueprint then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == self then my_pos = i; break end
            end
            if G.jokers.cards[1] and not self.getting_sliced and not G.jokers.cards[1].ability.eternal and not G.jokers.cards[1].getting_sliced then 
                local sliced_card = G.jokers.cards[1]
                sliced_card.getting_sliced = true
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                G.E_MANAGER:add_event(Event({func = function()
                    G.GAME.joker_buffer = 0
                    self.ability.mult = self.ability.mult + sliced_card.sell_cost*5
                    self:juice_up(0.8, 0.8)
                    sliced_card:start_dissolve({HEX("ff00ff")}, nil, 1.6)
                    play_sound('slice1', 0.96+math.random()*0.08)
                return true end }))
                card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_mult', vars = {self.ability.mult+5*sliced_card.sell_cost}}, colour = G.C.CHIPS, no_juice = false})
            end
        end
        if SMODS.end_calculate_context(context) then
            if self.ability.mult > 0 then
                return {
                    message = localize{type='variable',key='a_chips',vars={self.ability.mult}},
                    chip_mod = self.ability.mult, 
                    colour = G.C.CHIPS
                }
            end
        end
    end

    SMODS.Jokers.j_mf_triangle.calculate = function(self, context)
        if context.cardarea == G.jokers then
            if context.before then
                if #context.full_hand == 3 and not context.blueprint then
                    self.ability.extra.chips = self.ability.extra.chips + self.ability.extra.chip_mod
                    self.ability.extra.chip_mod = self.ability.extra.chip_mod + 1
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.CHIPS,
                        card = self
                    }
                end
            end
        end
        if SMODS.end_calculate_context(context) then
            return {
                message = localize{type='variable',key='a_chips',vars={self.ability.extra.chips}},
                chip_mod = self.ability.extra.chips, 
                colour = G.C.CHIPS
            }
        end
    end

    SMODS.Jokers.j_mf_boxofhands.calculate = function(self, context)
        if context.selling_self then
            if G.STATE == G.STATES.SELECTING_HAND then
                ease_hands_played(5, false)
            else
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3, 
                        hold = 1.4,
                        major = self,
                        backdrop_colour = G.C.MONEY,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                        offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                        silent = true
                        })
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                            play_sound('tarot2', 0.76, 0.4);return true end}))
                        play_sound('tarot2', 1, 0.4)
                        self:juice_up(0.3, 0.5)
                return true end }))
            end
        end
    end

    SMODS.Jokers.j_mf_hallofmirrors.calculate = function(self, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 6 and not context.blueprint then
            self.ability.h_size = self.ability.h_size + 2
            G.hand:change_size(2)
            
            return {
                extra = {focus = self, message = localize('k_upgrade_ex')},
                card = self,
                colour = G.C.MONEY
            }
        end
        if context.end_of_round then
            G.hand:change_size(-self.ability.h_size)
            self.ability.h_size = 0
        end
    end

    SMODS.Jokers.j_mf_rosetinted.calculate = function(self, context)
        if context.destroying_card and not context.blueprint and #context.full_hand == 1 and context.full_hand[1]:get_id() == 2 and G.GAME.current_round.hands_played == 0 then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_double'))
                    play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                    return true
                end)
            }))
           return true
        end
        return nil
    end

    -- SMODS.Jokers.j_mf_chef.calculate = function(self, context)
    --     if context.ending_shop then
    --         G.E_MANAGER:add_event(Event({
    --             func = (function()
    --                 add_tag(Tag('tag_standard'))
    --                 play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
    --                 play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
    --                 return true
    --             end)
    --         }))
    --         card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = 'Cooking!'})
    --     end
    --     return
    -- end

    SMODS.Jokers.j_mf_impostor.calculate = function(self, context)
        if SMODS.end_calculate_context(context) then
            local red_suits = 0
            for k, v in ipairs(context.full_hand) do
                if v:is_suit('Hearts', nil, true) or v:is_suit('Diamonds', nil, true) then
                    red_suits = red_suits + 1
                end
            end
            sendDebugMessage(red_suits)
            if red_suits == 1 then
                return {
                    message = localize{type='variable',key='a_xmult',vars={2}},
                    Xmult_mod = 2,
                }
            end
        end
    end
    
    SMODS.Jokers.j_mf_glitterbomb.effect = function(self, context)
        self.ability.extra_cost = (self.ability.extra_cost or 0) + 8
    end

    SMODS.Jokers.j_mf_glitterbomb.calculate = function(self, context)
        if context.selling_self then
            if G.STATE == G.STATES.SELECTING_HAND or G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.PLANET_PACK then
                for i,v in ipairs(G.hand.cards) do
                    local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
                    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
                end
                for i,v in ipairs(G.hand.cards) do
                    local cen_pool = {}
                    for k, va in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if va.key ~= 'm_stone' then 
                            cen_pool[#cen_pool+1] = va
                        end
                    end
                    local cen = pseudorandom_element(cen_pool, pseudoseed('glitterbomb'))
                    local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
                    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('tarot2', percent);G.hand.cards[i]:set_ability(cen);return true end }))
                end  
            else
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3, 
                        hold = 1.4,
                        major = self,
                        backdrop_colour = G.C.MONEY,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                        offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                        silent = true
                        })
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                            play_sound('tarot2', 0.76, 0.4);return true end}))
                        play_sound('tarot2', 1, 0.4)
                        self:juice_up(0.3, 0.5)
                return true end }))
            end
        end
    end

    SMODS.Jokers.j_mf_basepaulcard.calculate = function(self, context)
        if SMODS.end_calculate_context(context) then
            -- hack. if paul support is added then incorporate that
            if string.find(string.lower(G.PROFILES[G.SETTINGS.profile].name), "paul") then
                return {
                    message = localize{type='variable',key='a_xmult',vars={12.5}},
                    Xmult_mod = 12.5,
                }
            else
                return {
                    message = localize{type='variable',key='a_xmult',vars={1.2}},
                    Xmult_mod = 1.25,
                }
            end
        end
    end

    SMODS.Jokers.j_mf_jester.calculate = function(self, context)
        if SMODS.end_calculate_context(context) then
            return {
                message = localize{type='variable',key='a_chips',vars={40}},
                chip_mod = 40, 
                colour = G.C.CHIPS
            }
        end
    end

    SMODS.Jokers.j_mf_lollipop.calculate = function(self, context)
        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            if self.ability.x_mult - self.ability.extra <= 1.05 then 
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        self.T.r = -0.2
                        self:juice_up(0.3, 0.4)
                        self.states.drag.is = true
                        self.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                    G.jokers:remove_card(self)
                                    self:remove()
                                    self = nil
                                return true; end})) 
                        return true
                    end
                })) 
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.FILTER
                }
            else
                self.ability.x_mult = self.ability.x_mult - self.ability.extra
                return {
                    message = localize{type='variable',key='a_xmult_minus',vars={self.ability.extra}},
                    colour = G.C.RED
                }
            end
        elseif SMODS.end_calculate_context(context) then
            return {
                message = localize{type='variable',key='a_xmult',vars={self.ability.x_mult}},
                Xmult_mod = self.ability.x_mult,
            }
        end
    end

    SMODS.Jokers.j_mf_spiraljoker.calculate = function(self, context)
        if SMODS.end_calculate_context(context) then
            local val = 10 + math.floor(7 * math.cos(math.pi/8 * G.GAME.dollars or 0) + 0.5)
            return {
                message = localize{type='variable',key='a_mult',vars={val}},
                mult_mod = val
            }
        end
    end

    SMODS.Jokers.j_mf_luckycharm.calculate = function(self, context)
        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            if pseudorandom('lucky_charm_money') < G.GAME.probabilities.normal/8 then
                ease_dollars(20)
                return {
                    message = localize('$')..20,
                    colour = G.C.MONEY,
                    delay = 0.45, 
                    remove = true,
                    card = self
                }
            end
        end
        
        if SMODS.end_calculate_context(context) then
            if pseudorandom('lucky_charm_mult') < G.GAME.probabilities.normal/3 then
                return {
                    message = localize{type='variable',key='a_mult',vars={20}},
                    mult_mod = 20
                }
            end
        end
    end

    SMODS.Jokers.j_mf_stylemeter.calculate = function(self, context)
        if context.skip_blind and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function() 
                    card_eval_status_text(self, 'extra', nil, nil, nil, {
                        message = localize('$') .. (G.GAME.skips * 3),
                            colour = G.C.MONEY,
                        card = self
                    }) 
                    return true
                end}))
        end
    end
    
    SMODS.Jokers.j_mf_bloodpact.calculate = function(self, context)
        if SMODS.end_calculate_context(context) then
            local non_hearts = 0
            for k, v in ipairs(context.full_hand) do
                if not v:is_suit('Hearts', nil, true) then
                    non_hearts = non_hearts + 1
                end
            end
            sendDebugMessage(red_suits)
            if non_hearts > 0 then
                if not context.blueprint then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('tarot1')
                            self.T.r = -0.2
                            self:juice_up(0.3, 0.4)
                            self.states.drag.is = true
                            self.children.center.pinch.x = true
                            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                                func = function()
                                        G.jokers:remove_card(self)
                                        self:remove()
                                        self = nil
                                    return true; end})) 
                            return true
                        end
                    })) 
                    self.gone = true
                    return {
                        message = localize('k_extinct_ex')
                    }
                end
            else
                return {
                    message = localize{type='variable',key='a_xmult',vars={5}},
                    Xmult_mod = 5,
                }
            end
        end
    end
    
    SMODS.Jokers.j_mf_moneyprinter.calculate = function(self, context)
        if context.after and not context.blueprint then
            local total_money = 0
            local values = G.GAME.dollars..""
            for k, v in ipairs(context.full_hand) do
                if not v:is_face() and string.match(values, v.base.nominal % 10 .. "") then
                    total_money = total_money + 2
                end
            end
            if total_money > 0 then
                ease_dollars(total_money)
                return {
                    message = localize('$') .. total_money,
                    dollars = total_money,
                    card = self
                }
            end
        end
    end
    
    SMODS.Jokers.j_mf_sealthedeal.calculate = function(self, context)
    if context.before and G.GAME.chips + hand_chips * mult > G.GAME.blind.chips then
        local unsealed = {}
        for k, v in ipairs(context.full_hand) do
            if not v.seal then
                unsealed[#unsealed+1] = v
            end
        end
        if #unsealed > 0 then
            local conv_card = pseudorandom_element(unsealed, pseudoseed('seal_the_deal_card'))
            local seal = ""
            local seal_type = pseudorandom(pseudoseed('seal_the_deal_seal'))
            local interval = 1 / #seals

            for i = 1, #seals do
                if seal_type > (interval * i ) then
                    index = i + 1
                else
                    break
                end
            end
            seal = seals[index]

            G.E_MANAGER:add_event(Event({func = function()
                play_sound('tarot1')
                self:juice_up(0.3, 0.5)
                return true end }))
            
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                conv_card:set_seal(seal, nil, true)
                return true end }))

            return {
                message = "Sealed!",
                card = card
            }
        end
    end
    
    SMODS.Jokers.j_mf_particleaccelerator.calculate = function(self, context)
        if context.before then
            if #context.full_hand == 1 then
                self.ability.x_mult = self.ability.x_mult + 1
                return {
                    message = localize{
                        type='variable',
                        key='a_xmult',
                        vars={
                            self.ability.x_mult
                        }
                    },
                }
            else
                self.ability.x_mult = 1
                return {
                    message = localize{
                        type='variable',
                        key='a_xmult',
                        vars={
                            1
                        }
                    },
                }
            end
        end
        if SMODS.end_calculate_context(context) then
            if #context.full_hand ~= 1 then
                return {
                    message = localize{
                        type='variable',
                        key='a_xmult',
                        vars={
                            self.ability.x_mult
                        }
                    },
                    Xmult_mod = self.ability.x_mult,
                }
            end
        end
    end

    SMODS.Jokers.j_mf_clownfish.calculate = function(self, context)
        if context.individual and context.cardarea == G.play and context.other_card.ability.name ~= "Default Base" then
            return {
                chips = 10,
                mult = 4,
                card = self
            }
        end
    end
    
    SMODS.Jokers.j_mf_balatromods.calculate = function(self, context)
        if context.first_hand_drawn then
            if not context.blueprint then
                local eval = function() return G.GAME.current_round.hands_played == 0 end
                juice_card_until(self, eval, true)
            end
        end
        if context.cardarea == G.jokers then
            if context.before then
                if #context.full_hand == 1 and G.GAME.current_round.hands_played == 0 then
                    ease_dollars(-2)
                    for i,v in ipairs(context.full_hand) do
                        local percent = 1.15 - (i-0.999)/(#context.full_hand-0.998)*0.3
                        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() context.full_hand[i]:flip();play_sound('card1', percent);context.full_hand[i]:juice_up(0.3, 0.3);return true end }))
                    end
                    for i,v in ipairs(context.full_hand) do
                        local cen_pool = {}
                        for k, va in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                            if va.key ~= 'm_stone' then 
                                cen_pool[#cen_pool+1] = va
                            end
                        end
                        local cen = pseudorandom_element(cen_pool, pseudoseed('balatromods'))
                        local percent = 0.85 + (i-0.999)/(#context.full_hand-0.998)*0.3
                        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() context.full_hand[i]:flip();play_sound('tarot2', percent);context.full_hand[i]:set_ability(cen);return true end }))
                    end  
                    return {
                        message = "Enhanced!",
                        colour = G.C.CHIPS,
                        card = self
                    }
                end
            end
        end
    end
    
    SMODS.Jokers.j_mf_treasuremap.calculate = function(self, context)
        if context.end_of_round and not context.individual and not context.repetition  and not context.blueprint then
            self.ability.extra = self.ability.extra + 1
            if self.ability.extra == 3 then 
                local eval = function(card) return not card.REMOVED end
                juice_card_until(self, eval, true)
            end
            return {
                message = (self.ability.extra < 3) and (self.ability.extra..'/'..3) or localize('k_active_ex'),
                colour = G.C.FILTER
            }
        end
        if context.selling_self and (self.ability.extra >= 3) and not context.blueprint then
            local eval = function(card) return (card.ability.loyalty_remaining == 0) and not G.RESET_JIGGLES end
                juice_card_until(self, eval, true)
            ease_dollars(18)
            return {
                message = localize('$')..18,
                colour = G.C.MONEY,
                card = self
            }
        end
    end
    
    SMODS.Jokers.j_mf_expansionpack.calculate = function(self, context)
        if context.setting_blind and not self.getting_sliced and not (context.blueprint_card or self).getting_sliced and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            local jokers_to_create = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
            G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
            -- ah shit.
            function temp_ban_joker(key)
                if not G.GAME.banned_keys[key] then 
                    G.GAME.banned_keys[key] = 214389
                end
            end
            local vanilla_jokers = {"j_joker", "j_greedy_joker", "j_lusty_joker", "j_wrathful_joker", "j_gluttenous_joker", "j_jolly", "j_zany", "j_mad", "j_crazy", "j_droll", "j_sly", "j_wily", "j_clever", "j_devious", "j_crafty", "j_half", "j_stencil", "j_four_fingers", "j_mime", "j_credit_card", "j_ceremonial", "j_banner", "j_mystic_summit", "j_marble", "j_loyalty_card", "j_8_ball", "j_misprint", "j_dusk", "j_raised_fist", "j_chaos", "j_fibonacci", "j_steel_joker", "j_scary_face", "j_abstract", "j_delayed_grat", "j_hack", "j_pareidolia", "j_gros_michel", "j_even_steven", "j_odd_todd", "j_scholar", "j_business", "j_supernova", "j_ride_the_bus", "j_space", "j_egg", "j_burglar", "j_blackboard", "j_runner", "j_ice_cream", "j_dna", "j_splash", "j_blue_joker", "j_sixth_sense", "j_constellation", "j_hiker", "j_faceless", "j_green_joker", "j_superposition", "j_todo_list", "j_cavendish", "j_card_sharp", "j_red_card", "j_madness", "j_square", "j_seance", "j_riff_raff", "j_vampire", "j_shortcut", "j_hologram", "j_vagabond", "j_baron", "j_cloud_9", "j_rocket", "j_obelisk", "j_midas_mask", "j_luchador", "j_photograph", "j_gift", "j_turtle_bean", "j_erosion", "j_reserved_parking", "j_mail", "j_to_the_moon", "j_hallucination", "j_fortune_teller", "j_juggler", "j_drunkard", "j_stone", "j_golden", "j_lucky_cat", "j_baseball", "j_bull", "j_diet_cola", "j_trading", "j_flash", "j_popcorn", "j_trousers", "j_ancient", "j_ramen", "j_walkie_talkie", "j_selzer", "j_castle", "j_smiley", "j_campfire", "j_ticket", "j_mr_bones", "j_acrobat", "j_sock_and_buskin", "j_swashbuckler", "j_troubadour", "j_certificate", "j_smeared", "j_throwback", "j_hanging_chad", "j_rough_gem", "j_bloodstone", "j_arrowhead", "j_onyx_agate", "j_glass", "j_ring_master", "j_flower_pot", "j_blueprint", "j_wee", "j_merry_andy", "j_oops", "j_idol", "j_seeing_double", "j_matador", "j_hit_the_road", "j_duo", "j_trio", "j_family", "j_order", "j_tribe", "j_stuntman", "j_invisible", "j_brainstorm", "j_satellite", "j_shoot_the_moon", "j_drivers_license", "j_cartomancer", "j_astronomer", "j_burnt", "j_bootstraps", "j_caino", "j_triboulet", "j_yorick", "j_chicot", "j_perkeo"}
            for i = 1, #vanilla_jokers do
                temp_ban_joker(vanilla_jokers[i])
            end
            G.E_MANAGER:add_event(Event({
                func = function() 
                    for i = 1, jokers_to_create do
                        local card = create_card('Joker', G.jokers, nil, nil, nil, nil, nil, 'gbox')
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        card:start_materialize()
                        G.GAME.joker_buffer = 0
                    end
                    local vanilla_jokers = {"j_joker", "j_greedy_joker", "j_lusty_joker", "j_wrathful_joker", "j_gluttenous_joker", "j_jolly", "j_zany", "j_mad", "j_crazy", "j_droll", "j_sly", "j_wily", "j_clever", "j_devious", "j_crafty", "j_half", "j_stencil", "j_four_fingers", "j_mime", "j_credit_card", "j_ceremonial", "j_banner", "j_mystic_summit", "j_marble", "j_loyalty_card", "j_8_ball", "j_misprint", "j_dusk", "j_raised_fist", "j_chaos", "j_fibonacci", "j_steel_joker", "j_scary_face", "j_abstract", "j_delayed_grat", "j_hack", "j_pareidolia", "j_gros_michel", "j_even_steven", "j_odd_todd", "j_scholar", "j_business", "j_supernova", "j_ride_the_bus", "j_space", "j_egg", "j_burglar", "j_blackboard", "j_runner", "j_ice_cream", "j_dna", "j_splash", "j_blue_joker", "j_sixth_sense", "j_constellation", "j_hiker", "j_faceless", "j_green_joker", "j_superposition", "j_todo_list", "j_cavendish", "j_card_sharp", "j_red_card", "j_madness", "j_square", "j_seance", "j_riff_raff", "j_vampire", "j_shortcut", "j_hologram", "j_vagabond", "j_baron", "j_cloud_9", "j_rocket", "j_obelisk", "j_midas_mask", "j_luchador", "j_photograph", "j_gift", "j_turtle_bean", "j_erosion", "j_reserved_parking", "j_mail", "j_to_the_moon", "j_hallucination", "j_fortune_teller", "j_juggler", "j_drunkard", "j_stone", "j_golden", "j_lucky_cat", "j_baseball", "j_bull", "j_diet_cola", "j_trading", "j_flash", "j_popcorn", "j_trousers", "j_ancient", "j_ramen", "j_walkie_talkie", "j_selzer", "j_castle", "j_smiley", "j_campfire", "j_ticket", "j_mr_bones", "j_acrobat", "j_sock_and_buskin", "j_swashbuckler", "j_troubadour", "j_certificate", "j_smeared", "j_throwback", "j_hanging_chad", "j_rough_gem", "j_bloodstone", "j_arrowhead", "j_onyx_agate", "j_glass", "j_ring_master", "j_flower_pot", "j_blueprint", "j_wee", "j_merry_andy", "j_oops", "j_idol", "j_seeing_double", "j_matador", "j_hit_the_road", "j_duo", "j_trio", "j_family", "j_order", "j_tribe", "j_stuntman", "j_invisible", "j_brainstorm", "j_satellite", "j_shoot_the_moon", "j_drivers_license", "j_cartomancer", "j_astronomer", "j_burnt", "j_bootstraps", "j_caino", "j_triboulet", "j_yorick", "j_chicot", "j_perkeo"}
                    function temp_unban_joker(key)
                        if G.GAME.banned_keys[key] == 214389 then 
                            G.GAME.banned_keys[key] = nil
                        end
                    end
                    for i = 1, #vanilla_jokers do
                        temp_unban_joker(vanilla_jokers[i])
                    end
                    return true
                end}))   
                card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE}) 
        end
    end
    
    SMODS.Jokers.j_mf_fived.calculate = function(self, context)
        if context.after and G.GAME.chips + hand_chips * mult > G.GAME.blind.chips * 10 then
            ease_ante(-1)
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante-1
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    self.T.r = -0.2
                    self:juice_up(0.3, 0.4)
                    self.states.drag.is = true
                    self.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                        func = function()
                                G.jokers:remove_card(self)
                                self:remove()
                                self = nil
                            return true; end})) 
                    return true
                end
            })) 
            self.gone = true
        end
    end
    
    SMODS.Jokers.j_mf_teacup.calculate = function(self, context)
        if context.cardarea == G.jokers then
            if context.before then
                local text,disp_text = G.FUNCS.get_poker_hand_info(context.full_hand)
                card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
                update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(text, 'poker_hands'),chips = G.GAME.hands[text].chips, mult = G.GAME.hands[text].mult, level=G.GAME.hands[text].level})
                level_up_hand(context.blueprint_card or self, text, nil, 1)
                if not context.blueprint then
                    if self.ability.extra - 1 <= 0 then 
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                play_sound('tarot1')
                                self.T.r = -0.2
                                self:juice_up(0.3, 0.4)
                                self.states.drag.is = true
                                self.children.center.pinch.x = true
                                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                                    func = function()
                                            G.jokers:remove_card(self)
                                            self:remove()
                                            self = nil
                                        return true; end})) 
                                return true
                            end
                        })) 
                        return {
                            message = localize('k_drank_ex'),
                            colour = G.C.FILTER
                        }
                    else
                        self.ability.extra = self.ability.extra - 1
                        return {
                            message = self.ability.extra..'',
                            colour = G.C.FILTER
                        }
                    end
                end
            end
        end
    end
    
    SMODS.Jokers.j_mf_whiteboard.calculate = function(self, context)
        if SMODS.end_calculate_context(context) then
            if #G.hand.cards < 3 then
                local cards_below_three = math.max(0, 3 - #G.hand.cards)
                return {
                    message = localize{type='variable',key='a_xmult',vars={math.pow(2, cards_below_three)}},
                    Xmult_mod = math.pow(2, cards_below_three),
                }
            end
        end
    end
    
    SMODS.Jokers.j_mf_mspaint.calculate = function(self, context)
        if context.first_hand_drawn and not context.blueprint and self.ability.h_size == 0 then
            self.ability.h_size = self.ability.h_size + 4
            G.hand:change_size(4)
        end
        if context.after and not context.blueprint and self.ability.h_size ~= 0 then
            G.hand:change_size(-self.ability.h_size)
            self.ability.h_size = 0
        end
    end
    
    SMODS.Jokers.j_mf_hugejoker.calculate = function(self, context)
        if SMODS.end_calculate_context(context) then
            return {
                message = localize{type='variable',key='a_xmult',vars={3}},
                Xmult_mod = 3,
            }
        end
    end
    
    SMODS.Jokers.j_mf_miner.calculate = function(self, context)
        if context.setting_blind and not context.blueprint and context.blind.boss and not self.getting_sliced then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_d_six'))
                    play_sound('generic1', 0.6 + math.random()*0.1, 0.8)
                    play_sound('holo1', 1.1 + math.random()*0.1, 0.4)
                    return true
                end)
            }))
        end
    end
    
    SMODS.Jokers.j_mf_recycling.calculate = function(self, context)
        if context.skipping_booster and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            local card_type = pseudorandom_element({"Tarot", "Planet"}, pseudoseed('recycling_type'))
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                        local card = create_card(card_type,G.consumeables, nil, nil, nil, nil, nil, 'sup')
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                        G.GAME.consumeable_buffer = 0
                    return true
                end)}))
            if card_type == "Tarot" then
                return {
                    message = localize('k_plus_tarot'),
                    colour = G.C.SECONDARY_SET.Tarot,
                    card = self
                }
            else
                return {
                    message = localize('k_plus_planet'),
                    colour = G.C.SECONDARY_SET.Planet,
                    card = self
                }
            end
        end
    end

    SMODS.Jokers.j_mf_hollow.calculate = function(self, context)
        if SMODS.end_calculate_context(context) and G.hand.config.card_limit < 9 then
            return {
                message = localize{type='variable',key='a_mult',vars={10 * (9 - G.hand.config.card_limit)}},
                mult_mod = 10 * (9 - G.hand.config.card_limit)
            }
        end
    end

    SMODS.Jokers.j_mf_tonersoup.calculate = function(self, context)
        if context.cardarea == G.jokers and context.before then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                local card_type = 'Tarot'
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                            local card = create_card(card_type,G.consumeables, nil, nil, nil, nil, nil, 'sup')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                        return true
                    end)}))
            end
        end
        if context.end_of_round and not context.individual and not context.repetition  and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    self.T.r = -0.2
                    self:juice_up(0.3, 0.4)
                    self.states.drag.is = true
                    self.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                        func = function()
                                G.jokers:remove_card(self)
                                self:remove()
                                self = nil
                            return true; end})) 
                    return true
                end
            })) 
            return {
                message = localize('k_drank_ex'),
                colour = G.C.FILTER
            }
        end
    end

    -- -- challenge for testing.
    -- local challenges = G.CHALLENGES
    -- G.localization.misc.challenge_names["c_mod_morefluff_testing"] = "testing challenge"
    
    -- table.insert(G.CHALLENGES,#G.CHALLENGES+1,{
    --     name = 'testing challenge',
    --     id = 'c_mod_morefluff_testing',
    --     rules = {
    --         custom = {
    --         },
    --         modifiers = {
    --             {id = 'dollars', value = 9999},
    --             {id = 'discards', value = 9999},
    --             {id = 'hands', value = 9999},
    --             {id = 'reroll_cost', value = -9999},
    --             {id = 'joker_slots', value = 9999},
    --             {id = 'consumable_slots', value = 9999},
    --             {id = 'hand_size', value = 8},
    --         }
    --     },
    --     jokers = {
    --         {id = 'j_mf_basepaulcard'},
    --     },
    --     consumeables = {
    --     },
    --     vouchers = {
    --     },
    --     deck = {
    --         --enhancement = 'm_glass',
    --         --edition = 'foil',
    --         --gold_seal = true,
    --         --yes_ranks = {['3'] = true,T = true},
    --         --no_ranks = {['4'] = true},
    --         --yes_suits = {S=true},
    --         --no_suits = {D=true},
    --         -- cards = {},
    --         type = 'Challenge Deck'
    --     },
    --     restrictions = {
    --         banned_cards = {
    --         },
    --         banned_tags = {
    --             -- {id = 'tag_garbage'},
    --             -- {id = 'tag_handy'},
    --         },
    --         banned_other = {

    --         }
    --     }
    -- })
end

--- the good shit ---

-- UIBox garbage / Copied from LushMod . Thanks luscious!
local generate_UIBox_ability_tableref = Card.generate_UIBox_ability_table
function Card.generate_UIBox_ability_table(self)
    local card_type, hide_desc = self.ability.set or "None", nil
    local loc_vars = nil
    local main_start, main_end = nil, nil
    local no_badge = nil

    if self.config.center.unlocked == false and not self.bypass_lock then    -- For everyting that is locked
    elseif card_type == 'Undiscovered' and not self.bypass_discovery_ui then -- Any Joker or tarot/planet/voucher that is not yet discovered
    elseif self.debuff then
    elseif card_type == 'Default' or card_type == 'Enhanced' then
    elseif self.ability.set == 'Joker' then
        local customJoker = false

        if self.ability.name == 'Brainrot' then
            loc_vars = {self.ability.mult}
            customJoker = true
        elseif self.ability.name == 'Triangle Joker' then 
            loc_vars = {self.ability.extra.chips, self.ability.extra.chip_mod}
            customJoker = true
        elseif self.ability.name == 'Box of Hands' then 
            customJoker = true
        elseif self.ability.name == 'Rose-Tinted Glasses' then 
            customJoker = true
            loc_vars = {localize{type = 'name_text', set = 'Tag', key = 'tag_double', nodes = {}}}
        elseif self.ability.name == 'Hall of Mirrors' then 
            loc_vars = {self.ability.h_size}
            customJoker = true
        elseif self.ability.name == 'Lollipop' then 
            loc_vars = {self.ability.x_mult, self.ability.extra}
            customJoker = true
        elseif self.ability.name == 'Spiral Joker' then 
            loc_vars = {10 + math.floor(7 * math.cos(math.pi/8 * G.GAME.dollars or 0) + 0.5)}
            customJoker = true
        elseif self.ability.name == 'Lucky Charm' then 
            loc_vars = {G.GAME.probabilities.normal, 20, 3, 20, 8}
            customJoker = true
        elseif self.ability.name == 'Style Meter' then 
            loc_vars = {G.GAME.skips * 3}
            customJoker = true
        elseif self.ability.name == 'Particle Accelerator' then 
            loc_vars = {self.ability.x_mult}
            customJoker = true
        elseif self.ability.name == 'Treasure Map' then 
            loc_vars = {self.ability.extra}
            customJoker = true
        elseif self.ability.name == 'Teacup' then 
            loc_vars = {self.ability.extra}
            customJoker = true
        elseif self.ability.name == 'I Sip Toner Soup' then 
            loc_vars = {self.ability.extra}
            customJoker = true
        end

        if customJoker then
            local badges = {}
            if (card_type ~= 'Locked' and card_type ~= 'Undiscovered' and card_type ~= 'Default') or self.debuff then
                badges.card_type = card_type
            end
            if self.ability.set == 'Joker' and self.bypass_discovery_ui and (not no_badge) then
                badges.force_rarity = true
            end
            if self.edition then
                if self.edition.type == 'negative' and self.ability.consumeable then
                    badges[#badges + 1] = 'negative_consumable'
                else
                    badges[#badges + 1] = (self.edition.type == 'holo' and 'holographic' or self.edition.type)
                end
            end
            if self.seal then
                badges[#badges + 1] = string.lower(self.seal) .. '_seal'
            end
            if self.ability.eternal then
                badges[#badges + 1] = 'eternal'
            end
            if self.pinned then
                badges[#badges + 1] = 'pinned_left'
            end

            if self.sticker then
                loc_vars = loc_vars or {};
                loc_vars.sticker = self.sticker
            end

            local center = self.config.center
            return generate_card_ui(center, nil, loc_vars, card_type, badges, hide_desc, main_start, main_end)
        end
    end
    return generate_UIBox_ability_tableref(self)
end

local card_calculate_dollar_bonus_ref = Card.calculate_dollar_bonus

function Card.calculate_dollar_bonus(self)
    if self.debuff then return end
    if self.ability.set == "Joker" then
        if self.ability.name == 'Style Meter' then
            if G.GAME.skips > 0 then
                return G.GAME.skips * 3
            end
        end
    end
    return card_calculate_dollar_bonus_ref(self)
end

local Back_apply_to_run_ref = Back.apply_to_run
function Back.apply_to_run(arg)
    Back_apply_to_run_ref(arg)

    -- Lime Deck
    if arg.effect.config.gros_michel then
        G.E_MANAGER:add_event(Event({
            func = function()
                local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_gros_michel', nil)
                card:add_to_deck()
                G.jokers:emplace(card)
                return true
            end
        }))
    end
end

local Card_set_ability_ref = Card.set_ability
function Card.set_ability(self, center, initial, delay_sprites)
    Card_set_ability_ref(self,center,initial,delay_sprites)

    if center.name == "Huge Joker" then 
        -- H = H*2
        -- W = W*2
        self.T.h = self.T.h * 1.5
        self.T.w = self.T.w * 1.5
    end

    if center.name == "Pixel Joker" then 
        -- H = H*2
        -- W = W*2
        self.T.h = self.T.h * (4 / 95)
        self.T.w = self.T.w * (4 / 71)
    end
end 

local Card_add_to_deck_ref = Card.add_to_deck 
function Card.add_to_deck(self, from_debuff)
    if not self.added_to_deck then
        if self.ability.name == 'Huge Joker' then
            G.hand:change_size(-2)
        end
        if self.ability.name == 'Hollow Joker' then
            G.hand:change_size(-1)
        end
        if self.ability.name == 'Miner' then
            G.E_MANAGER:add_event(Event({func = function()
                G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - 1
                G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost - 1)
                return true end }))
        end
    end
    Card_add_to_deck_ref(self, from_debuff)
end

local Card_remove_from_deck_ref = Card.remove_from_deck 
function Card.remove_from_deck(self, from_debuff)
    if self.added_to_deck then
        if self.ability.name == 'Huge Joker' then
            G.hand:change_size(2)
        end
        if self.ability.name == 'Hollow Joker' then
            G.hand:change_size(1)
        end
        if self.ability.name == 'Miner' then
            G.E_MANAGER:add_event(Event({func = function()
                G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + 1
                G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost + 1)
                return true end }))
        end
    end
    Card_remove_from_deck_ref(self, from_debuff)
end

-- local g_uidef_card_h_popup_ref = G.UIDEF.card_h_popup
-- function G.UIDEF.card_h_popup(card)
--     if card.ability_UIBox_table and card.ability_UIBox_table.card_type == 'Joker' and card.config.center.name == "E Joker" then
--         local AUT = card.ability_UIBox_table
--         local debuffed = card.debuff
--         local card_type_colour = get_type_colour(card.config.center or card.config, card)
--         local card_type_background = 
--             (AUT.card_type == 'Locked' and G.C.BLACK) or 
--             ((AUT.card_type == 'Undiscovered') and darken(G.C.JOKER_GREY, 0.3)) or 
--             (AUT.card_type == 'Enhanced' or AUT.card_type == 'Default') and darken(G.C.BLACK, 0.1) or
--             (debuffed and darken(G.C.BLACK, 0.1)) or 
--             (card_type_colour and darken(G.C.BLACK, 0.1)) or
--             G.C.SET[AUT.card_type] or
--             {0, 1, 1, 1}

--         local outer_padding = 0.05
--         local card_type = localize('k_'..string.lower(AUT.card_type))

--         if AUT.card_type == 'Joker' or (AUT.badges and AUT.badges.force_rarity) then card_type = "Unpreposterous" end
--         if AUT.card_type == 'Enhanced' then card_type = localize{type = 'name_text', key = card.config.center.key, set = 'Enhanced'} end
--         card_type = (debuffed and AUT.card_type ~= 'Enhanced') and localize('k_debuffed') or card_type

--         local disp_type, is_playing_card = 
--                     (AUT.card_type ~= 'Locked' and AUT.card_type ~= 'Undiscovered' and AUT.card_type ~= 'Default') or debuffed,
--                     AUT.card_type == 'Enhanced' or AUT.card_type == 'Default'

--         local info_boxes = {}
--         local badges = {}

--         if AUT.badges.card_type or AUT.badges.force_rarity then
--             badges[#badges + 1] = create_badge(((card.ability.name == 'Pluto' or card.ability.name == 'Ceres' or card.ability.name == 'Eris') and localize('k_dwarf_planet')) or (card.ability.name == 'Planet X' and localize('k_planet_q') or card_type),card_type_colour, nil, 1.2)
--         end
--         if AUT.badges then
--             for k, v in ipairs(AUT.badges) do
--             if v == 'negative_consumable' then v = 'negative' end
--             badges[#badges + 1] = create_badge(localize(v, "labels"), get_badge_colour(v))
--             end
--         end

--         if AUT.info then
--             for k, v in ipairs(AUT.info) do
--             info_boxes[#info_boxes+1] =
--             {n=G.UIT.R, config={align = "cm"}, nodes={
--             {n=G.UIT.R, config={align = "cm", colour = lighten(G.C.JOKER_GREY, 0.5), r = 0.1, padding = 0.05, emboss = 0.05}, nodes={
--                 info_tip_from_rows(v, v.name),
--             }}
--             }}
--             end
--         end

--         return {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR}, nodes={
--             {n=G.UIT.C, config={align = "cm", func = 'show_infotip',object = Moveable(),ref_table = next(info_boxes) and info_boxes or nil}, nodes={
--             {n=G.UIT.R, config={padding = outer_padding, r = 0.12, colour = lighten(G.C.JOKER_GREY, 0.5), emboss = 0.07}, nodes={
--                 {n=G.UIT.R, config={align = "cm", padding = 0.07, r = 0.1, colour = adjust_alpha(card_type_background, 0.8)}, nodes={
--                 name_from_rows(AUT.name, is_playing_card and G.C.WHITE or nil),
--                 desc_from_rows(AUT.main),
--                 badges[1] and {n=G.UIT.R, config={align = "cm", padding = 0.03}, nodes=badges} or nil,
--                 }}
--             }}
--             }},
--         }}
--     end
--   return g_uidef_card_h_popup_ref(card)
-- end
----------------------------------------------
------------MOD CODE END----------------------
