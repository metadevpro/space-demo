/*
 * language's metadata:
 *     name:    SpaceDSL
 *     version: 0
 *     key:     SpaceDSL
 *     id:      SpaceDSL
 */


import {
    Classifier,
    EnumerationLiteral,
    Language
} from "@lionweb/core";

import {
    LionWebId
} from "@lionweb/json";

import {
    DeltaReceiver,
    ILanguageBase,
    NodeBaseFactory
} from "@lionweb/class-core";


export class SpaceDSLBase implements ILanguageBase {

    private readonly _language: Language = new Language("SpaceDSL", "0", "SpaceDSL", "SpaceDSL");
    get language(): Language {
        this.ensureWiredUp();
        return this._language;
    }

    private _wiredUp: boolean = false;
    private ensureWiredUp() {
        if (this._wiredUp) {
            return;
        }
        this._language.havingEntities();
        this._wiredUp = true;
    }

    factory(_receiveDelta?: DeltaReceiver): NodeBaseFactory {
        return (classifier: Classifier, _id: LionWebId) => {
            const {language} = classifier;
            throw new Error(`can't instantiate ${classifier.name} (key=${classifier.key}): classifier is not known in language ${language.name} (key=${language.key}, version=${language.version})`);
        }
    }

    enumLiteralFrom<EnumType>(enumerationLiteral: EnumerationLiteral): EnumType {
        const {enumeration} = enumerationLiteral;
        const {language} = enumeration;
        throw new Error(`enumeration with key ${enumeration.key} is not known in language ${language.name} (key=${language.key}, version=${language.version})`);
    }

    public static readonly INSTANCE = new SpaceDSLBase();
}


