import React, { useEffect, useState } from 'react';
import { Button, Image, StyleSheet, Text, TouchableHighlight, View } from 'react-native';

import { ScreenProps } from "../models/screen.model";
import { Meal, Meals } from "../models/meal.model";

import { menu } from "../data/meal.data";


function ResultScreen({ route, navigation }: ScreenProps) {

    const { userName } = route.params;

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
            <View style={styles.title}>
                <Text style={{fontSize: 30, fontWeight: 'bold'}}>The AI has decided</Text>
                <Text style={{fontSize: 32, fontWeight: 'bold'}}>{userName}</Text>
            </View>
            <View style={styles.resultContainer}>
                <Text style={styles.resultTitle}>{meal.title}</Text>
                <TouchableHighlight onPress={() => setMeal(pickMeal())}>
                    <Image style={styles.resultImage} source={meal.image}></Image>
                </TouchableHighlight>
                <Text style={styles.resultDescription}>{meal.description}</Text>
            </View>
            <View style={styles.buttonContainer}>
                <Button
                    onPress={() => setMeal(menu.clubsandwich)}
                    title="Well, maybe..."
                    color="#D1A641"
                />
            </View>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#F2BD71',
        justifyContent: 'center',
        alignItems: 'center'
    },
    title: {
        position: 'absolute',
        top: 20,
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center'
    },
    resultContainer: {
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center'
    },
    resultTitle: {
        fontSize: 22,
        fontWeight: 'bold',
        marginBottom: 20,
        marginHorizontal: 20,
        textAlign: 'center'
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