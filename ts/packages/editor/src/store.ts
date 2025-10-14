import { INodeBase } from "@lionweb/class-core"
import { action, makeObservable, observable } from "mobx"

import { initializeLionWeb } from "./lionweb"


initializeLionWeb()


export class Store {

    model: INodeBase[] = []

    setModel = (model: INodeBase[]) => {
        this.model.splice(0, this.model.length)
        this.model.push(...model)
    }

    constructor() {
        makeObservable(
            this,
            {
                model: observable,
                setModel: action
            }
        )
    }

}

export const store = new Store()

