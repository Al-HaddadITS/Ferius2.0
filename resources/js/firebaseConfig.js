import * as firebase from 'firebase'
import 'firebase/firestore'

// firebase init goes here
const config = {
    apiKey: "AIzaSyAbOA-lg98RPpf14DP_C3OEQEMuRSba5k8",
    authDomain: "feriushrms-3a84b.firebaseapp.com",
    databaseURL: "https://feriushrms-3a84b.firebaseio.com",
    projectId: "feriushrms-3a84b",
    storageBucket: "feriushrms-3a84b.appspot.com",
    messagingSenderId: "1025287994978"
}
firebase.initializeApp(config)

// firebase utils
var storage = firebase.storage();


export {
storage
}
