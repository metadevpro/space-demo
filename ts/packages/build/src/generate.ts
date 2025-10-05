import {writeFileSync} from "fs"
import {generateLanguage} from "@lionweb/class-core-generator"
import {serializeLanguages} from "@lionweb/core"
import {languageAsText, writeJsonAsFile} from "@lionweb/utilities"

import {spaceLanguage} from "./definition.js"


writeFileSync("artifacts/Space.language.txt", languageAsText(spaceLanguage))
writeJsonAsFile("artifacts/Space.language.json", serializeLanguages(spaceLanguage))

generateLanguage(spaceLanguage, "../editor/src/gen", {})

