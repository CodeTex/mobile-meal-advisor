import React, { useCallback, useEffect, useState } from 'react';
import { Alert, Button, Image, Linking, Modal, Pressable, StyleSheet, Text, View } from 'react-native';

import { ScreenProps } from "../models/component.model";
import { Meal } from "../models/data.model";

import { menu, reloadMenu } from "../data/meal.data";
import { pickRandomKey } from '../utils/utils';


function ResultScreen({ route, navigation }: ScreenProps) {

    const { user } = route.params;

    const adUrl: string = "https://www.reddit.com/r/PornMemes/?ref=porndude";

    const [reloadCount, setReloadCount] = useState(0)
    const [reloadBtnLabel, setReloadBtnLabel] = useState("Well, maybe...")
    const [meal, setMeal] = useState<Meal>(menu.schnitzel);
    const [modalVisible, toggleModalVisibility] = useState(false);

    const pickMeal = () => {
        const picked: Meal = pickRandomKey(menu);
        return picked;
    };

    const reloadBtnPress = (): void => {
        setReloadCount(reloadCount + 1)
        switch(reloadCount) {
            case 0:
                setReloadBtnLabel("Where's the Club Sandwich?")
                setMeal({ ...pickMeal(), description: "Got ya haha!"})
                break;
            case 1:
                setReloadBtnLabel("Thanks, but maybe...")
                setMeal(reloadMenu.give_in)
                break;
            case 2: case 3: case 4: case 5: case 6: case 7: case 8: case 9:
                setReloadBtnLabel("Well, still maybe...")
                setMeal({ ...pickMeal(), description: "You're not my favorite customer!"})
                break;
            case 10: case 11: case 12: case 13: case 14:
                setReloadBtnLabel("...")
                setMeal(reloadMenu.stop_it)
                break;
            case 15:
                setReloadBtnLabel("...")
                setMeal(reloadMenu.dead_end)
                break;
            default:
                setReloadBtnLabel(" ")
                setMeal(reloadMenu.dead_dead_end)
                break;
        }
    };

    const restartBtnPress = (): void => {
        navigation.navigate("Home");
    };


    const toggleModal = (modalState: boolean): void => {
        console.log(modalState)
        toggleModalVisibility(!modalState)
    };

    const OpenURLButton = ({ url, children }: {[key: string]: any}) => {
        const handlePress = useCallback(async () => {
        // Checking if the link is supported for links with custom URL scheme.
        const supported = await Linking.canOpenURL(url);

        if (supported) {
        // Opening the link with some app, if the URL scheme is "http" the web link should be opened
        // by some browser in the mobile
        await Linking.openURL(url);
        } else {
        Alert.alert(`Don't know how to open this URL: ${url}`);
        }
    }, [url]);

        return <Button title={children} onPress={handlePress} />;
    };

    useEffect(() => {
        setMeal(pickMeal())
        return () => {
            setReloadCount(0)
        }
    }, []);

    return (
        <View style={[containerStyle.container, generalStyle.primColor]}>
            <View style={[containerStyle.container, generalStyle.primColor, modalVisible && generalStyle.grayedOut]}>
                <View style={[containerStyle.header, generalStyle.flexCenter]}>
                    <Text 
                        style={[elementStyle.screenTitle, reloadCount > 15 && generalStyle.hide]}
                    >{user.name}, for you the AI chose:</Text>
                </View>
                <View style={containerStyle.body}>
                    <View style={[
                        containerStyle.bodyTitle, generalStyle.flexCenter, 
                        generalStyle.fieldBorder, generalStyle.secdColor
                    ]}>
                        <Text style={elementStyle.mealTitle}>{meal.title}</Text>
                    </View>
                    <View style={containerStyle.bodyImage}>
                        <Pressable onPress={() => setMeal(pickMeal())}>
                            <Image source={meal.image} style={elementStyle.mealImage} />
                        </Pressable>
                    </View>
                    <View style={[
                        containerStyle.bodyDescription, generalStyle.fieldBorder, generalStyle.secdColor
                    ]}>
                        <Text style={elementStyle.mealDescription}>{meal.description}</Text>
                    </View>
                </View>
                <View style={[containerStyle.footer, generalStyle.flexCenter]}>
                    <View style={containerStyle.footerRow}>
                        <Pressable 
                            onPress={reloadBtnPress} 
                            style={[elementStyle.button, generalStyle.secdColor]}
                        >
                            <Text style={elementStyle.buttonLabel}>{reloadBtnLabel}</Text>
                        </Pressable>
                        <Pressable 
                            onPress={restartBtnPress} 
                            style={[
                                elementStyle.button, generalStyle.secdColor,
                                reloadCount > 5 && generalStyle.hide
                            ]}
                        >
                            <Text style={elementStyle.buttonLabel}>Back to Start</Text>
                        </Pressable>
                    </View>
                </View>
                {/* Modal pop up button */}
                <Pressable 
                    style={[elementStyle.popUpButton, generalStyle.flexCenter]}
                    onPress={() => toggleModalVisibility(!modalVisible)}
                >
                    <Text style={{color:'#8A570A', fontSize:2}}>👾</Text>
                </Pressable>
            </View>
            
            {/* Modal */}
            <Modal
                animationType='slide'
                transparent={true}
                visible={modalVisible}
                onRequestClose={() => toggleModalVisibility(!modalVisible)}
            >
                <View style={[containerStyle.modal]}>
                    <Image source={require('../assets/img/geralt_fuck.jpg')} style={elementStyle.modalImage}></Image>
                    <View style={elementStyle.modalButton}>
                        <Pressable 
                            onPress={() => toggleModalVisibility(!modalVisible)}
                        >
                            <Text style={{color:'#8A570A', fontSize: 2}}>👾</Text>
                        </Pressable>
                    </View>
                </View>
            </Modal>
        </View>
    );
}

