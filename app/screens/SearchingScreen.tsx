import React, { useEffect, useState } from 'react';
import { ActivityIndicator, Button, Image, StyleSheet, Text, View } from 'react-native';
import { ScreenProps } from '../models/component.model';
import { randint } from '../utils/utils';


function SearchingScreen({ route, navigation }: ScreenProps) {

    const { user } = route.params;

    const timeoutModel = (seconds: number): void => {
        setTimeout(() => {
            navigation.navigate("Result", {
                user: user
            })
        }, seconds * 1000)
    };

    const runModel = (model: string): void => {
        switch(model) {
            case 'random':
                timeoutModel(randint(6,12));
                break;
            default:
                timeoutModel(4);
                break;
        }
    };

    useEffect(() => {
        runModel('random');
    }, []);

    return (
        <View style={styles.container}>
            <Text style={styles.greeting}>{user.greeting}</Text>
            <Image source={user.gif} style={styles.gif}/>
            <Text style={styles.message}>Calculating ideal meal ...</Text>
            <View style={{flexDirection: 'row', width: '80%', justifyContent: 'space-around'}}>
                <ActivityIndicator size="large" color="#8A570A"/>
                <Image source={require("../assets/gifs/calculating_01.gif")} style={{width: '40%', height: '100%'}}></Image>
                <ActivityIndicator size="large" color="#8A570A"/>
            </View>
            <View style={{flexDirection: 'row', width: '80%', justifyContent: 'space-around'}}>
                <Image source={require("../assets/gifs/calculating_02.webp")} style={{width: '40%', height: '100%'}}></Image>
                <ActivityIndicator size="large" color="#8A570A"/>
                <Image source={require("../assets/gifs/calculating_02.webp")} style={{width: '40%', height: '100%'}}></Image>
            </View>
            <View style={{flexDirection: 'row', width: '80%', justifyContent: 'space-around'}}>
                <ActivityIndicator size="large" color="#8A570A"/>
                <Image source={require("../assets/gifs/calculating_01.gif")} style={{width: '40%', height: '100%'}}></Image>
                <ActivityIndicator size="large" color="#8A570A"/>
            </View>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#F5BE6B',
        justifyContent: 'center',
        alignItems: 'center'
    },
    greeting: {
        fontSize: 22,
        fontWeight: '500',
        marginBottom: 40,
        marginHorizontal: 20,
        textAlign: 'center'
    },
    gif: {
        height: '50%',
        width: '100%'
    },
    message: {
        margin: 30
    }
})

export default SearchingScreen;