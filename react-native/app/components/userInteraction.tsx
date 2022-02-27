import { userMap } from "../data/user.map"
import { User, UserMap } from "../models/data.model"



const getInternalName = (user: string, map: UserMap = userMap): string => {
    return map.get(user) || user;
}

export const getUser = (user: string): User => {

    user = getInternalName(user)

    let selectedUser: User = {
        name: user,
        greeting: 'New in town, eh?',
        gif: require("../assets/gifs/hello.webp")
    }

    switch(user.toLowerCase()) {
        case 'jester':
            selectedUser['greeting'] = 'A funny one, eh?\nKeeping my lenses on you!';
            selectedUser['gif'] = require("../assets/gifs/suspicious.webp");
            break;
        case 'idiot':
            selectedUser['greeting'] = "Do you know what a rethorical question is?\nOf course not, you're an idiot.";
            selectedUser['gif'] = require("../assets/gifs/dean_pelton.webp");
            break;
        case 'alex':
            selectedUser['greeting'] = 'It is she who shronketh,\nwelcome!';
            selectedUser['gif'] = require("../assets/gifs/shronk.webp");
            break;
        case 'bernd':
            selectedUser['greeting'] = 'The most even-tempered buoy,\nahoy!';
            selectedUser['gif'] = require("../assets/gifs/road_rage.webp");
            break;
        case 'christian':
            selectedUser['greeting'] = 'Dr. Rodenbach I presume,\nmay your sanity persevere!';
            selectedUser['gif'] = require("../assets/gifs/dentist.webp");
            break;
        case 'julian':
            selectedUser['greeting'] = 'At your service,\nmy liege';
            selectedUser['gif'] = require("../assets/gifs/bow.webp");
            break;
        case 'coco':
            selectedUser['greeting'] = 'The new cowboy in town,\nbring it on Coco!';
            selectedUser['gif'] = require("../assets/gifs/cowboy_cat.webp");
            break;
        case 'blue':
            selectedUser['greeting'] = "Duchess Blue,\nI'm at your service!";
            selectedUser['gif'] = require("../assets/gifs/party_cat.gif");
            break;
        case 'emil':
            selectedUser['greeting'] = 'Ah the feisty Emil,\nen garde!';
            selectedUser['gif'] = require("../assets/gifs/puss_in_boots.webp");
            break;
    }

    return selectedUser
}
