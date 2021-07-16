import React, { useEffect, useState } from 'react';
import { Image, StyleSheet, Text, View } from 'react-native';
import { ScreenProps } from '../models/screen.model';


function SearchingScreen({ route, navigation }: ScreenProps) {

    const { userName } = route.params;

    const [text, setText] = useState("")
    const [gifSrc, setGifSrc] = useState(require("../assets/calc_gif.gif"))

    const titleText = (name: string) => {
        switch(name.toLowerCase()) {
            case "alex":
                return "She who Shronks, welcome!"
            case "bernd":
                return "The ever-afloat-heckling-buoy, ahoi!"
            case "christian":
                return "The Dr. Rodenbach himself, at your service!"
            case "":
            case "enter your name":
                return "No name entered, well keep your secrets then..."
            case "julian":
                return "At your service, my liege!"
            default:
                return "Don't know you, I'll keep an eye on your."
        }
    }

    const randomDuration = (min: number, max: number) => {
        return Math.floor(Math.random() * (max - min)) + min
    }

    const onScreenLoad = (seconds: number) => {
        setTimeout(() => {
            navigation.navigate("Result")
        }, seconds * 1000)
    }

    useEffect(() => {
        setText(titleText(userName.userName));
        // onScreenLoad(randomDuration(1, 10))
    }, [])

    return (
        <View style={styles.container}>
            <Text style={styles.nameText}>{text}</Text>
            <Image source={gifSrc} />
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
    nameText: {
        fontSize: 24,
        fontWeight: '600',
        marginBottom: 40,
        marginHorizontal: 20
    }
})

export default SearchingScreen;