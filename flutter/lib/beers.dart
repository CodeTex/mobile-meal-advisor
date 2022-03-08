enum BeerCategory {
  ale,
  belgian,
  cider,
  dark,
  ipa,
  lager,
  lambic,
  nonalcoholic,
  onTap,
  pils,
  special,
  trappist,
  wit,
}

Map<BeerCategory, Map<String, String>> beerMap = {
  BeerCategory.ale: {
    "name": "Ale & Pale Ale",
    "text": "Test Text",
  },
  BeerCategory.belgian: {
    "name": "It's all about Belgium",
    "text": "Test Text",
  },
  BeerCategory.cider: {
    "name": "Cider",
    "text": "Test Text",
  },
  BeerCategory.dark: {
    "name": "Dunkel, Porter, Imperial Porter",
    "text": "Test Text",
  },
  BeerCategory.ipa: {
    "name": "Session, IPA, Imperial & Black IPA",
    "text": "Test Text",
  },
  BeerCategory.lager: {
    "name": "Lager, Wiener Lager, Märzen",
    "text": "Test Text",
  },
  BeerCategory.lambic: {
    "name": "Gose, Berliner Weisse, Flanders Red, Lambic & Experimental Sour",
    "text": "Test Text",
  },
  BeerCategory.nonalcoholic: {
    "name": "Alkoholfrei",
    "text": "Test Text",
  },
  BeerCategory.onTap: {
    "name": "On Tap",
    "text": "Test Text",
  },
  BeerCategory.pils: {
    "name": "Pils",
    "text": "Test Text",
  },
  BeerCategory.special: {
    "name": "Spezialitäten",
    "text": "Test Text",
  },
  BeerCategory.trappist: {
    "name": "Trappistenbier",
    "text": "Test Text",
  },
  BeerCategory.wit: {
    "name": "Weizenbier, White Ale, Wit",
    "text": "Test Text",
  },
};
