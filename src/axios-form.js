import axios from 'axios';


const instance = axios.create({
    baseURL: 'https://nekretnine-55455-default-rtdb.europe-west1.firebasedatabase.app/'
});

export default instance;
