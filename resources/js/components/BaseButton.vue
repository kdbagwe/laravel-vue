<template>
    <button class="btn">
        <div class="d-flex align-items-center justify-content-center">
            <clip-loader
                :loading="isLoading"
                color="#ffffff"
                size="12px"
                class="me-1"
            />
            <slot></slot>
        </div>
    </button>
</template>

<script setup>

    import ClipLoader from 'vue-spinner/src/ClipLoader.vue'

    const props = defineProps({
        isLoading: {
            type: Boolean
        }
    })

</script>
