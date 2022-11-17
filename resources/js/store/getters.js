//getters['*/isAuthenticated']
const isAuthenticated = (state) => {
    return state.isAuthenticated && state.data !== null
}

const getUserData = (state) => {
    return state.data
}

const getBackdrop = (state) => {
    return state.backdrop
}

const getAdminType = (state) => {
    return state.data?.type
}

export default {
    isAuthenticated,
    getUserData,
    getBackdrop,
    getAdminType
}
