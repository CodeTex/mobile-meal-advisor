import React, { useEffect, useState } from 'react';
import { Image, ImageBackground, Pressable, StyleSheet, Text, TextInput, View } from 'react-native';

import { getUser } from '../components/userInteraction';

import { ScreenProps } from "../models/component.model";
import { randint } from '../utils/utils';


function WelcomeScreen({ navigation }: ScreenProps) {
    const [userName, setUserName] = useState('');
    const [btnLabel, setBtnLabel] = useState('');

    const buttonLabel: Array<string> = [
        "Choose the ideal meal",
        "Let SenpAI™ do the work",  // longest string
        "Bibi, hex hex!"
    ];

    const btnPress = (name: string): void => {
        navigation.navigate("Search", {
            user: getUser(name)
        })
    };

    useEffect(() => {
        setBtnLabel(buttonLabel[randint(0, buttonLabel.length)])
    }, []);

    return (
        <View style={containerStyle.container}>
            <ImageBackground
                style={elementStyle.background}
                source={require('../assets/img/welcome-background.jpg')}>

                <View style={containerStyle.content}>
                    <View style={[containerStyle.title, elementStyle.flexCenter]}>
                        <Image source={require("../assets/logo.png")}></Image>
                    </View>
                    <View style={[containerStyle.input, elementStyle.flexCenter]}>
                        <TextInput
                            style={[elementStyle.input, elementStyle.border]}
                            onChangeText={setUserName}
                            placeholder='Enter your name'
                            value={userName}
                        />
                    </View>
                    <View style={[containerStyle.button, elementStyle.flexCenter, elementStyle.border]}>
                        <Pressable onPress={() => btnPress(userName)}>
                            <Text style={elementStyle.buttonLabel}>{btnLabel}</Text>
                        </Pressable>
                    </View>
                </View>

            </ImageBackground>
        </View>
    );
}

const containerStyle = StyleSheet.create({
    container: {
        flex:1 , 
        justifyContent: 'center', 
        alignItems: 'center'
    },
    content: {
        flex: 1,
        width: '60%',
        marginTop: '20%',
        alignItems: 'center'
    },
    title: {
        height: 100,
        width: '100%',
        marginBottom: '15%'
    },
    input: {
        height: 40,
        width: '80%',
        margin: 20,
    },
    button: {
        height: 45,
        width: '100%',
        paddingHorizontal: 10,
        backgroundColor: '#DDA768'
    }
});

const elementStyle = StyleSheet.create({
    background: { 
        width: '110%', 
        height: '100%', 
        justifyContent: 'center', 
        alignItems: 'center',
        position: 'absolute'
    },
    title: {
        color: 'black',
        fontSize: 42,
        fontWeight: '700'
    },
    input: {
        height: '100%',
        width: '100%',
        paddingLeft: 10,
        backgroundColor: '#F4DDA4'
    },
    buttonLabel: {
        fontSize: 20,
        fontWeight: '600',
        color: '#774C0A'
    },
    flexCenter: {
        justifyContent: 'center',
        alignItems: 'center'
    },
    border: {
        borderColor: '#8A570A',
        borderStyle: 'solid',
        borderWidth: .4,
        borderRadius: 4,
    }
});

export default WelcomeScreen;