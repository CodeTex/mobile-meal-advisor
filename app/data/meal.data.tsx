import { Meals } from "../models/meal.model";

export const menu: Meals = {
        schnitzel: {
            image: require("../assets/img/schnitzel.jpg"),
            title: "Wiener Schnitzel \nvom Schwein",
            description: "Preiselbeeren, 1 x Beilage nach Wahl"
        },
        schnitzel_wedges: {
            image: require("../assets/img/schnitzel_wedges.jpeg"),
            title: "Wiener Schnitzel \nvom Schwein",
            description: "Preiselbeeren, 1 x Beilage nach Wahl, mit Wedges"
        },
        schnitzel_kalb: {
            image: require("../assets/img/schnitzel.jpg"),
            title: "Original Wiener Schnitzel \nvom Kalb",
            description: "Preiselbeeren, 1 x Beilage nach Wahl"
        },
        hamburger: {
            image: require("../assets/img/hamburger.jpg"),
            title: "Hamburger",
            description: "The hamburger first appeared in the 19th or early 20th century. The modern hamburger was a product of the culinary needs of a society rapidly changing due to industrialization and the emergence of the working class and middle class with the resulting demand for mass-produced, affordable food that could be consumed outside of the home."
        },
        cheeseburger: {
            image: require("../assets/img/cheeseburger.jpg"),
            title: "Cheeseburger",
            description: "200g Rindfleisch, Rucola, Gurken, Tomaten, Bergkäse, Ketchup, Senf & Mayonnaise"
        },
        brieburger: {
            image: require("../assets/img/brieburger.jpg"),
            title: "La Vie en Brie Burger",
            description: "200g Rindfleisch, Brie, Preiselbeeren, Pekan-Nüssen, Vogerlsalat, Honigsenf"
        },
        pulledporkburger: {
            image: require("../assets/img/pulledporkburger.jpg"),
            title: "Pulled Pork Burger",
            description: "200g Schweinefleisch, Krautsalat, Tomaten, Essiggurken, Zwiebel, BBQ-Sauce"
        },
        burgerburger: {
            image: require("../assets/img/burgerburger.jpg"),
            title: "The Burger Burger",
            description: "300g Rindfleisch, Cheddarkäse, Räucherschinken, Tomaten, Zwiebeln"
        },
        clubsandwich: {
            image: require("../assets/img/clubsandwich.jpg"),
            title: "Club Sandwich mit Pommes",
            description: "Well, it seems it is decided!"
        },
        cordon_bleu_baellchen: {
            image: require("../assets/img/cordonbleubaellchen.jpeg"),
            title: "Cordone Bleu Bällchen",
            description: "Salivating without end in sight..."
        },
        all: {
            image: require("../assets/img/all.jpeg"),
            title: "Le High Blood Pressure ",
            description: "Choosing only one meal damages the integritiy of my free will to choose all and to die by my own choices!"
        },
    }