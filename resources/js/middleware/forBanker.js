export default function forBanker({ to, next, store }) {

    if (!store.getters['user/isAuthenticated']) {

        return next({
            name: 'Login',
            query: {
                redirect: to.fullPath
            }
        })
    }

    if (!store.getters['user/getUserData']?.isBanker) {

        return next({
            name: 'Forbidden'
        })
    }

    return next()
}
