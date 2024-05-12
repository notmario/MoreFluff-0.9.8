--- STEAMODDED HEADER
--- MOD_NAME: More Fluff
--- MOD_ID: MoreFluff
--- MOD_AUTHOR: [notmario]
--- MOD_DESCRIPTION: Adds 45 jokers. wow
--- BADGE_COLOUR: 814BA8

----------------------------------------------
------------MOD CODE -------------------------

local joker_config = {
    mf_brainrot = true,
    mf_triangle = true,
    mf_boxofhands = true,
    mf_hallofmirrors = true,
    mf_rosetinted = true,
    mf_impostor = true,
    mf_glitterbomb = true,
    mf_basepaulcard = true,
    mf_jester = true,
    mf_lollipop = true,
    mf_spiraljoker = true,
    mf_luckycharm = true,
    mf_stylemeter = true,
    mf_bloodpact = true,
    mf_moneyprinter = true,
    mf_sealthedeal = true,
    mf_particleaccelerator = true,
    mf_clownfish = true,
    mf_balatromods = true, -- (Working 2024)
    mf_treasuremap = true,
    mf_expansionpack = true,
    mf_fived = true,
    mf_teacup = true,
    mf_whiteboard = true,
    mf_mspaint = true,
    mf_hugejoker = true,
    mf_miner = true,
    mf_recycling = true,
    mf_hollow = true,
    mf_tonersoup = true,
    mf_leagueoflegends = true, -- Bad Legal Defence
    mf_pipe = true, -- Philosophical Joker
    mf_blackmarket = true,
    mf_blasphemy = true,
    mf_thesolo = true,
    mf_thejester = true,
    mf_globe = true,
    mf_couponcatalogue = true,
    mf_ace = true, -- (Up The Sleeve)
    mf_fleshprison = true,
    mf_goldencarrot = true,
    mf_bowlingball = true,
    mf_simplified = true,
    mf_jankman = true,
    mf_pixeljoker = true,
    mf_burnerphone = true,
    mf_virtual = true,
    mf_dramaticentrance = true,
    mf_bladedance = true,
    mf_hyperbeam = true,
    mf_dropkick = true,
    mf_bigshot = true,
    mf_paintcan = true,
    mf_clipart = true,
    mf_loadeddisk = true,
    mf_mrloans = true,
    mf_rainbow = true,
    mf_mouthmoods = true, -- Mashup Album
    mf_css = true,
    mf_cba = true, -- Card Buffer Advanced

    mf_hugestuntman = true,
}

-- thanks to feder for making the base for all of this

local freaky = love.math.random() < 1/100

G.C.SECONDARY_SET.ColourCard = HEX("4f6367")
G.C.ColourCard = HEX("4f6367")
G.P_CENTER_POOLS.Colour = {}
G.localization.descriptions.Colour = {}
G.localization.descriptions["Other"]["undiscovered_colour"] = {
  name = "Not Discovered",
  text = {
    "Purchase or use",
    "this card in an",
    "unseeded run to",
    "learn what it does"
  }
}
G.localization.misc.dictionary["k_colour"] = "Colour"
G.localization.misc.dictionary["k_plus_colour"] = "+1 Colour"
G.localization.misc.dictionary["k_colour_pack"] = "Colour Pack"

G.localization.descriptions["Other"]["p_colour_normal"] = {
  name = "Colour Pack",
  text = {
      "Choose {C:attention}1{} of up to",
      "{C:attention}2{C:colourcard} Colour{} cards to",
      "add to your consumeables"
  }
}

G.localization.descriptions["Other"]["p_colour_jumbo"] = {
  name = "Jumbo Colour Pack",
  text = {
      "Choose {C:attention}1{} of up to",
      "{C:attention}4{C:colourcard} Colour{} cards to",
      "add to your consumeables"
  }
}

G.localization.descriptions["Other"]["p_colour_mega"] = {
  name = "Mega Colour Pack",
  text = {
      "Choose {C:attention}2{} of up to",
      "{C:attention}4{C:colourcard} Colour{} cards to",
      "add to your consumeables"
  }
}

-- local card_calculate_jokerref = Card.calculate_joker
-- function Card:calculate_joker(context)
--     if self.debuff then return nil end
--     if self.ability.set == "Colour" and not self.debuff then
--         if context.joker_main and next(find_joker("Stained Glass Joker")) then
--             return {
--                 message = localize{type = 'variable', key = 'a_xmult', vars = {2}},
--                 Xmult_mod = 2
--             }
--         end
--     end
-- end

local game_updateref = Game.update
function Game:update(dt)
    game_updateref(self, dt)
    
    self.C.SECONDARY_SET.ColourCard[1] = 0.4+0.2*(1+math.sin(self.TIMERS.REAL*1.5 + 0))
    self.C.SECONDARY_SET.ColourCard[3] = 0.4+0.2*(1+math.sin(self.TIMERS.REAL*1.5 + math.pi * 2 / 3))
    self.C.SECONDARY_SET.ColourCard[2] = 0.4+0.2*(1+math.sin(self.TIMERS.REAL*1.5 + math.pi * 4 / 3))
    
    if G.ARGS.LOC_COLOURS ~= nil then
        G.ARGS.LOC_COLOURS["colourcard"] = G.C.SECONDARY_SET.ColourCard
    end
end

local card_updateref = Card.update
function Card:update(dt)
    card_updateref(self, dt)
    if G.STAGE == G.STAGES.RUN then
        if self.ability.name == 'Black' then
            self.eligible_editionless_jokers = EMPTY(self.eligible_editionless_jokers)
            for k, v in pairs(G.jokers.cards) do
                if v.ability.set == 'Joker' and (not v.edition) then
                    table.insert(self.eligible_editionless_jokers, v)
                end
            end
        end
    end
end

local create_UIBox_your_collectionref = create_UIBox_your_collection
function create_UIBox_your_collection()
    local retval = create_UIBox_your_collectionref()
    table.insert(retval.nodes[1].nodes[1].nodes[1].nodes[1].nodes[4].nodes[2].nodes, UIBox_button({
        button = 'your_collection_colours', label = { "Colour Cards" }, count = G.DISCOVER_TALLIES.colours, minw = 4, id = 'your_collection_colours', colour = G.C.SECONDARY_SET.ColourCard
    }))
    return retval
end

G.FUNCS.your_collection_colours = function(e)
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu{
        definition = create_UIBox_your_collection_colours(),
    }
end

G.FUNCS.your_collection_colours_page = function(args)
    if not args or not args.cycle_config then return end
    for j = 1, #G.your_collection do
        for i = #G.your_collection[j].cards,1, -1 do
            local c = G.your_collection[j]:remove_card(G.your_collection[j].cards[i])
            c:remove()
            c = nil
        end
    end
    
    for j = 1, #G.your_collection do
        for i = 1, 4 do
            local center = G.P_CENTER_POOLS["Colour"][(j-1) * 4 + i + (8*(args.cycle_config.current_option - 1))]
            if not center then break end
            local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, center)
            card:start_materialize(nil, i>1 or j>1)
            G.your_collection[j]:emplace(card)
        end
    end
    INIT_COLLECTION_CARD_ALERTS()
end

