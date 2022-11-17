<template>
    <div class="container my-5">
        <div class="row">
            <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1">
                <div class="text-center mb-4">
                    <BaseButton class="btn-danger btn-sm mb-4"
                        type="button"
                        :isLoading="btnLoading"
                        :disabled="btnLoading"
                        @click="logout"
                    >
                        Logout
                    </BaseButton>
                </div>
                <UserRecords
                    :users="users"
                />
            </div>
        </div>
    </div>
</template>

<script setup>

    import UserRecords from '../components/UserRecords.vue'
    import BaseButton from '../components/BaseButton.vue'

    import useUser from '../composables/useUser'
    import useAuth from '../composables/useAuth'

    const {
        btnLoading,
        logout
    } = useAuth()

    const {
        users,
        getUsers
    } = useUser()

    getUsers()

</script>
