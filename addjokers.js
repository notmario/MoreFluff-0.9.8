let jokers = [
  {
    name: "Bad Legal Defence",
    text: [
      "Create a {C:attention}Death{} {C:tarot}Tarot{}",
      "when {C:attention}Boss Blind{}",
      "is selected",
      "{C:inactive}(Must have room)"
    ],
    image_url: "assets/1x/j_mf_leagueoflegends.png",
    rarity: "Common"
  },
  {
    name: "Balatro Mods (Working 2024)",
    text: [
      "If {C:attention}first hand{} of round",
      "has only {C:attention}1{} card, spend",
      "{C:attention}$2{} to give it a",
      "random {C:attention}Enhancement{}",
    ],
    image_url: "assets/1x/j_mf_balatromods.png",
    rarity: "Common"
  },
  {
    name: "Basepaul Card",
    text: [
      "{X:mult,C:white} X1.25{} Mult. {X:mult,C:white} X12.5{} Mult",
      "instead for {C:red}Paul{}",
      "{C:inactive}(Who's Paul?)"
    ],
    image_url: "assets/1x/j_mf_basepaulcard.png",
    rarity: "Common"
  },
  {
    name: "Burner Phone",
    text: [
      "Shows the rank and suit",
      "of the top two cards",
      "of the deck",
    ],
    image_url: "assets/1x/j_mf_burnerphone.png",
    rarity: "Common"
  },
  {
    name: "Clownfish",
    text: [
      "{C:attention}Enhanced{} cards",
      "score {C:chips}+10{} more Chips",
      "and {C:mult}+4{} more Mult",
      "when scored"
    ],
    image_url: "assets/1x/j_mf_clownfish.png",
    rarity: "Common"
  },
  {
    name: "Coupon Catalogue",
    text: [
      "{C:mult}+10{} Mult for each",
      "{C:attention}Voucher{} purchased",
      "this run"
    ],
    image_url: "assets/1x/j_mf_couponcatalogue.png",
    rarity: "Common"
  },
  {
    name: "Expansion Pack",
    text: [
      "When {C:attention}Blind{} is selected,",
      "create {C:attention}1 {C:dark_edition}modded{C:attention} Joker",
      "{C:inactive}(Must have room)"
    ],
    image_url: "assets/1x/j_mf_expansionpack.png",
    rarity: "Common"
  },
  {
    name: "Hollow Joker",
    text: [
      "{C:attention}-1{} hand size",
      "{C:mult}+10{} Mult per hand",
      "size below {C:attention}9"
    ],
    image_url: "assets/1x/j_mf_hollow.png",
    rarity: "Common"
  },
  {
    name: "Jester",
    text: [
      "{C:chips,s:1.1}+40{} Chips"
    ],
    image_url: "assets/1x/j_mf_jester.png",
    rarity: "Common"
  },
  {
    name: "Lollipop",
    text: [
      "{X:mult,C:white} X1.75{} Mult",
      "{X:mult,C:white} -X0.15{} Mult per",
      "round played"
    ],
    image_url: "assets/1x/j_mf_lollipop.png",
    rarity: "Common"
  },
  {
    name: "Lucky Charm",
    text: [
      "{C:green}1 in 4{} chance for {C:mult}+20{} Mult",
      "{C:green}1 in 6{} chance to win {C:money}$20",
      "at end of round"
    ],
    image_url: "assets/1x/j_mf_luckycharm.png",
    rarity: "Common"
  },
  {
    name: "Money Printer",
    text: [
      "Earn {C:money}$2{} for each",
      "played numbered card",
      "that is a digit of",
      "your current money",
      "{C:inactive}(Ace = 1, 10 = 0)"
    ],
    image_url: "assets/1x/j_mf_moneyprinter.png",
    rarity: "Common"
  },
  {
    name: "MS Paint Joker",
    text: [
      "{C:attention}+4{} hand size",
      "for the first hand",
      "of each blind"
    ],
    image_url: "assets/1x/j_mf_mspaint.png",
    rarity: "Common"
  },
  {
    name: "Philosophcal Joker",
    text: [
      "{C:dark_edition}+1{} Joker Slot"
    ],
    image_url: "assets/1x/j_mf_pipe.png",
    rarity: "Common"
  },
  {
    name: "Simplified Joker",
    text: [
      "Other {C:blue}Common{} Jokers",
      "each give {C:mult}+4{} Mult",
    ],
    image_url: "assets/1x/j_mf_simplified.png",
    rarity: "Common"
  },
  {
    name: "Spiral Joker",
    text: [
      "{C:mult}+(10+7cos(pi/8 x {C:attention}$${C:mult})){} Mult",
      "{C:inactive}({C:attention}$${C:inactive} is your current money)"
    ],
    image_url: "assets/1x/j_mf_spiraljoker.png",
    rarity: "Common"
  },
  {
    name: "Treasure Map",
    text: [
      "After {C:attention}3{} rounds,",
      "sell this card to",
      "earn {C:money}$18{}",
    ],
    image_url: "assets/1x/j_mf_treasuremap.png",
    rarity: "Common"
  },
  {
    name: "Ace Up The Sleeve",
    text: [
      "Add a random {C:attention}Enhanced",
      "{C:attention}Ace{} to your hand",
      "when you have {C:blue}1{}",
      "hand left"
    ],
    image_url: "assets/1x/j_mf_ace.png",
    rarity: "Uncommon"
  },
  {
    name: "Big Shot Joker",
    text: [
      "Played {C:attention}Aces{},",
      "{C:attention}9s{}, and {C:attention}7s{} earn",
      "{C:money}$1{} when scored",
      "Retrigger all played {C:attention}9s{}",
    ],
    image_url: "assets/1x/j_mf_bigshot.png",
    rarity: "Uncommon"
  },
  {
    name: "Box of Hands",
    text: [
      "Sell this card to gain {C:blue}5{} hands",
      "only for the current round",
      "{C:inactive}(No effect outside of a round)"
    ],
    image_url: "assets/1x/j_mf_boxofhands.png",
    rarity: "Uncommon"
  },
  {
    name: "Black Market",
    text: [
      "When {C:attention}Boss Blind{}",
      "is selected, spend {C:attention}$10",
      "to summon an {C:spectral}Ankh{} card"
    ],
    image_url: "assets/1x/j_mf_blackmarket.png",
    rarity: "Uncommon"
  },
  {
    name: "Blasphemy",
    text: [
      "{X:red,C:white} X4{} Mult,",
      "{C:blue}-9999{} hands",
      "when hand is played"
    ],
    image_url: "assets/1x/j_mf_blasphemy.png",
    rarity: "Uncommon"
  },
  {
    name: "Blade Dance",
    text: [
      "Adds 2 temporary",
      "{C:attention}Steel Cards{}",
      "to your deck when",
      "blind is selected"
    ],
    image_url: "assets/1x/j_mf_bladedance.png",
    rarity: "Uncommon"
  },
  {
    name: "Brainrot",
    text: [
      "When {C:attention}Blind{} is selected,",
      "destroy the leftmost Joker",
      "and permanently add {C:attention}5x",
      "its sell value to these {C:blue}Chips"
    ],
    image_url: "assets/1x/j_mf_brainrot.png",
    rarity: "Uncommon"
  },
  {
    name: "Clipart Joker",
    text: [
      "Create a {C:colourcard}Colour{} card",
      "when {C:attention}Blind{} is selected",
      "{C:inactive}(Must have room)"
    ],
    image_url: "assets/1x/j_mf_clipart.png",
    rarity: "Uncommon"
  },
  {
    name: "CSS",
    text: [
      "Create a random {C:colourcard}Colour",
      "card when played hand",
      "contains a {C:attention}Flush",
      "{C:inactive}(Must have room)"
    ],
    image_url: "assets/1x/j_mf_css.png",
    rarity: "Uncommon"
  },
  {
    name: "Dramatic Entrance",
    text: [
      "{C:chips} +150 {} Chips",
      "on first hand",
      "each round"
    ],
    image_url: "assets/1x/j_mf_dramaticentrance.png",
    rarity: "Uncommon"
  },
  {
    name: "Dropkick",
    text: [
      "{C:blue}+1{} hand when hand",
      "contains a {C:attention}Straight"
    ],
    image_url: "assets/1x/j_mf_dropkick.png",
    rarity: "Uncommon"
  },
  {
    name: "Globe",
    text: [
      "Create a {C:planet}Planet{} card",
      "when you {C:attention}reroll{} in the shop",
    ],
    image_url: "assets/1x/j_mf_globe.png",
    rarity: "Uncommon"
  },
  {
    name: "Golden Carrot",
    text: [
      "Earn {C:money}$10{} at",
      "end of round",
      "{C:money}-$1{} per hand played"
    ],
    image_url: "assets/1x/j_mf_goldencarrot.png",
    rarity: "Uncommon"
  },
  {
    name: "Hall of Mirrors",
    text: [
      "{C:attention}+2{} hand size for",
      "each {C:attention}6{} scored in",
      "the current round"
    ],
    image_url: "assets/1x/j_mf_hallofmirrors.png",
    rarity: "Uncommon"
  },
  {
    name: "Hyper Beam",
    text: [
      "{X:red,C:white} X3{} Mult",
      "{C:attention}Lose all discards",
      "when {C:attention}Blind{} is selected"
    ],
    image_url: "assets/1x/j_mf_hyperbeam.png",
    rarity: "Uncommon"
  },
  {
    name: "Impostor",
    text: [
      "{X:mult,C:white} X2{} Mult if the",
      "played hand has",
      "exactly one {C:red}red{} card"
    ],
    image_url: "assets/1x/j_mf_impostor.png",
    rarity: "Uncommon"
  },
  {
    name: "I Sip Toner Soup",
    text: [
      "Create a {C:tarot}Tarot{} card",
      "when a hand is played",
      "Destroyed when blind",
      "is defeated",
      "{C:inactive}(Must have room)"
    ],
    image_url: "assets/1x/j_mf_tonersoup.png",
    rarity: "Uncommon"
  },
  {
    name: "Loaded Disk",
    text: [
      "Creates a {C:colourcard}Pink{} and",
      "a {C:colourcard}Yellow{} {C:colourcard}Colour{} card",
      "when sold",
      "{C:inactive}(Must have room)"
    ],
    image_url: "assets/1x/j_mf_loadeddisk.png",
    rarity: "Uncommon"
  },
  {
    name: "Miner",
    text: [
      "Gain a {C:green}D6 Tag{}",
      "when {C:attention}Boss Blind",
      "is selected",
    ],
    image_url: "assets/1x/j_mf_miner.png",
    rarity: "Uncommon"
  },
  {
    name: "Mr. Loans",
    text: [
      "Prevents death if",
      "not in debt, but you",
      "lose {C:money}${} equal to remaining",
      "required chips"
    ],
    image_url: "assets/1x/j_mf_mrloans.png",
    rarity: "Uncommon"
  },
  {
    name: "Recycling",
    text: [
      "Create a random {C:planet}Planet{}",
      "or {C:tarot}Tarot{} card",
      "when any {C:attention}Booster{}",
      "{C:attention}Pack{} is skipped",
      "{C:inactive}(Must have room)",
    ],
    image_url: "assets/1x/j_mf_recycling.png",
    rarity: "Uncommon"
  },
  {
    name: "Seal the Deal",
    text: [
      "After you play a winning hand,",
      "add a random {C:attention}Seal{} to",
      "one of the played cards",
    ],
    image_url: "assets/1x/j_mf_sealthedeal.png",
    rarity: "Uncommon"
  },
  {
    name: "Style Meter",
    text: [
      "Earn {C:money}$3{} at end",
      "of round for each",
      "{C:attention}Blind{} skipped this run"
    ],
    image_url: "assets/1x/j_mf_stylemeter.png",
    rarity: "Uncommon"
  },
  {
    name: "Teacup",
    text: [
      "Upgrade the level of",
      "each {C:attention}played hand{}",
      "for the next {C:attention}4{} hands",
    ],
    image_url: "assets/1x/j_mf_teacup.png",
    rarity: "Uncommon"
  },
  {
    name: "Virtual Joker",
    text: [
      "{X:red,C:white} X3{} Mult",
      "Flips and shuffles all",
      "Joker cards when",
      "blind is selected"
    ],
    image_url: "assets/1x/j_mf_virtual.png",
    rarity: "Uncommon"
  },
  {
    name: "Whiteboard",
    text: [
      "{X:red,C:white} X2{} Mult for each",
      "empty hand space",
      "after {C:attention}3{} cards"
    ],
    image_url: "assets/1x/j_mf_whiteboard.png",
    rarity: "Uncommon"
  },
  {
    name: "5D Joker with Multiverse Time Travel",
    text: [
      "{C:attention}-1{} Ante and is destroyed if",
      "you defeat the {C:attention}Blind",
      "by {C:attention}10x{} or more"
    ],
    image_url: "assets/1x/j_mf_fived.png",
    rarity: "Rare"
  },
  {
    name: "Blood Pact",
    text: [
      "{X:mult,C:white} X5{} Mult",
      "Destroyed if you play",
      "a non-{C:hearts}Hearts{} card"
    ],
    image_url: "assets/1x/j_mf_bloodpact.png",
    rarity: "Rare"
  },
  {
    name: "Bowling Ball",
    text: [
      "Played {C:attention}3s{}",
      "give {C:chips}+60{} Chips",
      "and {C:mult}+10{} Mult",
      "when scored"
    ],
    image_url: "assets/1x/j_mf_bowlingball.png",
    rarity: "Rare"
  },
  {
    name: "Card Buffer Advanced",
    text: [
      "If {C:attention}first hand{} of round",
      "has only {C:attention}1{} card, add",
      "add {C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, or",
      "{C:dark_edition}Polychrome{} effect to it",
    ],
    image_url: "assets/1x/j_mf_cba.png",
    rarity: "Rare"
  },
  {
    name: "Flesh Prison",
    text: [
      "{C:red}X5{} {C:attention}Boss Blind{} size",
      "Destroyed and creates a",
      "{C:dark_edition}Negative{} {C:spectral}Soul{} card when a",
      "{C:attention}Boss Blind{} is defeated"
    ],
    image_url: "assets/1x/j_mf_fleshprison.png",
    rarity: "Rare"
  },
  {
    name: "Glitter Bomb",
    text: [
      "Sell this card to",
      "give all held cards",
      "a random {C:attention}Enhancement{}"
    ],
    image_url: "assets/1x/j_mf_glitterbomb.png",
    rarity: "Rare"
  },
  {
    name: "Huge Joker",
    text: [
      "{X:red,C:white} X3{} Mult,",
      "{C:attention}-2{} hand size"
    ],
    image_url: "assets/jimbo.png",
    rarity: "Rare"
  },
  {
    name: "Jankman",
    text: [
      "Other {C:dark_edition}Modded{} Jokers",
      "each give {X:mult,C:white} X1.25{} Mult",
    ],
    image_url: "assets/1x/j_mf_jankman.png",
    rarity: "Rare"
  },
  {
    name: "Mashup Album",
    text: [
      "Gains {C:mult} +4{} Mult if played",
      "hand contains a {C:hearts}red{} flush",
      "Gains {C:chips} +15{} Chips if played",
      "hand contains a {C:spades}black{} flush",
    ],
    image_url: "assets/1x/j_mf_mouthmoods.png",
    rarity: "Rare"
  },
  {
    name: "Particle Accelerator",
    text: [
      "Gains {X:mult,C:white} X0.5{} Mult if played",
      "hand has only {C:attention}1{} card,",
      "otherwise gives {X:mult,C:white} X1{} Mult",
      "and resets to {X:mult,C:white} X1{} Mult"
    ],
    image_url: "assets/1x/j_mf_particleaccelerator.png",
    rarity: "Rare"
  },
  {
    name: "Paint Can",
    text: [
      "{C:green}1 in 2{} chance to add",
      "{C:attention}1{} round to {C:colourcard}Colour Cards{}",
      "when they gain a round",
    ],
    image_url: "assets/1x/j_mf_paintcan.png",
    rarity: "Rare"
  },
  {
    name: "Pixel Joker",
    text: [
      "Played {C:attention}Aces{},",
      "{C:attention}4s{} and {C:attention}9s{} each give",
      "{X:mult,C:white} X1.5{} Mult when scored"
    ],
    image_url: "assets/1x/j_mf_pixeljoker.png",
    rarity: "Rare"
  },
  {
    name: "Rose-Tinted Glasses",
    text: [
      "If {C:attention}first hand{} of round is",
      "a single {C:attention}2{}, destroy it and",
      "create a free {C:attention}Double Tag{}",
    ],
    image_url: "assets/1x/j_mf_rosetinted.png",
    rarity: "Rare"
  },
  {
    name: "Rainbow Joker",
    text: [
      "{C:colourcard}Colour{} cards give",
      "{X:mult,C:white} X2{} Mult"
    ],
    image_url: "assets/1x/j_mf_rainbow.png",
    rarity: "Rare"
  },
  {
    name: "The Solo",
    text: [
      "Gains {X:mult,C:white} X0.1{} Mult if played",
      "hand has only {C:attention}1{} card"
    ],
    image_url: "assets/1x/j_mf_thesolo.png",
    rarity: "Rare"
  },
  {
    name: "Triangle Joker",
    text: [
      "Gains {C:chips}+1{} Chips and",
      "increase Chips gained",
      "by {C:chips}1{} if played hand has",
      "exactly {C:attention}3{} cards"
    ],
    image_url: "assets/1x/j_mf_triangle.png",
    rarity: "Rare"
  },
  {
    name: "The Jester",
    text: [
      "{X:mult,C:white} X2.5{} Mult for",
      "each unique played pair"
    ],
    image_url: "assets/1x/j_mf_thejester.png",
    rarity: "Legendary",
    soul: true
  },
]

