import { createRouter, createWebHistory } from 'vue-router'
import store from '../store/index'

// middleware
import middlewarePipeline from '../middleware/middlewarePipeline'
import forBanker from '../middleware/forBanker'
import forUser from '../middleware/forUser'

const routes = [
    {
        path: '/',
        redirect: {
            name: 'Login'
        },
    },
    {
        path: '/login',
        name: 'Login',
        component: () => import('../views/Login.vue')
    },
    {
        path: '/register',
        name: 'Register',
        component: () => import('../views/Register.vue')
    },
    {
        path: '/accounts',
        name: 'Account',
        component: () => import('../views/Account.vue'),
        meta: {
            middleware: [
                forUser
            ]
        }
    },
    {
        path: '/users',
        name: 'Users',
        component: () => import('../views/Users.vue'),
        meta: {
            middleware: [
                forBanker
            ]
        }
    },
    {
        path: '/users/:id/accounts',
        name: 'User-Accounts',
        component: () => import('../views/UserAccounts.vue'),
        props: true,
        meta: {
            middleware: [
                forBanker
            ]
        }
    },
    {
        path: '/forbidden',
        name: 'Forbidden',
        component: () => import('../views/Forbidden.vue')
    },
    {
        path: '/:catchAll(.*)',
        name: 'NotFound',
        component: () => import('../views/NotFound.vue')
    }
];

let router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes,
    scrollBehavior(to, from, scrollPosition) {

        return {
            top: 0,
            behavior: 'instant'
        }
    },
    linkExactActiveClass: "active",
});

let progress

// before each route check middleware
router.beforeEach((to, from, next) => {

    // no middleware present redirect to next route
    if (!to.meta.middleware) {
        return next()
    }

    const middleware = to.meta.middleware

    const context = {
        to,
        from,
        store,
        next
    }

    // call first middleware[0]
    // 1 or more middleware present middlewarePipeline recursive func will handle it
    return middleware[0]({
        ...context,
        next: middlewarePipeline(context, middleware, 1)
    })
})

export default router
