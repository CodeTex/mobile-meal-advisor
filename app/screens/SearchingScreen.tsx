import React, { useEffect } from 'react';
import { Image, StyleSheet, View } from 'react-native';
import { ScreenProps } from '../models/screen.model';


function SearchingScreen({ navigation }: ScreenProps) {

    const randomDuration = (min: number, max: number) => {
        return Math.floor(Math.random() * (max - min)) + min
    }

    const onScreenLoad = (seconds: number) => {
        setTimeout(() => {
            navigation.navigate("Result")
        }, seconds * 1000)
    }

    useEffect(() => {
        onScreenLoad(randomDuration(1, 10))
    }, [])

    return (
        <View style={styles.container}>
            <Image source={require("../assets/calc_gif.gif")} />
            <Image source={require("../assets/calc_gif.gif")} />
            <Image source={require("../assets/calc_gif.gif")} />
            <Image source={require("../assets/calc_gif.gif")} />
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: 'black',
        opacity: 0.8,
        justifyContent: 'center',
        alignItems: 'center'
    }
})

export default SearchingScreen;