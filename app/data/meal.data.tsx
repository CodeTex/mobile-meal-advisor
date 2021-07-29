import { Meals } from "../models/data.model";

const flammkuchen: Meals = {
    classico: {
        image: require("../assets/img/nothing-found.jpg"),
        title: "Flammkuchen Classico",
        description: "Mit Speck und Zwiebel",
        price: 12.8
    },
    portofino: {
        image: require("../assets/img/nothing-found.jpg"),
        title: "Flammkuchen Portofino",
        description: "Mit Tomaten, Büffelmozarella und Basilikum, vegetarisch 🌱",
        price: 14.8
    },
    trentino: {
        image: require("../assets/img/nothing-found.jpg"),
        title: "Flammkuchen Trentino",
        description: "Mit Ziegenkäse, Feigen und Rucola, vegetarisch 🌱",
        price: 14.8
    },
    parma: {
        image: require("../assets/img/nothing-found.jpg"),
        title: "Flammkuchen Parma",
        description: "Mit frischem Prosciutto, Rucola und Grana",
        price: 15.8
    },
    napoli: {
        image: require("../assets/img/nothing-found.jpg"),
        title: "Flammkuchen Napoli",
        description: "Mit Spinat und Schafskäse, vegetarisch 🌱",
        price: 13.8
    },
    verona: {
        image: require("../assets/img/nothing-found.jpg"),
        title: "Flammkuchen Verona",
        description: "Mit Tomatensauce, Büffelmozzarella, Thunfisch und roten Zwiebel",
        price: 14.8
    }
};

const burger: Meals = {
    hamburger: {
        image: require("../assets/img/hamburger.jpg"),
        title: "Hamburger",
        description: "200g Rindfeisch, Rucola, Cheddarkäse, geröstete Zwiebel, Tomaten, Prosciutto, rote Rüben & BBQ-Sauce",
        price: 11.9
    },
    cheeseburger: {
        image: require("../assets/img/cheeseburger.jpg"),
        title: "Cheeseburger",
        description: "200g Rindfleisch, Rucola, Gurken, Tomaten, Bergkäse, Ketchup, Senf & Mayonnaise",
        price: 11.9
    },
    brieburger: {
        image: require("../assets/img/brieburger.jpg"),
        title: "La Vie en Brie Burger",
        description: "200g Rindfleisch, Brie, Preiselbeeren, Pekan-Nüssen, Vogerlsalat, Honigsenf",
        price: 11.9
    },
    pulledpork_burger: {
        image: require("../assets/img/pulledporkburger.jpg"),
        title: "Pulled Pork Burger",
        description: "200g Schweinefleisch, Krautsalat, Tomaten, Essiggurken, Zwiebel, BBQ-Sauce",
        price: 12.9
    },
    burger_burger: {
        image: require("../assets/img/burgerburger.jpg"),
        title: "The Burger Burger",
        description: "300g Rindfleisch, Cheddarkäse, Räucherschinken, Tomaten, Zwiebeln",
        price: 15.8
    },
    lachs_burger: {
        image: require("../assets/img/burgerburger.jpg"),
        title: "Lachs Burger",
        description: "180g Lachs, Kren, Zitronen, Mayonnaise, Gurken, Radieschen, Vogerlsalat",
        price: 11.9
    },
    halloumi_burger: {
        image: require("../assets/img/burgerburger.jpg"),
        title: "Halloumi Burger",
        description: "Halloumi Käse, Melanzani, Zwiebel, Paprika, Humus, leicht scharf, vegetarisch 🌱",
        price: 10.8
    }
}

const brote_und_sandwiches: Meals = {
    schnittlauch: {
        image: require("../assets/img/nothing-found.jpg"),
        title: "Großes Schnittlauchbrot",
        description: "Joseph Brot, Butter, Schnittlauch, vegetarisch",
        price: 6.2
    },
    avocado_brot: {
        image: require("../assets/img/nothing-found.jpg"),
        title: "Belegtes Avocado Brot",
        description: "Joseph Brot, Avocado, Tomaten Stücke, Ei, Radieschen (kalt), vegetarisch 🌱",
        price: 9.5
    },
    bier_auftrich: {
        image: require("../assets/img/nothing-found.jpg"),
        title: "Bier-Aufstrich Brot",
        description: "getoastet, scharf, vegetarisch",
        price: 9.5
    },
    joseph: {
        image: require("../assets/img/nothing-found.jpg"),
        title: "Überbackenes Joseph Brot",
        description: "Bauernschinken, Käse, Tomaten, Paprika, Zwiebel",
        price: 11.5
    },
    pastrami: {
        image: require("../assets/img/nothing-found.jpg"),
        title: "Pastrami Baguette",
        description: "Pastrami, Sauerkraut, Gurken, Paprika, Maiskolben, Sauce Tatar, Kren& Pfefferoni",
        price: 11.2
    },
    pide_france: {
        image: require("../assets/img/nothing-found.jpg"),
        title: "Pide France",
        description: "Fladenbrot mit Speckstreifen und Brie",
        price: 7.2
    },
    pide_italia: {
        image: require("../assets/img/nothing-found.jpg"),
        title: "Pide Italia",
        description: "Fladenbrot mit Tomatenstücken, Mozzarella, Basilikum-Pesto, vegetarisch 🌱",
        price: 7.2
    },
    clubsandwich: {
        image: require("../assets/img/clubsandwich.jpg"),
        title: "Club Sandwich mit Pommes",
        description: "Delicous cooked chicken assembled in a jaw-dropping manner.",
        price: 12.5
    }
};

