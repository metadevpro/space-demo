import { writeFileSync } from "fs"
import { generateApiFromLanguages } from "@lionweb/class-core-generator"
import { deserializeLanguagesWithIoLionWebMpsSpecific, repairIoLionWebMpsSpecificAnnotations } from "@lionweb/io-lionweb-mps-specific"
import { LionWebJsonChunk } from "@lionweb/json"
import { generatePlantUmlForLanguage, languagesAsText, readFileAsJson } from "@lionweb/utilities"


const languagesJson = readFileAsJson("../../../chunks/space.languages.json") as LionWebJsonChunk
repairIoLionWebMpsSpecificAnnotations(languagesJson)
const spaceLanguages = deserializeLanguagesWithIoLionWebMpsSpecific(languagesJson)

writeFileSync("artifacts/space.languages.txt", languagesAsText(spaceLanguages))

spaceLanguages.forEach((language) => {
    writeFileSync(`artifacts/${language.name}.puml`, generatePlantUmlForLanguage(language))
})

generateApiFromLanguages(spaceLanguages, "../editor/src/gen")

