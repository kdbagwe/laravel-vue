export default function authUser({ to, next, store }) {

    if (!store.getters['user/isAuthenticated']) {

        return next({
            name: 'Login',
            query: {
                redirect: to.fullPath
            }
        })
    }
    return next()
}
