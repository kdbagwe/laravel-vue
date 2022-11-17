import { ref } from "vue"
import { useRoute, useRouter } from "vue-router"

export default function common() {

    let router = useRouter()
    let route = useRoute()
    let btnLoading = ref(false)
    let errors = ref(null)

    let showValidationErrors = (error, paddingTop = 300, scrollToError = true) => {

        let res = error.response

        if (res.status && res.status === 422 && res.data.errors) {

            errors.value = res.data.errors
            if (scrollToError) {

                let firstValidationError = document.getElementById(`${Object.keys(errors.value)[0]}`)
                // scroll to first error
                if (firstValidationError) {

                    window.scrollTo(0, firstValidationError.getBoundingClientRect().top - paddingTop)
                    firstValidationError.focus()
                }
            }
        }
        if (res.data.error) {

            errors.value = res.data.error
        }
    }

    return {
        router,
        route,
        btnLoading,
        errors,
        showValidationErrors
    }
}