// works the same. 
let consumables = [
  {
    name: "Black",
    text: [
      "Add {C:dark_edition}Negative{} to a",
      "random {C:attention}Joker{} for every",
      "{C:attention}4{} rounds this has been held"
    ],
    image_url: "assets/1x/c_mf_black.png",
    rarity: "Colour"
  },
  {
    name: "Deep Blue",
    text: [
      "Converts a random card in",
      "hand to {C:spades}Spades{} for every",
      "round this has been held",
    ],
    image_url: "assets/1x/c_mf_deepblue.png",
    rarity: "Colour"
  },
  {
    name: "Crimson",
    text: [
      "Create a {C:red}Rare Tag{} for",
      "every {C:attention}3{} rounds",
      "this has been held",
    ],
    image_url: "assets/1x/c_mf_crimson.png",
    rarity: "Colour"
  },
  {
    name: "Seaweed",
    text: [
      "Converts a random card in",
      "hand to {C:clubs}Clubs{} for every",
      "round this has been held",
    ],
    image_url: "assets/1x/c_mf_seaweed.png",
    rarity: "Colour"
  },
  {
    name: "Brown",
    text: [
      "Destroys a random card in",
      "hand and gives {C:attention}$2{} for every",
      "round this has been held",
    ],
    image_url: "assets/1x/c_mf_brown.png",
    rarity: "Colour"
  },
  {
    name: "Grey",
    text: [
      "Create a {C:attention}Double Tag{} for",
      "every {C:attention}3{} rounds",
      "this has been held",
    ],
    image_url: "assets/1x/c_mf_grey.png",
    rarity: "Colour"
  },
  {
    name: "Silver",
    text: [
      "Create a {C:dark_edition}Polychrome Tag{}",
      "for every {C:attention}3{} rounds",
      "this has been held",
    ],
    image_url: "assets/1x/c_mf_silver.png",
    rarity: "Colour"
  },
  {
    name: "White",
    text: [
      "Create a random {C:dark_edition}Negative{}",
      "{C:colourcard}Colour{} card for every",
      "{C:attention}2{} rounds this has been held",
    ],
    image_url: "assets/1x/c_mf_white.png",
    rarity: "Colour"
  },
  {
    name: "Red",
    text: [
      "Converts a random card in",
      "hand to {C:hearts}Hearts{} for every",
      "round this has been held",
    ],
    image_url: "assets/1x/c_mf_red.png",
    rarity: "Colour"
  },
  {
    name: "Orange",
    text: [
      "Converts a random card in",
      "hand to {C:diamonds}Diamonds{} for every",
      "round this has been held",
    ],
    image_url: "assets/1x/c_mf_orange.png",
    rarity: "Colour"
  },
  {
    name: "Yellow",
    text: [
      "Gains {C:money}$8{} of",
      "{C:attention}sell value{}",
      "every {C:attention}3{} rounds"
    ],
    image_url: "assets/1x/c_mf_yellow.png",
    rarity: "Colour"
  },
  {
    name: "Green",
    text: [
      "Create a {C:green}D6 Tag{} for",
      "every {C:attention}3{} rounds",
      "this has been held",
    ],
    image_url: "assets/1x/c_mf_green.png",
    rarity: "Colour"
  },
  {
    name: "Blue",
    text: [
      "Create a random {C:dark_edition}Negative{}",
      "{C:planet}Planet{} card for every",
      "{C:attention}2{} rounds this has been held",
    ],
    image_url: "assets/1x/c_mf_blue.png",
    rarity: "Colour"
  },
  {
    name: "Lilac",
    text: [
      "Create a random {C:dark_edition}Negative{}",
      "{C:tarot}Tarot{} card for every",
      "{C:attention}2{} rounds this has been held",
    ],
    image_url: "assets/1x/c_mf_lilac.png",
    rarity: "Colour"
  },
  {
    name: "Pink",
    text: [
      "Add {C:attention}1{} round to a random",
      "{C:colourcard}Colour{} card for every",
      "{C:attention}2{} rounds this has been held",
    ],
    image_url: "assets/1x/c_mf_pink.png",
    rarity: "Colour"
  },
  {
    name: "Peach",
    text: [
      "Create a {C:dark_edition}Negative{} {C:spectral}Soul{}",
      "card for every {C:attention}6{}",
      "rounds this has been held",
    ],
    image_url: "assets/1x/c_mf_peach.png",
    rarity: "Colour"
  },
]

