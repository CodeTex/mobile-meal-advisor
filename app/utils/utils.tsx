import { Meals } from "../models/data.model";

export const randint = (min: number, max: number): number => {
    return Math.floor(Math.random() * (max - min)) + min
}

export const pickRandomKey = (obj: Meals) => {
        const keys: Array<string> = Object.keys(obj);
        return obj[keys[ keys.length * Math.random() << 0]];
    }