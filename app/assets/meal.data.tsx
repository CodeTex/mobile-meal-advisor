import { Meals } from "../models/meal.model";

export const menu: Meals = {
        schnitzel: {
            image: require("./meals/schnitzel.jpg"),
            title: "WIENER SCHNITZEL VOM SCHWEIN",
            description: "Preiselbeeren, 1 x Beilage nach Wahl"
        },
        schnitzel_kalb: {
            image: require("./meals/schnitzel.jpg"),
            title: "ORIGINAL WIENER SCHNITZEL VOM KALB",
            description: "Preiselbeeren, 1 x Beilage nach Wahl"
        },
        hamburger: {
            image: require("./meals/hamburger.jpg"),
            title: "Hamburger",
            description: "The hamburger first appeared in the 19th or early 20th century. The modern hamburger was a product of the culinary needs of a society rapidly changing due to industrialization and the emergence of the working class and middle class with the resulting demand for mass-produced, affordable food that could be consumed outside of the home."
        },
        cheeseburger: {
            image: require("./meals/cheeseburger.jpg"),
            title: "Cheeseburger",
            description: "200g Rindfleisch, Rucola, Gurken, Tomaten, Bergkäse, Ketchup, Senf & Mayonnaise"
        },
        brieburger: {
            image: require("./meals/brieburger.jpg"),
            title: "LA VIE EN BRIE BURGER",
            description: "200g Rindfleisch, Brie, Preiselbeeren, Pekan-Nüssen, Vogerlsalat, Honigsenf"
        },
        pulledporkburger: {
            image: require("./meals/pulledporkburger.jpg"),
            title: "PULLED PORK BURGER",
            description: "200g Schweinefleisch, Krautsalat, Tomaten, Essiggurken, Zwiebel, BBQ-Sauce"
        },
        burgerburger: {
            image: require("./meals/burgerburger.jpg"),
            title: "THE BURGER BURGER",
            description: "300g Rindfleisch, Cheddarkäse, Räucherschinken, Tomaten, Zwiebeln"
        },
        clubsandwich: {
            image: require("./meals/clubsandwich.jpg"),
            title: "CLUB SANDWICH MIT POMMES",
            description: "Well, it seems it is decided!"
        },
    }