let extras = [
  {
    name: "Amber",
    text: [
      "Converts a random card in",
      "hand to {C:fleurons}Fleurons{} for every",
      "round this has been held",
      '(<a href="https://github.com/Firch/Bunco">Also try Bunco!</a>)'
    ],
    image_url: "assets/1x/c_mf_amber.png",
    rarity: "Colour"
  },
  {
    name: "Amethyst",
    text: [
      "Converts a random card in",
      "hand to {C:halberds}Halberds{} for every",
      "round this has been held",
      '(<a href="https://github.com/Firch/Bunco">Also try Bunco!</a>)'
    ],
    image_url: "assets/1x/c_mf_amethyst.png",
    rarity: "Colour"
  },
  {
    name: "Magenta",
    text: [
      "Converts a random card in",
      "hand to {C:stars}Stars{} for every",
      "round this has been held",
      '(<a href="https://github.com/Aurelius7309/SixSuits/">Also try Six Suits!</a>)'
    ],
    image_url: "assets/1x/c_mf_magenta.png",
    rarity: "Colour"
  },
  {
    name: "Periwinkle",
    text: [
      "Converts a random card in",
      "hand to {C:moons}Moons{} for every",
      "round this has been held",
      '(<a href="https://github.com/Aurelius7309/SixSuits/">Also try Six Suits!</a>)'
    ],
    image_url: "assets/1x/c_mf_periwinkle.png",
    rarity: "Colour"
  },
  // {
  //   name: "Purple",
  //   text: [
  //     "Converts a random card in",
  //     "hand to {C:notes}Notes{} for every",
  //     "round this has been held",
  //     '(<a href="https://github.com/itayfeder/MusicalSuit">Also try the Musical Suit!</a>)'
  //   ],
  //   image_url: "assets/1x/c_mf_purple.png",
  //   rarity: "Colour"
  // },
  {
    name: "Tan",
    text: [
      "Create a random {C:dark_edition}Negative{}",
      "{C:alchemical}Alchemical{} card for every",
      "{C:attention}2{} rounds this has been held",
      '(<a href="https://github.com/itayfeder/Codex-Arcanum">Also try Codex Arcanum!</a>)'
    ],
    image_url: "assets/1x/c_mf_tan.png",
    rarity: "Colour"
  },
  {
    name: "Huge Stuntman",
    text: [
      "{X:red,C:white} X3{} Mult, {C:chips}+300{} Chips,",
      "{C:attention}-2{} hand size",
      '(<a href="https://itayfeder.github.io/Fusion-Jokers/">Also try Fusion Jokers!</a>)'
    ],
    image_url: "assets/stuntman.png",
    rarity: "Fusion",
    fusion_jokers: [
      "assets/jimbo.png",
      "assets/stuntman.png"
    ]
  },
]

