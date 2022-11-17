<template>
    <Table>
        <TableHead>
            <th>No.</th>
            <th>Amount</th>
            <th>On</th>
        </TableHead>

        <TableBody>
            <template
                v-if="accounts.length"
            >
                <tr
                    v-for="(account, index) in accounts"
                    :key="account.uuid"
                >
                    <td>{{ index + 1 }}</td>
                    <td class="fw-bold text-success"
                        v-if="account.action"
                    >
                        + ₹{{ account.amount }}
                    </td>
                    <td class="fw-bold text-danger"
                        v-else
                    >
                        - ₹{{ account.amount }}
                    </td>
                    <td>{{ account.date }} {{ account.time }}</td>
                </tr>
            </template>
            <tr
                v-else
            >
                <td colspan="3" class="text-center">No Transactions To Show</td>
            </tr>
        </TableBody>
    </Table>
</template>

<script setup>

    import Table from './Table.vue'
    import TableHead from './TableHead.vue'
    import TableBody from './TableBody.vue'

    const props = defineProps({
        accounts: {
            required: true,
            type: [Object, null]
        }
    })

</script>