function create_UIBox_your_collection_colours()
    local deck_tables = {}
    
    G.your_collection = {}
    for j = 1, 2 do
        G.your_collection[j] = CardArea(
            G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
            (4.2)*G.CARD_W,
            G.CARD_H, 
            {card_limit = 4, type = 'title', highlight_limit = 0, collection = true})
            table.insert(deck_tables, 
                {n=G.UIT.R, config={align = "cm", padding = 0, no_fill = true}, nodes={
                {n=G.UIT.O, config={object = G.your_collection[j]}}
            }}
        )
    end
    
    local colour_options = {}
    for i = 1, math.ceil(#G.P_CENTER_POOLS.Colour/8) do
        table.insert(colour_options, localize('k_page')..' '..tostring(i)..'/'..tostring(math.ceil(#G.P_CENTER_POOLS.Colour/8)))
    end
    
    for j = 1, #G.your_collection do
        for i = 1, 4 do
            local center = G.P_CENTER_POOLS["Colour"][(j-1) * 4 + i]
            if type(center) == "table" then
                local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W, G.CARD_H, nil, center)
                card:start_materialize(nil, i>1 or j>1)
                G.your_collection[j]:emplace(card)
            end
        end
    end
    
    INIT_COLLECTION_CARD_ALERTS()
    
    local t = create_UIBox_generic_options({ back_func = 'your_collection', contents = {
        {n=G.UIT.R, config={align = "cm", minw = 2.5, padding = 0.1, r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes=deck_tables},
            {n=G.UIT.R, config={align = "cm"}, nodes={
                create_option_cycle({options = colour_options, w = 4.5, cycle_shoulders = true, opt_callback = 'your_collection_colours_page', focus_args = {snap_to = true, nav = 'wide'},current_option = 1, colour = G.C.RED, no_pips = true})
            }}
    }})
    return t
end

local set_discover_talliesref = set_discover_tallies
function set_discover_tallies()
    set_discover_talliesref()

    G.DISCOVER_TALLIES.colours = {tally = 0, of = 0}

    for _, v in pairs(G.P_CENTERS) do
        if not v.omit then 
            if v.set and v.consumeable and v.set == 'Colour' then
            G.DISCOVER_TALLIES.colours.of = G.DISCOVER_TALLIES.colours.of+1
                if v.discovered then 
                    G.DISCOVER_TALLIES.colours.tally = G.DISCOVER_TALLIES.colours.tally+1
                end
            end
        end
    end
end

function create_colour() 
    local card = create_card("Colour", G.pack_cards, nil, nil, true, true, nil, 'col')
    if G.GAME.used_vouchers.v_mf_colourtheory and pseudorandom('colourtheory') > 0.5 then
      card:set_edition({polychrome = true}, true)
    end
    return card
  end

local get_type_colourref = get_type_colour
function get_type_colour(_c, card)
  local fromRef = get_type_colourref(_c, card)

  if _c.set == "Colour" then
    return G.C.SECONDARY_SET.ColourCard
  end

  return fromRef
end

function progressbar(val, max)
    return string.rep("#", val), string.rep("#", max - val)
end

local generate_card_uiref = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
if _c.set == "Colour" or (_c.set == 'Booster' and _c.name:find("Colour")) then
    local first_pass = nil
    if not full_UI_table then 
        first_pass = true
        full_UI_table = {
            main = {},
            info = {},
            type = {},
            name = nil,
            badges = badges or {}
        }
    end

    local desc_nodes = (not full_UI_table.name and full_UI_table.main) or full_UI_table.info
    local name_override = nil
    local info_queue = {}

    if full_UI_table.name then
        full_UI_table.info[#full_UI_table.info+1] = {}
        desc_nodes = full_UI_table.info[#full_UI_table.info]
    end

    if not full_UI_table.name then
        if specific_vars and specific_vars.no_name then
            full_UI_table.name = true
        elseif card_type == 'Locked' then
            full_UI_table.name = localize{type = 'name', set = 'Other', key = 'locked', nodes = {}}
        elseif card_type == 'Undiscovered' then 
            full_UI_table.name = localize{type = 'name', set = 'Other', key = 'undiscovered_'..(string.lower(_c.set)), name_nodes = {}}
        elseif specific_vars and (card_type == 'Default' or card_type == 'Enhanced') then
            if (_c.name == 'Stone Card') then full_UI_table.name = true end
            if (specific_vars.playing_card and (_c.name ~= 'Stone Card')) then
                full_UI_table.name = {}
                localize{type = 'other', key = 'playing_card', set = 'Other', nodes = full_UI_table.name, vars = {localize(specific_vars.value, 'ranks'), localize(specific_vars.suit, 'suits_plural'), colours = {specific_vars.colour}}}
                full_UI_table.name = full_UI_table.name[1]
            end
        elseif card_type == 'Booster' then
            
        else
            full_UI_table.name = localize{type = 'name', set = _c.set, key = _c.key, nodes = full_UI_table.name}
        end
        full_UI_table.card_type = card_type or _c.set
    end 

    local loc_vars = specific_vars
    if main_start then 
        desc_nodes[#desc_nodes+1] = main_start 
    end


    if _c.set == "Colour" then
        localize{type = 'descriptions', key = _c.key, set = _c.set, nodes = desc_nodes, vars = loc_vars}
    elseif hide_desc then
        localize{type = 'other', key = 'undiscovered_'..(string.lower(_c.set)), set = _c.set, nodes = desc_nodes}
    elseif _c.set == 'Booster' and _c.name:find("Colour") then 
        local desc_override = 'p_arcana_normal'
        if _c.name == 'Colour Pack' then desc_override = 'p_colour_normal'; loc_vars = {_c.config.choose, _c.config.extra} end
        if _c.name == 'Jumbo Colour Pack' then desc_override = 'p_colour_jumbo'; loc_vars = {_c.config.choose, _c.config.extra} end
        if _c.name == 'Mega Colour Pack' then desc_override = 'p_colour_mega'; loc_vars = {_c.config.choose, _c.config.extra} end
        name_override = desc_override
        if not full_UI_table.name then full_UI_table.name = localize{type = 'name', set = 'Other', key = name_override, nodes = full_UI_table.name} end
        localize{type = 'other', key = desc_override, nodes = desc_nodes, vars = loc_vars}
    end

    if main_end then 
        desc_nodes[#desc_nodes+1] = main_end 
    end

--Fill all remaining info if this is the main desc
    if not ((specific_vars and not specific_vars.sticker) and (card_type == 'Default' or card_type == 'Enhanced')) then
        if desc_nodes == full_UI_table.main and not full_UI_table.name then
            localize{type = 'name', key = _c.key, set = _c.set, nodes = full_UI_table.name} 
            if not full_UI_table.name then full_UI_table.name = {} end
        elseif desc_nodes ~= full_UI_table.main then 
            desc_nodes.name = localize{type = 'name_text', key = name_override or _c.key, set = name_override and 'Other' or _c.set} 
        end
    end

    if first_pass and not (_c.set == 'Edition') and badges then
        for k, v in ipairs(badges) do
            if v == 'foil' then info_queue[#info_queue+1] = G.P_CENTERS['e_foil'] end
            if v == 'holographic' then info_queue[#info_queue+1] = G.P_CENTERS['e_holo'] end
            if v == 'polychrome' then info_queue[#info_queue+1] = G.P_CENTERS['e_polychrome'] end
            if v == 'negative' then info_queue[#info_queue+1] = G.P_CENTERS['e_negative'] end
            if v == 'negative_consumable' then info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}} end
            if v == 'gold_seal' then info_queue[#info_queue+1] = {key = 'gold_seal', set = 'Other'} end
            if v == 'blue_seal' then info_queue[#info_queue+1] = {key = 'blue_seal', set = 'Other'} end
            if v == 'red_seal' then info_queue[#info_queue+1] = {key = 'red_seal', set = 'Other'} end
            if v == 'purple_seal' then info_queue[#info_queue+1] = {key = 'purple_seal', set = 'Other'} end
            if v == 'eternal' then info_queue[#info_queue+1] = {key = 'eternal', set = 'Other'} end
            if v == 'pinned_left' then info_queue[#info_queue+1] = {key = 'pinned_left', set = 'Other'} end
        end
    end

    for _, v in ipairs(info_queue) do
        generate_card_ui(v, full_UI_table)
    end

    return full_UI_table
end

return generate_card_uiref(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
end
local generate_UIBox_ability_tableref = Card.generate_UIBox_ability_table
function Card:generate_UIBox_ability_table()
    if self.ability.set == 'Colour' then
        local card_type, hide_desc = self.ability.set or "None", nil
        local loc_vars = nil
        local main_start, main_end = nil, nil
        local no_badge = nil
        local is_custom = false

        if 
            self.ability.name == "Black" or self.ability.name == "Yellow" or self.ability.name == "Pink" or self.ability.name == "Brown" or 
            self.ability.name == "Crimson" or self.ability.name == "Grey" or self.ability.name == "Silver" or self.ability.name == "Green" or
            self.ability.name == "Peach" or 
            self.ability.name == "White" or self.ability.name == "Tan" or self.ability.name == "Lilac" or self.ability.name == "Blue" or -- creates
            self.ability.name == "Red" or self.ability.name == "Orange" or self.ability.name == "Deep Blue" or self.ability.name == "Seaweed" or -- suits
            self.ability.name == "Amber" or self.ability.name == "Amethyst" or self.ability.name == "Magenta" or self.ability.name == "Periwinkle" or self.ability.name == "Purple" -- crossover suits
        then
            local val, max = progressbar(self.ability.partial_rounds_held, self.ability.upgrade_rounds)

            is_custom = true
            loc_vars = {self.ability.extra, val, max}
        end

        if not self.bypass_lock and self.config.center.unlocked ~= false and
        (self.ability.set == 'Joker' or self.ability.set == 'Edition' or self.ability.consumeable or self.ability.set == 'Voucher' or self.ability.set == 'Booster') and
        not self.config.center.discovered and 
        ((self.area ~= G.jokers and self.area ~= G.consumeables and self.area) or not self.area) then
            card_type = 'Undiscovered'
        end    
        if self.config.center.unlocked == false and not self.bypass_lock then --For everyting that is locked
            card_type = "Locked"
            if self.area and self.area == G.shop_demo then loc_vars = {}; no_badge = true end
        elseif card_type == 'Undiscovered' and not self.bypass_discovery_ui then -- Any Joker or tarot/planet/voucher that is not yet discovered
            hide_desc = true
        elseif self.debuff then
            loc_vars = { debuffed = true, playing_card = not not self.base.colour, value = self.base.value, suit = self.base.suit, colour = self.base.colour }
        end

        if is_custom then
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
        if self.seal then badges[#badges + 1] = string.lower(self.seal)..'_seal' end
        if self.ability.eternal then badges[#badges + 1] = 'eternal' end
        if self.pinned then badges[#badges + 1] = 'pinned_left' end

        if self.sticker then loc_vars = loc_vars or {}; loc_vars.sticker=self.sticker end

        return generate_card_ui(self.config.center, nil, loc_vars, card_type, badges, hide_desc, main_start, main_end)
        end
    end

    return generate_UIBox_ability_tableref(self)
end

local set_spritesref = Card.set_sprites
function Card:set_sprites(_center, _front)
    if _center and _center.set == "Colour" then
      if _center.set then
        if self.children.center then
          self.children.center.atlas = G.ASSET_ATLAS[_center.atlas]
          self.children.center:set_sprite_pos(_center.pos)
        else
          if not self.params.bypass_discovery_center and not _center.discovered then 
            self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["c_mf_undiscovered"], {x=0,y=0})
          else
            self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[_center.atlas], _center.pos)
          end
            self.children.center.states.hover = self.states.hover
            self.children.center.states.click = self.states.click
            self.children.center.states.drag = self.states.drag
            self.children.center.states.collide.can = false
            self.children.center:set_role({major = self, role_type = 'Glued', draw_major = self})
        end
      end

      if not self.children.back then
          self.children.back = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["centers"], self.params.bypass_back or (self.playing_card and G.GAME[self.back].pos or G.P_CENTERS['b_red'].pos))
          self.children.back.states.hover = self.states.hover
          self.children.back.states.click = self.states.click
          self.children.back.states.drag = self.states.drag
          self.children.back.states.collide.can = false
          self.children.back:set_role({major = self, role_type = 'Glued', draw_major = self})
      end
    else
      set_spritesref(self, _center, _front);
    end
    
end

MoreFluff = {}
MoreFluff.Colours = {}
MoreFluff.Colour = {
  name = "",
  slug = "",
	cost = 3,
	config = {},
  pos = {},
	loc_txt = {},
	discovered = false, 
	consumeable = true
}

function MoreFluff.Colour:new(name, slug, config, pos, loc_txt, cost, discovered)
    o = {}
    setmetatable(o, self)
    self.__index = self
  
    o.loc_txt = loc_txt
    o.name = name
    o.slug = "c_" .. slug
    o.config = config or {}
    o.pos = pos or {
        x = 0,
        y = 0
    }
    o.cost = cost or 4
    o.discovered = discovered or false
    o.consumeable = true
    return o
end
function MoreFluff.Colour:register()
    MoreFluff.Colours[self.slug] = self
    local minId = table_length(G.P_CENTER_POOLS['Colour']) + 1
    local id = 0
    local i = 0
        i = i + 1

    id = i + minId

        local colour_obj = {
            discovered = self.discovered,
            consumeable = true,
            name = self.name,
            set = "Colour",
            order = id,
            key = self.slug,
            pos = self.pos,
            cost = self.cost,
            config = self.config
        }

        for _i, sprite in ipairs(SMODS.Sprites) do
            if sprite.name == colour_obj.key then
                colour_obj.atlas = sprite.name
            end
        end

    G.P_CENTERS[self.slug] = colour_obj
        table.insert(G.P_CENTER_POOLS['Colour'], colour_obj)

    G.localization.descriptions["Colour"][self.slug] = self.loc_txt

    for g_k, group in pairs(G.localization) do
            if g_k == 'descriptions' then
                for _, set in pairs(group) do
                    for _, center in pairs(set) do
                        center.text_parsed = {}
                        for _, line in ipairs(center.text) do
                            center.text_parsed[#center.text_parsed + 1] = loc_parse_string(line)
                        end
                        center.name_parsed = {}
                        for _, line in ipairs(type(center.name) == 'table' and center.name or {center.name}) do
                            center.name_parsed[#center.name_parsed + 1] = loc_parse_string(line)
                        end
                        if center.unlock then
                            center.unlock_parsed = {}
                            for _, line in ipairs(center.unlock) do
                                center.unlock_parsed[#center.unlock_parsed + 1] = loc_parse_string(line)
                            end
                        end
                    end
                end
            end
        end

        sendDebugMessage("The Colour named " .. self.name .. " with the slug " .. self.slug ..
                            " has been registered at the id " .. id .. ".")
end


MoreFluff.Boosters = {}
MoreFluff.Booster = {
  	name = "",
  	slug = "",
	cost = 4,
	config = {},
  	pos = {},
	discovered = false,
    weight = 1, 
    kind = 'Standard',
    atlas = 'Booster'
}

function MoreFluff.Booster:new(name, slug, config, pos, cost, discovered, weight, kind, atlas)
    o = {}
    setmetatable(o, self)
    self.__index = self

    o.name = name
    o.slug = "p_" .. slug
    o.config = config or {}
    o.pos = pos or {
        x = 0,
        y = 0
    }
    o.cost = cost
    o.discovered = discovered or false
    o.weight = weight or 1
	o.kind = kind or 'Standard'
	o.atlas = atlas or 'Booster'
	return o
end

function MoreFluff.Booster:register()
	MoreFluff.Boosters[self.slug] = self

	local minId = table_length(G.P_CENTER_POOLS['Booster']) + 1
    local id = 0
    local i = 0
	i = i + 1
	-- Prepare some Datas
	id = i + minId

	local booster_obj = {
		discovered = self.discovered,
		name = self.name,
		set = "Booster",
		order = id,
		key = self.slug,
		pos = self.pos,
        cost = self.cost,
		config = self.config,
		weight = self.weight,
		kind = self.kind,
		atlas = self.atlas
	}

	for _i, sprite in ipairs(SMODS.Sprites) do
		if sprite.name == booster_obj.key then
			booster_obj.atlas = sprite.name
		end
	end

	-- Now we replace the others
	G.P_CENTERS[self.slug] = booster_obj
	table.insert(G.P_CENTER_POOLS['Booster'], booster_obj)

	sendDebugMessage("The Booster named " .. self.name .. " with the slug " .. self.slug ..
						 " have been registered at the id " .. id .. ".")
end

-- BOOSTER API

local init_item_prototypes_ref = Game.init_item_prototypes
function Game:init_item_prototypes()
    init_item_prototypes_ref(self)

    G.C.SECONDARY_SET.ColourCard = HEX("4f6367")
    G.P_CENTER_POOLS.Colour = {}
    G.localization.descriptions.Colour = {}

    for _, booster in pairs(MoreFluff.Boosters) do
        booster:register()
    end

    for _, colour in pairs(MoreFluff.Colours) do
        colour:register()
    end
    SMODS.LOAD_LOC()
    SMODS.SAVE_UNLOCKS()
end

local card_openref = Card.open
function Card:open()
  G.ARGS.is_colour_booster = false
  if self.ability.set == "Booster" and self.ability.name:find('Colour') then
      stop_use()
      G.STATE_COMPLETE = false 
      self.opening = true

      if not self.config.center.discovered then
          discover_card(self.config.center)
      end
      self.states.hover.can = false

      G.ARGS.is_colour_booster = true
      G.STATE = G.STATES.STANDARD_PACK
      G.GAME.pack_size = self.ability.extra

      G.GAME.pack_choices = self.config.center.config.choose or 1

      if self.cost > 0 then 
          G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
              inc_career_stat('c_shop_dollars_spent', self.cost)
              self:juice_up()
          return true end }))
          ease_dollars(-self.cost) 
     else
         delay(0.2)
     end

      G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
          self:explode()
          local pack_cards = {}

          G.E_MANAGER:add_event(Event({trigger = 'after', delay = 1.3*math.sqrt(G.SETTINGS.GAMESPEED), blockable = false, blocking = false, func = function()
              local _size = self.ability.extra
              
              for i = 1, _size do
                  local card = nil
                  card = create_colour()
                  card.T.x = self.T.x
                  card.T.y = self.T.y
                  card:start_materialize({G.C.WHITE, G.C.WHITE}, nil, 1.5*G.SETTINGS.GAMESPEED)
                  pack_cards[i] = card
              end
              return true
          end}))

          G.E_MANAGER:add_event(Event({trigger = 'after', delay = 1.3*math.sqrt(G.SETTINGS.GAMESPEED), blockable = false, blocking = false, func = function()
              if G.pack_cards then 
                  if G.pack_cards and G.pack_cards.VT.y < G.ROOM.T.h then 
                  for k, v in ipairs(pack_cards) do
                      G.pack_cards:emplace(v)
                  end
                  return true
                  end
              end
          end}))

          for i = 1, #G.jokers.cards do
              G.jokers.cards[i]:calculate_joker({open_booster = true, card = self})
          end

          if G.GAME.modifiers.inflation then 
              G.GAME.inflation = G.GAME.inflation + 1
              G.E_MANAGER:add_event(Event({func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true end }))
          end

      return true end }))
  else
    card_openref(self)
  end
end

-- thanks autumn
local alias__G_UIDEF_use_and_sell_buttons = G.UIDEF.use_and_sell_buttons;
function G.UIDEF.use_and_sell_buttons(card)
	local ret = alias__G_UIDEF_use_and_sell_buttons(card)
	
	if card.config.center.key and (card.area == G.pack_cards and G.pack_cards) and card.ability.set == "Colour" then
		return {
			n=G.UIT.ROOT, config = {padding = 0, colour = G.C.CLEAR}, nodes={
				{n=G.UIT.R, config={mid = true}, nodes={
				}},
				{n=G.UIT.R, config={ref_table = card, r = 0.08, padding = 0.1, align = "bm", minw = 0.5*card.T.w - 0.15, minh = 0.8*card.T.h, maxw = 0.7*card.T.w - 0.15, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'select_colour', func = 'can_select_colour'}, nodes={
				{n=G.UIT.T, config={text = localize('b_select'),colour = G.C.UI.TEXT_LIGHT, scale = 0.55, shadow = true}}
			}},
		}}
	end
	
	return ret
end

G.FUNCS.can_select_colour = function(e)
    if e.config.ref_table.ability.set ~= 'Colour' or (e.config.ref_table.edition and e.config.ref_table.edition.negative) or #G.consumeables.cards < G.consumeables.config.card_limit then 
        e.config.colour = G.C.GREEN
        e.config.button = 'select_colour'
    else
      e.config.colour = G.C.UI.BACKGROUND_INACTIVE
      e.config.button = nil
    end
end

  -- a LOT of this is unnecessary and may be trimmed down in the future
G.FUNCS.select_colour = function(e, mute, nosave)
    e.config.button = nil
    local card = e.config.ref_table
    local area = card.area
    local prev_state = G.STATE
    local dont_dissolve = nil
    local delay_fac = 1

    G.TAROT_INTERRUPT = G.STATE
    if card.ability.set == 'Booster' then G.GAME.PACK_INTERRUPT = G.STATE end 
    G.STATE = (G.STATE == G.STATES.TAROT_PACK and G.STATES.TAROT_PACK) or
      (G.STATE == G.STATES.PLANET_PACK and G.STATES.PLANET_PACK) or
      (G.STATE == G.STATES.SPECTRAL_PACK and G.STATES.SPECTRAL_PACK) or
      (G.STATE == G.STATES.STANDARD_PACK and G.STATES.STANDARD_PACK) or
      (G.STATE == G.STATES.BUFFOON_PACK and G.STATES.BUFFOON_PACK) or
      G.STATES.PLAY_TAROT
      
    G.CONTROLLER.locks.use = true
    if G.booster_pack and not G.booster_pack.alignment.offset.py and (card.ability.consumeable or not (G.GAME.pack_choices and G.GAME.pack_choices > 1)) then
      G.booster_pack.alignment.offset.py = G.booster_pack.alignment.offset.y
      G.booster_pack.alignment.offset.y = G.ROOM.T.y + 29
    end
    if G.shop and not G.shop.alignment.offset.py then
      G.shop.alignment.offset.py = G.shop.alignment.offset.y
      G.shop.alignment.offset.y = G.ROOM.T.y + 29
    end
    if G.blind_select and not G.blind_select.alignment.offset.py then
      G.blind_select.alignment.offset.py = G.blind_select.alignment.offset.y
      G.blind_select.alignment.offset.y = G.ROOM.T.y + 39
    end
    if G.round_eval and not G.round_eval.alignment.offset.py then
      G.round_eval.alignment.offset.py = G.round_eval.alignment.offset.y
      G.round_eval.alignment.offset.y = G.ROOM.T.y + 29
    end

    if card.children.use_button then card.children.use_button:remove(); card.children.use_button = nil end
    if card.children.sell_button then card.children.sell_button:remove(); card.children.sell_button = nil end
    if card.children.price then card.children.price:remove(); card.children.price = nil end

    if card.area then card.area:remove_card(card) end
    
    if card.ability.set == 'Colour' then
      card:add_to_deck()
      G.consumeables:emplace(card)
      play_sound('card1', 0.8, 0.6)
      play_sound('generic1')
      dont_dissolve = true
      delay_fac = 0.2
    end
	G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,
	func = function()
		if not dont_dissolve then card:start_dissolve() end
		G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,
		func = function()
			G.STATE = prev_state
			G.TAROT_INTERRUPT=nil
			G.CONTROLLER.locks.use = false

			if (prev_state == G.STATES.TAROT_PACK or prev_state == G.STATES.PLANET_PACK or
			  prev_state == G.STATES.SPECTRAL_PACK or prev_state == G.STATES.STANDARD_PACK or
			  prev_state == G.STATES.BUFFOON_PACK) and G.booster_pack then
			  if area == G.consumeables then
				G.booster_pack.alignment.offset.y = G.booster_pack.alignment.offset.py
				G.booster_pack.alignment.offset.py = nil
			  elseif G.GAME.pack_choices and G.GAME.pack_choices > 1 then
				if G.booster_pack.alignment.offset.py then 
				  G.booster_pack.alignment.offset.y = G.booster_pack.alignment.offset.py
				  G.booster_pack.alignment.offset.py = nil
				end
				G.GAME.pack_choices = G.GAME.pack_choices - 1
			  else
				  G.CONTROLLER.interrupt.focus = true
					G.ARGS.is_colour_booster = false
				  G.FUNCS.end_consumeable(nil, delay_fac)
			  end
			else
			  if G.shop then 
				G.shop.alignment.offset.y = G.shop.alignment.offset.py
				G.shop.alignment.offset.py = nil
			  end
			  if G.blind_select then
				G.blind_select.alignment.offset.y = G.blind_select.alignment.offset.py
				G.blind_select.alignment.offset.py = nil
			  end
			  if G.round_eval then
				G.round_eval.alignment.offset.y = G.round_eval.alignment.offset.py
				G.round_eval.alignment.offset.py = nil
			  end
			  if area and area.cards[1] then 
				G.E_MANAGER:add_event(Event({func = function()
				  G.E_MANAGER:add_event(Event({func = function()
					G.CONTROLLER.interrupt.focus = nil
					if card.ability.set == 'Voucher' then 
					  G.CONTROLLER:snap_to({node = G.shop:get_UIE_by_ID('next_round_button')})
					elseif area then
					  G.CONTROLLER:recall_cardarea_focus(area)
					end
				  return true end }))
				return true end }))
			  end
			end
		return true
	  end}))
	return true
  end}))
end
local use_consumeableref = Card.use_consumeable
function Card:use_consumeable(area, copier)

  local used_colour = copier or self

  use_consumeableref(self, area, copier)
--   if self.config.mfinbooster then
--     if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
--       G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
--       G.E_MANAGER:add_event(Event({
--         func = (function()
--           G.E_MANAGER:add_event(Event({
--             func = function() 
--               local card = copy_card(used_colour, nil, nil, nil)
--               card:add_to_deck()
--               G.consumeables:emplace(card)
--               G.GAME.consumeable_buffer = 0
--               return true end }))   
--       return true end)}))
--     end
--   else
    if self.ability.set == "Colour" then
        if self.ability.name == "White" or self.ability.name == "Tan" or self.ability.name == "Blue" or self.ability.name == "Lilac" then
            local card_type = 
                (self.ability.name == "White" and "Colour") or
                (self.ability.name == "Tan" and "Alchemical") or
                (self.ability.name == "Blue" and "Planet") or
                (self.ability.name == "Lilac" and "Tarot")
            local rng_seed = 
                (self.ability.name == "White" and "whi") or
                (self.ability.name == "Tan" and "tan") or
                (self.ability.name == "Blue" and "blu") or
                (self.ability.name == "Lilac" and "lil")
            for i = 1, self.ability.extra do
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    play_sound('timpani')
                    local card = create_card(card_type, G.consumeables, nil, nil, nil, nil, nil, rng_seed)
                    card:add_to_deck()
                    card:set_edition({negative = true}, true)
                    G.consumeables:emplace(card)
                    self:juice_up(0.3, 0.5)
                    return true end }))
            end
            delay(0.6)
        end
        if self.ability.name == "Peach" then
            for i = 1, self.ability.extra do
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    play_sound('timpani')
                    local card = create_card(nil,G.consumeables, nil, nil, nil, nil, 'c_soul', 'sup')
                    card:add_to_deck()
                    card:set_edition({negative = true}, true)
                    G.consumeables:emplace(card)
                    self:juice_up(0.3, 0.5)
                    return true end }))
            end
            delay(0.6)
        end
        if self.ability.name == "Black" then
            for i = 1, self.ability.extra do
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    local temp_pool = {}
                    local backup_pool = {}
                    for k, v in pairs(G.jokers.cards) do
                        if v.ability.set == 'Joker' and (not v.edition) then
                            table.insert(temp_pool, v)
                        end
                        if v.ability.set == 'Joker' then
                            table.insert(backup_pool, v)
                        end
                    end
                    if #temp_pool > 0 then
                        local over = false
                        local eligible_card = pseudorandom_element(temp_pool, pseudoseed("black"))
                        local edition = {negative = true}
                        eligible_card:set_edition(edition, true)
                        check_for_unlock({type = 'have_edition'})
                        self:juice_up(0.3, 0.5)
                    elseif #backup_pool > 0 then
                        local over = false
                        local eligible_card = pseudorandom_element(backup_pool, pseudoseed("black"))
                        local edition = {negative = true}
                        eligible_card:set_edition(edition, true)
                        check_for_unlock({type = 'have_edition'})
                        self:juice_up(0.3, 0.5)
                    end
                return true end }))
            end
            delay(0.6)
        end
        if self.ability.name == "Red" or self.ability.name == "Orange" or self.ability.name == "Deep Blue" or self.ability.name == "Seaweed" or self.ability.name == "Amber" or self.ability.name == "Amethyst" or self.ability.name == "Magenta" or self.ability.name == "Periwinkle" or self.ability.name == "Purple" then
            local suit = 
                (self.ability.name == "Red" and "Hearts") or
                (self.ability.name == "Orange" and "Diamonds") or
                (self.ability.name == "Deep Blue" and "Spades") or
                (self.ability.name == "Seaweed" and "Clubs") or 
                (self.ability.name == "Amber" and "Fleurons") or
                (self.ability.name == "Amethyst" and "Halberds") or
                (self.ability.name == "Magenta" and "Stars") or
                (self.ability.name == "Periwinkle" and "Moons") or
                (self.ability.name == "Purple" and "Notes")
            local rng_seed = 
                (self.ability.name == "Red" and "red") or
                (self.ability.name == "Orange" and "ora") or
                (self.ability.name == "Deep Blue" and "dee") or
                (self.ability.name == "Seaweed" and "sea")  or 
                (self.ability.name == "Amber" and "amb") or
                (self.ability.name == "Amethyst" and "ame") or
                (self.ability.name == "Magenta" and "mag") or
                (self.ability.name == "Periwinkle" and "per") or
                (self.ability.name == "Purple" and "pur")

            if self.ability.name == "Amber" then
                acknowledge("Fleurons")
            elseif self.ability.name == "Amethyst" then
                acknowledge("Halberds")
            end
            local blacklist = {}
            for i = 1, self.ability.extra do
                local temp_pool = {}
                for k, v in pairs(G.hand.cards) do
                    if not v:is_suit(suit) and not blacklist[v] then
                        table.insert(temp_pool, v)
                    end
                end
                local over = false
                if #temp_pool == 0 then
                    break
                end
                local eligible_card = pseudorandom_element(temp_pool, pseudoseed(rng_seed))
                blacklist[eligible_card] = true
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() eligible_card:flip();play_sound('card1', 1);eligible_card:juice_up(0.3, 0.3);return true end }))
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function() eligible_card:flip();play_sound('tarot2', percent);eligible_card:change_suit(suit);return true end }))
                self:juice_up(0.3, 0.5)
            end
            delay(0.6)
        end
        if self.ability.name == "Crimson" or self.ability.name == "Silver" or self.ability.name == "Grey" or self.ability.name == "Green" then
            local tag_type = 
                (self.ability.name == "Crimson" and "tag_rare") or
                (self.ability.name == "Green" and "tag_d_six") or
                (self.ability.name == "Silver" and "tag_polychrome") or
                (self.ability.name == "Grey" and "tag_double")
            for i = 1, self.ability.extra do
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        add_tag(Tag(tag_type))
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        return true
                    end)
                }))
                delay(0.2)
            end
            delay(0.6)
        end
        if self.ability.name == "Pink" then
            n_random_colour_rounds(self.ability.extra)
            delay(0.6)
        end
        if self.ability.name == "Brown" then
            local temp_hand = {}
            local destroyed_cards = {}
            for k, v in ipairs(G.hand.cards) do temp_hand[#temp_hand+1] = v end
            table.sort(temp_hand, function (a, b) return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card end)
            pseudoshuffle(temp_hand, pseudoseed('immolate'))

            for i = 1, math.min(#temp_hand, self.ability.extra) do destroyed_cards[#destroyed_cards+1] = temp_hand[i] end

            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                play_sound('tarot1')
                self:juice_up(0.3, 0.5)
                return true end }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function() 
                    for i=#destroyed_cards, 1, -1 do
                        local card = destroyed_cards[i]
                        if card.ability.name == 'Glass Card' then 
                            card:shatter()
                        else
                            card:start_dissolve(nil, i == #destroyed_cards)
                        end
                    end
                    return true end }))
            delay(0.5)
            ease_dollars(2 * self.ability.extra)
            delay(0.3)
            for i = 1, #G.jokers.cards do
                G.jokers.cards[i]:calculate_joker({remove_playing_cards = true, removed = destroyed_cards})
            end
            delay(0.6)
        end
    end
