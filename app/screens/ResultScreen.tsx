import React, { useEffect, useState } from 'react';
import { Button, Image, StyleSheet, Text, View } from 'react-native';

import { ScreenProps } from "../models/screen.model";
import { Meal, Meals } from "../models/meal.model";

import { menu } from "../assets/meal.data";


function ResultScreen({ navigation }: ScreenProps) {

    

    const [meal, setMeal] = useState<Meal>(menu.schnitzel);

    const pickRandomKey = (obj: Meals) => {
        const keys: Array<string> = Object.keys(obj);
        return obj[keys[ keys.length * Math.random() << 0]];
    }

    const pickMeal = () => {
        const picked: Meal = pickRandomKey(menu);
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
                    onPress={() => setMeal(menu.clubsandwich)}
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