let decks = [
  {
    name: "Gros Michel Deck",
    text: [
      "Start run with {C:attention}Gros Michel"
    ],
    image_url: "assets/1x/b_mf_grosmichel.png",
    rarity: "Deck"
  },
  {
    name: "Rainbow Deck",
    text: [
      "Start run with a {C:colourcard}White",
      "{C:colourcard}Colour{} card and the",
      "{C:tarot,T:v_mf_paintroller}Paint Roller{} Voucher",
    ],
    image_url: "assets/1x/b_mf_rainbow.png",
    rarity: "Deck"
  },
  {
    name: "Philosophical Deck",
    text: [
      "Start run with 5",
      "{C:attention}Philosophical Jokers"
    ],
    image_url: "assets/1x/b_mf_philosophical.png",
    rarity: "Deck"
  },
  {
    name: "Blasphemous Deck",
    text: [
      "Start run with a {C:dark_edition}Negative{}",
      "{C:spectral}Eternal{} {C:attention}Blasphemy"
    ],
    image_url: "assets/1x/b_mf_blasphemy.png",
    rarity: "Deck"
  },
]

let packs = [
  {
    hidden: true
  },
  {
    name: "Paint Roller",
    text: [
      "{C:green}1 in 2{} chance to add",
      "{C:attention}1{} round to {C:colourcard}Colour Cards{}",
      "when they gain a round",
    ],
    image_url: "assets/1x/v_mf_paintroller.png",
    rarity: "Voucher"
  },
  {
    name: "Colour Theory",
    text: [
      "{C:green}1 in 2{} {C:colourcard}Colour{} cards in",
      "packs are {C:dark_edition}Polychrome{}",
    ],
    image_url: "assets/1x/v_mf_colourtheory.png",
    rarity: "Voucher"
  },
  {
    hidden: true
  },
  {
    name: "Colour Pack",
    text: [
      "Choose {C:attention}1{} of up to",
      "{C:attention}2{C:colourcard} Colour{} cards to",
      "add to your consumeables"
    ],
    image_url: "assets/cpack1.png",
    rarity: "Pack"
  },
  {
    name: "Colour Pack",
    text: [
      "Choose {C:attention}1{} of up to",
      "{C:attention}2{C:colourcard} Colour{} cards to",
      "add to your consumeables"
    ],
    image_url: "assets/cpack2.png",
    rarity: "Pack"
  },
  {
    name: "Jumbo Colour Pack",
    text: [
      "Choose {C:attention}1{} of up to",
      "{C:attention}4{C:colourcard} Colour{} cards to",
      "add to your consumeables"
    ],
    image_url: "assets/cpack3.png",
    rarity: "Pack"
  },
  {
    name: "Mega Colour Pack",
    text: [
      "Choose {C:attention}2{} of up to",
      "{C:attention}4{C:colourcard} Colour{} cards to",
      "add to your consumeables"
    ],
    image_url: "assets/cpack4.png",
    rarity: "Pack"
  },
]

