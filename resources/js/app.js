import Vuetify from 'vuetify'
import Axios from 'axios'
import store from './store'
import router from './router'
import { createSimpleTransition } from 'vuetify/es5/util/helpers'
import 'vuetify/dist/vuetify.min.css'

import VeeValidate from 'vee-validate'


// import VueMce from 'vue-mce'


// var EditorTui = require('tui-editor');


/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');
window.axios = require('axios');
Vue.use(Vuetify)
Vue.use(VeeValidate)

// Vue.use(VueMce)

const myTransition = createSimpleTransition('my-transition')
/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */



const files = require.context('./', true, /\.vue$/i)

files.keys().map(key => {
    return Vue.component(_.last(key.split('/')).split('.')[0], files(key))
})

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
    router,
    store
});


