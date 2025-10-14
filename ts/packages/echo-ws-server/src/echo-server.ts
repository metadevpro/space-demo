import { WebSocketServer } from "ws"
import { exit } from "process"


/**
 * Runs the given asynchronous thunk as an application.
 * @param startReturningShutdown an asynchronous thunk that returns an asynchronous function that shuts down the app.
 */
export const runAsApp = async (startReturningShutdown: () => Promise<() => Promise<void>>) => {
    const intervalID = setInterval(() => {}, 1 << 25)   // =9h19m14s432ms

    const shutDownHandler = async () => {
        clearInterval(intervalID)
        await shutdown()
        exit(0)
    }

    const shutdown = await startReturningShutdown()

    process.on("SIGTERM", shutDownHandler)
    process.on("SIGINT", shutDownHandler)
}


const dataAsJson = (data: unknown) => {
    if (data instanceof Buffer) {
        return JSON.parse(data.toString())
    }
    return `don't know how to handle ${typeof data}`
}

runAsApp(() => {
    const port = 4000
    const webSocketServer = new WebSocketServer({ port })
    console.log(`echoing WebSocket server started @ port ${port}`)

    webSocketServer.on("connection", (webSocket, _request) => {
        console.log(`a client connected`)
        webSocket.on("message", (data: unknown) => {
            console.log(`received a message from client: ${JSON.stringify(dataAsJson(data))}`)
        })
    })

    return Promise.resolve(() => Promise.resolve())
})

