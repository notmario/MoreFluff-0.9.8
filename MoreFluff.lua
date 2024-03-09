--- STEAMODDED HEADER
--- MOD_NAME: More Fluff
--- MOD_ID: MoreFluff
--- MOD_AUTHOR: [notmario]
--- MOD_DESCRIPTION: Adds stuff

----------------------------------------------
------------MOD CODE -------------------------

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
                "a random {C:attention}Enhancement{}",
                "{C:inactive}(Sells for $1)"
            }
        },
        mf_basepaulcard = {
            name = "Basepaul Card",
            text = {
                "{X:mult,C:white} X1.2 {} Mult. {X:mult,C:white} X12 {} Mult",
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
                "(Ace = 1, 10 = 0)"
            }
        },
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
            3, 2, true, true, false, true
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
            if no_art_yet[k] ~= true then
                SMODS.Sprite:new(v.slug, SMODS.findModByID("MoreFluff").path, v.slug..".png", 71, 95, "asset_atli")
                :register()
            else
                SMODS.Sprite:new(v.slug, SMODS.findModByID("MoreFluff").path, "j_mf_missing.png", 71, 95, "asset_atli")
                :register()
            end
        end
    end

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
            if string.find(string.lower(love.filesystem.getUserDirectory()), "paul") then
                return {
                    message = localize{type='variable',key='a_xmult',vars={12}},
                    Xmult_mod = 12,
                }
            else
                return {
                    message = localize{type='variable',key='a_xmult',vars={1.2}},
                    Xmult_mod = 1.2,
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
            if pseudorandom('lucky_charm_money') < G.GAME.probabilities.normal/6 then
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
            if pseudorandom('lucky_charm_mult') < G.GAME.probabilities.normal/4 then
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

    -- challenge for testing.
    local challenges = G.CHALLENGES
	G.localization.misc.challenge_names["c_mod_morefluff_testing"] = "testing challenge"
    
    table.insert(G.CHALLENGES,#G.CHALLENGES+1,{
        name = 'testing challenge',
        id = 'c_mod_morefluff_testing',
        rules = {
            custom = {
            },
            modifiers = {
                {id = 'dollars', value = 5},
                {id = 'discards', value = 9999},
                {id = 'hands', value = 5},
                {id = 'reroll_cost', value = -999},
                {id = 'joker_slots', value = 9999},
                {id = 'consumable_slots', value = 9999},
                {id = 'hand_size', value = 8},
            }
        },
        jokers = {
            {id = 'j_mf_moneyprinter'},
        },
        consumeables = {
        },
        vouchers = {
        },
        deck = {
            --enhancement = 'm_glass',
            --edition = 'foil',
            --gold_seal = true,
            --yes_ranks = {['3'] = true,T = true},
            --no_ranks = {['4'] = true},
            --yes_suits = {S=true},
            --no_suits = {D=true},
            -- cards = {},
            type = 'Challenge Deck'
        },
        restrictions = {
            banned_cards = {
                -- {id = 'j_joker'},
                -- {id = 'j_egg'},
            },
            banned_tags = {
                -- {id = 'tag_garbage'},
                -- {id = 'tag_handy'},
            },
            banned_other = {

            }
        }
    })
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
            loc_vars = {G.GAME.probabilities.normal, 20, 4, 20, 6}
            customJoker = true
        elseif self.ability.name == 'Style Meter' then 
            loc_vars = {G.GAME.skips * 3}
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
----------------------------------------------
------------MOD CODE END----------------------