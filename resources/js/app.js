import { createApp } from 'vue';

require('./bootstrap');

import App from './views/App.vue'
import store from './store/index'
import router from './router/index'
import Notifications from '@kyvg/vue3-notification'
import tooltip from "./directives/tooltip"
// frontend theme
import 'bootstrap/scss/bootstrap.scss'
import 'bootstrap'

let app = createApp(App)

// app.config.errorHandler = (error) => {
//     console.log(error)
// }

app.use(store)
    .use(router)
    .use(Notifications)
    .directive("tooltip", tooltip)
    .mount('#app')
