export type Meal = {
    image: any,
    title: string, 
    description: string,
    price: number
};

export type Meals = {[key: string]: Meal};

export type UserMap = Map<string, string>;

export type User = {
    name: string,
    greeting: string,
    gif: NodeRequire
}