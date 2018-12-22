import Vuetify from 'vuetify'
import Axios from 'axios'
import store from './store'
import router from './router'
import { createSimpleTransition } from 'vuetify/es5/util/helpers'
import 'tui-editor/dist/tui-editor.css'
import 'tui-editor/dist/tui-editor-contents.css'
import 'codemirror/lib/codemirror.css'
import { Editor } from '@toast-ui/vue-editor'
import Icon from './components/Icon'
import 'vuetify/dist/vuetify.min.css'
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');
window.axios = require('axios');
Vue.use(Vuetify)
const myTransition = createSimpleTransition('my-transition')
/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */


// //  admin
// Vue.component('admin_home', require('./components/admin_home'));
// // employees
// Vue.component('admin_create_emp', require('./components/admin/employees/admin_create_emp.vue'));
// Vue.component('admin_employee', require('./components/admin/employees/admin_employee.vue'));
// // departments
// Vue.component('admin_departments', require('./components/admin/departments/admin_departments.vue'));

// // dashboard
// Vue.component('admin_dashboard', require('./components/admin/dashboard/admin_dashboard.vue'));
// Vue.component('actionCenter', require('./components/admin/dashboard/actionCenter.vue'));
// Vue.component('centerDash', require('./components/admin/dashboard/centerDash.vue'));
// Vue.component('dashEvents', require('./components/admin/dashboard/dashEvents.vue'));
// Vue.component('cards', require('./components/admin/dashboard/cards.vue'));
// Vue.component('admin_myteam', require('./components/admin/dashboard/admin_myteam.vue'));
// // navigation
// Vue.component('admin_navbar', require('./components/admin/navigation/admin_navbar.vue'));
// Vue.component('admin_navbar_lg', require('./components/admin/navigation/admin_navbar_lg.vue'));
// Vue.component('admin_navbar_sm', require('./components/admin/navigation/admin_navbar_sm.vue'));


// // shared
// Vue.component('app_header', require('./components/shared/app_header.vue'));
// Vue.component('app_footer', require('./components/shared/app_footer.vue'));

// Vue.component('example-component', require('./components/ExampleComponent.vue'));
// Vue.component('login', require('./components/Login.vue'));

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
