import { reactive, ref } from "vue"
import AxiosEventService from "../services/AxiosEventService"
import store from '../store'
import common from '../composables/common'

export default function useAccount() {

    const {
        btnLoading,
        errors,
        router,
        showValidationErrors
    } = common()

    let accounts = ref(null)

    const getAccounts = async() => {

        accounts.value = null
        try {
            let response = await AxiosEventService.getEvents('/accounts')
            console.log(response)

            accounts.value = response.data.data
            // router.push({ name: 'Contributor-Dashboard' })
        }
        catch (error) {
            console.log(error.response)
        }
    }

    let showForm = ref(false)

    let showDepositForm = () => {

        showForm.value = true
        formData.action = 1
    }

    let showWithdrawForm = () => {

        showForm.value = true
        formData.action = 0
    }

    let reset = () => {

        showForm.value = false
        formData.action = formData.amount = ''
        errors.value = null
    }

    const formData = reactive({
        amount: '',
        action: ''
    })

    const addTransaction = async(emits) => {

        btnLoading.value = true
        try {
            let response = await AxiosEventService.postEvent('/accounts', formData)
            console.log(response)

            reset()

            store.commit('user/AUTHENTICATE', response.data.user)

            emits('addTransactionRecord', response.data.account)
        }
        catch (error) {
            console.log(error.response)

            showValidationErrors(error)
        }
        btnLoading.value = false
    }

    return {
        btnLoading,
        errors,
        accounts, getAccounts,
        showForm,
        showDepositForm, showWithdrawForm, reset,
        formData, addTransaction
    }
}
