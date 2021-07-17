import React, { useEffect, useState } from 'react';
import { Image, Pressable, StyleSheet, Text, View } from 'react-native';

import { ScreenProps } from "../models/component.model";
import { Meal, Meals } from "../models/data.model";

import { menu } from "../data/meal.data";
import { pickRandomKey } from '../utils/utils';


function ResultScreen({ route, navigation }: ScreenProps) {

    const { user } = route.params;

    const [meal, setMeal] = useState<Meal>(menu.schnitzel);

    const pickMeal = () => {
        const picked: Meal = pickRandomKey(menu);
        return picked;
    }

    useEffect(() => {
        setMeal(pickMeal())
    }, [])

    return (
        <View style={[containerStyle.container, generalStyle.primColor]}>
            <View style={[containerStyle.header, generalStyle.flexCenter]}>
                <Text style={{fontSize: 18, fontWeight: '600'}}>{user.name}, the AI choose: </Text>
            </View>
            <View style={containerStyle.body}>
                <View style={[
                    containerStyle.bodyTitle, generalStyle.flexCenter, 
                    generalStyle.fieldBorder, generalStyle.secdColor
                ]}>
                    <Text style={elementStyle.mealTitle}>{meal.title}</Text>
                </View>
                <View style={containerStyle.bodyImage}>
                    <Pressable onPress={() => setMeal(pickMeal())}>
                        <Image source={meal.image} style={elementStyle.mealImage} />
                    </Pressable>
                </View>
                <View style={[
                    containerStyle.bodyDescription, generalStyle.fieldBorder, generalStyle.secdColor
                ]}>
                    <Text style={elementStyle.mealDescription}>{meal.description}</Text>
                </View>
            </View>
            <View style={[containerStyle.footer, generalStyle.flexCenter]}>
                <View style={containerStyle.footerRow}>
                    <Pressable 
                        onPress={() => setMeal(menu.clubsandwich)} 
                        style={[elementStyle.button, generalStyle.secdColor]}
                    >
                        <Text style={elementStyle.buttonLabel}>Well, maybe...</Text>
                    </Pressable>
                    <Pressable 
                        onPress={() => navigation.navigate("Home")} 
                        style={[elementStyle.button, generalStyle.secdColor]}
                    >
                        <Text style={elementStyle.buttonLabel}>Back to Start</Text>
                    </Pressable>
                </View>
            </View>
        </View>
    );
}

const containerStyle = StyleSheet.create({
    container: {
        flexDirection: 'column',
        flex: 1
    },
    header: {
        flex: 1,
    },
    body: {
        flex: 6,
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'stretch',
    },
    bodyTitle: {
        flex: 1,
        marginHorizontal: 20,
        marginVertical: 10,
        paddingHorizontal: 10,
        paddingVertical: 5, 
        borderRadius: 5
    },
    bodyImage: {
        flex: 6,
        justifyContent: 'center'
    },
    bodyDescription: {
        flex: 3,
        margin: 10,
        padding: 10,
    },
    footer: {
        flex: .8,
    },
    footerRow: {
        flexDirection: 'row',
        flexWrap: 'wrap'
    }
})

const elementStyle = StyleSheet.create({
    mealTitle: {
        fontSize: 24,
        fontWeight: '700',
    },
    mealImage: {
        height: 250,
        width: 400
    },
    mealDescription: {
        textAlign: 'left'
    },
    button: {
        paddingHorizontal: 8,
        paddingVertical: 6,
        borderRadius: 4,
        marginHorizontal: '1%',
        marginBottom: 6,
        minWidth: '33%',
        textAlign: 'center',
        borderColor: '#8A570A',
        borderWidth: .5
    },
    buttonLabel: {
        fontSize: 12,
        fontWeight: '600',
        color: 'black'
    }
})

const generalStyle = StyleSheet.create({
    flexCenter: {
        display: 'flex', 
        justifyContent: 'center',
        alignItems: 'center',
    },
    fieldBorder: {
        borderRadius: 4,
        borderColor: '#8A570A',
        borderStyle: 'solid',
        borderBottomWidth: .5,
        borderLeftWidth: 2,
        borderRightWidth: 2,
        borderTopWidth: .5,
    },
    primColor: {
        backgroundColor: '#F5BE6B'
    },
    secdColor: {
        backgroundColor: '#FEF9F1'
    }
})

export default ResultScreen;