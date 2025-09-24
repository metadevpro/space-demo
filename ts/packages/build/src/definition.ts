import {builtinClassifiers, builtinPrimitives, LanguageFactory} from "@lionweb/core"
import {chain, concatenator, lastOf} from "@lionweb/ts-utils"


const factory = new LanguageFactory("SpaceDSL", "0", chain(concatenator("-")), lastOf)
export const spaceLanguage = factory.language

