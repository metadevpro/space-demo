import {ILanguageBase, LionCore_builtinsBase} from "@lionweb/class-core";

import * as PowerBudget from "./PowerBudget.g.js";
import * as Finding from "./Finding.g.js";

// ensure that all languages get wired up by triggering that through their first entity:
LionCore_builtinsBase.INSTANCE.String;
PowerBudget.PowerBudgetBase.INSTANCE.IPowerModuleContent;
Finding.FindingBase.INSTANCE.Finding;

export const allLanguageBases: ILanguageBase[] = [
    PowerBudget.PowerBudgetBase.INSTANCE,
    Finding.FindingBase.INSTANCE
];

export {
    PowerBudget,
    Finding
};