let blinds = [
  {
    name: "The Old",
    text: [
      "Modded Jokers",
      "are disabled"
    ],
    image_url: "assets/1x/bl_mf_theold.png",
    rarity: "Boss Blind"
  },
  {
    name: "The New",
    text: [
      "Vanilla Jokers",
      "are disabled"
    ],
    image_url: "assets/1x/bl_mf_thenew.png",
    rarity: "Boss Blind"
  },
]

let shop_items = [
]

let cols = {
  
  MULT: "#FE5F55",
  CHIPS: "#009dff",
  MONEY: "#f3b958",
  XMULT: "#FE5F55",
  FILTER: "#ff9a00",
  ATTENTION: "#ff9a00",
  BLUE: "#009dff",
  RED: "#FE5F55",
  GREEN: "#4BC292",
  PALE_GREEN: "#56a887",
  ORANGE: "#fda200",
  IMPORTANT: "#ff9a00",
  GOLD: "#eac058",
  YELLOW: "#ffff00",
  CLEAR: "#00000000", 
  WHITE: "#ffffff",
  PURPLE: "#8867a5",
  BLACK: "#374244",
  L_BLACK: "#4f6367",
  GREY: "#5f7377",
  CHANCE: "#4BC292",
  JOKER_GREY: "#bfc7d5",
  VOUCHER: "#cb724c",
  BOOSTER: "#646eb7",
  EDITION: "#ffffff",
  DARK_EDITION: "#5d5dff",
  ETERNAL: "#c75985",
  INACTIVE: "#ffffff99",
  HEARTS: "#f03464",
  DIAMONDS: "#f06b3f",
  SPADES: "#403995",
  CLUBS: "#235955",
  ENHANCED: "#8389DD",
  JOKER: "#708b91",
  TAROT: "#a782d1",
  PLANET: "#13afce",
  SPECTRAL: "#4584fa",
  VOUCHER: "#fd682b",
  EDITION: "#4ca893",

  ALCHEMICAL: "#C09D75",
  COLOURCARD: "#8867a5",
  
  FLEURONS: "#d6901a",
  HALBERDS: "#993283",
  STARS: "#DF509F",
  MOONS: "#696076",
  NOTES: "#D61BAF",
}

