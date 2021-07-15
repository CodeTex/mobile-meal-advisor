import React from 'react';
import { Button, ImageBackground, StyleSheet, Text, TextInput, View } from 'react-native';

function WelcomeScreen() {
    const [text, onChangeText] = React.useState("Useless Text");

    return (
        <View style={styles.container}>
            <ImageBackground
                style={styles.background}
                source={require('../assets/welcome-background.jpg')}>

                <Text style={styles.titleText}>Meal Advisor AI</Text>
                <View style={styles.inputContainer}>
                    <TextInput
                        style={styles.input}
                        onChangeText={onChangeText}
                        value={text}
                    />
                    <Button
                        onPress={() => console.log("Button clicked.")}
                        title="Choose for me, senp'ai'"
                        color="#D1A641"
                    />
                </View>

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
        position: 'absolute',
        top: '20%',
        color: 'black',
        fontSize: 34,
        fontWeight: '700'
    },
    inputContainer: {
        position: 'absolute',
        top: '30%'
    },
    input: {
        height: 40,
        width: 200,
        paddingLeft: 10,
        margin: 15,
        borderWidth: 1,
        borderRadius: 4,
        marginBottom: 40
    }
})

export default WelcomeScreen;