import AxiosEventService from '../services/AxiosEventService'

//store.dispatch('{module-name}/checkUserAuthentication')
const checkUserAuthentication = () => {

    AxiosEventService.getEvent('/check-user-authentication')
                .then(response => {
                    console.log(response)

                })
                .catch(error => {
                    console.log(error, error.response)
                })
}

export {
    checkUserAuthentication
}
