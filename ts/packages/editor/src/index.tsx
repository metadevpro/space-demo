import React from "react"
import { createRoot } from "react-dom/client"

import { App } from "./App.js"
import { initializeLionWeb } from "./lionweb.js"

import "./styling.css"


initializeLionWeb()

const container = document.getElementById("app")!
const root = createRoot(container)
root.render(<App />)

