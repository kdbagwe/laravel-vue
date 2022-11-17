import axios from "axios"
import store from "../store"
import router from "../router"
import { cacheAdapterEnhancer } from "axios-extensions";

let hostname = window.location.hostname

if (hostname === '127.0.0.1') {

    hostname = `127.0.0.1:${window.location.port}`
}

const instance = axios.create({
    baseURL: `${window.location.protocol}//${hostname}/api`,
    withCredentials: true,
    headers: { 'Cache-Control': 'no-cache' },
    adapter: cacheAdapterEnhancer(axios.defaults.adapter, { enabledByDefault: false, cacheFlag: 'useCache'})
})

// ignore login page redirect if unauth 401 msg from server
const ignoreUserRoutes = [
    "/check-user-authentication", //check user auth on first time load
]

// intercept requests/responses before they are handled by then or catch.
instance.interceptors.response.use(function(response) {
    // Do something with response data

    return response;

}, function(error) {

    //If unauthenticated
    if (error.response?.status === 401) {

        if (error.response.data.guard === 'admin') {

            store.commit('admin/LOGOUT')
            router.push({ name: 'Admin-Login' })
        }

        if (error.response.data.guard === 'user') {

            store.commit('user/LOGOUT')

            if (!ignoreUserRoutes.includes(error.response.config.url)) {

                router.push({
                    name: 'Contributor-Login'
                })
            }
        }
    }

    // if route forbidden
    if (error.response?.status === 403) {

        if (error.response.data?.guard === 'user') {

            router.push({
                name: 'Contributor-Verification-Pending'
            })
        }

        if (error.response.data?.guard === 'admin') {

            router.push({
                name: 'Admin-Forbidden'
            })
        }
    }

    return Promise.reject(error)
});

export default {
    getEvents(url, data = {}) { //get all records

        return instance.get(url, data)
    },
    getEvent(url, data = {}) { //get single record

        return instance.get(url, data)
    },
    postEvent(url, data, config = {}) { //save record

        return instance.post(url, data, config)
    },
    putEvent(url, data = null, config = {}) { //update record

        return instance.put(url, data, config)
    },
    deleteEvent(url) { //delete record

        return instance.delete(url)
    }
}
