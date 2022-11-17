import { reactive } from "vue"
import AxiosEventService from "../services/AxiosEventService"
import store from '../store'
import common from '../composables/common'

export default function useAuth() {

    const {
        btnLoading,
        errors,
        router,
        route,
        showValidationErrors
    } = common()

    const formData = reactive({
        email: '',
        password: ''
    })

    const login = async() => {

        btnLoading.value = true
        try {
            await AxiosEventService.getEvent('/sanctum/csrf-cookie')
            errors.value = null

            let response = await AxiosEventService.postEvent('/login', formData)
            console.log(response)

            let user = response.data.user

            store.commit('user/AUTHENTICATE', user)

            if (route.query.redirect) {

                router.push({
                    path: route.query.redirect
                })
            }
            else if (user.isBanker) {

                router.push({
                    name: 'Users'
                })
            }
            else {

                router.push({
                    name: 'Account'
                })
            }
        }
        catch (error) {
            console.log(error.response)

            showValidationErrors(error)
        }
        btnLoading.value = false
    }

    const logout = async() => {

        btnLoading.value = true
        try {
            let response = await AxiosEventService.postEvent('/logout')
            console.log(response)

            store.commit('user/LOGOUT')
            // localStorage.removeItem('userToken')
            router.push({ name: 'Login' })
        }
        catch(error) {
            console.log(error.response)
        }
        btnLoading.value = false
    }


    return {
        formData, errors, btnLoading,
        login, logout
    }
}