--   end
end

local create_UIBox_standard_packref = create_UIBox_standard_pack
function create_UIBox_standard_pack()
  if G.ARGS.is_colour_booster then
    local _size = G.GAME.pack_size
    G.pack_cards = CardArea(
      G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
      _size*G.CARD_W*1.1,
      1.05*G.CARD_H, 
      {card_limit = _size, type = 'consumeable', highlight_limit = 1})

      local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
        {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
          {n=G.UIT.R, config={align = "cm"}, nodes={
          {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
            {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
              {n=G.UIT.O, config={object = G.pack_cards}},
            }}
          }}
        }},
        {n=G.UIT.R, config={align = "cm"}, nodes={
        }},
        {n=G.UIT.R, config={align = "tm"}, nodes={
          {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
          {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
          UIBox_dyn_container({
            {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
              {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                {n=G.UIT.O, config={object = DynaText({string = localize('k_colour_pack'), colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}
              }},
              {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                {n=G.UIT.O, config={object = DynaText({string = {localize('k_choose')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}
              }},
            }}
          }),
        }},
          {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
            {n=G.UIT.R,config={minh =0.2}, nodes={}},
            {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
              {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}
            }}
          }}
        }}
      }}
    }}
    return t
  else
    return create_UIBox_standard_packref()
  end
end

