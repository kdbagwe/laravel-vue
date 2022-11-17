import { reactive, ref } from "vue"
import AxiosEventService from "../services/AxiosEventService"

export default function useUser() {

    let users = ref(null)

    const getUsers = async() => {

        users.value = null
        try {
            let response = await AxiosEventService.getEvents('/users')
            console.log(response)

            users.value = response.data.data
        }
        catch (error) {
            console.log(error.response)
        }
    }

    let  user = ref(null)

    const getUserAccounts = async(id) => {

        try {
            let response = await AxiosEventService.getEvent(`/users/${id}/accounts`)
            console.log(response)

            user.value = response.data.data
        }
        catch (error) {
            console.log(error.response)
        }
    }

    return {
        users, getUsers,
        user, getUserAccounts
    }
}
