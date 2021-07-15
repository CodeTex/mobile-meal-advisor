import React from 'react';
import { StyleSheet, Text, View } from 'react-native';

import { ScreenProps } from "../models/screen.model";


function ResultScreen({ navigation }: ScreenProps) {
    return (
        <View style={styles.container}>
            <Text>Result</Text>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: 'red',
    }
})

export default ResultScreen;