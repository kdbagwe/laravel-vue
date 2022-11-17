<template>
    <div class="container my-5">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <Card>
                    <CardBody>
                        <CardHeader class="bg-white">
                            <h3 class="text-center">User Registration</h3>
                        </CardHeader>
                        <CardBody>
                            <form
                                @submit.prevent="register"
                            >
                                <div class="mt-3">
                                    <BaseLabel
                                        for="name"
                                    >
                                        Name:
                                    </BaseLabel>
                                    <BaseInput
                                        v-model="formData.name"
                                        type="text"
                                        placeholder="Enter Name"
                                        id="name"
                                        :class="{ 'is-invalid': errors?.name }"
                                    />
                                    <ValidationError
                                        v-if="errors?.name"
                                    >
                                        {{ errors?.name[0] }}
                                    </ValidationError>
                                </div>
                                <div class="mt-3">
                                    <BaseLabel
                                        for="email"
                                    >
                                        Email:
                                    </BaseLabel>
                                    <BaseInput
                                        v-model="formData.email"
                                        type="email"
                                        placeholder="Enter Email"
                                        id="email"
                                        :class="{ 'is-invalid': errors?.email }"
                                    />
                                    <ValidationError
                                        v-if="errors?.email"
                                    >
                                        {{ errors?.email[0] }}
                                    </ValidationError>
                                </div>
                                <div class="mt-4">
                                    <BaseLabel
                                        for="password"
                                    >
                                        Password:
                                    </BaseLabel>
                                    <BaseInput
                                        v-model="formData.password"
                                        type="password"
                                        placeholder="Enter Password"
                                        id="password"
                                        :class="{ 'is-invalid': errors?.password }"
                                    />
                                    <ValidationError
                                        v-if="errors?.password"
                                    >
                                        {{ errors?.password[0] }}
                                    </ValidationError>
                                    <ValidationError
                                        v-if="typeof errors === 'string'"
                                    >
                                        {{ errors }}
                                    </ValidationError>
                                </div>
                                <div class="mt-4">
                                    <BaseLabel
                                        for="password_confirmation"
                                    >
                                        Confirm Password:
                                    </BaseLabel>
                                    <BaseInput
                                        v-model="formData.password_confirmation"
                                        type="password"
                                        placeholder="Confirm Password"
                                        id="password_confirmation"
                                        :class="{ 'is-invalid': errors?.password_confirmation }"
                                    />
                                </div>
                                <div class="text-center mt-5 mb-2">
                                    <BaseButton  class="btn-primary"
                                        type="submit"
                                        :isLoading="btnLoading"
                                        :disabled="btnLoading"
                                    >
                                        Submit
                                    </BaseButton>
                                </div>
                                <div class="text-center mt-4">
                                    <router-link
                                        :to="{
                                            name: 'Login'
                                        }"
                                    >
                                        Already Registered ? Login Here
                                    </router-link>
                                </div>
                            </form>
                        </CardBody>
                    </CardBody>
                </Card>
            </div>
        </div>
    </div>
</template>

<script setup>

    import Card from '../components/Card.vue'
    import CardBody from '../components/CardBody.vue'
    import CardHeader from '../components/CardHeader.vue'
    import BaseButton from '../components/BaseButton.vue'
    import BaseLabel from '../components/BaseLabel.vue'
    import ValidationError from '../components/ValidationError.vue'
    import BaseInput from '../components/FormFields/BaseInput.vue'

    import useRegister from '../composables/useRegister'

    const {
        formData,
        errors,
        btnLoading,
        register
    } = useRegister()

</script>
