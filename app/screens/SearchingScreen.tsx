import React, { useEffect } from 'react';
import { Image, StyleSheet, Text, View } from 'react-native';
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
            <Image source={require('../assets/gifs/loading-48.gif')} style={styles.loadingGif}></Image>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#001E31',
        justifyContent: 'center',
        alignItems: 'center'
    },
    greeting: {
        color: '#E1E5EA',
        fontSize: 22,
        fontWeight: '500',
        marginBottom: 40,
        marginHorizontal: 20,
        textAlign: 'center'
    },
    gif: {
        height: '30%',
        width: '90%'
    },
    message: {
        color: '#E1E5EA',
        marginTop: 50
    },
    loadingGif: {
        marginTop: 50,
        height: '30%',
        width: '50%'
    },
})

export default SearchingScreen;