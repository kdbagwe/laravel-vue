<template>
    <div class="error-page">
        <slot></slot>
    </div>
</template>

<style lang="css">
    .error-page {
        display: flex;
        flex-direction: column;
        align-content: center;
        justify-content: center;
        height: 100vh;
        text-align: center;
    }
    .error-page h1 {
        font-size: 18vh;
        font-weight: bold;
    }
</style>
