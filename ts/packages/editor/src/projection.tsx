import { INodeBase } from "@lionweb/class-core"
import { action } from "mobx"
import { observer } from "mobx-react"
import React from "react"
import { FaBatteryHalf, FaPlug } from "react-icons/fa"

import { PowerConsumer, PowerModule, PowerSource } from "./gen/PowerBudget.g.js"
import { Finding, Severity } from "./gen/Finding.g.js"


const parsedNumberValue = (stringValue: string) =>
    stringValue === ""
        ? undefined
        : parseInt(stringValue, 10)

export const Projection = observer(({ node }: { node: INodeBase }) => {

    if (node === undefined) {
        return <span>(no node)</span>
    }

    if (node instanceof PowerModule) {
        return <div>
            power module {node.name}
            {node.contents.length > 0  &&
                <ul>
                    {node.contents.map((child) =>
                        <li key={child.id}>
                            <Projection node={child} />
                        </li>
                    )}
                </ul>
            }
        </div>
    }

    if (node instanceof PowerConsumer) {
        return <div>
            <FaPlug/> power consumer <span style={{ fontWeight: 600, color: "#0070f3" }}> {node.name} </span>
            with peak <input type ="number" value={node.peak ?? ""} onChange={action((event) => {node.peak = parsedNumberValue(event.target.value)})} />
            {node.annotations.length > 0 && node.annotations.map((anno) => <Projection node={anno} /> )}
        </div>
    }
    if (node instanceof PowerSource) {
        return <div>
            <FaBatteryHalf/> power source<span style={{ fontWeight: 600, color: "#038112ff" }}> {node.name} </span>
            with peak <input type ="number" value={node.peak ?? ""} onChange={action((event) => {node.peak = parsedNumberValue(event.target.value)})} />
            {node.annotations.length > 0 && node.annotations.map((anno) => <Projection node={anno} key={anno.id} /> )}
        </div>
    }

    if (node instanceof Finding) {
        const findingStyle = (severity: Severity | undefined): React.CSSProperties => {
            switch (severity) {
                case Severity.info: return {backgroundColor: "#01b00d81"}
                case Severity.error: return {backgroundColor: "#f3000c9a"}
                case Severity.warning: return {backgroundColor: "#f3ba00b4"}
                default: return {}
            }
        }
        return <span style={findingStyle(node.severity)}> {node.message} </span>
    }


    return <span>No projection defined for node of classifier "{node.classifier.name}"</span>

})

