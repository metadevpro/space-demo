import { nodeBaseDeserializer } from "@lionweb/class-core"
import { LionWebJsonChunk } from "@lionweb/json"
import { makeObservable } from "mobx"

import { SpaceDSLBase } from "./gen/SpaceDSL.g.js"


export const deserialized = (chunk: LionWebJsonChunk) =>
    nodeBaseDeserializer([SpaceDSLBase.INSTANCE])(chunk)

export class Store {

    // TODO  implement multi-model store?

    constructor() {
        makeObservable(
            this,
            {
                // TODO
            }
        )
        // TODO  implement a reaction that auto-saves
    }

}


export const store = new Store()