let rarities = {
  "Common": "#009dff", 
  "Uncommon": "#4BC292",
  "Rare": "#fe5f55",
  "Legendary": "#b26cbb",
  "Joker": "#708b91",
  "Tarot": "#a782d1",
  "Planet": "#13afce",
  "Spectral": "#4584fa",
  "Voucher": "#fd682b",
  "Pack": "#9bb6bd",
  "Enhancement": "#8389DD",
  "Edition": "#4ca893",
  "Seal": "#4584fa",
  "Deck": "#9bb6bd",
  "Sticker": "#5d5dff",
  "Boss Blind": "#5d5dff",
  "Showdown": "#4584fa",

  "Colour": "#8867a5",
  "Fusion": "#F7D762"
}

regex = /{([^}]+)}/g;
let add_cards_to_div = (jokers, jokers_div) => {
  for (let joker of jokers) {
    if (joker.hidden) {
      let joker_div = document.createElement("div");
      jokers_div.appendChild(joker_div);
      continue
    }
    console.log("adding joker", joker.name);
  
    joker.text = joker.text.map((line) => { return line + "{}"});
  
    joker.text = joker.text.join("<br/>");
    joker.text = joker.text.replaceAll("{}", "</span>");
    joker.text = joker.text.replace(regex, function replacer(match, p1, offset, string, groups) {
      let classes = p1.split(",");
  
      let css_styling = "";
  
      for (let i = 0; i < classes.length; i++) {
        let parts = classes[i].split(":");
        if (parts[0] === "C") {
          css_styling += `color: ${cols[parts[1].toUpperCase()]};`;
        } else if (parts[0] === "X") {
          css_styling += `background-color: ${cols[parts[1].toUpperCase()]}; border-radius: 5px; padding: 0 5px;`;
        }
      }
  
      return `</span><span style='${css_styling}'>`;
    });
  
    let joker_div = document.createElement("div");
    joker_div.classList.add("joker");
    if (joker.rarity === "Sticker" || joker.rarity == "Seal") {
      joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        <img src="${joker.image_url}" alt="${joker.name}" class="hasback" />
        <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
    } else if (joker.soul) {
      joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        <span class="soulholder">
          <img src="${joker.image_url}" alt="${joker.name}" class="soul-bg" />
          <img src="${joker.image_url}" alt="${joker.name}" class="soul-top" />
        </span>
        <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
    } else {
      joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        <img src="${joker.image_url}" alt="${joker.name}" />
        <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
    }
    if (joker.name == "Huge Joker" || joker.name == "Huge Stuntman") {
      joker_div.classList.add("hugejoker");
    }
    if (joker.name == "Pixel Joker") {
      joker_div.classList.add("pixeljoker");
    }
    if (joker.name == "Mashup Album" || joker.name == "Triangle Joker") {
      joker_div.classList.add("mouthmoods");
    }
    
    if (joker.fusion_jokers) {
      let fusion_div = document.createElement("div");
      if (joker.fusion_jokers[0] == "assets/jimbo.png") {
        fusion_div.innerHTML = `
        <table>
          <tr>
          <td><img src="${joker.fusion_jokers[0]}" alt="${joker.name}" style="width: 71px; height: 95px"/></td>
          <td><h1 style="padding-right: 20px; padding-left: 20px">+</h1></td>
          <td><img src="${joker.fusion_jokers[1]}" alt="${joker.name}" style="width: 48px; height: 64px"/></td>
          </tr>
        </table>
        `
      } else {
        fusion_div.innerHTML = `
        <table>
          <tr>
          <td><img src="${joker.fusion_jokers[0]}" alt="${joker.name}" style="width: 48px; height: 64px "/></td>
          <td><h1 style="padding-right: 20px; padding-left: 20px">+</h1></td>
          <td><img src="${joker.fusion_jokers[1]}" alt="${joker.name}" style="width: 48px; height: 64px"/></td>
          </tr>
        </table>
        `
      }
      joker_div.innerHTML += `
      <button type="button" class="collapsible">Show Fusion</button>`

      fusion_div.classList.add("content");
      joker_div.appendChild(fusion_div);
    }
  
    jokers_div.appendChild(joker_div);
  }
}