local can_use_consumeableref = Card.can_use_consumeable
function Card:can_use_consumeable(any_state, skip_check)
  if not skip_check and ((G.play and #G.play.cards > 0) or
    (G.CONTROLLER.locked) or
    (G.GAME.STOP_USE and G.GAME.STOP_USE > 0))
    then  return false end

  if G.STATE == G.STATES.SELECTING_HAND then
    -- if self.ability.name == "Black" or self.ability.name == "Deep Blue" or self.ability.name == "Crimson" or self.ability.name == "Seaweed"
    -- or self.ability.name == "Brown" or self.ability.name == "Grey" or self.ability.name == "Silver" or self.ability.name == "White"
    -- or self.ability.name == "Red" or self.ability.name == "Orange" or self.ability.name == "Yellow" or self.ability.name == "Green"
    -- or self.ability.name == "Blue" or self.ability.name == "Lilac" or self.ability.name == "Pink" or self.ability.name == "Peach" then
    if self.ability.set == "Colour" then
      self.config.mfinbooster = false
      return true
    end
  end

  if G.STATE == G.STATES.STANDARD_PACK then
    -- if self.ability.name == "Black" or self.ability.name == "Deep Blue" or self.ability.name == "Crimson" or self.ability.name == "Seaweed"
    -- or self.ability.name == "Brown" or self.ability.name == "Grey" or self.ability.name == "Silver" or self.ability.name == "White"
    -- or self.ability.name == "Red" or self.ability.name == "Orange" or self.ability.name == "Yellow" or self.ability.name == "Green"
    -- or self.ability.name == "Blue" or self.ability.name == "Lilac" or self.ability.name == "Pink" or self.ability.name == "Peach" then
    if self.ability.set == "Colour" then
      self.config.mfinbooster = true
      return true
    end
  end
  
    if self.ability.set == "Colour" and G.STATE ~= G.STATES.HAND_PLAYED and G.STATE ~= G.STATES.DRAW_TO_HAND and G.STATE ~= G.STATES.PLAY_TAROT or any_state then
        self.config.mfinbooster = false
        if self.ability.name == "White" or self.ability.name == "Tan" or self.ability.name == "Lilac" or self.ability.name == "Blue" or 
           self.ability.name == "Pink" or 
           self.ability.name == "Crimson" or self.ability.name == "Green" or self.ability.name == "Silver" or self.ability.name == "Grey" or
           self.ability.name == "Peach" then
            return true
        end
        if self.ability.name == "Black" then 
            if next(self.eligible_editionless_jokers) then return true end
        end
        if self.ability.name == "Red" or self.ability.name == "Orange" or self.ability.name == "Deep Blue" or self.ability.name == "Seaweed" or 
        self.ability.name == "Amber" or self.ability.name == "Amethyst" or self.ability.name == "Magenta" or self.ability.name == "Periwinkle" or self.ability.name == "Purple" or
        self.ability.name == "Brown" then
            return #G.hand.cards > 1
        end
        -- return false
    end

  return can_use_consumeableref(self, any_state, skip_check)
end

function SMODS.INIT.MoreFluff()

    sendDebugMessage("morefluff incorporated")

    register_sound("yay", SMODS.findModByID("MoreFluff").path, "yay.ogg")

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
                "Gains {X:mult,C:white} X0.5 {} Mult if played",
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
                "{X:red,C:white} X3 {} Mult",
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
        mf_leagueoflegends = {
            name = "Bad Legal Defence",
            text = {
                "Create a {C:attention}Death{} {C:tarot}Tarot{}",
                "when {C:attention}Boss Blind{}",
                "is selected",
                "{C:inactive}(Must have room)"
            },
        },
        mf_pipe = {
            name = "Philosophical Joker",
            text = {
                "{C:dark_edition}+1{} Joker Slot"
            },
        },
        mf_blackmarket = {
            name = "Black Market",
            text = {
                "When {C:attention}Boss Blind{}",
                "is selected, spend {C:attention}$10",
                "to summon an {C:spectral}Ankh{} card"
            },
        },
        mf_blasphemy = {
            name = "Blasphemy",
            text = {
                "{X:red,C:white} X4 {} Mult",
                "{C:blue}-9999{} hands",
                "when hand is played"
            },
        },
        mf_thesolo = {
            name = "The Solo",
            text = {
                "Gains {X:mult,C:white} X0.1 {} Mult if played",
                "hand has only {C:attention}1{} card",
                "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)",
            }
        },
        mf_thejester = {
            name = "The Jester",
            text = {
                "{X:mult,C:white} X2.5 {} Mult for",
                "each unique played pair"
            }
        },
        mf_globe = {
            name = "Globe",
            text = {
                "Create a {C:planet}Planet{} card",
                "when you {C:attention}reroll{} in the shop",
            }
        },
        mf_globe = {
            name = "Globe",
            text = {
                "Create a {C:planet}Planet{} card",
                "when you {C:attention}reroll{} in the shop",
            }
        },
        mf_couponcatalogue = {
            name = "Coupon Catalogue",
            text = {
                "{C:mult}+10{} Mult for each",
                "{C:attention}Voucher{} purchased",
                "this run",
                "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
            }
        },
        mf_ace = {
            name = "Ace Up The Sleeve",
            text = {
                "Add a random {C:attention}Enhanced",
                "{C:attention}Ace{} to your hand",
                "when you have {C:blue}1{}",
                "hand left"
            }
        },
        mf_fleshprison = {
            name = "Flesh Prison",
            text = {
                "{C:red}X5{} {C:attention}Boss Blind{} size",
                "Destroyed and creates a",
                "{C:dark_edition}Negative{} {C:spectral}Soul{} card when a",
                "{C:attention}Boss Blind{} is defeated"
            }
        },
        mf_goldencarrot = {
            name = "Golden Carrot",
            text = {
                "Earn {C:money}$#1#{} at",
                "end of round",
                "{C:money}-$#2#{} per hand played"
            }
        },
        mf_bowlingball = {
            name = "Bowling Ball",
            text = {
                "Played {C:attention}3s{}",
                "give {C:chips}+60{} Chips",
                "and {C:mult}+10{} Mult",
                "when scored"
            }
        },
        mf_simplified = {
            name = "Simplified Joker",
            text = {
                "Other {C:blue}Common{} Jokers",
                "each give {C:mult}+4{} Mult",
            }
        },
        mf_jankman = {
            name = "Jankman",
            text = {
                "Other {C:dark_edition}Modded{} Jokers",
                "each give {X:mult,C:white} X1.25 {} Mult",
            }
        },
        mf_pixeljoker = {
            name = "Pixel Joker",
            text = {
                "Played {C:attention}Aces{},",
                "{C:attention}4s{} and {C:attention}9s{} each give",
                "{X:mult,C:white} X1.5 {} Mult when scored"
            },
        },
        mf_burnerphone = {
            name = "Burner Phone",
            text = {
                "Shows the rank and suit",
                "of the top two cards",
                "of the deck",
                "{C:inactive}(Currently {V:1}#1#{V:2}#2#{V:3}#3#{C:inactive}",
                "{C:inactive}and {V:4}#4#{V:5}#5#{V:6}#6#{C:inactive})"
            },
        },
        mf_virtual = {
            name = "Virtual Joker",
            text = {
                "{X:red,C:white} X3 {} Mult",
                "Flips and shuffles all",
                "Joker cards when",
                "blind is selected"
            },
        },
        mf_dramaticentrance = {
            name = "Dramatic Entrance",
            text = {
                "{C:chips} +150 {} Chips",
                "on first hand",
                "each round"
            },
        },
        mf_bladedance = {
            name = "Blade Dance",
            text = {
                "Adds 2 temporary",
                "{C:attention}Steel Cards{}",
                "to your deck when",
                "blind is selected"
            },
        },
        mf_hyperbeam = {
            name = "Hyper Beam",
            text = {
                "{X:red,C:white} X3 {} Mult",
                "{C:attention}Lose all discards",
                "when {C:attention}Blind{} is selected"
            },
        },
        mf_dropkick = {
            name = "Dropkick",
            text = {
                "{C:blue}+1{} hand when hand",
                "contains a {C:attention}Straight"
            },
        },
        mf_bigshot = {
            name = "Big Shot Joker",
            text = {
                "Played {C:attention}Aces{},",
                "{C:attention}9s{}, and {C:attention}7s{} earn",
                "{C:money}$1{} when scored",
                "Retrigger all played {C:attention}9s{}",
            },
        },
        mf_paintcan = {
            name = "Paint Can",
            text = {
                "{C:green}#1# in 5{} chance to add",
                "{C:attention}1{} round to {C:colourcard}Colour Cards{}",
                "when they gain a round",
            },
        },
        mf_clipart = {
            name = "Clipart Joker",
            text = {
                "Create a {C:colourcard}Colour{} card",
                "when {C:attention}Blind{} is selected",
                "{C:inactive}(Must have room)"
            },
        },
        mf_loadeddisk = {
            name = "Loaded Disk",
            text = {
                "Creates a {C:colourcard}Pink{} and",
                "a {C:colourcard}Yellow{} {C:colourcard}Colour{} card",
                "when sold",
                "{C:inactive}(Must have room)"
            },
        },
        mf_mrloans = {
            name = "Mr. Loans",
            text = {
                "Prevents death if",
                "not in debt, but you",
                "lose {C:money}${} equal to remaining",
                "required chips"
            },
        },
        mf_rainbow = {
            name = "Rainbow Joker",
            text = {
                "{C:colourcard}Colour{} cards give",
                "{X:mult,C:white} X2{} Mult"
            },
        },
        mf_mouthmoods = {
            name = "Mashup Album",
            text = {
                "Gains {C:mult}+4{} Mult if played",
                "hand contains a {C:hearts}red{} flush",
                "Gains {C:chips}+15{} Chips if played",
                "hand contains a {C:spades}black{} flush",
                "{C:inactive}(Currently {C:mult}+#1#{C:inactive} and {C:chips}+#2#{C:inactive})"
            },
        },
        mf_css = {
            name = "CSS",
            text = {
                "Create a random {C:colourcard}Colour",
                "card when played hand",
                "contains a {C:attention}Flush"
            },
        },
        mf_cba = {
            name = "Card Buffer Advanced",
            text = {
                "If {C:attention}first hand{} of round",
                "has only {C:attention}1{} card, add",
                "add {C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, or",
                "{C:dark_edition}Polychrome{} effect to it",
            },
        },
        -- mf_cube = {
        --     name = "Joker Cube",
        --     text = {
        --         "{C:colourcard}Colour{} cards give",
        --         "{X:mult,C:white} X2{} Mult"
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

        c_mf_black = {
            name = "Black",
            text = {
                "Add {C:dark_edition}Negative{} to a",
                "random {C:attention}Joker{} for every",
                "{C:attention}4{} rounds this has been held",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },
        c_mf_deepblue = {
            name = "Deep Blue",
            text = {
                "Converts a random card in",
                "hand to {C:spades}Spades{} for every",
                "round this has been held",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },
        c_mf_crimson = {
            name = "Crimson",
            text = {
                "Create a {C:red}Rare Tag{} for",
                "every {C:attention}3{} rounds",
                "this has been held",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },
        c_mf_seaweed = {
            name = "Seaweed",
            text = {
                "Converts a random card in",
                "hand to {C:clubs}Clubs{} for every",
                "round this has been held",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },
        c_mf_brown = {
            name = "Brown",
            text = {
                "Destroys a random card in",
                "hand and gives {C:attention}$2{} for every",
                "{C:attention}2{} rounds this has been held",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },
        c_mf_grey = {
            name = "Grey",
            text = {
                "Create a {C:attention}Double Tag{} for",
                "every {C:attention}3{} rounds",
                "this has been held",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },
        c_mf_silver = {
            name = "Silver",
            text = {
                "Create a {C:dark_edition}Polychrome Tag{} for",
                "every {C:attention}3{} rounds",
                "this has been held",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },
        c_mf_white = {
            name = "White",
            text = {
                "Create a random {C:dark_edition}Negative{}",
                "{C:colourcard}Colour{} card for every",
                "{C:attention}2{} rounds this has been held",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },
        c_mf_red = {
            name = "Red",
            text = {
                "Converts a random card in",
                "hand to {C:hearts}Hearts{} for every",
                "round this has been held",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },
        c_mf_orange = {
            name = "Orange",
            text = {
                "Converts a random card in",
                "hand to {C:diamonds}Diamonds{} for every",
                "round this has been held",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },
        c_mf_yellow = {
            name = "Yellow",
            text = {
                "Gains {C:money}$8{} of",
                "{C:attention}sell value{}",
                "every {C:attention}3 rounds",
                "{C:inactive}({}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },
        c_mf_green = {
            name = "Green",
            text = {
                "Create a {C:green}D6 Tag{} for",
                "every {C:attention}3{} rounds",
                "this has been held",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },
        c_mf_blue = {
            name = "Blue",
            text = {
                "Create a random {C:dark_edition}Negative{}",
                "{C:planet}Planet{} card for every",
                "{C:attention}2{} rounds this has been held",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },
        c_mf_lilac = {
            name = "Lilac",
            text = {
                "Create a random {C:dark_edition}Negative{}",
                "{C:tarot}Tarot{} card for every",
                "{C:attention}2{} rounds this has been held",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },
        c_mf_pink = {
            name = "Pink",
            text = {
                "Add {C:attention}1{} round to a random",
                "{C:colourcard}Colour{} card for every",
                "{C:attention}2{} rounds this has been held",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },
        c_mf_peach = {
            name = "Peach",
            text = {
                "Create a {C:dark_edition}Negative{} {C:spectral}Soul{}",
                "card for every {C:attention}6{}",
                "rounds this has been held",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },

        v_mf_paintroller = {
            name = "Paint Roller",
            text = {
                "{C:green}1 in 2{} chance to add",
                "{C:attention}1{} round to {C:colourcard}Colour Cards{}",
                "when they gain a round"
            },
        },
        v_mf_colourtheory = {
            name = "Colour Theory",
            text = {
                "{C:green}1 in 2{} {C:colourcard}Colour{} cards in",
                "packs are {C:dark_edition}Polychrome{}",
            },
        },

        mf_hugestuntman = {
            name = "Huge Stuntman",
            text = {
                "{X:red,C:white} X3 {} Mult, {C:chips}+300{} Chips,",
                "{C:attention}-2{} hand size",
                "{C:inactive}(Huge Joker + Stuntman)"
            },
        },
        c_mf_tan = {
            name = "Tan",
            text = {
                "Create a random {C:dark_edition}Negative{}",
                "{C:alchemical}Alchemical{} card for every",
                "{C:attention}2{} rounds this has been held",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },
        c_mf_amber = {
            name = "Amber",
            text = {
                "Converts a random card in",
                "hand to {C:fleurons}Fleurons{} for every",
                "round this has been held",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },
        c_mf_amethyst = {
            name = "Amethyst",
            text = {
                "Converts a random card in",
                "hand to {C:halberds}Halberds{} for every",
                "round this has been held",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },
        c_mf_magenta = {
            name = "Magenta",
            text = {
                "Converts a random card in",
                "hand to {C:stars}Stars{} for every",
                "round this has been held",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },
        c_mf_periwinkle = {
            name = "Periwinkle",
            text = {
                "Converts a random card in",
                "hand to {C:moons}Moons{} for every",
                "round this has been held",
                "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
            },
        },
        -- c_mf_purple = {
        --     name = "Purple",
        --     text = {
        --         "Converts a random card in",
        --         "hand to {C:notes}Notes{} for every",
        --         "round this has been held",
        --         "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
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
            { x = 0, y = 0 }, "",
            2, 6, true, true, true, true
        ),
        mf_triangle = SMODS.Joker:new(
            "Triangle Joker", "",
            { extra = { chips = 1, chip_mod = 2 }},
            { x = 0, y = 0 }, "",
            3, 7, true, true, true, true
        ),
        mf_boxofhands = SMODS.Joker:new(
            "Box of Hands", "",
            { },
            { x = 0, y = 0 }, "",
            2, 6, true, true, false, false
        ),
        mf_hallofmirrors = SMODS.Joker:new(
            "Hall of Mirrors", "",
            { config = { h_size = 0 } },
            { x = 0, y = 0 }, "",
            2, 7, true, true, false, true
        ),
        mf_rosetinted = SMODS.Joker:new(
            "Rose-Tinted Glasses", "",
            { },
            { x = 0, y = 0 }, "",
            3, 7, true, true, false, true
        ),
        mf_impostor = SMODS.Joker:new(
            "Impostor", "",
            { },
            { x = 0, y = 0 }, "",
            2, 6, true, true, true, true
        ),
        mf_glitterbomb = SMODS.Joker:new(
            "Glitter Bomb", "",
            { },
            { x = 0, y = 0 }, "",
            3, 14, true, true, false, false
        ),
        mf_basepaulcard = SMODS.Joker:new(
            "Basepaul Card", "",
            { },
            { x = 0, y = 0 }, "",
            1, 6, true, true, true, true
        ),
        mf_jester = SMODS.Joker:new(
            "Jester", "",
            { },
            { x = 0, y = 0 }, "",
            1, 2, true, true, true, true
        ),
        mf_lollipop = SMODS.Joker:new(
            "Lollipop", "",
            { Xmult = 1.75, extra = 0.15 },
            { x = 0, y = 0 }, "",
            1, 6, true, true, true, false
        ),
        mf_spiraljoker = SMODS.Joker:new(
            "Spiral Joker", "",
            { },
            { x = 0, y = 0 }, "",
            1, 5, true, true, true, true
        ),
        mf_luckycharm = SMODS.Joker:new(
            "Lucky Charm", "",
            { },
            { x = 0, y = 0 }, "",
            1, 6, true, true, true, true
        ),
        mf_stylemeter = SMODS.Joker:new(
            "Style Meter", "",
            { },
            { x = 0, y = 0 }, "",
            2, 6, true, true, false, true
        ),
        mf_bloodpact = SMODS.Joker:new(
            "Blood Pact", "",
            { },
            { x = 0, y = 0 }, "",
            3, 9, true, true, true, false
        ),
        mf_moneyprinter = SMODS.Joker:new(
            "Money Printer", "",
            { },
            { x = 0, y = 0 }, "",
            1, 5, true, true, false, true
        ),
        mf_sealthedeal = SMODS.Joker:new(
            "Seal the Deal", "",
            { },
            { x = 0, y = 0 }, "",
            2, 6, true, true, true, true
        ),
        mf_particleaccelerator = SMODS.Joker:new(
            "Particle Accelerator", "",
            { Xmult = 1 },
            { x = 0, y = 0 }, "",
            3, 7, true, true, true, true
        ),
        mf_clownfish = SMODS.Joker:new(
            "Clownfish", "",
            { },
            { x = 0, y = 0 }, "",
            1, 6, true, true, false, true
        ),
        mf_balatromods = SMODS.Joker:new(
            "Balatro Mods", "",
            { },
            { x = 0, y = 0 }, "",
            1, 3, true, true, false, true
        ),
        mf_treasuremap = SMODS.Joker:new(
            "Treasure Map", "",
            { extra = 0 },
            { x = 0, y = 0 }, "",
            1, 4, true, true, false, false
        ),
        mf_expansionpack = SMODS.Joker:new(
            "Expansion Pack", "",
            { },
            { x = 0, y = 0 }, "",
            1, 5, true, true, true, true
        ),
        mf_fived = SMODS.Joker:new(
            "5D Joker with Multiverse Time Travel", "",
            { },
            { x = 0, y = 0 }, "",
            3, 10, true, true, false, false
        ),
        mf_teacup = SMODS.Joker:new(
            "Teacup", "",
            { extra = 4 },
            { x = 0, y = 0 }, "",
            2, 5, true, true, true, false
        ),
        mf_whiteboard = SMODS.Joker:new(
            "Whiteboard", "",
            { },
            { x = 0, y = 0 }, "",
            2, 6, true, true, true, true
        ),
        mf_mspaint = SMODS.Joker:new(
            "MS Paint Joker", "",
            { config = { h_size = 0 } },
            { x = 0, y = 0 }, "",
            1, 5, true, true, false, true
        ),
        mf_hugejoker = SMODS.Joker:new(
            "Huge Joker", "",
            { },
            { x = 0, y = 0 }, "",
            3, 8, true, true, true, true
        ),
        mf_miner = SMODS.Joker:new(
            "Miner", "",
            { },
            { x = 0, y = 0 }, "",
            1, 5, true, true, true, true
        ),
        mf_recycling = SMODS.Joker:new(
            "Recycling", "",
            { },
            { x = 0, y = 0 }, "",
            2, 5, true, true, true, true
        ),
        mf_hollow = SMODS.Joker:new(
            "Hollow Joker", "",
            { },
            { x = 0, y = 0 }, "",
            1, 4, true, true, true, true
        ),
        mf_tonersoup = SMODS.Joker:new(
            "I Sip Toner Soup", "",
            { extra = 3 },
            { x = 0, y = 0 }, "",
            2, 8, true, true, true, false
        ),
        mf_leagueoflegends = SMODS.Joker:new(
            "Bad Legal Defence", "",
            { },
            { x = 0, y = 0 }, "",
            1, 6, true, true, true, true
        ),
        mf_pipe = SMODS.Joker:new(
            "Philosophical Joker", "",
            { },
            { x = 0, y = 0 }, "",
            1, 1, true, true, false, true
        ),
        mf_blackmarket = SMODS.Joker:new(
            "Black Market", "",
            { },
            { x = 0, y = 0 }, "",
            2, 4, true, true, false, false
        ),
        mf_blasphemy = SMODS.Joker:new(
            "Blasphemy", "",
            { },
            { x = 0, y = 0 }, "",
            2, 4, true, true, true, true
        ),
        mf_thesolo = SMODS.Joker:new(
            "The Solo", "",
            { Xmult = 1 },
            { x = 0, y = 0 }, "",
            3, 7, true, true, true, true
        ),
        mf_thejester = SMODS.Joker:new(
            "The Jester", "",
            { },
            { x = 0, y = 0 }, "",
            4, 20, true, true, true, true
        ),
        mf_globe = SMODS.Joker:new(
            "Globe", "",
            { },
            { x = 0, y = 0 }, "",
            2, 6, true, true, true, true
        ),
        mf_couponcatalogue = SMODS.Joker:new(
            "Coupon Catalogue", "",
            { },
            { x = 0, y = 0 }, "",
            1, 6, true, true, true, true
        ),
        mf_ace = SMODS.Joker:new(
            "Ace Up The Sleeve", "",
            { },
            { x = 0, y = 0 }, "",
            2, 6, true, true, true, true
        ),
        mf_fleshprison = SMODS.Joker:new(
            "Flesh Prison", "",
            { },
            { x = 0, y = 0 }, "",
            3, 10, true, true, false, false
        ),
        mf_goldencarrot = SMODS.Joker:new(
            "Golden Carrot", "",
            { extra = 10 },
            { x = 0, y = 0 }, "",
            2, 4, true, true, false, false
        ),
        mf_bowlingball = SMODS.Joker:new(
            "Bowling Ball", "",
            { },
            { x = 0, y = 0 }, "",
            3, 8, true, true, true, true
        ),
        mf_simplified = SMODS.Joker:new(
            "Simplified Joker", "",
            { },
            { x = 0, y = 0 }, "",
            1, 4, true, true, true, true
        ),
        mf_jankman = SMODS.Joker:new(
            "Jankman", "",
            { },
            { x = 0, y = 0 }, "",
            3, 10, true, true, true, true
        ),
        mf_pixeljoker = SMODS.Joker:new(
            "Pixel Joker", "",
            { },
            { x = 0, y = 0 }, "",
            3, 9, true, true, true, true
        ),
        mf_burnerphone = SMODS.Joker:new(
            "Burner Phone", "",
            { },
            { x = 0, y = 0 }, "",
            1, 2, true, true, false, true
        ),
        mf_virtual = SMODS.Joker:new(
            "Virtual Joker", "",
            { },
            { x = 0, y = 0 }, "",
            2, 7, true, true, true, true
        ),
        mf_dramaticentrance = SMODS.Joker:new(
            "Dramatic Entrance", "",
            { },
            { x = 0, y = 0 }, "",
            2, 6, true, true, true, true
        ),
        mf_bladedance = SMODS.Joker:new(
            "Blade Dance", "",
            { },
            { x = 0, y = 0 }, "",
            2, 8, true, true, true, true
        ),
        mf_hyperbeam = SMODS.Joker:new(
            "Hyper Beam", "",
            { },
            { x = 0, y = 0 }, "",
            2, 8, true, true, true, true
        ),
        mf_dropkick = SMODS.Joker:new(
            "Dropkick", "",
            { },
            { x = 0, y = 0 }, "",
            2, 8, true, true, false, true
        ),
        mf_bigshot = SMODS.Joker:new(
            "Big Shot Joker", "",
            { },
            { x = 0, y = 0 }, "",
            2, 7, true, true, true, true
        ),
        mf_paintcan = SMODS.Joker:new(
            "Paint Can", "",
            { },
            { x = 0, y = 0 }, "",
            3, 8, true, true, true, true
        ),
        mf_clipart = SMODS.Joker:new(
            "Clipart Joker", "",
            { },    
            { x = 0, y = 0 }, "",
            2, 6, true, true, true, true
        ),
        mf_loadeddisk = SMODS.Joker:new(
            "Loaded Disk", "",
            { },
            { x = 0, y = 0 }, "",
            2, 8, true, true, false, false
        ),
        mf_mrloans = SMODS.Joker:new(
            "Mr. Loans", "",
            { },
            { x = 0, y = 0 }, "",
            2, 4, true, true, false, true
        ),
        mf_rainbow = SMODS.Joker:new(
            "Rainbow Joker", "",
            { },
            { x = 0, y = 0 }, "",
            3, 7, true, true, false, true
        ),
        mf_mouthmoods = SMODS.Joker:new(
            "Mashup Album", "",
            { extra = { chips = 0, mult = 0 } },
            { x = 0, y = 0 }, "",
            3, 8, true, true, false, true
        ),
        mf_css = SMODS.Joker:new(
            "CSS", "",
            { },
            { x = 0, y = 0 }, "",
            2, 6, true, true, true, true
        ),
        mf_cba = SMODS.Joker:new(
            "Card Buffer Advanced", "",
            { },
            { x = 0, y = 0 }, "",
            3, 8, true, true, false, true
        ),
        -- mf_cube = SMODS.Joker:new(
        --     "Joker Cube", "",
        --     { },
        --     { x = 0, y = 0 }, "",
        --     3, 7, true, true, true, true
        -- ),
        -- mf_e = SMODS.Joker:new(
        --     "E Joker", "",
        --     { extra = 0 },
        --     { x = 0, y = 0 }, "",
        --     2, 6, true, true, true, true
        -- ),
    }
    -- Blacklist individual Jokers here
    local no_art_yet = {
    }
    
    if SMODS.findModByID("FusionJokers") then
        jokers.mf_hugestuntman = SMODS.Joker:new(
            "Huge Stuntman", "",
            { },
            { x = 8, y = 6 }, "",
            5, 12, true, true, true, true
        )
		FusionJokers.fusions:add_fusion("j_mf_hugejoker", nil, false, "j_stuntman", nil, false, "j_mf_hugestuntman", 12)
    end

    local joker_order_thing = {}

    for k, v in pairs(jokers) do
        local j = {}
        j.name = v.name
        j.rarity = v.rarity
        j.slug = k
        table.insert(joker_order_thing, j)
    end

    table.sort(joker_order_thing, function(a, b)
        if a.rarity ~= b.rarity then
            return a.rarity < b.rarity
        end
        return a.name < b.name
    end)

    for i, j in ipairs(joker_order_thing) do
        local k = j.slug
        local v = jokers[k]
        if joker_config[k] then
            v.slug = "j_" .. k
            v.loc_txt = localization[k]
            -- v.spritePos = { x = 0, y = 0 }
            if k == "mf_thejester" then
                v.soul_pos = { x = 0, y = 1 }
            end
            v.mod = "MoreFluff"
            v:register()
            if k == "mf_hugejoker" or k == "mf_hugestuntman" then
                -- these ones use the default sprite
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

    
    SMODS.Sprite:new("c_mf_undiscovered", SMODS.findModByID("MoreFluff").path, "c_mf_undiscovered.png", 71, 95, "asset_atli"):register();

    --[[MoreFluff.Colour:new(name, slug, config, pos, loc_txt, cost, discovered)]]
    local colours = {
        MoreFluff.Colour:new("Black", "mf_black", { upgrade_rounds = 4, extra = 0 }, { x = 0, y = 0 }, "", 4, true),
        MoreFluff.Colour:new("Deep Blue", "mf_deepblue", { upgrade_rounds = 1, extra = 0 }, { x = 0, y = 0 }, "", 4, true),
        MoreFluff.Colour:new("Crimson", "mf_crimson", { upgrade_rounds = 3, extra = 0 }, { x = 0, y = 0 }, "", 4, true),
        MoreFluff.Colour:new("Seaweed", "mf_seaweed", { upgrade_rounds = 1, extra = 0 }, { x = 0, y = 0 }, "", 4, true),
        MoreFluff.Colour:new("Brown", "mf_brown", { upgrade_rounds = 1, extra = 0 }, { x = 0, y = 0 }, "", 4, true),
        MoreFluff.Colour:new("Grey", "mf_grey", { upgrade_rounds = 3, extra = 0 }, { x = 0, y = 0 }, "", 4, true),
        MoreFluff.Colour:new("Silver", "mf_silver", { upgrade_rounds = 3, extra = 0 }, { x = 0, y = 0 }, "", 4, true),
        MoreFluff.Colour:new("White", "mf_white", { upgrade_rounds = 2, extra = 0 }, { x = 0, y = 0 }, "", 4, true),
        MoreFluff.Colour:new("Red", "mf_red", { upgrade_rounds = 1, extra = 0 }, { x = 0, y = 0 }, "", 4, true),
        MoreFluff.Colour:new("Orange", "mf_orange", { upgrade_rounds = 1, extra = 0 }, { x = 0, y = 0 }, "", 4, true),
        MoreFluff.Colour:new("Yellow", "mf_yellow", { upgrade_rounds = 3, extra = 0 }, { x = 0, y = 0 }, "", 4, true),
        MoreFluff.Colour:new("Green", "mf_green", { upgrade_rounds = 3, extra = 0 }, { x = 0, y = 0 }, "", 4, true),
        MoreFluff.Colour:new("Blue", "mf_blue", { upgrade_rounds = 2, extra = 0 }, { x = 0, y = 0 }, "", 4, true),
        MoreFluff.Colour:new("Lilac", "mf_lilac", { upgrade_rounds = 2, extra = 0 }, { x = 0, y = 0 }, "", 4, true),
        MoreFluff.Colour:new("Pink", "mf_pink", { upgrade_rounds = 2, extra = 0 }, { x = 0, y = 0 }, "", 4, true),
        MoreFluff.Colour:new("Peach", "mf_peach", { upgrade_rounds = 6, extra = 0 }, { x = 0, y = 0 }, "", 4, true),
    }

    if SMODS.findModByID("CodexArcanum") then
        local tan = MoreFluff.Colour:new("Tan", "mf_tan", { upgrade_rounds = 2, extra = 0 }, { x = 0, y = 0 }, "", 4, true)
        table.insert(colours, tan)
    end

    if SMODS.findModByID("Bunco") then
        local amber = MoreFluff.Colour:new("Amber", "mf_amber", { upgrade_rounds = 1, extra = 0 }, { x = 0, y = 0 }, "", 4, true)
        table.insert(colours, amber)
        local amethyst = MoreFluff.Colour:new("Amethyst", "mf_amethyst", { upgrade_rounds = 1, extra = 0 }, { x = 0, y = 0 }, "", 4, true)
        table.insert(colours, amethyst)
    end

    if SMODS.findModByID("SixSuits") then
        local magenta = MoreFluff.Colour:new("Magenta", "mf_magenta", { upgrade_rounds = 1, extra = 0 }, { x = 0, y = 0 }, "", 4, true)
        table.insert(colours, magenta)
        local periwinkle = MoreFluff.Colour:new("Periwinkle", "mf_periwinkle", { upgrade_rounds = 1, extra = 0 }, { x = 0, y = 0 }, "", 4, true)
        table.insert(colours, periwinkle)
    end

    -- if SMODS.findModByID("MusicalSuit") then
    --     local purple = MoreFluff.Colour:new("Purple", "mf_purple", { upgrade_rounds = 1, extra = 0 }, { x = 0, y = 0 }, "", 4, true)
    --     table.insert(colours, purple)
    -- end

    for i, j in ipairs(colours) do
        SMODS.Sprite:new(j.slug, SMODS.findModByID("MoreFluff").path, j.slug..".png", 71, 95, "asset_atli")
        :register()

        j.loc_txt = localization[j.slug]
        -- v.spritePos = { x = 0, y = 0 }
        j.mod = "MoreFluff"
        j:register()
    end
    
    SMODS.Sprite:new("colour_booster_atlas", SMODS.findModByID("MoreFluff").path, "colour_booster_atlas.png", 71, 95, "asset_atli"):register();
    MoreFluff.Booster:new("Colour Pack", "colour_normal_1", {extra = 2, choose = 1}, { x = 0, y = 0 }, 4, true, 1, "Celestial", "colour_booster_atlas"):register()
    MoreFluff.Booster:new("Colour Pack", "colour_normal_2", {extra = 2, choose = 1}, { x = 1, y = 0 }, 4, true, 1, "Celestial", "colour_booster_atlas"):register()
    MoreFluff.Booster:new("Jumbo Colour Pack", "colour_jumbo_1", {extra = 4, choose = 1}, { x = 2, y = 0 }, 6, true, 1, "Celestial", "colour_booster_atlas"):register()
    MoreFluff.Booster:new("Mega Colour Pack", "colour_mega_1", {extra = 4, choose = 2}, { x = 3, y = 0 }, 8, true, 0.25, "Celestial", "colour_booster_atlas"):register()

    local paintroller = SMODS.Voucher:new("Paint Roller", "mf_paintroller", {}, { x = 0, y = 0 }, localization["v_mf_paintroller"], 10, true, true)
    SMODS.Sprite:new("v_mf_paintroller", SMODS.findModByID("MoreFluff").path, "v_mf_paintroller.png", 71, 95, "asset_atli"):register();
    paintroller:register()

    local colourtheory = SMODS.Voucher:new("Colour Theory", "mf_colourtheory", {}, { x = 0, y = 0 }, localization["v_mf_colourtheory"], 10, true, true, true, {"v_mf_paintroller"})
    SMODS.Sprite:new("v_mf_colourtheory", SMODS.findModByID("MoreFluff").path, "v_mf_colourtheory.png", 71, 95, "asset_atli"):register();
    colourtheory:register()

    -- decks
    SMODS.Sprite:new("b_mf_grosmichel", SMODS.findModByID("MoreFluff").path, "b_mf_grosmichel.png", 71, 95, "asset_atli")
    :register()
    
    SMODS.Deck:new("Gros Michel Deck", "mf_grosmichel", { gros_michel = true, atlas = "b_mf_grosmichel" }, { x = 0, y = 0 }, {
        name = "Gros Michel Deck",
        text = {
            "Start run with {C:attention}Gros Michel"
        }
    })
    :register()

    SMODS.Sprite:new("b_mf_rainbow", SMODS.findModByID("MoreFluff").path, "b_mf_rainbow.png", 71, 95, "asset_atli")
    :register()
    
    SMODS.Deck:new("Rainbow Deck", "mf_rainbow", { voucher = 'v_mf_paintroller', consumables = {'c_mf_white'}, atlas = "b_mf_rainbow" }, { x = 0, y = 0 }, {
        name = "Rainbow Deck",
        text = {
            "Start run with a {C:colourcard}White",
            "{C:colourcard}Colour{} card and the",
            "{C:tarot,T:v_mf_paintroller}Paint Roller{} Voucher",
        }
    })
    :register()
    if joker_config.mf_pipe then

        SMODS.Sprite:new("b_mf_philosophical", SMODS.findModByID("MoreFluff").path, "b_mf_philosophical.png", 71, 95, "asset_atli")
        :register()
        
        SMODS.Deck:new("Philosophical Deck", "mf_philosophical", { philosophical = true, atlas = "b_mf_philosophical" }, { x = 0, y = 0 }, {
            name = "Philosophical Deck",
            text = {
                "Start run with 5",
                "{C:attention}Philosophical Jokers"
            }
        })
        :register()
    end

    if joker_config.mf_blasphemy then

        SMODS.Sprite:new("b_mf_blasphemy", SMODS.findModByID("MoreFluff").path, "b_mf_blasphemy.png", 71, 95, "asset_atli")
        :register()
        
        SMODS.Deck:new("Blasphemous Deck", "mf_blasphemy", { blasphemy = true, atlas = "b_mf_blasphemy" }, { x = 0, y = 0 }, {
            name = "Blasphemous Deck",
            text = {
                "Start run with a {C:dark_edition}Negative{}",
                "{C:spectral}Eternal{} {C:attention}Blasphemy"
            }
        })
        :register()
    end

    if freaky then
        register_sound("vineboom", SMODS.findModByID("MoreFluff").path, "vineboom.ogg")

        SMODS.Sprite:new("b_mf_freaky", SMODS.findModByID("MoreFluff").path, "b_mf_freaky.png", 71, 95, "asset_atli")
        :register()
        
        SMODS.Deck:new("Freaky Deck", "mf_freaky", { atlas = "b_mf_freaky" }, { x = 0, y = 0 }, {
            name = "Freaky Deck",
            text = {
                "Jokers are now {C:attention}freaky"
            }
        })
        :register()
        
        G.localization.descriptions.Other.e_freaky = {
            name = "Freaky",
            text = {
                "Freaky",
            }
        }

        G.localization.misc.labels.freaky = 'Freaky'

        -- surprisingly simple
        G.SHADERS['freaky'] = love.graphics.newShader(SMODS.findModByID("MoreFluff").path.."/assets/shaders/freaky.fs")

        -- insert e_ionized into the other editions
        local e_freaky = {order = 9999,  unlocked = true, discovered = false, name = "Freaky", pos = {x=0,y=0}, atlas = 'Joker', set = "Edition", config = {}}

        G.P_CENTERS['e_freaky'] = e_freaky
        table.insert(G.P_CENTER_POOLS['Edition'], e_freaky)

    end

    if joker_config.mf_brainrot then

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

        SMODS.Jokers.j_mf_brainrot.loc_def = function(self)
            return {self.ability.mult}
        end

    end

    if joker_config.mf_triangle then

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

        SMODS.Jokers.j_mf_triangle.loc_def = function(self)
            return {self.ability.extra.chips, self.ability.extra.chip_mod}
        end
    end
    
    if joker_config.mf_boxofhands then

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

    end
    
    if joker_config.mf_hallofmirrors then

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
            if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
                G.hand:change_size(-self.ability.h_size)
                self.ability.h_size = 0
            end
        end

        SMODS.Jokers.j_mf_hallofmirrors.loc_def = function(self)
            return {self.ability.h_size}
        end

    end
    
    if joker_config.mf_rosetinted then

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

        SMODS.Jokers.j_mf_rosetinted.loc_def = function(self)
            return {localize{type = 'name_text', set = 'Tag', key = 'tag_double', nodes = {}}}
        end

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

    if joker_config.mf_impostor then

        SMODS.Jokers.j_mf_impostor.calculate = function(self, context)
            if SMODS.end_calculate_context(context) then
                local red_suits = 0
                for k, v in ipairs(context.full_hand) do
                    if v:is_suit('Hearts', nil, true) or v:is_suit('Diamonds', nil, true) or v:is_suit('Stars', nil, true) or v:is_suit('Fleurons', nil, true) then
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

    end
    
    if joker_config.mf_glitterbomb then

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
    end
    
    if joker_config.mf_basepaulcard then

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
                        message = localize{type='variable',key='a_xmult',vars={1.25}},
                        Xmult_mod = 1.25,
                    }
                end
            end
        end
    end
    
    if joker_config.mf_jester then

        SMODS.Jokers.j_mf_jester.calculate = function(self, context)
            if SMODS.end_calculate_context(context) then
                return {
                    message = localize{type='variable',key='a_chips',vars={40}},
                    chip_mod = 40, 
                    colour = G.C.CHIPS
                }
            end
        end
    end
    
    if joker_config.mf_lollipop then

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

        SMODS.Jokers.j_mf_lollipop.loc_def = function(self)
            return {self.ability.x_mult, self.ability.extra}
        end
    
    end
    
    if joker_config.mf_spiraljoker then

        SMODS.Jokers.j_mf_spiraljoker.calculate = function(self, context)
            if SMODS.end_calculate_context(context) then
                local val = 10 + math.floor(7 * math.cos(math.pi/8 * G.GAME.dollars or 0) + 0.5)
                return {
                    message = localize{type='variable',key='a_mult',vars={val}},
                    mult_mod = val
                }
            end
        end

        SMODS.Jokers.j_mf_spiraljoker.loc_def = function(self)
            return {10 + math.floor(7 * math.cos(math.pi/8 * G.GAME.dollars or 0) + 0.5)}
        end

    end

    if joker_config.mf_luckycharm then

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

        SMODS.Jokers.j_mf_luckycharm.loc_def = function(self)
            return {G.GAME.probabilities.normal, 20, 3, 20, 8}
        end

    end
    
    if joker_config.mf_stylemeter then

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

        SMODS.Jokers.j_mf_stylemeter.loc_def = function(self)
            return {G.GAME.skips * 3}
        end

    end
    
    if joker_config.mf_bloodpact then
    
        SMODS.Jokers.j_mf_bloodpact.calculate = function(self, context)
            if SMODS.end_calculate_context(context) and context.full_hand ~= nil then
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

    end
    
    if joker_config.mf_moneyprinter then
    
        SMODS.Jokers.j_mf_moneyprinter.calculate = function(self, context)
            if context.after and not context.blueprint and context.full_hand ~= nil and context.cardarea == G.jokers then
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
    end
    
    if joker_config.mf_sealthedeal then
    
        SMODS.Jokers.j_mf_sealthedeal.calculate = function(self, context)
            if context.after and G.GAME.chips + hand_chips * mult > G.GAME.blind.chips and context.cardarea == G.jokers then
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
                    if seal_type > 0.75 then seal = 'Red'
                    elseif seal_type > 0.5 then seal = 'Blue'
                    elseif seal_type > 0.25 then seal = 'Gold'
                    else seal = 'Purple' end

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
        end
    end
    
    if joker_config.mf_particleaccelerator then
    
        SMODS.Jokers.j_mf_particleaccelerator.calculate = function(self, context)
            if context.after and context.full_hand ~= nil and context.cardarea == G.jokers then
                if #context.full_hand == 1 then
                    self.ability.x_mult = self.ability.x_mult + 0.5
                    return {
                        message = localize{type='variable',key='a_xmult',vars={self.ability.x_mult}},
                    }
                else
                    self.ability.x_mult = 1
                    return {
                        message = localize{type='variable',key='a_xmult',vars={1}},
                    }
                end
            end
            if SMODS.end_calculate_context(context) then
                if #context.full_hand ~= 1 then
                    return {
                        message = localize{type='variable',key='a_xmult',vars={self.ability.x_mult}},
                        Xmult_mod = self.ability.x_mult,
                    }
                end
            end
        end

        SMODS.Jokers.j_mf_particleaccelerator.loc_def = function(self)
            return {self.ability.x_mult}
        end
    end
    
    if joker_config.mf_clownfish then

        SMODS.Jokers.j_mf_clownfish.calculate = function(self, context)
            if context.individual and context.cardarea == G.play and context.other_card.ability.name ~= "Default Base" then
                return {
                    chips = 10,
                    mult = 4,
                    card = self
                }
            end
        end
    end
    
    if joker_config.mf_balatromods then
    
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
    end
    
    if joker_config.mf_treasuremap then
    
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

        SMODS.Jokers.j_mf_treasuremap.loc_def = function(self)
            return {self.ability.extra}
        end
    end
    
    if joker_config.mf_expansionpack then
    
        SMODS.Jokers.j_mf_expansionpack.calculate = function(self, context)
            if context.setting_blind and not self.getting_sliced and not (context.blueprint_card or self).getting_sliced and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                local jokers_to_create = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
                -- ah shit.
                function temp_ban_joker(key)
                    if not G.GAME.banned_keys[key] then 
                        G.GAME.banned_keys[key] = 214389
                    elseif G.GAME.banned_keys[key] % 214389 == 0 then
                        G.GAME.banned_keys[key] = G.GAME.banned_keys[key] + 214389
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
                            elseif G.GAME.banned_keys[key] % 214389 == 0 then 
                                G.GAME.banned_keys[key] = G.GAME.banned_keys[key] - 214389
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

    end
    
    if joker_config.mf_fived then
    
        SMODS.Jokers.j_mf_fived.calculate = function(self, context)
            if context.after and G.GAME.chips + hand_chips * mult > G.GAME.blind.chips * 10 and context.cardarea == G.jokers then
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
    end
    
    if joker_config.mf_teacup then
    
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

        SMODS.Jokers.j_mf_teacup.loc_def = function(self)
            return {self.ability.extra}
        end
    end
    
    if joker_config.mf_whiteboard then
    
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
    end
    
    if joker_config.mf_mspaint then
    
        SMODS.Jokers.j_mf_mspaint.calculate = function(self, context)
            if context.first_hand_drawn and not context.blueprint and self.ability.h_size == 0 then
                self.ability.h_size = self.ability.h_size + 4
                G.hand:change_size(4)
            end
            if context.after and not context.blueprint and self.ability.h_size ~= 0 and context.cardarea == G.jokers then
                G.hand:change_size(-self.ability.h_size)
                self.ability.h_size = 0
            end
        end
    end
    
    if joker_config.mf_hugejoker then
    
        SMODS.Jokers.j_mf_hugejoker.calculate = function(self, context)
            if SMODS.end_calculate_context(context) then
                return {
                    message = localize{type='variable',key='a_xmult',vars={3}},
                    Xmult_mod = 3,
                }
            end
        end
    end
    
    if joker_config.mf_miner then
    
        SMODS.Jokers.j_mf_miner.calculate = function(self, context)
            if context.setting_blind and context.blind.boss and not self.getting_sliced then
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
    end
    
    if joker_config.mf_recycling then
    
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
    end
    
    if joker_config.mf_hollow then

        SMODS.Jokers.j_mf_hollow.calculate = function(self, context)
            if SMODS.end_calculate_context(context) and G.hand.config.card_limit < 9 then
                return {
                    message = localize{type='variable',key='a_mult',vars={10 * (9 - G.hand.config.card_limit)}},
                    mult_mod = 10 * (9 - G.hand.config.card_limit)
                }
            end
        end
    end
    
    if joker_config.mf_tonersoup then

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

        SMODS.Jokers.j_mf_tonersoup.loc_def = function(self)
            return {self.ability.extra}
        end
    end
    
    if joker_config.mf_leagueoflegends then
    
        SMODS.Jokers.j_mf_leagueoflegends.calculate = function(self, context)
            if context.setting_blind and context.blind.boss and not self.getting_sliced then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = (function()
                                local card = create_card(nil,G.consumeables, nil, nil, nil, nil, 'c_death', 'sup')
                                card:add_to_deck()
                                G.consumeables:emplace(card)
                                G.GAME.consumeable_buffer = 0
                            return true
                        end)}))
                    card_eval_status_text(self, 'extra', nil, nil, nil, {message = "DEATH", colour = G.C.PURPLE})
                end
            end
        end
    end
    
    if joker_config.mf_blackmarket then

        SMODS.Jokers.j_mf_blackmarket.calculate = function(self, context)
            if context.setting_blind and not context.blueprint and context.blind.boss and not self.getting_sliced then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit and G.GAME.dollars >= 10 then
                    ease_dollars(-10)
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = (function()
                                local card = create_card(nil,G.consumeables, nil, nil, nil, nil, 'c_ankh', 'sup')
                                card:add_to_deck()
                                G.consumeables:emplace(card)
                                G.GAME.consumeable_buffer = 0
                            return true
                        end)}))
                        card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('+1 Ankh'), colour = G.C.SECONDARY_SET.Spectral})
                end
            end
        end
    end
    
    if joker_config.mf_blasphemy then
    
        SMODS.Jokers.j_mf_blasphemy.calculate = function(self, context)
            if context.cardarea == G.jokers and context.before and not context.blueprint then
                ease_hands_played(-G.GAME.current_round.hands_left, true)
            end
            if SMODS.end_calculate_context(context) then
                return {
                    message = localize{type='variable',key='a_xmult',vars={4}},
                    Xmult_mod = 4,
                }
            end
        end
    end

    if joker_config.mf_thesolo then
    
        SMODS.Jokers.j_mf_thesolo.calculate = function(self, context)
            if context.before and context.full_hand ~= nil and context.cardarea == G.jokers and not context.blueprint then
                if #context.full_hand == 1 then
                    self.ability.x_mult = self.ability.x_mult + 0.1
                    return {
                        message = localize{type='variable',key='a_xmult',vars={self.ability.x_mult}},
                    }
                end
            end
            if SMODS.end_calculate_context(context) then
                return {
                    message = localize{type='variable',key='a_xmult',vars={self.ability.x_mult}},
                    Xmult_mod = self.ability.x_mult,
                }
            end
        end

        SMODS.Jokers.j_mf_thesolo.loc_def = function(self)
            return {self.ability.x_mult}
        end
    end
    
    if joker_config.mf_thejester then
    
        SMODS.Jokers.j_mf_thejester.calculate = function(self, context)
            if SMODS.end_calculate_context(context) then
                local multmod = 1
                for j = 1, #context.scoring_hand do
                    local my_id = context.scoring_hand[j]:get_id()
                    local count = 0
                    for i = 1, #context.scoring_hand do
                        if context.scoring_hand[i]:get_id() == my_id then
                            count = count + 1 
                        end
                        if count == 2 and i == j then
                            multmod = multmod * 2.5
                            break
                        end
                    end
                end
                if multmod ~= 1 then
                    return {
                        message = localize{type='variable',key='a_xmult',vars={multmod}},
                        Xmult_mod = multmod,
                    }
                end
            end
        end
    end
    
    if joker_config.mf_globe then
    
        SMODS.Jokers.j_mf_globe.calculate = function(self, context)
            if context.reroll_shop and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                            local card = create_card('Planet',G.consumeables, nil, nil, nil, nil, nil, '8ba')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                        return true
                    end)}))
                return {
                    message = localize('k_plus_planet'),
                    colour = G.C.SECONDARY_SET.Planet,
                    card = self
                }
            end
        end
    end
    
    if joker_config.mf_couponcatalogue then
    
        SMODS.Jokers.j_mf_couponcatalogue.calculate = function(self, context)
            if SMODS.end_calculate_context(context) then
                local redeemed = 0
                for k,v in pairs(G.GAME.used_vouchers) do
                    if v == true then
                        redeemed = redeemed + 1
                    end
                end
                return {
                    message = localize{type='variable',key='a_mult',vars={10 * redeemed}},
                    mult_mod = 10 * redeemed
                }
            end
        end

        SMODS.Jokers.j_mf_couponcatalogue.loc_def = function(self)
            local redeemed = 0
            for k,v in pairs(G.GAME.used_vouchers) do
                if v == true then
                    redeemed = redeemed + 1
                end
            end
            return {redeemed * 10}
        end
    end
    
    if joker_config.mf_ace then
    
        SMODS.Jokers.j_mf_ace.calculate = function(self, context)
            if context.after and G.GAME.current_round.hands_left == 1 and context.cardarea == G.jokers then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        local _suit, _rank = nil, nil
                        _rank = 'A'
                        _suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('aceupthesleeve_create'))
                        local cen_pool = {}
                        for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                            if v.key ~= 'm_stone' then 
                                cen_pool[#cen_pool+1] = v
                            end
                        end
                        local card = create_playing_card({front = G.P_CARDS[_suit..'_'.._rank], center = pseudorandom_element(cen_pool, pseudoseed('spe_card'))}, G.hand, nil, false, {G.C.SECONDARY_SET.Spectral})
                        playing_card_joker_effects({card})
                        return true end }))
            end
        end
    end
    
    if joker_config.mf_fleshprison then
    
        SMODS.Jokers.j_mf_fleshprison.calculate = function(self, context)
            if context.setting_blind and not context.blueprint and context.blind.boss and not self.getting_sliced then
                self.gone = false
                G.GAME.blind.chips = G.GAME.blind.chips * 5
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.HUD_blind:recalculate(true)
                G.E_MANAGER:add_event(Event({func = function()
                    G.E_MANAGER:add_event(Event({func = function()
                        play_sound('timpani')
                        delay(0.4)
                        return true end }))
                    card_eval_status_text(self, 'extra', nil, nil, nil, {message = 'Good luck!'})
                return true end }))
            end
            if context.end_of_round and not context.individual and not context.repetition and not context.blueprint and G.GAME.blind.boss and not self.gone then
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                            local card = create_card(nil,G.consumeables, nil, nil, nil, nil, 'c_soul', 'sup')
                            card:set_edition({negative = true}, true)
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                        return true
                    end)}))
                if not self.ability.eternal then
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
                end
                self.gone = true
            end
        end
    end
    
    if joker_config.mf_goldencarrot then
    
        SMODS.Jokers.j_mf_goldencarrot.calculate = function(self, context)
            if context.after and not context.blueprint and context.cardarea == G.jokers and not self.gone then
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
                        message = localize('k_eaten_ex'),
                        colour = G.C.MONEY
                    }
                else
                    self.ability.extra = self.ability.extra - 1
                    return {
                        message = "$"..self.ability.extra,
                        colour = G.C.MONEY
                    }
                end
            end
        end

        SMODS.Jokers.j_mf_goldencarrot.loc_def = function(self)
            return {self.ability.extra, 1}
        end
    end
    
    if joker_config.mf_bowlingball then
    
        SMODS.Jokers.j_mf_bowlingball.calculate = function(self, context)
            if context.individual and context.cardarea == G.play then
                if context.other_card:get_id() == 3 then
                    return {
                        chips = 60,
                        mult = 10,
                        card = self
                    }
                end
            end
        end
    end
    
    if joker_config.mf_simplified then
    
        SMODS.Jokers.j_mf_simplified.calculate = function(self, context)
            if context.other_joker and context.other_joker.config.center.rarity == 1 and self ~= context.other_joker and context.other_joker.ability.set == "Joker" then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        context.other_joker:juice_up(0.5, 0.5)
                        return true
                    end
                })) 
                return {
                    message = localize{type='variable',key='a_mult',vars={4}},
                    mult_mod = 4
                }
            end
        end
    end
    
    if joker_config.mf_jankman then

        SMODS.Jokers.j_mf_jankman.calculate = function(self, context)
            local vanilla_jokers = {"j_joker", "j_greedy_joker", "j_lusty_joker", "j_wrathful_joker", "j_gluttenous_joker", "j_jolly", "j_zany", "j_mad", "j_crazy", "j_droll", "j_sly", "j_wily", "j_clever", "j_devious", "j_crafty", "j_half", "j_stencil", "j_four_fingers", "j_mime", "j_credit_card", "j_ceremonial", "j_banner", "j_mystic_summit", "j_marble", "j_loyalty_card", "j_8_ball", "j_misprint", "j_dusk", "j_raised_fist", "j_chaos", "j_fibonacci", "j_steel_joker", "j_scary_face", "j_abstract", "j_delayed_grat", "j_hack", "j_pareidolia", "j_gros_michel", "j_even_steven", "j_odd_todd", "j_scholar", "j_business", "j_supernova", "j_ride_the_bus", "j_space", "j_egg", "j_burglar", "j_blackboard", "j_runner", "j_ice_cream", "j_dna", "j_splash", "j_blue_joker", "j_sixth_sense", "j_constellation", "j_hiker", "j_faceless", "j_green_joker", "j_superposition", "j_todo_list", "j_cavendish", "j_card_sharp", "j_red_card", "j_madness", "j_square", "j_seance", "j_riff_raff", "j_vampire", "j_shortcut", "j_hologram", "j_vagabond", "j_baron", "j_cloud_9", "j_rocket", "j_obelisk", "j_midas_mask", "j_luchador", "j_photograph", "j_gift", "j_turtle_bean", "j_erosion", "j_reserved_parking", "j_mail", "j_to_the_moon", "j_hallucination", "j_fortune_teller", "j_juggler", "j_drunkard", "j_stone", "j_golden", "j_lucky_cat", "j_baseball", "j_bull", "j_diet_cola", "j_trading", "j_flash", "j_popcorn", "j_trousers", "j_ancient", "j_ramen", "j_walkie_talkie", "j_selzer", "j_castle", "j_smiley", "j_campfire", "j_ticket", "j_mr_bones", "j_acrobat", "j_sock_and_buskin", "j_swashbuckler", "j_troubadour", "j_certificate", "j_smeared", "j_throwback", "j_hanging_chad", "j_rough_gem", "j_bloodstone", "j_arrowhead", "j_onyx_agate", "j_glass", "j_ring_master", "j_flower_pot", "j_blueprint", "j_wee", "j_merry_andy", "j_oops", "j_idol", "j_seeing_double", "j_matador", "j_hit_the_road", "j_duo", "j_trio", "j_family", "j_order", "j_tribe", "j_stuntman", "j_invisible", "j_brainstorm", "j_satellite", "j_shoot_the_moon", "j_drivers_license", "j_cartomancer", "j_astronomer", "j_burnt", "j_bootstraps", "j_caino", "j_triboulet", "j_yorick", "j_chicot", "j_perkeo"}
            if context.other_joker and self ~= context.other_joker and context.other_joker.ability.set == "Joker" then
                local real = true
                for i, k in pairs(vanilla_jokers) do
                    if k == context.other_joker.config.center.key then
                        real = false
                        break
                    end
                end
                if real then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            context.other_joker:juice_up(0.5, 0.5)
                            return true
                        end
                    })) 
                    return {
                        message = localize{type='variable',key='a_xmult',vars={1.25}},
                        Xmult_mod = 1.25
                    }
                end
            end
        end
    end
    
    if joker_config.mf_pixeljoker then
    
        SMODS.Jokers.j_mf_pixeljoker.calculate = function(self, context)
            if context.individual and context.cardarea == G.play then
                if context.other_card:get_id() == 14 or context.other_card:get_id() == 4 or context.other_card:get_id() == 9 then
                    return {
                        x_mult = 1.5,
                        colour = G.C.RED,
                        card = self
                    }
                end
            end
        end
    end
    
    if joker_config.mf_burnerphone then
    
        SMODS.Jokers.j_mf_burnerphone.loc_def = function(self)
            if not G.deck or not G.deck.cards or #G.deck.cards == 0 then
                return { "no ", "cards ", "left,", "the deck ", "is ", "empty", colours = {G.C.UI.TEXT_INACTIVE,G.C.UI.TEXT_INACTIVE,G.C.UI.TEXT_INACTIVE,
                G.C.UI.TEXT_INACTIVE,G.C.UI.TEXT_INACTIVE,G.C.UI.TEXT_INACTIVE} }
            end
            local has_this = false
            for i = 1,#G.jokers.cards do
                local j = G.jokers.cards[i]
                if j and j.ability.name == "Burner Phone" then
                    has_this = true
                    break
                end
            end
            if not has_this then
                return { "is ", "not ", "owned,", "you ", "get ", "nothing", colours = {G.C.UI.TEXT_INACTIVE,G.C.UI.TEXT_INACTIVE,G.C.UI.TEXT_INACTIVE,
                G.C.UI.TEXT_INACTIVE,G.C.UI.TEXT_INACTIVE,G.C.UI.TEXT_INACTIVE} }
            end
            local cardlist = G.deck.cards
            if #cardlist == 1 then
                local card = cardlist[#cardlist]
                if card.ability.effect == "Stone Card" then
                    return { "a ", "Stone ", "Card", "that ", "is ", "all", colours = {G.C.UI.TEXT_INACTIVE,G.C.UI.TEXT_INACTIVE,G.C.UI.TEXT_INACTIVE, 
                    G.C.UI.TEXT_INACTIVE,G.C.UI.TEXT_INACTIVE,G.C.UI.TEXT_INACTIVE} }
                end
                return { localize(card.base.value,"ranks").." ", "of ", localize(card.base.suit,"suits_plural"), "that ", "is ", "all", colours = {G.C.FILTER,G.C.UI.TEXT_DARK,G.C.SUITS[card.base.suit], 
                G.C.UI.TEXT_INACTIVE,G.C.UI.TEXT_INACTIVE,G.C.UI.TEXT_INACTIVE} }
            end

            -- here we go
            local texts = {}
            local colours = {}
            for i = 0, 1 do
                local card = cardlist[#cardlist - i]
                if card.ability.effect == "Stone Card" then
                    table.insert(texts, "a ")
                    table.insert(texts, "Stone ")
                    table.insert(texts, "Card")
                    table.insert(colours, G.C.UI.TEXT_INACTIVE)
                    table.insert(colours, G.C.UI.TEXT_INACTIVE)
                    table.insert(colours, G.C.UI.TEXT_INACTIVE)
                else
                    table.insert(texts, localize(card.base.value,"ranks").." ")
                    table.insert(texts, "of ")
                    table.insert(texts, localize(card.base.suit,"suits_plural"))
                    table.insert(colours, G.C.FILTER)
                    table.insert(colours, G.C.UI.TEXT_DARK)
                    table.insert(colours, G.C.SUITS[card.base.suit])
                end
            end
            texts.colours = colours
            return texts
        end
    end
    
    if joker_config.mf_virtual then
    
        SMODS.Jokers.j_mf_virtual.calculate = function(self, context)
            if context.setting_blind and not self.getting_sliced and not (context.blueprint_card or self).getting_sliced and not context.blueprint then
                if #G.jokers.cards > 1 then 
                    G.jokers:unhighlight_all()
                    for k, v in ipairs(G.jokers.cards) do
                        v:flip()
                    end
                    G.E_MANAGER:add_event(Event({ trigger = 'after', delay = 0.2, func = function() 
                        G.E_MANAGER:add_event(Event({ func = function() G.jokers:shuffle('aajk'); play_sound('cardSlide1', 0.85);return true end })) 
                        delay(0.15)
                        G.E_MANAGER:add_event(Event({ func = function() G.jokers:shuffle('aajk'); play_sound('cardSlide1', 1.15);return true end })) 
                        delay(0.15)
                        G.E_MANAGER:add_event(Event({ func = function() G.jokers:shuffle('aajk'); play_sound('cardSlide1', 1);return true end })) 
                        delay(0.5)
                    return true end })) 
                end
            end
            if SMODS.end_calculate_context(context) then
                return {
                    message = localize{type='variable',key='a_xmult',vars={3}},
                    Xmult_mod = 3,
                }
            end
        end
    end
    
    if joker_config.mf_dramaticentrance then
    
        SMODS.Jokers.j_mf_dramaticentrance.calculate = function(self, context)
            if SMODS.end_calculate_context(context) and G.GAME.current_round.hands_played == 0 then
                return {
                    message = localize{type='variable',key='a_chips',vars={150}},
                    chip_mod = 150, 
                }
            end
        end
    end
    
    if joker_config.mf_bladedance then
    
        SMODS.Jokers.j_mf_bladedance.calculate = function(self, context)
            if context.setting_blind and not self.getting_sliced and not (context.blueprint_card or self).getting_sliced then
                if not G.bladedance_temp_ids then
                    G.bladedance_temp_ids = {}
                end
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.7,
                    func = function() 
                        local cards = {}
                        for i=1, 2 do
                            cards[i] = true
                            local _suit, _rank = nil, nil
                            _rank = pseudorandom_element({'A', '2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K'}, pseudoseed('bladedance_create'))
                            _suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('bladedance_create'))
                            local card = create_playing_card({front = G.P_CARDS[_suit..'_'.._rank], center = G.P_CENTERS.m_steel
                            }, G.hand, nil, i ~= 1, {G.C.SECONDARY_SET.Spectral})
                            table.insert(G.bladedance_temp_ids, card.unique_val)
                        end
                        playing_card_joker_effects(cards)
                        return true end }))
            end
        end
    end
    
    if joker_config.mf_hyperbeam then
    
        SMODS.Jokers.j_mf_hyperbeam.calculate = function(self, context)
            if context.setting_blind and not (context.blueprint_card or self).getting_sliced then
                G.E_MANAGER:add_event(Event({func = function()
                    ease_discard(-G.GAME.current_round.discards_left, nil, true)
                return true end }))
            end
            if SMODS.end_calculate_context(context) then
                return {
                    message = localize{type='variable',key='a_xmult',vars={3}},
                    Xmult_mod = 3,
                }
            end
        end
    end
    
    if joker_config.mf_dropkick then
    
        SMODS.Jokers.j_mf_dropkick.calculate = function(self, context)
            if context.after and context.cardarea == G.jokers and next(context.poker_hands['Straight']) and not context.blueprint then
                ease_hands_played(1)
                card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = "+1 Hand"})
            end
        end
    end
    
    if joker_config.mf_bigshot then
    
        SMODS.Jokers.j_mf_bigshot.calculate = function(self, context)
            if context.individual and context.cardarea == G.play then
                if context.other_card:get_id() == 14 or context.other_card:get_id() == 9 or context.other_card:get_id() == 7 then
                    G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + 1
                    G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
                    return {
                        dollars = 1,
                        card = self
                    }
                end
            elseif context.repetition and context.cardarea == G.play then
                if context.other_card:get_id() == 9 then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = 1,
                        card = self
                    }
                end
            end
        end
    end
    
    if joker_config.mf_paintcan then
    
        SMODS.Jokers.j_mf_paintcan.loc_def = function(self)
            return {G.GAME.probabilities.normal * 2}
        end
    end
    
    if joker_config.mf_clipart then
    
        SMODS.Jokers.j_mf_clipart.calculate = function(self, context)
            if context.setting_blind and not self.getting_sliced and not (context.blueprint_card or self).getting_sliced and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        G.E_MANAGER:add_event(Event({
                            func = function() 
                                local card = create_card('Colour',G.consumeables, nil, nil, nil, nil, nil, 'cli')
                                card:add_to_deck()
                                G.consumeables:emplace(card)
                                modded_play_sound("yay", false, 0.5, 0.7)
                                G.GAME.consumeable_buffer = 0
                                return true
                            end}))   
                            card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_colour'), colour = G.C.PURPLE})                       
                        return true
                    end)}))
            end
        end
    end
    
    if joker_config.mf_loadeddisk then
    
        SMODS.Jokers.j_mf_loadeddisk.calculate = function(self, context)
            if context.selling_self then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                                func = function() 
                                        local card = create_card('Colour',G.consumeables, nil, nil, nil, nil, 'c_mf_pink', nil)
                                        card:add_to_deck()
                                        G.consumeables:emplace(card)
                                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
                                        return true
                                end}))                   
                            return true
                        end)}))
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_colour'), colour = G.C.PURPLE})       
                end
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                                func = function() 
                                        local card = create_card('Colour',G.consumeables, nil, nil, nil, nil, 'c_mf_yellow', nil)
                                        card:add_to_deck()
                                        G.consumeables:emplace(card)
                                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
                                        return true
                                end}))                   
                            return true
                        end)}))
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_colour'), colour = G.C.PURPLE})       
                end
            end
        end
    end
    
    if joker_config.mf_mrloans then
    
        SMODS.Jokers.j_mf_mrloans.calculate = function(self, context)
            if context.end_of_round and not context.blueprint and context.game_over then
                ease_dollars(G.GAME.chips-G.GAME.blind.chips)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand_text_area.blind_chips:juice_up()
                        G.hand_text_area.game_chips:juice_up()
                        play_sound('tarot1')
                        -- self:start_dissolve()
                        return true
                    end
                })) 
                return {
                    message = "Saved...",
                    saved = true,
                    colour = G.C.RED
                }
            end
        end
    end
    
    if joker_config.mf_rainbow then
    
        SMODS.Jokers.j_mf_rainbow.calculate = function(self, context)
            if context.other_joker and context.other_joker.ability.set == "Colour" then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        context.other_joker:juice_up(0.5, 0.5)
                        return true
                    end
                })) 
                return {
                    message = localize{type='variable',key='a_xmult',vars={2}},
                    Xmult_mod = 2
                }
            end
        end
    end
    
    if joker_config.mf_mouthmoods then
    
        SMODS.Jokers.j_mf_mouthmoods.calculate = function(self, context)
            if not context.repetition and not context.other_joker and context.cardarea == G.jokers and context.before and next(context.poker_hands['Flush']) then
                local _, cards = next(context.poker_hands['Flush'])
                local card = cards[1]

                -- six suits and bunco compat??
                -- sixty suits is not real.
                if card:is_suit("Hearts") or card:is_suit("Diamonds") or card:is_suit("Stars") or card:is_suit("Fleurons") then
                    self.ability.extra.mult = self.ability.extra.mult + 4
                    return {
                        message = localize('k_upgrade_ex'),
                        card = self,
                        colour = G.C.RED
                    }
                else
                    self.ability.extra.chips = self.ability.extra.chips + 15
                    return {
                        message = localize('k_upgrade_ex'),
                        card = self,
                        colour = G.C.CHIPS
                    }
                end
            end
            if SMODS.end_calculate_context(context) then
                if self.ability.extra.mult > 0 and self.ability.extra.chips > 0 then
                    hand_chips = mod_chips(hand_chips + self.ability.extra.chips)
                    update_hand_text({delay = 0}, {chips = hand_chips})
                    card_eval_status_text(self, 'extra', nil, nil, nil, {
                        message = localize{type='variable',key='a_chips',vars={self.ability.extra.chips}},
                        colour = G.C.CHIPS
                    }) 
                    return {
                        message = localize{type='variable',key='a_mult',vars={self.ability.extra.mult}},
                        mult_mod = self.ability.extra.mult,
                    }
                elseif self.ability.extra.mult > 0 then
                    return {
                        message = localize{type='variable',key='a_mult',vars={self.ability.extra.mult}},
                        mult_mod = self.ability.extra.mult,
                    }
                elseif self.ability.extra.chips > 0 then
                    return {
                        message = localize{type='variable',key='a_chips',vars={self.ability.extra.chips}},
                        chip_mod = self.ability.extra.chips,
                    }
                end
            end
        end

        SMODS.Jokers.j_mf_mouthmoods.loc_def = function(self)
            return {self.ability.extra.mult, self.ability.extra.chips}
        end
    end
    
    if joker_config.mf_css then
    
        SMODS.Jokers.j_mf_css.calculate = function(self, context)
            if SMODS.end_calculate_context(context)  and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                if next(context.poker_hands["Flush"]) then
                    local card_type = 'Colour'
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = (function()
                                local card = create_card(card_type,G.consumeables, nil, nil, nil, nil, nil, 'css')
                                card:add_to_deck()
                                G.consumeables:emplace(card)
                                G.GAME.consumeable_buffer = 0
                            return true
                        end)}))
                    return {
                        message = localize('k_plus_colour'),
                        colour = G.C.SECONDARY_SET.Tarot,
                        card = self
                    }
                end
            end
        end
    end
    
    if joker_config.mf_cba then
    
        SMODS.Jokers.j_mf_cba.calculate = function(self, context)
            if not context.repetition and not context.other_joker and context.cardarea == G.jokers and context.after and G.GAME.current_round.hands_played == 0 then
                if #context.full_hand == 1 then
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.0, func = function()
                        local over = false
                        local edition = poll_edition('aura', nil, true, true)
                        local aura_card = context.full_hand[1]
                        aura_card:set_edition(edition, true)
                        self:juice_up(0.3, 0.5)
                    return true end }))
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    return true end }))
                end
            end
        end
    end
    
    if SMODS.Jokers.j_mf_hugestuntman then
    
        SMODS.Jokers.j_mf_hugestuntman.calculate = function(self, context)
            if SMODS.end_calculate_context(context) then
                hand_chips = mod_chips(hand_chips + 300)
                update_hand_text({delay = 0}, {chips = hand_chips})
                card_eval_status_text(self, 'extra', nil, nil, nil, {
                    message = localize{type='variable',key='a_chips',vars={300}},
                    colour = G.C.CHIPS
                }) 
                return {
                    message = localize{type='variable',key='a_xmult',vars={3}},
                    Xmult_mod = 3,
                }
            end
        end
    end

    -- challenge for testing.
    local challenges = G.CHALLENGES

	G.localization.misc.challenge_names["c_mod_morefluff_testing"] = "testing challenge"
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
    --         -- {id = 'j_stencil'},
    --         -- {id = 'j_stencil'},
    --         -- {id = 'j_stencil'},
    --         -- {id = 'j_stencil'},
    --         {id = 'j_joker'},
    --         {id = 'j_joker'},
    --         {id = 'j_joker'},
    --         {id = 'j_oops'},
    --         {id = 'j_oops'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --         {id = 'j_mf_paintcan'},
    --     },
    --     consumeables = {
    --         {id = 'c_mf_white'},
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
    --             {id = 'p_standard_normal_1', ids = {
    --                 'p_standard_normal_1','p_standard_normal_2','p_standard_normal_3','p_standard_normal_4','p_standard_jumbo_1','p_standard_jumbo_2','p_standard_mega_1','p_standard_mega_2',
    --             }},
    --             {id = 'p_buffoon_normal_1', ids = {
    --                 'p_buffoon_normal_1','p_buffoon_normal_2','p_buffoon_jumbo_1','p_buffoon_mega_1'
    --             }},
    --             {id = 'p_spectral_normal_1', ids = {
    --                 'p_spectral_normal_1','p_spectral_normal_2','p_spectral_jumbo_1','p_spectral_mega_1'
    --             }},
    --             {id = 'p_arcana_normal_1', ids = {
    --                 'p_arcana_normal_1','p_arcana_normal_2','p_arcana_normal_3','p_arcana_normal_4','p_arcana_jumbo_1','p_arcana_jumbo_2','p_arcana_mega_1','p_arcana_mega_2',
    --             }},
    --             {id = 'p_celestial_normal_1', ids = {
    --                 'p_celestial_normal_1','p_celestial_normal_2','p_celestial_normal_3','p_celestial_normal_4','p_celestial_jumbo_1','p_celestial_jumbo_2','p_celestial_mega_1','p_celestial_mega_2',
    --             }},
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

local card_calculate_dollar_bonus_ref = Card.calculate_dollar_bonus

function Card.calculate_dollar_bonus(self)
    if self.debuff then return end
    if self.ability.set == "Joker" then
        if self.ability.name == 'Style Meter' then
            if G.GAME.skips > 0 then
                return G.GAME.skips * 3
            end
        end
        if self.ability.name == 'Golden Carrot' then
            if self.ability.extra >= 0 then
                return self.ability.extra + 2
            end
        end
    end
    return card_calculate_dollar_bonus_ref(self)
end

local Back_apply_to_run_ref = Back.apply_to_run
function Back.apply_to_run(arg)
    Back_apply_to_run_ref(arg)

    -- Gros Michel Deck
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
    -- Philosophical Deck
    if arg.effect.config.philosophical then
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = 1,5 do
                    local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_mf_pipe', nil)
                    card:add_to_deck()
                    G.jokers:emplace(card)
                end
                return true
            end
        }))
    end
    -- Blasphemous Deck
    if arg.effect.config.blasphemy then
        G.E_MANAGER:add_event(Event({
            func = function()
                local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_mf_blasphemy', nil)
                card:add_to_deck()
                card:set_edition({negative = true})
                card:set_eternal(true)
                G.jokers:emplace(card)
                return true
            end
        }))
    end
