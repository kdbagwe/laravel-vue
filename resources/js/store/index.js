import { createStore } from 'vuex'
import createPersistedState from "vuex-persistedstate"
// import Cookies from 'js-cookie'
import user from './modules/user'
//for encrypting vuex local storage data
import SecureLS from "secure-ls"
import { last } from 'lodash'
const ls = new SecureLS({encodingType: 'aes'})

export default createStore({

    /*
    On successfull login user data gets stored in vuex/store user module with state named data
    On page refresh this user data stored in vuex/store gets deleted
    so we use createPersistedState plugin to maintain this state/data,
    This is done by storing vuex/state data in cookie named vuex and data in it
    is fetch later from this cookie to restore in store's state,
    this way data is maintened/persisted even on page refresh event.
    */
    plugins: [
        createPersistedState({
            storage: {
                getItem: (key) => {
                    try {
                        return ls.get(key)
                    }
                    catch(e) {
                        console.log(e)
                        ls.remove(key)
                    }
                },
                setItem: (key, value) => ls.set(key, value),
                removeItem: (key) => ls.remove(key)
            }
        })
    ],

    modules: {
        user
    }
})
