import { reactive } from "vue"
import AxiosEventService from "../services/AxiosEventService"
import store from '../store'
import common from '../composables/common'

export default function useRegister() {

    const {
        btnLoading,
        errors,
        router,
        showValidationErrors
    } = common()

    const formData = reactive({
        name: '',
        email: '',
        password: '',
        password_confirmation: ''
    })

    const register = async() => {

        btnLoading.value = true
        try {
            let response = await AxiosEventService.postEvent('/register', formData)
            console.log(response)

            let user = response.data.user

            store.commit('user/AUTHENTICATE', user)

            if (user.isBanker) {

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

    return {
        formData, errors, btnLoading, register
    }
}