end

local Card_set_ability_ref = Card.set_ability
function Card.set_ability(self, center, initial, delay_sprites)
    Card_set_ability_ref(self,center,initial,delay_sprites)

    if center.name == "Huge Joker" or self.ability.name == "Huge Stuntman" then 
        -- H = H*2
        -- W = W*2
        self.T.h = self.T.h * 1.5
        self.T.w = self.T.w * 1.5
    end

    if center.name == "Pixel Joker" then 
        -- H = H*2
        -- W = W*2
        self.T.h = self.T.h * (16 / 95)
        self.T.w = self.T.w * (16 / 71)
    end

    if center.name == "Mashup Album" or center.name == "Triangle Joker" then 
        -- H = H*2
        -- W = W*2
        self.T.h = self.T.h * (71 / 95)
        self.children.center.scale.y = self.children.center.scale.y*(71/95)
        self.children.center:set_sprite_pos(nil)
    end

    if center.name == "CSS" then 
        -- H = H*2
        -- W = W*2
        self.T.h = self.T.h
        self.T.w = self.T.w * 2
        self.children.center.scale.x = self.children.center.scale.x*2
        self.children.center:set_sprite_pos(nil)
    end

    if self.ability.set == "Colour" then 
        -- H = H*2
        -- W = W*2
        self.T.h = self.T.h * (87 / 95)
        self.children.center.scale.y = self.children.center.scale.y * (87 / 95)
        self.children.center:set_sprite_pos(nil)

        self.ability.partial_rounds_held = 0
        self.ability.upgrade_rounds = center.config.upgrade_rounds or nil
    end
