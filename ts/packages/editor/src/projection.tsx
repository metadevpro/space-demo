import { INodeBase } from "@lionweb/class-core"
import { observer } from "mobx-react"
import React from "react"


export const Projection = observer(({ node }: { node: INodeBase | undefined }) => {

    if (node === undefined) {
        return <span>model is empty</span>
    }

    return <span>No projection defined for node of classifier "{node.classifier.name}"</span>

})