if (jokers.length === 0) {
  document.querySelector(".jokersfull").style.display = "none"
} else {
  let jokers_div = document.querySelector(".jokers");
  add_cards_to_div(jokers, jokers_div);
}

// if (blinds.length === 0) {
//   document.querySelector(".blindsfull").style.display = "none"
// } else {
//   let blinds_div = document.querySelector(".blinds");
//   add_cards_to_div(blinds, blinds_div);
// }

if (consumables.length === 0) {
  document.querySelector(".consumablesfull").style.display = "none"
} else {
  let consumables_div = document.querySelector(".consumables");
  add_cards_to_div(consumables, consumables_div);
}

if (packs.length === 0) {
  document.querySelector(".packsfull").style.display = "none"
} else {
  let packs_div = document.querySelector(".packs");
  add_cards_to_div(packs, packs_div);
}

if (decks.length === 0) {
  document.querySelector(".decksfull").style.display = "none"
} else {
  let decks_div = document.querySelector(".decks");
  add_cards_to_div(decks, decks_div);
}

if (extras.length === 0) {
  document.querySelector(".extrasfull").style.display = "none"
} else {
  let extras_div = document.querySelector(".extras");
  add_cards_to_div(extras, extras_div);
}

document.querySelector(".jokercount").innerHTML = document.querySelector(".jokercount").innerHTML.replace("{{count}}", jokers.length);


var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.maxHeight){
      this.innerHTML = "Show Fusion"
      content.style.maxHeight = null;
    } else {
      this.innerHTML = "Hide Fusion"
      content.style.maxHeight = content.scrollHeight + "px";
    }
  });
}