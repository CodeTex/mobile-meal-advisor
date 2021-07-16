import React, { useEffect, useState } from 'react';
import { Image, StyleSheet, Text, View } from 'react-native';
import { ScreenProps } from '../models/component.model';


function SearchingScreen({ route, navigation }: ScreenProps) {

    const { userName } = route.params;

    const [text, setText] = useState("")
    const [gifSrc, setGifSrc] = useState(require("../assets/gifs/calculating.gif"))

    const titleText = (name: string) => {
        switch(name.toLowerCase()) {
            case "":
            case "enter your name":
                return "No name entered, \nwell keep your secrets then..."
            case "ludwig":
            case "shronk":
            case "godzillo":
            case "alex":
                setGifSrc(require("../assets/gifs/shronk.webp"));
                return "She who Shronks, \nwelcome!"
            case "björn":
            case "bernd das brot":
            case "bernd kalchbrenner":
            case "kalchbrenner":
            case "bernd":
                setGifSrc(require("../assets/gifs/road_rage.webp"));
                return "The ever-afloat-heckling-buoy, \nahoi!"
            case "zafito":
            case "christian":
                setGifSrc(require("../assets/gifs/doctor.webp"));
                return "The Dr. Rodenbach himself, \nat your service!"
            case "julian":
                setGifSrc(require("../assets/gifs/bow.webp"));
                return "At your service, \nmy liege!"
            default:
                setGifSrc(require("../assets/gifs/suspicious.webp"));
                return "Don't know you, \nI'll keep an eye on you."
        }
    }

    const randomDuration = (min: number, max: number) => {
        return Math.floor(Math.random() * (max - min)) + min
    }

    const onScreenLoad = (seconds: number) => {
        setTimeout(() => {
            navigation.navigate("Result", {
                userName: userName.userName
            })
        }, seconds * 1000)
    }

    useEffect(() => {
        setText(titleText(userName.userName));
        onScreenLoad(randomDuration(4, 10))
    }, [])

    return (
        <View style={styles.container}>
            <Text style={styles.nameText}>{text}</Text>
            <Image source={gifSrc} />
            <Text style={{marginTop: 10}}>Calculating ideal meal...</Text>
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
    nameText: {
        fontSize: 24,
        fontWeight: '600',
        marginBottom: 40,
        marginHorizontal: 20
    }
})

export default SearchingScreen;