const containerStyle = StyleSheet.create({
    container: {
        flexDirection: 'column',
        flex: 1
    },
    header: {
        flex: 1,
    },
    body: {
        flex: 6,
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'stretch',
    },
    bodyTitle: {
        flex: 1,
        marginHorizontal: 20,
        marginVertical: 10,
        paddingHorizontal: 10,
        paddingVertical: 5, 
        borderRadius: 5
    },
    bodyImage: {
        flex: 6,
        justifyContent: 'center'
    },
    bodyDescription: {
        flex: 3,
        margin: 10,
        padding: 10,
    },
    footer: {
        flex: .8,
    },
    footerRow: {
        flexDirection: 'row',
        flexWrap: 'wrap'
    },
    modal: {
        display: 'flex', 
        justifyContent: 'space-between',
        alignItems: 'center',
        margin: 20,
        marginTop: 35,
        backgroundColor: "#000",
        borderRadius: 20,
        padding: 25,
        paddingTop: 45,
        height: '80%',
        shadowColor: "#000",
        shadowOffset: {
            width: 0,
            height: 2
        },
        shadowOpacity: 0.25,
        shadowRadius: 4,
        elevation: 5
    }
})

const elementStyle = StyleSheet.create({
    screenTitle: {
        fontSize: 18, fontWeight: '600'
    },
    mealTitle: {
        fontSize: 24,
        fontWeight: '700',
    },
    mealImage: {
        height: 250,
        width: 400
    },
    mealDescription: {
        textAlign: 'left'
    },
    button: {
        justifyContent: 'center',
        alignItems: 'center',
        paddingHorizontal: 8,
        paddingVertical: 6,
        borderRadius: 4,
        marginHorizontal: '1%',
        marginBottom: 6,
        minWidth: '33%',
        textAlign: 'center',
        borderColor: '#8A570A',
        borderWidth: .5
    },
    buttonLabel: {
        fontSize: 12,
        fontWeight: '600',
        color: 'black'
    },
    popUpButton: {
        position: 'absolute',
        top: 40,
        right: 5,
        height: 25,
        width: 25,
        borderRadius: 25
    },
    modalImage: {
        height: '80%',
        width: '100%',
    },
    modalButton: {
    }
})

const generalStyle = StyleSheet.create({
    flexCenter: {
        display: 'flex', 
        justifyContent: 'center',
        alignItems: 'center',
    },
    fieldBorder: {
        borderRadius: 4,
        borderColor: '#8A570A',
        borderStyle: 'solid',
        borderBottomWidth: .5,
        borderLeftWidth: 2,
        borderRightWidth: 2,
        borderTopWidth: .5,
    },
    hide: {
        display: 'none'
    },
    grayedOut: {
        backgroundColor: 'black',
        opacity: .5
    },
    primColor: {
        backgroundColor: '#F5BE6B'
    },
    secdColor: {
        backgroundColor: '#FEF9F1'
    }
})

export default ResultScreen;