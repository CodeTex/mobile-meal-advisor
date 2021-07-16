import React, { useEffect, useState } from 'react';
import { Button, Image, StyleSheet, Text, View } from 'react-native';

import { ScreenProps } from "../models/screen.model";


type Meal = {
    image: any,
    title: string, 
    description: string
};

type Meals = {[key: string]: Meal};


function ResultScreen({ navigation }: ScreenProps) {

    const meals: Meals = {
        schnitzel: {
            image: require("../assets/meals/schnitzel.jpg"),
            title: "WIENER SCHNITZEL VOM SCHWEIN",
            description: "Preiselbeeren, 1 x Beilage nach Wahl"
        },
        schnitzel_kalb: {
            image: require("../assets/meals/schnitzel.jpg"),
            title: "ORIGINAL WIENER SCHNITZEL VOM KALB",
            description: "Preiselbeeren, 1 x Beilage nach Wahl"
        },
        hamburger: {
            image: require("../assets/meals/hamburger.jpg"),
            title: "Hamburger",
            description: "The hamburger first appeared in the 19th or early 20th century. The modern hamburger was a product of the culinary needs of a society rapidly changing due to industrialization and the emergence of the working class and middle class with the resulting demand for mass-produced, affordable food that could be consumed outside of the home."
        },
        cheeseburger: {
            image: require("../assets/meals/cheeseburger.jpg"),
            title: "Cheeseburger",
            description: "200g Rindfleisch, Rucola, Gurken, Tomaten, Bergkäse, Ketchup, Senf & Mayonnaise"
        },
        brieburger: {
            image: require("../assets/meals/brieburger.jpg"),
            title: "LA VIE EN BRIE BURGER",
            description: "200g Rindfleisch, Brie, Preiselbeeren, Pekan-Nüssen, Vogerlsalat, Honigsenf"
        },
        pulledporkburger: {
            image: require("../assets/meals/pulledporkburger.jpg"),
            title: "PULLED PORK BURGER",
            description: "200g Schweinefleisch, Krautsalat, Tomaten, Essiggurken, Zwiebel, BBQ-Sauce"
        },
        burgerburger: {
            image: require("../assets/meals/burgerburger.jpg"),
            title: "THE BURGER BURGER",
            description: "300g Rindfleisch, Cheddarkäse, Räucherschinken, Tomaten, Zwiebeln"
        },
        clubsandwich: {
            image: require("../assets/meals/clubsandwich.jpg"),
            title: "CLUB SANDWICH MIT POMMES",
            description: "Well, it seems it is decided!"
        },
    }

    const [meal, setMeal] = useState<Meal>(meals.schnitzel);

    const pickRandomKey = (obj: Meals) => {
        const keys: Array<string> = Object.keys(obj);
        return obj[keys[ keys.length * Math.random() << 0]];
    }

    const pickMeal = () => {
        const picked: Meal = pickRandomKey(meals);
        // console.log(picked)
        return picked;
    }

    useEffect(() => {
        setMeal(pickMeal())
    }, [])

    return (
        <View style={styles.container}>
            <Text style={styles.title}>Result</Text>
            <View style={styles.resultContainer}>
                <Text style={styles.resultTitle}>{meal.title}</Text>
                <Image style={styles.resultImage} source={meal.image}></Image>
                <Text style={styles.resultDescription}>{meal.description}</Text>
            </View>
            <View style={styles.buttonContainer}>
                <Button
                    onPress={() => setMeal(meals.clubsandwich)}
                    title="Well, maybe.."
                    color="#D1A641"
                />
            </View>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#F4953E',
        justifyContent: 'center',
        alignItems: 'center'
    },
    title: {
        position: 'absolute',
        top: '10%',
        fontWeight: '700',
        fontSize: 36
    },
    resultContainer: {
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center'
    },
    resultTitle: {
        fontSize: 24,
        fontWeight: 'bold',
        marginBottom: 20
    },
    resultImage: {
        height: 200,
        width: 400
    },
    scrollView: {
        marginBottom: 80,
        width: 300
    },
    resultDescription: {
        marginTop: 20,
        marginHorizontal: 20
    },
    buttonContainer: {
        position: "absolute",
        bottom: 20,
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'flex-end'
    }
})

export default ResultScreen;