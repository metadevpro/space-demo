/*
 * language's metadata:
 *     name:    PowerBudget
 *     version: 0.1
 *     key:     space-PowerBudget
 *     id:      space-PowerBudget
 */

import {
  Classifier,
  Concept,
  Containment,
  Enumeration,
  EnumerationLiteral,
  Interface,
  Language,
  Property,
  Reference,
  SingleRef,
} from '@lionweb/core';

import { LionWebId } from '@lionweb/json';

import {
  ContainmentValueManager,
  DeltaReceiver,
  ILanguageBase,
  INamed,
  INodeBase,
  LionCore_builtinsBase,
  NodeBase,
  NodeBaseFactory,
  OptionalMultiContainmentValueManager,
  OptionalMultiReferenceValueManager,
  OptionalPropertyValueManager,
  Parentage,
  PropertyValueManager,
  ReferenceValueManager,
  RequiredPropertyValueManager,
} from '@lionweb/class-core';

export class PowerBudgetBase implements ILanguageBase {
  private readonly _language: Language = new Language(
    'PowerBudget',
    '0.1',
    'space-PowerBudget',
    'space-PowerBudget'
  );
  get language(): Language {
    this.ensureWiredUp();
    return this._language;
  }

  public readonly _IPowerModuleContent = new Interface(
    this._language,
    'IPowerModuleContent',
    'IPowerModuleContent',
    'IPowerModuleContent'
  );
  get IPowerModuleContent(): Interface {
    this.ensureWiredUp();
    return this._IPowerModuleContent;
  }

  public readonly _IPowerParticipant = new Interface(
    this._language,
    'IPowerParticipant',
    'IPowerParticipant',
    'IPowerParticipant'
  );
  get IPowerParticipant(): Interface {
    this.ensureWiredUp();
    return this._IPowerParticipant;
  }
  private readonly _IPowerParticipant_peak = new Property(
    this._IPowerParticipant,
    'peak',
    'IPowerParticipant-peak',
    'IPowerParticipant-peak'
  ).isOptional();
  get IPowerParticipant_peak(): Property {
    this.ensureWiredUp();
    return this._IPowerParticipant_peak;
  }
  private readonly _IPowerParticipant_continuous = new Property(
    this._IPowerParticipant,
    'continuous',
    'IPowerParticipant-continuous',
    'IPowerParticipant-continuous'
  ).isOptional();
  get IPowerParticipant_continuous(): Property {
    this.ensureWiredUp();
    return this._IPowerParticipant_continuous;
  }

  public readonly _PowerConsumer = new Concept(
    this._language,
    'PowerConsumer',
    'PowerConsumer',
    'PowerConsumer',
    false
  );
  get PowerConsumer(): Concept {
    this.ensureWiredUp();
    return this._PowerConsumer;
  }
  private readonly _PowerConsumer_providedFrom = new Reference(
    this._PowerConsumer,
    'providedFrom',
    'ODgyNjBiZDctZjQ0MC00ZWNhLTk4NzMtMTJkOTRjYjZlNzQ3LzEwMDI1NjMxNTEwMTY3ODAxOTUvMTAwMjU2MzE1MTAxNjg4NTY0Nw',
    'ODgyNjBiZDctZjQ0MC00ZWNhLTk4NzMtMTJkOTRjYjZlNzQ3LzEwMDI1NjMxNTEwMTY3ODAxOTUvMTAwMjU2MzE1MTAxNjg4NTY0Nw'
  )
    .isOptional()
    .isMultiple();
  get PowerConsumer_providedFrom(): Reference {
    this.ensureWiredUp();
    return this._PowerConsumer_providedFrom;
  }

  public readonly _PowerModule = new Concept(
    this._language,
    'PowerModule',
    'PowerModule',
    'PowerModule',
    false
  ).isPartition();
  get PowerModule(): Concept {
    this.ensureWiredUp();
    return this._PowerModule;
  }
  private readonly _PowerModule_contents = new Containment(
    this._PowerModule,
    'contents',
    'PowerModule-contents',
    'PowerModule-contents'
  )
    .isOptional()
    .isMultiple();
  get PowerModule_contents(): Containment {
    this.ensureWiredUp();
    return this._PowerModule_contents;
  }

  public readonly _PowerSource = new Concept(
    this._language,
    'PowerSource',
    'PowerSource',
    'PowerSource',
    false
  );
  get PowerSource(): Concept {
    this.ensureWiredUp();
    return this._PowerSource;
  }
  private readonly _PowerSource_kind = new Property(
    this._PowerSource,
    'kind',
    'PowerSource-kind',
    'PowerSource-kind'
  ).isOptional();
  get PowerSource_kind(): Property {
    this.ensureWiredUp();
    return this._PowerSource_kind;
  }

