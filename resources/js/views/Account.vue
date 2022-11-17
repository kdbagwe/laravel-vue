<template>
    <div class="container my-5">
        <div class="row">
            <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 mb-5">
                <DepositWithdraw
                    @addTransactionRecord="(account) => {
                        accounts.unshift(account)
                    }"
                />
            </div>
            <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1">
                <h3 class="mb-4 text-center">Accounts</h3>
                <AccountRecords
                    v-if="accounts"
                    :accounts="accounts"
                />
                <ScaleLoader
                    v-else
                />
            </div>
        </div>
    </div>
</template>

<script setup>

    import AccountRecords from '../components/AccountRecords.vue'
    import DepositWithdraw from '../components/DepositWithdraw.vue'
    import ScaleLoader from '../components/ScaleLoader.vue'

    import useAccount from '../composables/useAccount'

    const {
        accounts,
        getAccounts
    } = useAccount()

    getAccounts()

</script>
