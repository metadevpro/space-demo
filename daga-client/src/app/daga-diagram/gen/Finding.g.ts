/*
 * language's metadata:
 *     name:    Finding
 *     version: 0.1
 *     key:     FindingLanguage
 *     id:      FindingLanguage
 */

import {
  Annotation,
  Classifier,
  Enumeration,
  EnumerationLiteral,
  Language,
  Property,
} from '@lionweb/core';

import { LionWebId } from '@lionweb/json';

import {
  DeltaReceiver,
  ILanguageBase,
  LionCore_builtinsBase,
  NodeBase,
  NodeBaseFactory,
  OptionalPropertyValueManager,
  Parentage,
  PropertyValueManager,
} from '@lionweb/class-core';

export class FindingBase implements ILanguageBase {
  private readonly _language: Language = new Language(
    'Finding',
    '0.1',
    'FindingLanguage',
    'FindingLanguage'
  );
  get language(): Language {
    this.ensureWiredUp();
    return this._language;
  }

  public readonly _Finding = new Annotation(this._language, 'Finding', 'Finding', 'Finding');
  get Finding(): Annotation {
    this.ensureWiredUp();
    return this._Finding;
  }
  private readonly _Finding_severity = new Property(
    this._Finding,
    'severity',
    'Finding-severity',
    'Finding-severity'
  ).isOptional();
  get Finding_severity(): Property {
    this.ensureWiredUp();
    return this._Finding_severity;
  }
  private readonly _Finding_message = new Property(
    this._Finding,
    'message',
    'Finding-message',
    'Finding-message'
  ).isOptional();
  get Finding_message(): Property {
    this.ensureWiredUp();
    return this._Finding_message;
  }
  private readonly _Finding_code = new Property(
    this._Finding,
    'code',
    'Finding-code',
    'Finding-code'
  ).isOptional();
  get Finding_code(): Property {
    this.ensureWiredUp();
    return this._Finding_code;
  }

  public readonly _Severity = new Enumeration(this._language, 'Severity', 'Severity', 'Severity');
  get Severity(): Enumeration {
    this.ensureWiredUp();
    return this._Severity;
  }
  private readonly _Severity_info = new EnumerationLiteral(
    this._Severity,
    'info',
    'Severity-info',
    'Severity-info'
  );
  get Severity_info(): EnumerationLiteral {
    this.ensureWiredUp();
    return this._Severity_info;
  }
  private readonly _Severity_warning = new EnumerationLiteral(
    this._Severity,
    'warning',
    'Severity-warning',
    'Severity-warning'
  );
  get Severity_warning(): EnumerationLiteral {
    this.ensureWiredUp();
    return this._Severity_warning;
  }
  private readonly _Severity_error = new EnumerationLiteral(
    this._Severity,
    'error',
    'Severity-error',
    'Severity-error'
  );
  get Severity_error(): EnumerationLiteral {
    this.ensureWiredUp();
    return this._Severity_error;
  }

  private _wiredUp: boolean = false;
  private ensureWiredUp() {
    if (this._wiredUp) {
      return;
    }
    this._language.havingEntities(this._Finding, this._Severity);
    this._Finding.havingFeatures(this._Finding_severity, this._Finding_message, this._Finding_code);
    this._Finding_severity.ofType(this._Severity).isOptional();
    this._Finding_message.ofType(LionCore_builtinsBase.INSTANCE._String).isOptional();
    this._Finding_code.ofType(LionCore_builtinsBase.INSTANCE._Integer).isOptional();
    this._Severity.havingLiterals(
      this._Severity_info,
      this._Severity_warning,
      this._Severity_error
    );
    this._wiredUp = true;
  }

  factory(receiveDelta?: DeltaReceiver): NodeBaseFactory {
    return (classifier: Classifier, id: LionWebId) => {
      if (classifier.key === this._Finding.key) {
        return Finding.create(id, receiveDelta);
      }
      const { language } = classifier;
      throw new Error(
        `can't instantiate ${classifier.name} (key=${classifier.key}): classifier is not known in language ${language.name} (key=${language.key}, version=${language.version})`
      );
    };
  }

  enumLiteralFrom<EnumType>(enumerationLiteral: EnumerationLiteral): EnumType {
    const { enumeration } = enumerationLiteral;
    if (enumeration.key === this._Severity.key) {
      return enumerationLiteral.key as EnumType;
    }
    const { language } = enumeration;
    throw new Error(
      `enumeration with key ${enumeration.key} is not known in language ${language.name} (key=${language.key}, version=${language.version})`
    );
  }

  public static readonly INSTANCE = new FindingBase();
}

export class Finding extends NodeBase {
  static create(id: LionWebId, receiveDelta?: DeltaReceiver, parentInfo?: Parentage): Finding {
    return new Finding(FindingBase.INSTANCE.Finding, id, receiveDelta, parentInfo);
  }

  private readonly _severity: OptionalPropertyValueManager<Severity>;
  get severity(): Severity | undefined {
    return this._severity.get();
  }
  set severity(newValue: Severity | undefined) {
    this._severity.set(newValue);
  }

  private readonly _message: OptionalPropertyValueManager<string>;
  get message(): string | undefined {
    return this._message.get();
  }
  set message(newValue: string | undefined) {
    this._message.set(newValue);
  }

  private readonly _code: OptionalPropertyValueManager<number>;
  get code(): number | undefined {
    return this._code.get();
  }
  set code(newValue: number | undefined) {
    this._code.set(newValue);
  }

  public constructor(
    classifier: Classifier,
    id: LionWebId,
    receiveDelta?: DeltaReceiver,
    parentInfo?: Parentage
  ) {
    super(classifier, id, receiveDelta, parentInfo);
    this._severity = new OptionalPropertyValueManager<Severity>(
      FindingBase.INSTANCE.Finding_severity,
      this
    );
    this._message = new OptionalPropertyValueManager<string>(
      FindingBase.INSTANCE.Finding_message,
      this
    );
    this._code = new OptionalPropertyValueManager<number>(FindingBase.INSTANCE.Finding_code, this);
  }

  override getPropertyValueManager(property: Property): PropertyValueManager<unknown> {
    switch (property.key) {
      case FindingBase.INSTANCE.Finding_severity.key:
        return this._severity;
      case FindingBase.INSTANCE.Finding_message.key:
        return this._message;
      case FindingBase.INSTANCE.Finding_code.key:
        return this._code;
      default:
        return super.getPropertyValueManager(property);
    }
  }
}

export enum Severity {
  info = 'Severity-info',
  warning = 'Severity-warning',
  error = 'Severity-error',
}