const kleine_happen: Meals = {
    rindfleisch_baellchen: {
        image: require("../assets/img/nothing-found.jpg"),
        title: "Rindfleisch-Bällchen",
        description: "mit Cocktail-Whiskey Sauce (3 STK. €4,80 / 6 STK. €8,90 / 9 STK. €12,50)",
        price: 4.8
    },
    thunfisch_baellchen: {
        image: require("../assets/img/nothing-found.jpg"),
        title: "Thunfisch-Bällchen",
        description: "mit Joghurt-Dill Sauce (3 STK. €4,80 / 6 STK. €8,90 / 9 STK. €12,50)",
        price: 4.8
    },
    ziegenkaese_baellchen: {
        image: require("../assets/img/nothing-found.jpg"),
        title: "Ziegenkäse-Bällchen",
        description: "mit Feigenmarmelade, kalt (3 STK. €4,80 / 6 STK. €8,90 / 9 STK. €12,50)",
        price: 4.8
    },
    salsicce_kaese_baellchen: {
        image: require("../assets/img/nothing-found.jpg"),
        title: "Salsicce-Käse-Bällchen",
        description: "mit Dijon Senf (3 STK. €4,80 / 6 STK. €8,90 / 9 STK. €12,50)",
        price: 4.8
    },
    cordonbleu_baellchen: {
        image: require("../assets/img/cordonbleubaellchen.jpeg"),
        title: "Cordone Bleu Bällchen",
        description: "Salivating without end in sight...",
        price: 0.0
    }
};

const schnitzel: Meals = {
    schnitzel_schwein: {
        image: require("../assets/img/schnitzel.jpg"),
        title: "Wiener Schnitzel (Schwein)",
        description: "Preiselbeeren, 1 x Beilage nach Wahl",
        price: 14.9
    },
    schnitzel_wedges: {
        image: require("../assets/img/schnitzel_wedges.jpeg"),
        title: "Wiener Schnitzel (Schwein)",
        description: "Preiselbeeren, 1 x Beilage nach Wahl, mit Wedges",
        price: 14.9
    },
    schnitzel_kalb: {
        image: require("../assets/img/schnitzel.jpg"),
        title: "Original Wiener Schnitzel",
        description: "Preiselbeeren, 1 x Beilage nach Wahl",
        price: 21.5
    },
};

export const menu: Meals = {
    ...flammkuchen,
    ...kleine_happen,
    ...brote_und_sandwiches,
    ...burger,
    ...schnitzel,
    all: {
        image: require("../assets/img/all.jpeg"),
        title: "Le High Blood Pressure ",
        description: "Choosing only one meal damages the integritiy of my free will to choose all and to die by my own choices!",
        price: 420.69
    },
}

export const reloadMenu: Meals = {
    give_in: {
        image: require("../assets/img/clubsandwich.jpg"),
        title: "Club Sandwich mit Pommes",
        description: "Well, it seems it is decided, no more shenanigans!",
        price: 12.50
    },
    stop_it: {
        image: require("../assets/gifs/stop_it.webp"),
        title: "STOP IT",
        description: "As if clicking on the same button over and over again would solve your deeply rooted issues like choosing a meal. I dare you to keep clicking!" ,
        price: 0.0
    },
    dead_end: {
        image: require("../assets/img/clubsandwich.jpg"),
        title: "CLUB SANDWICH",
        description: "Well, here it is, I'm heading out!",
        price: 12.50
    },
    dead_dead_end: {
        image: require("../assets/gifs/heading_out.webp"),
        title: "F*** YOU",
        description: " . . . ",
        price: 666.66
    }
}