  public readonly _PowerSourceKind = new Enumeration(
    this._language,
    'PowerSourceKind',
    'PowerSourceKind',
    'PowerSourceKind'
  );
  get PowerSourceKind(): Enumeration {
    this.ensureWiredUp();
    return this._PowerSourceKind;
  }
  private readonly _PowerSourceKind_solar = new EnumerationLiteral(
    this._PowerSourceKind,
    'solar',
    'PowerSourceKind-solar',
    'PowerSourceKind-solar'
  );
  get PowerSourceKind_solar(): EnumerationLiteral {
    this.ensureWiredUp();
    return this._PowerSourceKind_solar;
  }
  private readonly _PowerSourceKind_nuclear = new EnumerationLiteral(
    this._PowerSourceKind,
    'nuclear',
    'PowerSourceKind-nuclear',
    'PowerSourceKind-nuclear'
  );
  get PowerSourceKind_nuclear(): EnumerationLiteral {
    this.ensureWiredUp();
    return this._PowerSourceKind_nuclear;
  }
  private readonly _PowerSourceKind_diesel = new EnumerationLiteral(
    this._PowerSourceKind,
    'diesel',
    'PowerSourceKind-diesel',
    'PowerSourceKind-diesel'
  );
  get PowerSourceKind_diesel(): EnumerationLiteral {
    this.ensureWiredUp();
    return this._PowerSourceKind_diesel;
  }

  private _wiredUp: boolean = false;
  private ensureWiredUp() {
    if (this._wiredUp) {
      return;
    }
    this._language.havingEntities(
      this._IPowerModuleContent,
      this._IPowerParticipant,
      this._PowerConsumer,
      this._PowerModule,
      this._PowerSource,
      this._PowerSourceKind
    );
    this._IPowerModuleContent.extending(LionCore_builtinsBase.INSTANCE._INamed);
    this._IPowerParticipant.havingFeatures(
      this._IPowerParticipant_peak,
      this._IPowerParticipant_continuous
    );
    this._IPowerParticipant_peak.ofType(LionCore_builtinsBase.INSTANCE._Integer).isOptional();
    this._IPowerParticipant_continuous.ofType(LionCore_builtinsBase.INSTANCE._Integer).isOptional();
    this._PowerConsumer.extends = LionCore_builtinsBase.INSTANCE._Node;
    this._PowerConsumer.implementing(this._IPowerModuleContent, this._IPowerParticipant);
    this._PowerConsumer.havingFeatures(this._PowerConsumer_providedFrom);
    this._PowerConsumer_providedFrom.ofType(this._PowerSource);
    this._PowerModule.extends = LionCore_builtinsBase.INSTANCE._Node;
    this._PowerModule.implementing(LionCore_builtinsBase.INSTANCE._INamed);
    this._PowerModule.havingFeatures(this._PowerModule_contents);
    this._PowerModule_contents.ofType(this._IPowerModuleContent);
    this._PowerSource.extends = LionCore_builtinsBase.INSTANCE._Node;
    this._PowerSource.implementing(this._IPowerModuleContent, this._IPowerParticipant);
    this._PowerSource.havingFeatures(this._PowerSource_kind);
    this._PowerSource_kind.ofType(this._PowerSourceKind).isOptional();
    this._PowerSourceKind.havingLiterals(
      this._PowerSourceKind_solar,
      this._PowerSourceKind_nuclear,
      this._PowerSourceKind_diesel
    );
    this._wiredUp = true;
  }

  factory(receiveDelta?: DeltaReceiver): NodeBaseFactory {
    return (classifier: Classifier, id: LionWebId) => {
      switch (classifier.key) {
        case this._PowerConsumer.key:
          return PowerConsumer.create(id, receiveDelta);
        case this._PowerModule.key:
          return PowerModule.create(id, receiveDelta);
        case this._PowerSource.key:
          return PowerSource.create(id, receiveDelta);
        default: {
          const { language } = classifier;
          throw new Error(
            `can't instantiate ${classifier.name} (key=${classifier.key}): classifier is not known in language ${language.name} (key=${language.key}, version=${language.version})`
          );
        }
      }
    };
  }