end 

local Card_add_to_deck_ref = Card.add_to_deck 
function Card.add_to_deck(self, from_debuff)
    if not self.added_to_deck then
        if self.ability.name == 'Huge Joker' or self.ability.name == "Huge Stuntman" then
            G.hand:change_size(-2)
        end
        if self.ability.name == 'Hollow Joker' then
            G.hand:change_size(-1)
        end
        if self.ability.name == "Philosophical Joker" then
            if G.jokers then 
                G.jokers.config.card_limit = G.jokers.config.card_limit + 1
            end
        end
    end
    Card_add_to_deck_ref(self, from_debuff)
end

local Card_remove_from_deck_ref = Card.remove_from_deck 
function Card.remove_from_deck(self, from_debuff)
    if self.added_to_deck then
        if self.ability.name == 'Huge Joker' or self.ability.name == "Huge Stuntman" then
            G.hand:change_size(2)
        end
        if self.ability.name == 'Hollow Joker' then
            G.hand:change_size(1)
        end
        if self.ability.name == "Philosophical Joker" then
            if G.jokers then 
                G.jokers.config.card_limit = G.jokers.config.card_limit - 1
            end
        end
    end
    Card_remove_from_deck_ref(self, from_debuff)
end
local update_blind_selectref = Game.update_blind_select
function Game:update_blind_select(dt)
    update_blind_selectref(self, dt)
    G.do_colour_end_of_round_stuff = true
