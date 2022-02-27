import React, { useEffect, useState } from 'react';
import { Image, ImageBackground, Pressable, StyleSheet, Text, TextInput, View } from 'react-native';

import { getUser } from '../components/userInteraction';

import { ScreenProps } from "../models/component.model";
import { randint } from '../utils/utils';


function WelcomeScreen({ navigation }: ScreenProps) {
    const [userName, setUserName] = useState('');
    const [btnLabel, setBtnLabel] = useState('');

    const buttonLabel: Array<string> = [
        "Choose my meal",
        "Let SenpAI™ do the work",  // longest string
        "Bibi, hex hex!",
        "Gimme recommendation",
        "Work, bitch!"
    ];

    const backgroundImage: Array<NodeRequire> = [
        require('../assets/img/welcome/chicken-burger.png'),
        require('../assets/img/welcome/gray-bowl.jpg'),
        require('../assets/img/welcome/ice-cream.jpg'),
        require('../assets/img/welcome/raspberry-cake.png'),
        require('../assets/img/welcome/steak.jpg')
    ];

    const [bgImg, setBgImg] = useState(backgroundImage[0]);

    const btnPress = (name: string): void => {
        navigation.navigate("Search", {
            user: getUser(name)
        })
    };

    useEffect(() => {
        setBtnLabel(buttonLabel[randint(0, buttonLabel.length)])
        setBgImg(backgroundImage[randint(0, backgroundImage.length)])
    }, []);

    return (
        <View style={containerStyle.container}>
            <ImageBackground
                style={elementStyle.background}
                source={bgImg}
                >
                <View style={containerStyle.content}>
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
        position: 'absolute',
        bottom: 15, 
        left: '20%',
        height: '15%',
        width: '60%',
        alignItems: 'center',
        justifyContent: 'space-between'
    },
    input: {
        height: 40,
        width: '80%',
    },
    button: {
        height: 45,
        width: '100%',
        paddingHorizontal: 10,
        backgroundColor: '#EDF3F8'
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
    input: {
        height: '100%',
        width: '100%',
        paddingLeft: 10,
        backgroundColor: '#EDF3F8'
    },
    buttonLabel: {
        fontSize: 20,
        fontWeight: '600',
        color: '#000'
    },
    flexCenter: {
        justifyContent: 'center',
        alignItems: 'center'
    },
    border: {
        borderColor: '#000',
        borderStyle: 'solid',
        borderWidth: .4,
        borderRadius: 4,
    }
});

export default WelcomeScreen;