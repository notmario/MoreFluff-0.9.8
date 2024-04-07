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
    name: "Huge Joker",
    text: [
      "{X:red,C:white} X3{} Mult,",
      "{C:attention}-2{} hand size"
    ],
    image_url: "assets/jimbo.png",
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
      "{C:chips}+10{} Chips per",
      "consecutive hand",
      "that scores a {C:attention}3{}"
    ],
    image_url: "assets/1x/j_mf_bowlingball.png",
    rarity: "Rare"
  },
  {
    name: "Flesh Prison",
    text: [
      "{C:red}X2{} {C:attention}Boss Blind{} size",
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
    name: "Jankman",
    text: [
      "Other {C:dark_edition}Modded{} Jokers",
      "each give {X:mult,C:white} X1.5{} Mult",
    ],
    image_url: "assets/1x/j_mf_jankman.png",
    rarity: "Rare"
  },
  {
    name: "Particle Accelerator",
    text: [
      "Gains {X:mult,C:white} X1{} Mult if played",
      "hand has only {C:attention}1{} card,",
      "otherwise gives {X:mult,C:white} X1{} Mult",
      "and resets to {X:mult,C:white} X1{} Mult"
    ],
    image_url: "assets/1x/j_mf_particleaccelerator.png",
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
      "{X:mult,C:white} X2{} Mult for",
      "each unique played pair"
    ],
    image_url: "assets/1x/j_mf_thejester.png",
    rarity: "Legendary",
    soul: true
  },
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
  DYN_UI: {
    MAIN: "#374244",
    DARK: "#374244",
    BOSS_MAIN: "#374244",
    BOSS_DARK: "#374244",
    BOSS_PALE: "#374244"
  },
  SO_1: {
    Hearts: "#f03464",
    Diamonds: "#f06b3f",
    Spades: "#403995",
    Clubs: "#235955",
  },
  SO_2: {
    Hearts: "#f83b2f",
    Diamonds: "#e29000",
    Spades: "#4f31b9",
    Clubs: "#008ee6",
  },
  SUITS: {
      Hearts: "#FE5F55",
      Diamonds: "#FE5F55",
      Spades: "#374649",
      Clubs: "#424e54",
  },
  
  SET: {
    Default: "#cdd9dc",
    Enhanced: "#cdd9dc",
    Joker: "#424e54",
    Tarot: "#424e54",
    Planet: "#424e54",
    Spectral: "#424e54",
    Voucher: "#424e54",
  }, 
  SECONDARY_SET: {
    Default: "#9bb6bdFF",
    Enhanced: "#8389DDFF",
    Joker: "#708b91",
    Tarot: "#a782d1",
    Planet: "#13afce",
    Spectral: "#4584fa",
    Voucher: "#fd682b",
    Edition: "#4ca893",
  },
}

let rarities = {
  "Common": "#009dff", 
  "Uncommon": "#4BC292",
  "Rare": "#fe5f55",
  "Legendary": "#b26cbb"
}

regex = /{([^}]+)}/g;

let jokers_div = document.querySelector(".jokers");

for (let joker of jokers) {
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
  if (joker.soul) {
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
  if (joker.name == "Huge Joker") {
    joker_div.classList.add("hugejoker");
  }
  if (joker.name == "Pixel Joker") {
    joker_div.classList.add("pixeljoker");
  }

  jokers_div.appendChild(joker_div);
}

document.querySelector(".jokercount").innerHTML = document.querySelector(".jokercount").innerHTML.replace("{{count}}", jokers.length);