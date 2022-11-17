<template>
    <div class="text-center">
        <BaseButton class="btn-danger btn-sm mb-4"
            type="button"
            :isLoading="logoutBtnLoading"
            :disabled="logoutBtnLoading"
            @click="logout"
        >
            Logout
        </BaseButton>
        <h3 class="mb-4">Balance: ₹ {{ balance }}</h3>
        <div class="d-flex justify-content-center"
            v-if="!showForm"
        >
            <BaseButton  class="btn-success me-4"
                type="button"
                @click="showDepositForm"
            >
                Deposit Amount
            </BaseButton>
            <BaseButton  class="btn-danger"
                type="button"
                @click="showWithdrawForm"
            >
                Withdraw Amount
            </BaseButton>
        </div>
        <div
            v-else
        >
            <form
                @submit.prevent="addTransaction(emits)"
            >
                <div class="row">
                    <div class="col-md-8 offset-md-2 mb-4">
                        <BaseLabel
                            for="amount"
                        >
                            Enter Amount:
                        </BaseLabel>
                        <BaseInput
                            v-model="formData.amount"
                            type="number"
                            placeholder="Enter Amount"
                            id="amount"
                            step=".01"
                            :class="{ 'is-invalid': errors?.amount }"
                        />
                        <ValidationError
                            v-if="errors?.amount"
                        >
                            {{ errors?.amount[0] }}
                        </ValidationError>
                    </div>
                </div>
                <div class="d-flex justify-content-center">
                    <BaseButton  class="btn-success"
                        v-if="formData.action === 1"
                        type="submit"
                        :isLoading="btnLoading"
                        :disabled="btnLoading"
                    >
                        Deposit
                    </BaseButton>
                    <BaseButton  class="btn-danger"
                        v-else-if="formData.action === 0"
                        type="submit"
                        :isLoading="btnLoading"
                        :disabled="btnLoading"
                    >
                        Withdraw
                    </BaseButton>
                    <BaseButton  class="btn-info ms-4"
                        type="button"
                        :disabled="btnLoading"
                        @click="reset"
                    >
                        Cancel
                    </BaseButton>
                </div>
            </form>
        </div>
    </div>
</template>

<script setup>

    import BaseLabel from '../components/BaseLabel.vue'
    import BaseInput from '../components/FormFields/BaseInput.vue'
    import ValidationError from '../components/ValidationError.vue'
    import BaseButton from '../components/BaseButton.vue'

    import useAccount from '../composables/useAccount'
    import useAuth from '../composables/useAuth'
    import { computed } from '@vue/runtime-core'
    import store from '../store'

    const emits = defineEmits(['addTransactionRecord'])

    const {
        btnLoading: logoutBtnLoading,
        logout
    } = useAuth()

    const {
        btnLoading,
        errors,
        showForm,
        showDepositForm, showWithdrawForm, reset,
        formData, addTransaction
    } = useAccount()

    const balance = computed(() => {

        let user

        if (store.getters['user/isAuthenticated']) {

            user = store.getters['user/getUserData']
        }

        return user?.balance ? user.balance.toFixed(2) : '0'
    })

</script>
