<template>
    <input
        :class="['form-control', { 'is-invalid': hasError }]"
        :value="modelValue"
        @input="onInput"
    />
</template>

<script setup>

    let props = defineProps({
        hasError: {
            type: Boolean
        },
        modelValue: {
            required: true
        }
    })

    let emits =defineEmits(['update:modelValue'])

    let onInput = (event) => {

        emits('update:modelValue', event.target.value)
    }

</script>
