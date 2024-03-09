let jokers = [
  {
    name: "Basepaul Card",
    text: [
      "{X:mult,C:white} X1.2{} Mult. {X:mult,C:white} X12{} Mult",
      "instead for {C:red}Paul{}",
      "{C:inactive}(Who's Paul?)"
    ],
    image_url: "assets/1x/j_mf_basepaulcard.png",
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
      "(Ace = 1, 10 = 0)"
    ],
    image_url: "assets/1x/j_mf_moneyprinter.png",
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
    name: "Glitter Bomb",
    text: [
      "Sell this card to",
      "give all held cards",
      "a random {C:attention}Enhancement{}",
      "{C:inactive}(Sells for $1)"
    ],
    image_url: "assets/1x/j_mf_glitterbomb.png",
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
    name: "Triangle Joker",
    text: [
      "Gains {C:chips}+1{} Chips and",
      "increase Chips gained",
      "by {C:chips}1{} if played hand has",
      "exactly {C:attention}3{} cards"
    ],
    image_url: "assets/1x/j_mf_triangle.png",
    rarity: "Rare"
  }
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
  DARK_EDITION: "#000000",
  ETERNAL: "#c75985",
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
  joker_div.innerHTML = `
    <h3>${joker.name}</h3>
    <img src="${joker.image_url}" alt="${joker.name}" />
    <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
    <div class="text">${joker.text}</div>
  `;

  jokers_div.appendChild(joker_div);
}