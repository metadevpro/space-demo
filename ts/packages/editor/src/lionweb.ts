import { asTreeTextWith, INodeBase } from "@lionweb/class-core"
import { LionWebClient } from "@lionweb/delta-protocol-client"
import { createBrowserLowLevelClient } from "@lionweb/delta-protocol-low-level-client-browser"

import { allLanguageBases } from "./gen/index.g.js"
// import { PowerModule, PowerSource } from "./gen/PowerBudget.g.js"
import { store } from "./store.js"


export const logModel = (model: INodeBase[]) => {
    console.log(
        asTreeTextWith(
            (node) =>
                "name" in node ? (node.name as string) : node.id
        )(model)
    )
}


const maxLogLength = 200
const trimTo = (text: string) =>
    text.length <= maxLogLength
        ? text
        : (text.substring(0, maxLogLength - 1) + "…")   // limit it to exactly maxLogLength


export const initializeLionWeb = () => {
    console.log(`creating client`)
    let queryNumber = 0
    const uniqueQueryId = () => `query-${++queryNumber}`
    LionWebClient.create({
        clientId: "TS-client-1",
        url: "ws://localhost:40000",
        languageBases: allLanguageBases,
        lowLevelClientInstantiator: (lowLevelClientParameters) =>
            createBrowserLowLevelClient(lowLevelClientParameters, (logItem) => {
                console.log(`low-level log item: ${trimTo(JSON.stringify(logItem))}`)
                console.dir(logItem)
            }),
        semanticLogger: (logItem) => {
            console.log(trimTo(logItem.asText()))
            console.dir(logItem)
        }
    })
        .then((client) => {
            console.log(`client created`)
            console.log(`signing in`)
            client.signOn(uniqueQueryId(), "myRepo")
                .then(() => {
                    console.log(`signed on`)
                    console.log(`getting list of partitions`)
                    client.listPartitions(uniqueQueryId())
                        .then((partitionInfo) => {
                            const partitionIds = partitionInfo.nodes
                                .filter((partitionJson) => partitionJson.parent === null)
                                .map(({id}) => id)
                            console.log(`list of IDs of partitions: ${partitionIds.join(", ")}`)
                            if (partitionIds.length === 0) {
                                return
                            }
                            const partitionId = partitionIds[0]
                            console.log(`subscribing to partition ${partitionId}`)
                            client.subscribeToPartitionContents(uniqueQueryId(), partitionId)
                                .then((receivedModelJson) => {
                                    const receivedModel = client.deserializer(receivedModelJson)
                                    store.setModel(receivedModel)
                                    logModel(receivedModel)
                                    client.setModel(receivedModel)
                                    /*
                                    setTimeout(() => {
                                        if (client.model.length > 0 && client.model[0] instanceof PowerModule) {
                                            console.log(`making changes, to check whether they are sent`)
                                            const powerModule = client.model[0] as PowerModule
                                            (powerModule.contents[0] as PowerSource).peak = 600
                                            powerModule.name = "VGER"
                                        }
                                    }, 1)
                                     */
                                    console.log(`(done)`)
                                })
                        })
                })
        })
}

// TODO  (find out how to make Parcel understand await/async)

