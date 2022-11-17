<template>
    <div class="container my-5">
        <div class="row">
            <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1">
                <div
                    v-if="user"
                >
                    <div class="my-4">
                        <h6>User Name: {{ user.name }}</h6>
                        <h6>User Email: {{ user.email }}</h6>
                        <h6>User Balance: ₹ {{ user.balance }}</h6>
                    </div>
                    <h3 class="mb-4 text-center">User Accounts</h3>
                    <AccountRecords
                        :accounts="user.accounts"
                    />
                    <div class="text-center mt-5">
                        <router-link class="btn btn-primary"
                            :to="{
                                name: 'Users'
                            }"
                        >
                            Back To Users
                        </router-link>
                    </div>
                </div>
                <ScaleLoader
                    v-else
                />
            </div>
        </div>
    </div>
</template>

<script setup>

    import AccountRecords from '../components/AccountRecords.vue'
    import ScaleLoader from '../components/ScaleLoader.vue'

    import useUser from '../composables/useUser'

    const props = defineProps({
        id: {
            required: true,
            type: String
        }
    })

    const {
        user,
        getUserAccounts
    } = useUser()

    getUserAccounts(props.id)

</script>