end

function colour_end_of_round_effects()
    for i=1, #G.consumeables.cards do
        local _card = G.consumeables.cards[i]
        trigger_colour_end_of_round(_card)
    end
end

function n_random_colour_rounds(n)
    for i=1, n do
        local temp_pool = {}
        for k, v in pairs(G.consumeables.cards) do
            if v.ability.set == 'Colour' then
                table.insert(temp_pool, v)
            end
        end
        if #temp_pool == 0 then
            break
        end
        local _card = pseudorandom_element(temp_pool, pseudoseed("pink"))
        trigger_colour_end_of_round(_card)
    end
end

function trigger_colour_end_of_round(_card)
    if _card.ability.set == "Colour" then
        local retriggerers = {}
        for k, v in pairs(G.jokers.cards) do
            if v.ability.name == "Paint Can" and pseudorandom('paintcan_trigger') < G.GAME.probabilities.normal*2/5 then
                table.insert(retriggerers, v)
            end
        end

        local base_count = 1
        if G.GAME.used_vouchers.v_mf_paintroller and pseudorandom('paintroller') > 0.5 then
            base_count = base_count + 1
        end

        for j=1, #retriggerers + base_count do
            -- all of them that go up over time
            if _card.ability.upgrade_rounds then
                _card.ability.partial_rounds_held = _card.ability.partial_rounds_held + 1
                if _card.ability.partial_rounds_held >= _card.ability.upgrade_rounds then
                    _card.ability.extra = _card.ability.extra + 1
                    _card.ability.partial_rounds_held = _card.ability.partial_rounds_held - _card.ability.upgrade_rounds
                    
                    if _card.ability.name == "Yellow" then
                        G.E_MANAGER:add_event(Event({
                            func = function() 
                                _card.ability.extra_value = _card.ability.extra_value + 8
                                _card:set_cost()
                                card_eval_status_text(_card, 'extra', nil, nil, nil, {
                                    message = localize('k_val_up'),
                                        colour = G.C.MONEY,
                                    card = _card
                                }) 
                                return true
                            end}))
                    else
                        G.E_MANAGER:add_event(Event({
                            func = function() 
                                card_eval_status_text(_card, 'extra', nil, nil, nil, {
                                    message = 'Upgrade!',
                                        colour = G.C.SECONDARY_SET.ColourCard,
                                    card = _card
                                }) 
                                return true
                            end}))
                    end
                else
                    local str = _card.ability.partial_rounds_held..'/'.._card.ability.upgrade_rounds
                    G.E_MANAGER:add_event(Event({
                        func = function()
                        card_eval_status_text(_card, 'extra', nil, nil, nil, {
                            message = str,
                                colour = G.C.SECONDARY_SET.ColourCard,
                            card = _card
                        }) 
                        return true
                    end }))
                end
            end

            if retriggerers[j] then
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        card_eval_status_text(retriggerers[j], 'extra', nil, nil, nil, {
                            message = localize('k_again_ex'),
                            colour = G.C.ORANGE,
                            card = retriggerers[j]
                        }) 
                        return true
                    end}))
            end
        end
    end
