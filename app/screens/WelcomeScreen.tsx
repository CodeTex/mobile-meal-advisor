import React from 'react';

import { ImageBackground, StyleSheet, Text, View } from 'react-native';

function WelcomeScreen() {
    return (
        <View style={styles.container}>
            <ImageBackground
                style={styles.background}
                source={require('../assets/welcome-background.jpg')}>

                <Text style={styles.titleText}>Meal Advisor AI</Text>

            </ImageBackground>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex:1 , 
        justifyContent: 'center', 
        alignItems: 'center'
    },
    background: { 
        width: '110%', 
        height: '100%', 
        justifyContent: 'center', 
        alignItems: 'center' 
    },
    titleText: {
        color: 'black',
        fontSize: 34
    }
})

export default WelcomeScreen;