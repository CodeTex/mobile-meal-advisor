export type Meal = {
    image: any,
    title: string, 
    description: string
};

export type Meals = {[key: string]: Meal};

export type UserMap = Map<string, string>