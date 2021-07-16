export type Meal = {
    image: NodeRequire,
    title: string, 
    description: string
};

export type Meals = {[key: string]: Meal};

export type UserMap = Map<string, string>;

export type User = {
    name: string,
    greeting: string,
    gif: NodeRequire
}