  enumLiteralFrom<EnumType>(enumerationLiteral: EnumerationLiteral): EnumType {
    const { enumeration } = enumerationLiteral;
    if (enumeration.key === this._PowerSourceKind.key) {
      return enumerationLiteral.key as EnumType;
    }
    const { language } = enumeration;
    throw new Error(
      `enumeration with key ${enumeration.key} is not known in language ${language.name} (key=${language.key}, version=${language.version})`
    );
  }

  public static readonly INSTANCE = new PowerBudgetBase();
}

export interface IPowerModuleContent extends INamed {}

export interface IPowerParticipant extends INodeBase {
  peak: number | undefined;
  continuous: number | undefined;
}

export class PowerConsumer extends NodeBase implements IPowerModuleContent, IPowerParticipant {
  static create(
    id: LionWebId,
    receiveDelta?: DeltaReceiver,
    parentInfo?: Parentage
  ): PowerConsumer {
    return new PowerConsumer(PowerBudgetBase.INSTANCE.PowerConsumer, id, receiveDelta, parentInfo);
  }

  private readonly _providedFrom: OptionalMultiReferenceValueManager<PowerSource>;
  get providedFrom(): SingleRef<PowerSource>[] {
    return this._providedFrom.get();
  }
  addProvidedFrom(newValue: PowerSource) {
    this._providedFrom.add(newValue);
  }
  removeProvidedFrom(valueToRemove: PowerSource) {
    this._providedFrom.remove(valueToRemove);
  }
  addProvidedFromAtIndex(newValue: PowerSource, index: number) {
    this._providedFrom.insertAtIndex(newValue, index);
  }
  moveProvidedFrom(oldIndex: number, newIndex: number) {
    this._providedFrom.move(oldIndex, newIndex);
  }

  private readonly _name: RequiredPropertyValueManager<string>;
  get name(): string {
    return this._name.get();
  }
  set name(newValue: string) {
    this._name.set(newValue);
  }

  private readonly _peak: OptionalPropertyValueManager<number>;
  get peak(): number | undefined {
    return this._peak.get();
  }
  set peak(newValue: number | undefined) {
    this._peak.set(newValue);
  }

  private readonly _continuous: OptionalPropertyValueManager<number>;
  get continuous(): number | undefined {
    return this._continuous.get();
  }
  set continuous(newValue: number | undefined) {
    this._continuous.set(newValue);
  }

  public constructor(
    classifier: Classifier,
    id: LionWebId,
    receiveDelta?: DeltaReceiver,
    parentInfo?: Parentage
  ) {
    super(classifier, id, receiveDelta, parentInfo);
    this._providedFrom = new OptionalMultiReferenceValueManager<PowerSource>(
      PowerBudgetBase.INSTANCE.PowerConsumer_providedFrom,
      this
    );
    this._name = new RequiredPropertyValueManager<string>(
      LionCore_builtinsBase.INSTANCE.INamed_name,
      this
    );
    this._peak = new OptionalPropertyValueManager<number>(
      PowerBudgetBase.INSTANCE.IPowerParticipant_peak,
      this
    );
    this._continuous = new OptionalPropertyValueManager<number>(
      PowerBudgetBase.INSTANCE.IPowerParticipant_continuous,
      this
    );
  }

  override getPropertyValueManager(property: Property): PropertyValueManager<unknown> {
    switch (property.key) {
      case LionCore_builtinsBase.INSTANCE.INamed_name.key:
        return this._name;
      case PowerBudgetBase.INSTANCE.IPowerParticipant_peak.key:
        return this._peak;
      case PowerBudgetBase.INSTANCE.IPowerParticipant_continuous.key:
        return this._continuous;
      default:
        return super.getPropertyValueManager(property);
    }
  }

  override getReferenceValueManager(reference: Reference): ReferenceValueManager<INodeBase> {
    if (reference.key === PowerBudgetBase.INSTANCE.PowerConsumer_providedFrom.key) {
      return this._providedFrom;
    }
    return super.getReferenceValueManager(reference);
  }
}

export class PowerModule extends NodeBase implements INamed {
  static create(id: LionWebId, receiveDelta?: DeltaReceiver, parentInfo?: Parentage): PowerModule {
    return new PowerModule(PowerBudgetBase.INSTANCE.PowerModule, id, receiveDelta, parentInfo);
  }

