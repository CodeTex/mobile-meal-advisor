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

class Beer {
  final String name;
  final String country;
  final double price;

  Beer({required this.name, required this.country, required this.price});
}

class BeerCategoryInformation {
  final String name;
  final List<Beer> beers;

  BeerCategoryInformation({required this.name, required this.beers});
}

Map<BeerCategory, BeerCategoryInformation> beerMap = {
  BeerCategory.ale: BeerCategoryInformation(
    name: "Ale & Pale Ale",
    beers: <Beer>[
      Beer(
        name: "Kona - Big Wave 0,335 L",
        country: "Hawaii - 4,4%, 10°",
        price: 6.4,
      ),
      Beer(
        name: "Brauwerk - Native Tongue 0,33 L",
        country: "Österreich - 4,4%, 11°",
        price: 5.4,
      ),
      Beer(
        name: "Brew Age - Hopfenauflauf 0,33 L",
        country: "Österreich - 5,4%",
        price: 5.8,
      ),
      Beer(
        name: "Brewdog - Vagabond Pale Ale 0,33 L",
        country: "Schottland - 4,5%, 11°",
        price: 6.4,
      ),
      Beer(
        name: "Einstök - Wee Heavy 0,33 L",
        country: "Island - 8%, 12,8°",
        price: 6.8,
      ),
    ],
  ),
  BeerCategory.belgian: BeerCategoryInformation(
    name: "It's all about Belgium",
    beers: <Beer>[
      Beer(
        name: "Der Belgier - Saison 0,33 L",
        country: "Österreich - 5,9%, 13,1",
        price: 5.6,
      ),
      Beer(
        name: "Der Belgier - Honey, I Love You 0,33 L",
        country: "Österreich - 7,5%, 16,5",
        price: 6.2,
      ),
      Beer(
        name: "Der Belgier - Blond 0,33 L",
        country: "Österreich - 6,5%, 14,5",
        price: 5.6,
      ),
      Beer(
        name: "St. Bernadus - Abt 0,33 L",
        country: "Belgien -10%, 20",
        price: 8.5,
      ),
      Beer(
        name: "Huyghe - Delirium Tremens 0,33 L",
        country: "Belgien - 8,5%, 16",
        price: 7.5,
      ),
    ],
  ),
  BeerCategory.cider: BeerCategoryInformation(
    name: "Cider",
    beers: <Beer>[
      Beer(
        name: "Blakstoc - Wild Tree 0,33 L",
        country: "Österreich - 4,5%",
        price: 5.8,
      ),
      Beer(
        name: "Blakstoc - Buddha's Hand 0,33 L",
        country: "Österreich - 4%",
        price: 5.8,
      ),
      Beer(
        name: "Blakstoc - Ginger For My Honey 0,33 L",
        country: "Österreich - 3%",
        price: 5.8,
      ),
      Beer(
        name: "Blakstoc - Will You Perry Me 0,33 L",
        country: "Österreich - 5,4%",
        price: 5.8,
      ),
      Beer(
        name: "Blakstoc - Urban Orchard 0,33 L",
        country: "Österreich - 4,5%",
        price: 5.8,
      ),
    ],
  ),
  BeerCategory.dark: BeerCategoryInformation(
    name: "Dunkel, Porter, Imperial Porter",
    beers: <Beer>[
      Beer(
        name: "Goldfassl Dunkles 0,5 L",
        country: "Österreich - 4,9%, 12,2°",
        price: 5.7,
      ),
      Beer(
        name: "Left Hand - Milk Stout Nitro Dose",
        country: "USA - 6%, 15°",
        price: 7.4,
      ),
      Beer(
        name: "Bevog - Baja Oatmeal Stout 0,33 L",
        country: "Österreich - 5,8%, 15°",
        price: 5.8,
      ),
      Beer(
        name: "Porterhouse - Oyster Stout 0,33 L",
        country: "Irland - 4,6%, 11,5°",
        price: 6.4,
      ),
    ],
  ),
  BeerCategory.ipa: BeerCategoryInformation(
    name: "Session, IPA, Imperial & Black IPA",
    beers: <Beer>[
      Beer(
        name: "Brauwerk - Big Easy 0,33 L",
        country: "Österreich - 4,3%, 10,5°",
        price: 5.4,
      ),
      Beer(
        name: "Brew Age - Alphatier 0,33 L",
        country: "Österreich - 5,6%, 12°",
        price: 6.2,
      ),
      Beer(
        name: "Lagunitas - IPA 0,36 L",
        country: "USA - 6,2%, 14°",
        price: 5.6,
      ),
      Beer(
        name: "Flying Dog - Snake Dog IPA 0,355 L",
        country: "USA - 7,1%, 15°",
        price: 7,
      ),
      Beer(
        name: "Thornbridge - Shelby Peaky Blinders 0,33 L",
        country: "England - 5%",
        price: 5.8,
      ),
      Beer(
        name: "Brauhaus Gusswerk - Nicobar 0,33 L",
        country: "Österreich - 6,4%",
        price: 5.8,
      ),
      Beer(
        name: "Bevog - Rudeen 0,33 L",
        country: "Österreich - 7,4%, 17°",
        price: 7,
      ),
      Beer(
        name: "Brauwerk - Avalanche 0,33 L",
        country: "Österreich - 9,5%, 21,5°",
        price: 7.5,
      ),
    ],
  ),
  BeerCategory.lager: BeerCategoryInformation(
    name: "Lager, Wiener Lager, Märzen",
    beers: <Beer>[
      Beer(
        name: "Brooklyn - Lager 0,35 L",
        country: "USA - 5,2%, 13°",
        price: 6.6,
      ),
      Beer(
        name: "Weitrabräu - Dashelle 0,33 L",
        country: "Österreich - 5%, 11,8°",
        price: 5,
      ),
      Beer(
        name: "Bayreuther - Helles 0,5 L",
        country: "Österreich - 4,9%, 11°",
        price: 5.7,
      ),
    ],
  ),
  BeerCategory.lambic: BeerCategoryInformation(
    name: "Gose, Berliner Weisse, Flanders Red, Lambic & Experimental Sour",
    beers: <Beer>[
      Beer(
        name: "Stu Mostow - Berliner Weisse Strawberry 0,5 L",
        country: "Polen - 3,8%",
        price: 6.8,
      ),
      Beer(
        name: "BRLO - Berliner Weisse 0,33 L",
        country: "Deutschland - 4%, 10°",
        price: 5.5,
      ),
      Beer(
        name: "Mongozo - Coconut 0,33 L",
        country: "Belgien - 3,6%, 14°",
        price: 5.5,
      ),
      Beer(
        name: "Brauwerk - Red Impact 0,33 L",
        country: "Österreich - 7,2%, 17,2°",
        price: 5.8,
      ),
      Beer(
        name: "Rodenbach - Grand Cru 0,33 L",
        country: "Belgien - 6%, 14°",
        price: 7.2,
      ),
      Beer(
        name: "Boon - Kriek 0,375 L",
        country: "Belgien - 4%, 12°",
        price: 8.5,
      ),
      Beer(
        name: "Lervig - Sour Suzy 0,33 L",
        country: "Norwegen - 4%, 9°",
        price: 5.5,
      ),
      Beer(
        name: "Freddo Fox - Fruited Sour 0,33 L",
        country: "Spanien - 4-6%, 13-16°",
        price: 7.5,
      ),
    ],
  ),
  BeerCategory.nonalcoholic: BeerCategoryInformation(
    name: "Alkoholfrei",
    beers: <Beer>[
      Beer(
        name: "Big Drop - Paradisco Citra IPA 0,33 L",
        country: "Großbritannien - 0,5%",
        price: 5.7,
      ),
      Beer(
        name: "Null Komma Josef 0,33 L",
        country: "Österreich - 0,5%, 6,2°",
        price: 4.6,
      ),
      Beer(
        name: "Riegele - Liberis 0,33 L",
        country: "Deutschland - 0,5%, 9°",
        price: 5.7,
      ),
    ],
  ),
  BeerCategory.onTap: BeerCategoryInformation(
    name: "On Tap",
    beers: <Beer>[
      Beer(
        name: "Wiener Original - Hausbier",
        country: "Österreich - 5,3%, 12°",
        price: 5.2,
      ),
      Beer(
        name: "Budweiser",
        country: "Tschechien - 5%, 11,9°",
        price: 5.8,
      ),
      Beer(
        name: "Goldfassl Zwickl Rot",
        country: "Österreich - 5,2%, 12,2°",
        price: 5.8,
      ),
      Beer(
        name: "Sierra Nevada - Pale Ale",
        country: "USA - 5,6%, 13,1°",
        price: 6.2,
      ),
      Beer(
        name: "The Padawan",
        country: "Österreich - 5,5%, 13°",
        price: 6.2,
      ),
      Beer(
        name: "Stadtboden BPA",
        country: "Österreich - 5,3%, 13,1°",
        price: 6.2,
      ),
      Beer(
        name: "Chicxulub",
        country: "Österreich - 5,4%",
        price: 6.2,
      ),
    ],
  ),
  BeerCategory.pils: BeerCategoryInformation(
    name: "Pils",
    beers: <Beer>[
      Beer(
        name: "Theresianer - Premium Pils 0,33 L",
        country: "Italien - 5%, 12°",
        price: 5.8,
      ),
      Beer(
        name: "Zillertal Bier - Pils 0,33 L",
        country: "Österreich - 5,2%, 12°",
        price: 5.8,
      ),
      Beer(
        name: "Bierschmiede - Meisterstück 0,33 L",
        country: "Österreich - 5%, 12°",
        price: 6.2,
      ),
    ],
  ),
  BeerCategory.special: BeerCategoryInformation(
    name: "Spezialitäten",
    beers: <Beer>[
      Beer(
        name: "Hollow's & Fentiman's - Ginger Beer 0,5 L",
        country: "England - 4%",
        price: 6.8,
      ),
      Beer(
        name: "Kiesbye's - Waldbier 0,33 L",
        country: "Österreich",
        price: 6.5,
      ),
      Beer(
        name: "Ottakringer Citrus Radler 0,5 L",
        country: "Österreich - 2,1%, 9,8°",
        price: 5.7,
      ),
    ],
  ),
  BeerCategory.trappist: BeerCategoryInformation(
    name: "Trappistenbier",
    beers: <Beer>[
      Beer(
        name: "Orval 0,33 L",
        country: "Belgien - 6,2%, 14°",
        price: 6.8,
      ),
    ],
  ),
  BeerCategory.wit: BeerCategoryInformation(
    name: "Weizenbier, White Ale, Wit",
    beers: <Beer>[
      Beer(
        name: "Die Weisse 0,5 L",
        country: "Österreich - 5,2%",
        price: 5.7,
      ),
      Beer(
        name: "Gutmann - Hefeweizen 0,5 L",
        country: "Deutschland - 5,2%, 12°",
        price: 5.7,
      ),
      Beer(
        name: "Einstök - White Ale 0,33 L",
        country: "Island - 5,2%, 12°",
        price: 6.6,
      ),
      Beer(
        name: "Du Bocq - Blanche de Namur 0,33 L",
        country: "Belgien - 4,5%, 10°",
        price: 5.7,
      ),
    ],
  ),
};
