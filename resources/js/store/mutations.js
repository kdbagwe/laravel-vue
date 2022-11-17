// state.commit('user/AUTHENTICATE')
const AUTHENTICATE = (state, data) => {
    state.isAuthenticated = true
    state.data = data
}

const LOGOUT = (state) => {
    state.isAuthenticated = false
    state.data = null
}

export default {
    AUTHENTICATE,
    LOGOUT
}