end

local update_round_evalref = Game.update_round_eval
function Game:update_round_eval(dt)
    update_round_evalref(self, dt)

    -- thanks feder
    if G.bladedance_temp_ids then
        for _, remove_id in ipairs(G.bladedance_temp_ids) do
            for k, card in ipairs(G.playing_cards) do
                if card.unique_val == remove_id then
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                        func = function()
                        G.deck:remove_card(card)
                        G.hand:remove_card(card)
                        G.discard:remove_card(card)
                        card:start_dissolve(nil, false)
                        card = nil
                    return true; end})) 
                end
            end
            -- for k, card in ipairs(G.hand.cards) do
            --     if card.unique_val == remove_id then
            --         G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
            --             func = function()
            --             G.hand:remove_card(card)
            --             hand:remove()
            --             card = nil
            --         return true; end})) 
            --     end
            -- end
        end
        G.bladedance_temp_ids = {}
    end
    if G.do_colour_end_of_round_stuff then
        colour_end_of_round_effects()

        G.do_colour_end_of_round_stuff = false
    end
end

local card_draw_ref = Card.draw
function Card.draw(self, layer)
    card_draw_ref(self, layer)

end

local create_card_ref = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    local card = create_card_ref(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)

    sendDebugMessage('Key: '..((card.ability.name) or 'none')..', Type: '..(_type or 'nil'))

    local function has_value(tab, val)
        for index, value in ipairs(tab) do
            if value == val then
                return true
            end
        end
        return false
    end

    local exotic_table = {
        'Amber',
        'Amethyst'
    }
    local exotic_keys = {
        'c_mf_amber',
        'c_mf_amethyst',
        'c_mf_yellow',
        'UNAVAILABLE'
    }

    if G.GAME.Fleurons ~= nil or G.GAME.Halberds ~= nil then
        allow_exotic = true
    end

    if not allow_exotic and has_value(exotic_table, card.ability.name) then
        local pool,_ = get_current_pool(_type, _rarity, legendary, key_append)
        local non_exotic = false
        for i,t in ipairs(pool) do
            sendDebugMessage("asdf"..t)
            if not has_value(exotic_keys,t) then
                non_exotic = true
                break
            end
        end
        if not non_exotic then
            -- but the joke is on you. huzzah!
            card:remove()
            return create_card(_type, area, legendary, _rarity, skip_materialize, soulable, "c_mf_yellow", key_append)
        end
        sendDebugMessage('Exotic card appeared! But the exotic suit did not exist.')
        sendDebugMessage('Rerolling...')
        card:remove()
        return create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    else
        return card
    end
end

if freaky then

    local poll_editionref = poll_edition
    function poll_edition(_key, _mod, _no_neg, _guaranteed)
        local val = poll_editionref(_key, _mod, _no_neg, _guaranteed)
        if G.GAME.selected_back.name == "Freaky Deck" and val == nil then
            return {freaky = true}
        end
        return val
    end

    local get_badge_colourref = get_badge_colour
    function get_badge_colour(key)
        if key == "freaky" then
            return G.C.DARK_EDITION
        end
        return get_badge_colourref(key)
    end

    local set_edition_ref = Card.set_edition
    function Card.set_edition(self, edition, immediate, silent)

        set_edition_ref(self, edition, immediate, silent)
        if edition then
            if edition.freaky then 
                if not self.edition then self.edition = {} end
                self.edition.freaky = true
                self.edition.type = 'freaky'
            end
        end

        if self.edition and not silent and edition.freaky then
            G.CONTROLLER.locks.edition = true
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = not immediate and 0.2 or 0,
                blockable = not immediate,
                func = function()
                    self:juice_up(1, 0.5)
                    modded_play_sound("vineboom", false, 1.0, 1.0)
                return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    G.CONTROLLER.locks.edition = false
                return true
                end
            }))
        end
    end

    -- remember to implement the shader properly!
    local card_draw_ref = Card.draw
    function Card.draw(self, layer)
        card_draw_ref(self, layer)

        layer = layer or 'both'

        if (layer == 'shadow' or layer == 'both') then
            self.ARGS.send_to_shader = self.ARGS.send_to_shader or {}
            self.ARGS.send_to_shader[1] = math.min(self.VT.r*3, 1) + G.TIMERS.REAL/(28) + (self.juice and self.juice.r*20 or 0) + self.tilt_var.amt
            self.ARGS.send_to_shader[2] = G.TIMERS.REAL

            for k, v in pairs(self.children) do
                v.VT.scale = self.VT.scale
            end
        end

        if (layer == 'card' or layer == 'both') then
            if self.sprite_facing == 'front' then 
                if self.edition and self.edition.freaky then
                    self.children.center:draw_shader('freaky', nil, self.ARGS.send_to_shader)
                end
            end
        end

        
    end

end

local get_current_poolref = get_current_pool

function get_current_pool(_type, _rarity, _legendary, _append)
    local _pool, _pool2 = get_current_poolref(_type, _rarity, _legendary, _append)
    if #_pool == 1 and _type == "Colour" then
        _pool[1] = "c_mf_yellow"
    end
    return _pool, _pool2
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