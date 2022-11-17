<template>
    <h3 class="mb-4 text-center">Users</h3>
    <Table
        v-if="users"
    >
        <TableHead>
            <th>No.</th>
            <th>User Name</th>
            <th>User Email</th>
            <th>Balance</th>
            <th>Action</th>
        </TableHead>

        <TableBody>
            <template
                v-if="users.length"
            >
                <tr
                    v-for="(user, index) in users"
                    :key="user.uuid"
                >
                    <td>{{ index + 1 }}</td>
                    <td>{{ user.name }}</td>
                    <td>{{ user.email }}</td>
                    <td>₹ {{ user.balance }}</td>
                    <td>
                        <router-link class="btn btn-info btn-sm"
                            :to="{
                                name: 'User-Accounts',
                                params: {
                                    id: user.uuid
                                }
                            }"
                        >
                            View Transactions
                        </router-link>
                    </td>
                </tr>
            </template>
            <tr
                v-else
            >
                <td colspan="5" class="text-center">No Users To Show</td>
            </tr>
        </TableBody>
    </Table>

    <ScaleLoader
        v-else
    />
</template>

<script setup>

    import Table from './Table.vue'
    import TableHead from './TableHead.vue'
    import TableBody from './TableBody.vue'
    import ScaleLoader from './ScaleLoader.vue'

    const props = defineProps({
        users: {
            required: true,
            type: [Object, null]
        }
    })

</script>
