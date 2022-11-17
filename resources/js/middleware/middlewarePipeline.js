export default function middlewarePipeline(context, middleware, index) {

    const nextMiddleware = middleware[index]

    //if middleware not present
    if (!nextMiddleware) {
        return context.next
    }

    // recursion
    return () => {
        const nextPipeline = middlewarePipeline(
            context, middleware, index + 1
        )

        nextMiddleware({...context, next: nextPipeline })
    }
}
