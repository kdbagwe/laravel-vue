<template>
    <nav aria-label="...">
        <ul class="pagination row  mb-0">
            <!-- <template v-for="(link, index) in links" :key="link">
                <li class="page-item my-2"
                :class="{ 'active': link.active, 'disabled': !link.url }"
                @click="redirect(link.url, link.active)">
                    <a href="javascript:void(0)" v-if="index == 0" class="page-link" tabindex="-1">
                        <i class="fas fa-angle-left"></i>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a href="javascript:void(0)" v-else-if="index == Object.keys(links).length - 1" class="page-link">
                        <i class="fas fa-angle-right"></i>
                        <span class="sr-only">Next</span>
                    </a>
                    <a href="javascript:void(0)" v-else class="page-link">{{ link.label }}</a>
                </li>
            </template> -->
            <template v-for="(link, index) in meta.links" :key="link">
                <li class="page-item my-2"
                v-if="link.url"
                :class="{ 'active': link.active }">
                    <a href="javascript:void(0)" class="page-link" tabindex="-1"
                        v-if="index == 0"
                        @click="previous"
                    >
                        <i class="fas fa-angle-left"></i>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a href="javascript:void(0)" class="page-link"
                        v-else-if="index == Object.keys(meta.links).length - 1"
                        @click="next"
                    >
                        <i class="fas fa-angle-right"></i>
                        <span class="sr-only">Next</span>
                    </a>
                    <a href="javascript:void(0)"
                        v-else class="page-link"
                        @click="redirect(link)"
                    >
                        {{ link.label }}
                    </a>
                </li>
            </template>
        </ul>
    </nav>
</template>

<script>
export default {

    props: [
        'meta',
    ],
    methods: {
        redirect(link) {

            // not an active page
            if (!link.active) {

                // document.getElementById(`${this.contentId}`).scrollIntoView({ behavior: 'auto' })
                this.changeRoutePath(Number(link.label))
            }
        },
        previous() {

            this.changeRoutePath(this.meta.current_page - 1)
        },
        next() {

            this.changeRoutePath(this.meta.current_page + 1)
        },
        changeRoutePath(page) {

            // if (page !== 1) {
            //     this.$router.push({ query: { page } })
            // }
            document.body.scrollTop = document.documentElement.scrollTop = 0
            this.$emit('paginate', page)
        }
    }
}
</script>