  private readonly _contents: OptionalMultiContainmentValueManager<IPowerModuleContent>;
  get contents(): IPowerModuleContent[] {
    return this._contents.get();
  }
  addContents(newValue: IPowerModuleContent) {
    this._contents.add(newValue);
  }
  removeContents(valueToRemove: IPowerModuleContent) {
    this._contents.remove(valueToRemove);
  }
  addContentsAtIndex(newValue: IPowerModuleContent, index: number) {
    this._contents.insertAtIndex(newValue, index);
  }
  moveContents(oldIndex: number, newIndex: number) {
    this._contents.move(oldIndex, newIndex);
  }
  replaceContentsAtIndex(movedChild: IPowerModuleContent, newIndex: number) {
    this._contents.replaceAtIndex(movedChild, newIndex);
  }

  private readonly _name: RequiredPropertyValueManager<string>;
  get name(): string {
    return this._name.get();
  }
  set name(newValue: string) {
    this._name.set(newValue);
  }

  public constructor(
    classifier: Classifier,
    id: LionWebId,
    receiveDelta?: DeltaReceiver,
    parentInfo?: Parentage
  ) {
    super(classifier, id, receiveDelta, parentInfo);
    this._contents = new OptionalMultiContainmentValueManager<IPowerModuleContent>(
      PowerBudgetBase.INSTANCE.PowerModule_contents,
      this
    );
    this._name = new RequiredPropertyValueManager<string>(
      LionCore_builtinsBase.INSTANCE.INamed_name,
      this
    );
  }

  override getPropertyValueManager(property: Property): PropertyValueManager<unknown> {
    if (property.key === LionCore_builtinsBase.INSTANCE.INamed_name.key) {
      return this._name;
    }
    return super.getPropertyValueManager(property);
  }

  override getContainmentValueManager(
    containment: Containment
  ): ContainmentValueManager<INodeBase> {
    if (containment.key === PowerBudgetBase.INSTANCE.PowerModule_contents.key) {
      return this._contents;
    }
    return super.getContainmentValueManager(containment);
  }
}

export class PowerSource extends NodeBase implements IPowerModuleContent, IPowerParticipant {
  static create(id: LionWebId, receiveDelta?: DeltaReceiver, parentInfo?: Parentage): PowerSource {
    return new PowerSource(PowerBudgetBase.INSTANCE.PowerSource, id, receiveDelta, parentInfo);
  }

  private readonly _kind: OptionalPropertyValueManager<PowerSourceKind>;
  get kind(): PowerSourceKind | undefined {
    return this._kind.get();
  }
  set kind(newValue: PowerSourceKind | undefined) {
    this._kind.set(newValue);
  }

  private readonly _name: RequiredPropertyValueManager<string>;
  get name(): string {
    return this._name.get();
  }
  set name(newValue: string) {
    this._name.set(newValue);
  }

  private readonly _peak: OptionalPropertyValueManager<number>;
  get peak(): number | undefined {
    return this._peak.get();
  }
  set peak(newValue: number | undefined) {
    this._peak.set(newValue);
  }

  private readonly _continuous: OptionalPropertyValueManager<number>;
  get continuous(): number | undefined {
    return this._continuous.get();
  }
  set continuous(newValue: number | undefined) {
    this._continuous.set(newValue);
  }

  public constructor(
    classifier: Classifier,
    id: LionWebId,
    receiveDelta?: DeltaReceiver,
    parentInfo?: Parentage
  ) {
    super(classifier, id, receiveDelta, parentInfo);
    this._kind = new OptionalPropertyValueManager<PowerSourceKind>(
      PowerBudgetBase.INSTANCE.PowerSource_kind,
      this
    );
    this._name = new RequiredPropertyValueManager<string>(
      LionCore_builtinsBase.INSTANCE.INamed_name,
      this
    );
    this._peak = new OptionalPropertyValueManager<number>(
      PowerBudgetBase.INSTANCE.IPowerParticipant_peak,
      this
    );
    this._continuous = new OptionalPropertyValueManager<number>(
      PowerBudgetBase.INSTANCE.IPowerParticipant_continuous,
      this
    );
  }

  override getPropertyValueManager(property: Property): PropertyValueManager<unknown> {
    switch (property.key) {
      case PowerBudgetBase.INSTANCE.PowerSource_kind.key:
        return this._kind;
      case LionCore_builtinsBase.INSTANCE.INamed_name.key:
        return this._name;
      case PowerBudgetBase.INSTANCE.IPowerParticipant_peak.key:
        return this._peak;
      case PowerBudgetBase.INSTANCE.IPowerParticipant_continuous.key:
        return this._continuous;
      default:
        return super.getPropertyValueManager(property);
    }
  }
}

export enum PowerSourceKind {
  solar = 'PowerSourceKind-solar',
  nuclear = 'PowerSourceKind-nuclear',
  diesel = 'PowerSourceKind-diesel',
}
