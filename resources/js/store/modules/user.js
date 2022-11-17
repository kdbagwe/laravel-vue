import getters from '../getters'
import mutations from '../mutations'
import AxiosEventService from '../../services/AxiosEventService'

const user = {
    namespaced: true,
    state: () => ({
        isAuthenticated: false,
        data: null
    }),
    mutations,
    getters,
    actions: {
        async checkAuthentication(context) {
            try {
                let response = await AxiosEventService.getEvent('/check-authentication')
                console.log(response)

                context.commit('AUTHENTICATE', response.data.data)
            }
            catch (error) {
                console.log(error, error.response)
            }
        }
    }
};

export default user;
